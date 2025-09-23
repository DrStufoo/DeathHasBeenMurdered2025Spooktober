using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PersistentCollectiblesManager : MonoBehaviour
{
    [Header("Main Menu Souvenir Objects")]
    [SerializeField] private GameObject[] mainMenuSouvenirs; // Assign souvenirs 1-8 in order
    
    private PersistentCollectiblesData collectiblesData;
    private string collectiblesFileName = "PersistentCollectibles.json";
    
    public static PersistentCollectiblesManager instance { get; private set; }

    private void Awake()
    {
        if (instance != null)
        {
            Destroy(gameObject);
            return;
        }
        instance = this;
        DontDestroyOnLoad(gameObject);
        
        LoadCollectiblesData();
    }

    private void Start()
    {
        UpdateMainMenuSouvenirs();
        
        // Check for newly unlocked souvenirs every frame when DialogueManager exists
        InvokeRepeating(nameof(CheckForNewUnlocks), 1f, 0.5f);
    }

    private void CheckForNewUnlocks()
    {
        if (DialogueManager.GetInstance() == null) return;

        bool hasNewUnlocks = false;

        // Check souvenirs 1-8
        for (int i = 1; i <= 8; i++)
        {
            string varName = "hasSouvenir" + i;
            var inkValue = DialogueManager.GetInstance().GetVariableState(varName);
            
            if (inkValue != null && ((Ink.Runtime.BoolValue)inkValue).value)
            {
                if (!collectiblesData.unlockedSouvenirs.Contains(i))
                {
                    collectiblesData.unlockedSouvenirs.Add(i);
                    hasNewUnlocks = true;
                    Debug.Log($"Permanently unlocked souvenir {i}!");
                }
            }
        }

        if (hasNewUnlocks)
        {
            SaveCollectiblesData();
            UpdateMainMenuSouvenirs();
        }
    }

    private void LoadCollectiblesData()
    {
        string filePath = System.IO.Path.Combine(Application.persistentDataPath, collectiblesFileName);
        
        if (System.IO.File.Exists(filePath))
        {
            try
            {
                string json = System.IO.File.ReadAllText(filePath);
                collectiblesData = JsonUtility.FromJson<PersistentCollectiblesData>(json);
            }
            catch (System.Exception e)
            {
                Debug.LogError("Error loading collectibles data: " + e.Message);
                collectiblesData = new PersistentCollectiblesData();
            }
        }
        else
        {
            collectiblesData = new PersistentCollectiblesData();
        }
    }

    private void SaveCollectiblesData()
    {
        try
        {
            string json = JsonUtility.ToJson(collectiblesData, true);
            string filePath = System.IO.Path.Combine(Application.persistentDataPath, collectiblesFileName);
            System.IO.File.WriteAllText(filePath, json);
        }
        catch (System.Exception e)
        {
            Debug.LogError("Error saving collectibles data: " + e.Message);
        }
    }

    private void UpdateMainMenuSouvenirs()
    {
        for (int i = 0; i < mainMenuSouvenirs.Length; i++)
        {
            if (mainMenuSouvenirs[i] == null) continue;

            int souvenirIndex = i + 1; // Convert to 1-based indexing
            bool isUnlocked = collectiblesData.unlockedSouvenirs.Contains(souvenirIndex);

            // Get the Image component
            Image souvenirImage = mainMenuSouvenirs[i].GetComponent<Image>();
            if (souvenirImage != null)
            {
                souvenirImage.color = isUnlocked ? Color.white : Color.black;
            }

            // Make clickable only if unlocked
            Button souvenirButton = mainMenuSouvenirs[i].GetComponent<Button>();
            if (souvenirButton != null)
            {
                souvenirButton.interactable = isUnlocked;
            }
        }
    }

    // Call this method if you want to reset all collectibles (for testing)
    public void ResetAllCollectibles()
    {
        collectiblesData = new PersistentCollectiblesData();
        SaveCollectiblesData();
        UpdateMainMenuSouvenirs();
        Debug.Log("All collectibles reset!");
    }

    // Public method to check if a souvenir is unlocked
    public bool IsSouvenirUnlocked(int souvenirIndex)
    {
        return collectiblesData.unlockedSouvenirs.Contains(souvenirIndex);
    }
}

[System.Serializable]
public class PersistentCollectiblesData
{
    public List<int> unlockedSouvenirs = new List<int>();
}