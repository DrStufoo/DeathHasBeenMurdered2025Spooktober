using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement; 
using UnityEngine.UI;

public class SaveSlotsMenu : Menu
{
    [Header("Menu Navigation")]
    [SerializeField] private MainMenu mainMenu;

    [Header("Menu Buttons")]
    [SerializeField] private Button backButton;

    [Header("Confirmation Popup")]
    [SerializeField] private ConfirmationPopupMenu confirmationPopupMenu;

    private SaveSlot[] saveSlots;

    private bool isLoadingGame = false;

    private void Awake()
    {
        saveSlots = this.GetComponentsInChildren<SaveSlot>();
    }

    
    private void LoadSceneNewGame()
    {
        // Use SceneTransitionManager instead of direct SceneManager calls
        if (SceneTransitionManager.instance != null)
        {
            SceneTransitionManager.instance.LoadSceneWithTransition("CharacterSelection");
            Debug.Log("Starting new game with transition - loading character selection");
        }
        else
        {
            // Fallback to direct loading if no transition manager
            SceneManager.LoadSceneAsync("CharacterSelection");
            Debug.LogWarning("SceneTransitionManager not found, loading directly");
        }
    }

    private void LoadSceneLoadGame()
    {
        string savedScene = DataPersistenceManager.instance.GetSavedSceneName();
        if (!string.IsNullOrEmpty(savedScene))
        {
            if (SceneTransitionManager.instance != null)
            {
                SceneTransitionManager.instance.LoadSceneWithTransition(savedScene);
                Debug.Log("Loading saved scene with transition: " + savedScene);
            }
            else
            {
                SceneManager.LoadSceneAsync(savedScene);
                Debug.LogWarning("SceneTransitionManager not found, loading directly");
            }
        }
        else
        {
            // Fallback to character selection if no saved scene
            if (SceneTransitionManager.instance != null)
            {
                SceneTransitionManager.instance.LoadSceneWithTransition("CharacterSelection");
            }
            else
            {
                SceneManager.LoadSceneAsync("CharacterSelection");
            }
            Debug.Log("No saved scene found, loading character selection");
        }
    }


    public void OnSaveSlotClicked(SaveSlot saveSlot)
{
    //disable all buttons
    DisableMenuButtons();
    
    //case - loading game
    if(isLoadingGame)
    {
        Debug.Log("Loading existing game...");
        DataPersistenceManager.instance.ChangeSelectedProfileId(saveSlot.GetProfileId());
        LoadSceneLoadGame(); // Changed from SaveGameAndLoadSceneLoadGame()
    }

    // case - new game, but the save slot has data
    else if(saveSlot.hasData)
    {
        Debug.Log("Save slot has data, showing confirmation popup...");
        confirmationPopupMenu.ActivateMenu(
            "Starting a New Game with this slot will override the currently saved data. Are you sure?",
            //function to execute if we select 'yes'
            () => {
                DataPersistenceManager.instance.ChangeSelectedProfileId(saveSlot.GetProfileId());
                DataPersistenceManager.instance.NewGame();
                LoadSceneNewGame(); // Changed from SaveGameAndLoadSceneNewGame()
            },
            //function to execute if we select 'cancel'
            () => {
                this.ActivateMenu(isLoadingGame);
            }
        );
    }
    // case - new game, and the save slot has no data
    else
    {
        Debug.Log("Starting NEW game in slot: " + saveSlot.GetProfileId());
        DataPersistenceManager.instance.ChangeSelectedProfileId(saveSlot.GetProfileId());
        DataPersistenceManager.instance.NewGame();
        LoadSceneNewGame(); // Changed from SaveGameAndLoadSceneNewGame()
    }
}


    public void OnClearClicked(SaveSlot saveSlot)
    {
        DisableMenuButtons();

        confirmationPopupMenu.ActivateMenu(
            "Are you sure you want to delete this saved data?",
            //function to excute if we select 'yes'
            () => {
                DataPersistenceManager.instance.DeleteProfileData(saveSlot.GetProfileId());
                ActivateMenu(isLoadingGame);
            },
            //function to execute if we select 'cancel'
            () => {
                ActivateMenu(isLoadingGame);
            }

        );

    }

    public void OnBackClicked()
    {
        mainMenu.ActivateMenu();
        this.DeactivateMenu();
    }

    public void ActivateMenu(bool isLoadingGame)
    {   //sets this menu to be active
        this.gameObject.SetActive(true);

        //set mode
        this.isLoadingGame = isLoadingGame;

        //load all of the profiles that exist
        Dictionary<string, GameData> profilesGameData = DataPersistenceManager.instance.GetAllProfilesGameData();

        //ensure the back button is enabled when we activate the menu
        backButton.interactable = true;

        //loop through each save slot in the UI and set the content  appropiately
        GameObject firstSelected = backButton.gameObject;

        //loop through each save slot in theUI and set the content appropiately 
        foreach (SaveSlot saveSlot in saveSlots)
        {
            GameData profileData = null;
            profilesGameData.TryGetValue(saveSlot.GetProfileId(), out profileData);
            saveSlot.SetData(profileData);
            if (profileData == null && isLoadingGame)
            {
                saveSlot.SetInteractable(false);
            }
            else{
                saveSlot.SetInteractable(true);
                if (firstSelected.Equals(backButton.gameObject))
                {
                    firstSelected = saveSlot.gameObject;
                }
            }
        }

        //set the first selected button
        //Button firstSelectedButton = firstSelected.GetComponent<Button>();
        //this.SetFirstSelected(firstSelectedButton);
    }

    public void DeactivateMenu()
    {
        this.gameObject.SetActive(false);
    }

    private void DisableMenuButtons()
    {
        foreach (SaveSlot saveSlot in saveSlots)
        {
            saveSlot.SetInteractable(false);
        }
        backButton.interactable = false;
    }

}
