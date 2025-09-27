using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class SaveSlot : MonoBehaviour
{
    [Header("Profile Id")]
    [SerializeField] private string profileId = "";

    [Header("Content")]
    [SerializeField] private GameObject noDataContent;
    [SerializeField] private GameObject hasDataContent;

    [SerializeField] private TextMeshProUGUI percentageCompleteText;
    
    [Header("In Progress Indicator")]
    [SerializeField] private TextMeshProUGUI inProgressText; // Add this field

    [Header("Clear Data Button")]
    [SerializeField] private Button clearButton;

    public bool hasData {get; private set; } = false;

    private Button saveSlotButton;

    private void Awake()
    {
        saveSlotButton = this.GetComponent<Button>();
    }

    public void SetData(GameData data)
    {
        //there's no data for this profileId
        if (data == null)
        {
            hasData = false;
            noDataContent.SetActive(true);
            hasDataContent.SetActive(false);
            clearButton.gameObject.SetActive(false);
            
            // Hide in progress text
            if (inProgressText != null)
                inProgressText.gameObject.SetActive(false);
        }

        //there is data for this profileId
        else
        {
            hasData = true;
            noDataContent.SetActive(false);
            hasDataContent.SetActive(true);
            clearButton.gameObject.SetActive(true);
            
            // Show "In Progress" if this profile was loaded/used
            if (inProgressText != null)
            {
                bool isCurrentProfile = (profileId == DataPersistenceManager.instance.GetCurrentProfileId());
                inProgressText.gameObject.SetActive(isCurrentProfile);
                if (isCurrentProfile)
                {
                    inProgressText.text = "In Progress...";
                }
            }
        }
    }

    public string GetProfileId()
    {
        return this.profileId;
    }
    
    public void SetInteractable(bool interactable)
    {
        saveSlotButton.interactable = interactable;
        clearButton.interactable = interactable;
    }
}
