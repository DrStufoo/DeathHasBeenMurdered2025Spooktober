using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using Ink.Runtime;

public class SceneLoader : MonoBehaviour
{


    public static SceneLoader instance;
    [SerializeField] Animator transitionAnim;
    
    public float transitionTimer = 5f;
    
    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
            DontDestroyOnLoad(gameObject);
        }
        else
        {
            Destroy(gameObject);
        }
    }

    private void Start()
    {
        if (transitionAnim != null)
        {
            transitionAnim.SetTrigger("Start");
        }
    }

    // Called by Ink external functions
    public void LoadSceneWithTransition(string sceneName)
    {
        StartCoroutine(LoadSceneCoroutine(sceneName));
    }
    
    private IEnumerator LoadSceneCoroutine(string sceneName)
    {
        // Start transition animation
        if (transitionAnim != null)
        {
            transitionAnim.SetTrigger("End");
        }
        
        // Wait for transition
        yield return new WaitForSeconds(transitionTimer);
        
        // Save current game state
        if (DataPersistenceManager.instance != null)
        {
            DataPersistenceManager.instance.SaveGame();
        }
        
        // Load the scene
        SceneManager.LoadScene(sceneName);
    }
    
    // Immediate scene load without transition
    public void LoadSceneImmediate(string sceneName)
    {
        if (DataPersistenceManager.instance != null)
        {
            DataPersistenceManager.instance.SaveGame();
        }
        SceneManager.LoadScene(sceneName);
    }
}
