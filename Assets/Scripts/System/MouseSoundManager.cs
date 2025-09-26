using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using FMODUnity;
using System.Collections.Generic;

public class MouseClickSoundManager : MonoBehaviour
{
    [SerializeField] private EventReference buttonClickSound;
    [SerializeField] private EventReference emptyClickSound;

    private HashSet<Button> processedButtons = new HashSet<Button>();

    void Start()
    {
        // Add sounds to all buttons (including inactive ones)
        AddSoundsToAllButtons();
    }

    void Update()
    {
        // Check for new buttons every frame
        AddSoundsToAllButtons();

        if (Input.GetMouseButtonDown(0)) // Left mouse click
        {
            CheckForEmptyClick();
        }
    }

    void AddSoundsToAllButtons()
    {
        // Find ALL buttons, including inactive ones
        Button[] allButtons = FindObjectsByType<Button>(FindObjectsInactive.Include, FindObjectsSortMode.None);
        
        foreach (Button button in allButtons)
        {
            // Only add listener if we haven't processed this button yet
            if (!processedButtons.Contains(button))
            {
                button.onClick.AddListener(() => PlayButtonSound());
                processedButtons.Add(button);
            }
        }
    }

    void CheckForEmptyClick()
    {
        Debug.Log("Mouse clicked - checking for empty click");
        
        // Use raycast to see what specific UI element we hit
        PointerEventData pointerData = new PointerEventData(EventSystem.current);
        pointerData.position = Input.mousePosition;
        
        List<RaycastResult> results = new List<RaycastResult>();
        EventSystem.current.RaycastAll(pointerData, results);
        
        // Check if we hit any buttons or other interactive elements
        bool hitInteractiveElement = false;
        foreach (RaycastResult result in results)
        {
            // Only count buttons, toggles, sliders, etc. as "interactive"
            if (result.gameObject.GetComponent<Button>() != null ||
                result.gameObject.GetComponent<Toggle>() != null ||
                result.gameObject.GetComponent<Slider>() != null ||
                result.gameObject.GetComponent<Dropdown>() != null)
            {
                hitInteractiveElement = true;
                Debug.Log("Hit interactive element: " + result.gameObject.name);
                break;
            }
        }
        
        if (!hitInteractiveElement)
        {
            Debug.Log("Playing empty click sound");
            PlayEmptyClickSound();
        }
        else
        {
            Debug.Log("Hit interactive UI element - skipping empty click sound");
        }
    }

    void PlayButtonSound()
    {
        if (!buttonClickSound.IsNull)
        {
            AudioManager.instance.PlayOneShot(buttonClickSound, Camera.main.transform.position);
        }
    }

    void PlayEmptyClickSound()
    {
        if (!emptyClickSound.IsNull)
        {
            AudioManager.instance.PlayOneShot(emptyClickSound, Camera.main.transform.position);
        }
    }
}