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

    public void ActivateMenu(string displayText, UnityAction confirmAction, UnityAction cancelAction)
    {
        this.gameObject.SetActive(true);


        //removes any existing listeners just to make sure there aren't any previous ones hanging around
        //note - this only removes listeners added through code
        saveQuitButton.onClick.RemoveAllListeners();
        backToGameButton.onClick.RemoveAllListeners();

        //assign the onClick listeners
        backToGameButton.onClick.AddListener(() =>{
            DeactivateMenu();
            confirmAction();
        });
        saveQuitButton.onClick.AddListener(() =>{
            DeactivateMenu();
            SceneManager.LoadSceneAsync("MainMenu"); 
            confirmAction();
        });    
    }

    private void DeactivateMenu()
    {
        this.gameObject.SetActive(false);
    }
}
