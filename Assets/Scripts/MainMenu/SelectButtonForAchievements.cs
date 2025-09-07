using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;
using TMPro;

public class SelectButtonForAchievments : Menu
{
    [Header("Components")] 

    // Assign this in the Inspector to the button you want focused after closing
    [SerializeField] private GameObject nextSelectedButton;

    public void ActivateMenu(string displayText, UnityAction confirmAction, UnityAction cancelAction)
    {
        this.gameObject.SetActive(true);

    }

    public void DeactivateMenu()
    {
        // Select a new button BEFORE disabling this menu
        if (nextSelectedButton != null)
        {
            EventSystem.current.SetSelectedGameObject(null);
            EventSystem.current.SetSelectedGameObject(nextSelectedButton);
        }

        // Now deactivate this menu
        this.gameObject.SetActive(false);
    }
}
