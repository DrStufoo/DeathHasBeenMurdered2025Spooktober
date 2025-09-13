using UnityEngine;
using UnityEngine.SceneManagement;

public class SkipCutsceneListener : MonoBehaviour
{
    [SerializeField] private string sceneToLoad = "Bar_Undertaker";
    
    void Update()
    {
        // Check for TAB key press
        if (Input.GetKeyDown(KeyCode.Tab))
        {
            SkipCutscene();
        }
    }
    
    void SkipCutscene()
    {
        // Force exit dialogue if it's playing
        if (DialogueManager.GetInstance().dialogueIsPlaying)
        {
            // Stop dialogue immediately
            StopAllCoroutines();
        }

        // Load the target scene with transition
        SceneTransitionManager.LoadScene(sceneToLoad);
    }
}

