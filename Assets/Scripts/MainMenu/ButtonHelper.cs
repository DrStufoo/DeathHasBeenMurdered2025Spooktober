using UnityEngine;

public class SceneTransitionButtonHelper : MonoBehaviour
{
    // These methods can be called from Button OnClick events in the Inspector
    
    public void LoadMainMenu()
    {
        SceneTransitionManager.LoadScene("MainMenu");
    }

    // Generic method if you want to pass scene names via other means
    public void LoadScene(string sceneName)
    {
        SceneTransitionManager.LoadScene(sceneName);
    }
    
}

