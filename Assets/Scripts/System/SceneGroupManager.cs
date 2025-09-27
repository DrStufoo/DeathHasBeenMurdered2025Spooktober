using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using FMODUnity;
using FMOD.Studio;

[System.Serializable]
public class GameObjectGroup
{
    public string groupName;
    public GameObject groupObject;
}

public class SceneGroupManager : MonoBehaviour, IDataPersistence
{
    [SerializeField] private GameObjectGroup[] gameObjectGroups;
    [SerializeField] private float transitionDuration = 1f;
    
    public static SceneGroupManager instance;

    private Dictionary<string, GameObject> groupDictionary;

    private string currentActiveGroup = "";


    private void Awake()
    {
        instance = this;
        InitializeGroups();
    }

    private void Start()
    {
        // Detect which group is already active at scene start
        DetectCurrentActiveGroup();

        // Play audio for currently active groups at scene start
        PlayMusicForActiveGroups();
    }

    private void OnDestroy()
    {
        if (instance == this)
        {
            instance = null;
        }
    }

    private void DetectCurrentActiveGroup()
    {
        foreach (var group in gameObjectGroups)
        {
            if (group.groupObject != null && group.groupObject.activeInHierarchy)
            {
                currentActiveGroup = group.groupName;
                break;
            }
        }
    }

    private void InitializeGroups()
    {
        groupDictionary = new Dictionary<string, GameObject>();
        foreach (GameObjectGroup group in gameObjectGroups)
        {
            if (!string.IsNullOrEmpty(group.groupName) && group.groupObject != null)
            {
                groupDictionary[group.groupName] = group.groupObject;
            }
        }
    }

    public void ActivateGroup(string groupName)
    {
        if (groupDictionary.TryGetValue(groupName, out GameObject groupObject))
        {
            groupObject.SetActive(true);
        }
        else
        {
            Debug.LogWarning($"Group '{groupName}' not found!");
            ListAvailableGroups();
        }
    }

    public void DeactivateGroup(string groupName)
    {
        if (groupDictionary.TryGetValue(groupName, out GameObject groupObject))
        {
            groupObject.SetActive(false);
        }
        else
        {
            Debug.LogWarning($"Group '{groupName}' not found!");
            ListAvailableGroups();
        }
    }

    private void ListAvailableGroups()
    {
        Debug.Log("Available groups: " + string.Join(", ", groupDictionary.Keys));
    }

    public void ShowOnlyGroup(string groupName)
    {
        StartCoroutine(TransitionToGroup(groupName));
    }

    private void ShowOnlyGroupInstant(string groupName)
        {
            foreach (var group in gameObjectGroups)
            {
                if (group.groupObject != null)
                {
                    group.groupObject.SetActive(false);
                }
            }
            
            ActivateGroup(groupName);
            currentActiveGroup = groupName;
        }



    private IEnumerator TransitionToGroup(string groupName)
    {
        DialogueManager.GetInstance().SetInteractionEnabled(false);

        // Get the animator from the persistent SceneTransitionManager
        Animator transitionAnimator = null;
        if (SceneTransitionManager.instance != null)
        {
            transitionAnimator = SceneTransitionManager.instance.GetTransitionAnimator();
        }

        // Fade to black
        if (transitionAnimator != null)
        {
            transitionAnimator.SetTrigger("End");
        }
        
        // Get the new group's audio before switching
        EventReference newMusic = GetGroupMusic(groupName);
        EventReference newAmbience = GetGroupAmbience(groupName);
        
        yield return new WaitForSeconds(transitionDuration);

        ShowOnlyGroupInstant(groupName); // This now properly sets currentActiveGroup
        
        // Start new audio during the black screen
        if (!newMusic.IsNull)
        {
            AudioManager.instance.PlaySceneMusic(newMusic, transitionDuration);
        }
        if (!newAmbience.IsNull)
        {
            AudioManager.instance.PlaySceneAmbience(newAmbience, transitionDuration);
        }

        // Fade from black
        if (transitionAnimator != null)
        {
            transitionAnimator.SetTrigger("Start");
        }

        yield return new WaitForSeconds(transitionDuration - 2);
        DialogueManager.GetInstance().SetInteractionEnabled(true);
    }

    private void PlayMusicForActiveGroups()
    {
        foreach (var group in gameObjectGroups)
        {
            if (group.groupObject != null && group.groupObject.activeInHierarchy)
            {
                GroupMusicManager musicManager = group.groupObject.GetComponentInChildren<GroupMusicManager>();
                if (musicManager != null)
                {
                    musicManager.PlayGroupMusic();
                    musicManager.PlayGroupAmbience();
                    break; // Only play audio for the first active group found
                }
            }
        }
    }

    private EventReference GetGroupMusic(string groupName)
    {
        if (groupDictionary.TryGetValue(groupName, out GameObject groupObject))
        {
            GroupMusicManager musicManager = groupObject.GetComponentInChildren<GroupMusicManager>();
            if (musicManager != null)
            {
                return musicManager.GetGroupMusic();
            }
        }
        
        return new EventReference();
    }

    private EventReference GetGroupAmbience(string groupName)
    {
        if (groupDictionary.TryGetValue(groupName, out GameObject groupObject))
        {
            GroupMusicManager musicManager = groupObject.GetComponentInChildren<GroupMusicManager>();
            if (musicManager != null)
            {
                return musicManager.GetGroupAmbience();
            }
        }
        
        return new EventReference();
    }



    public void LoadData(GameData data)
    {
        // If we have a saved group and it exists in this scene
        if (!string.IsNullOrEmpty(data.currentActiveGroup) && 
            groupDictionary.ContainsKey(data.currentActiveGroup))
        {
            ShowOnlyGroupInstant(data.currentActiveGroup);
        }
        // Otherwise keep whatever group was already active (detected in Start)
    }

    public void SaveData(GameData data)
    {
        data.currentActiveGroup = currentActiveGroup;
    }
}


