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

    // Bonus: Switch to one group and hide all others
    public void ShowOnlyGroup(string groupName)
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
}