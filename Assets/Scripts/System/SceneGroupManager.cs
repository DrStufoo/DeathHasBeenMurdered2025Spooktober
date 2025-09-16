using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class GameObjectGroup
{
    public string groupName;
    public GameObject groupObject;  // The empty GameObject that contains everything
}

public class SceneGroupManager : MonoBehaviour
{
    [SerializeField] private GameObjectGroup[] gameObjectGroups;
    [SerializeField] private Animator transitionAnimator; // Assign your transition animator here
    [SerializeField] private float transitionDuration = 1f; // Should match your scene transition duration
    
    public static SceneGroupManager instance;

    private Dictionary<string, GameObject> groupDictionary;

    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
            InitializeGroups();
        }
        else
        {
            Destroy(gameObject);
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

    // Show group with smooth transition
    public void ShowOnlyGroup(string groupName)
    {
        StartCoroutine(TransitionToGroup(groupName));
    }

    // Internal instant method for switching during transition
    private void ShowOnlyGroupInstant(string groupName)
    {
        // First, deactivate all groups
        foreach (var group in gameObjectGroups)
        {
            if (group.groupObject != null)
            {
                group.groupObject.SetActive(false);
            }
        }
        
        // Then activate the specific group
        ActivateGroup(groupName);
    }

    private IEnumerator TransitionToGroup(string groupName)
    {
        // Disable dialogue interactions during transition
        DialogueManager.GetInstance().SetInteractionEnabled(false);

        // Fade to black
        if (transitionAnimator != null)
        {
            transitionAnimator.SetTrigger("End");
        }

        // Wait for fade to complete
        yield return new WaitForSeconds(transitionDuration);

        // Switch groups instantly while screen is black
        ShowOnlyGroupInstant(groupName);

        // Fade from black
        if (transitionAnimator != null)
        {
            transitionAnimator.SetTrigger("Start");
        }

        // Wait for fade in to complete, then re-enable interactions
        yield return new WaitForSeconds(transitionDuration - 2f); // Enable interactions 0.5 seconds early
        DialogueManager.GetInstance().SetInteractionEnabled(true);
    }
}