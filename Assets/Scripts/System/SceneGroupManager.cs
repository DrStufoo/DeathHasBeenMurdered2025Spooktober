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

public class SceneGroupManager : MonoBehaviour
{
    [SerializeField] private GameObjectGroup[] gameObjectGroups;
    [SerializeField] private float transitionDuration = 1f;
    
    public static SceneGroupManager instance;

    private Dictionary<string, GameObject> groupDictionary;

    private void Awake()
    {
        instance = this;
        InitializeGroups();
    }

    private void Start()
    {
        // Play music for currently active groups at scene start
        PlayMusicForActiveGroups();
    }

    private void OnDestroy()
    {
        if (instance == this)
        {
            instance = null;
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
        
        Debug.Log($"Initialized {groupDictionary.Count} GameObject groups");
    }

    public void ActivateGroup(string groupName)
    {
        if (groupDictionary.TryGetValue(groupName, out GameObject groupObject))
        {
            groupObject.SetActive(true);
            Debug.Log($"Activated group: {groupName}");
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
            Debug.Log($"Deactivated group: {groupName}");
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

        // Fade to black AND start fading out music
        if (transitionAnimator != null)
        {
            transitionAnimator.SetTrigger("End");
        }
        
        // Get the new group's music before switching
        EventReference newMusic = GetGroupMusic(groupName);
        
        yield return new WaitForSeconds(transitionDuration);

        ShowOnlyGroupInstant(groupName);
        
        // Start new music during the black screen
        if (!newMusic.IsNull)
        {
            AudioManager.instance.PlaySceneMusic(newMusic, transitionDuration);
        }

        // Fade from black
        if (transitionAnimator != null)
        {
            transitionAnimator.SetTrigger("Start");
        }

        yield return new WaitForSeconds(transitionDuration - 2f);
        DialogueManager.GetInstance().SetInteractionEnabled(true);
    }

    // Add this helper method to get music for a group:
    private EventReference GetGroupMusic(string groupName)
    {
        if (groupDictionary.TryGetValue(groupName, out GameObject groupObject))
        {
            GroupMusicManager musicManager = groupObject.GetComponent<GroupMusicManager>();
            if (musicManager != null)
            {
                return musicManager.GetGroupMusic();
            }
        }
        
        return new EventReference(); // Return empty if no music found
    }

    // ADD THIS NEW METHOD:
    private void PlayMusicForActiveGroups()
    {
        foreach (var group in gameObjectGroups)
        {
            if (group.groupObject != null && group.groupObject.activeInHierarchy)
            {
                GroupMusicManager musicManager = group.groupObject.GetComponent<GroupMusicManager>();
                if (musicManager != null)
                {
                    Debug.Log("Starting music for active group: " + group.groupName);
                    musicManager.PlayGroupMusic();
                    break; // Only play music for the first active group found
                }
            }
        }
    }
}
