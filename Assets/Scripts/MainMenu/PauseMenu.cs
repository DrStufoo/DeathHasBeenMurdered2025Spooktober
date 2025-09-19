using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;
using UnityEngine.SceneManagement;
using TMPro;

public class PauseMenu : Menu
{
    [Header("Components")]
    [SerializeField] private Button saveQuitButton;
    [SerializeField] private Button backToGameButton;

    // UPDATED METHOD
    public void SaveQuitButton()
    {
        // Save the game
        if (DataPersistenceManager.instance != null)
        {
            DataPersistenceManager.instance.SaveGame();
        }
        
        // Resume time before loading scene
        Time.timeScale = 1f;
        
        // Load main menu with transition
        if (SceneTransitionManager.instance != null)
        {
            SceneTransitionManager.instance.LoadSceneWithTransition("MainMenu");
        }
        else
        {
            // Fallback if no transition manager
            SceneManager.LoadScene("MainMenu");
        }
    }

    public void ActivateMenu(string displayText, UnityAction confirmAction, UnityAction cancelAction)
    {
        this.gameObject.SetActive(true);

        // Remove listeners
        saveQuitButton.onClick.RemoveAllListeners();
        backToGameButton.onClick.RemoveAllListeners();

        // Assign the onClick listeners
        backToGameButton.onClick.AddListener(() =>{
            DeactivateMenu();
            confirmAction();
        });
        
        // USE THE NEW METHOD HERE
        saveQuitButton.onClick.AddListener(() =>{
            SaveQuitButton();
        });    
    }

    private void DeactivateMenu()
    {
        this.gameObject.SetActive(false);
    }
}