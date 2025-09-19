using System.Collections;
using System.Collections.Generic;
using UnityEngine;

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
            // We need to add a getter for the animator in SceneTransitionManager
            transitionAnimator = SceneTransitionManager.instance.GetTransitionAnimator();
        }

        // Fade to black
        if (transitionAnimator != null)
        {
            transitionAnimator.SetTrigger("End");
        }
        else
        {
            Debug.LogWarning("No transition animator found!");
        }

        yield return new WaitForSeconds(transitionDuration);

        ShowOnlyGroupInstant(groupName);

        // Fade from black
        if (transitionAnimator != null)
        {
            transitionAnimator.SetTrigger("Start");
        }

        yield return new WaitForSeconds(transitionDuration - 2f);
        DialogueManager.GetInstance().SetInteractionEnabled(true);
    }
}