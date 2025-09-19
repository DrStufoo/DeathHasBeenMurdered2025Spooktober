using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneTransitionManager : MonoBehaviour
{
    public static SceneTransitionManager instance;

    [Header("Transition Settings")]
    [SerializeField] private Animator transitionAnimator;
    [SerializeField] private float transitionDuration = 1f;
    [SerializeField] private bool playStartTransitionOnSceneLoad = true;

    private bool cameFromTransition = false;

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
            return;
        }

        SceneManager.sceneLoaded += OnSceneLoaded;
    }

    private void OnDestroy()
    {
        SceneManager.sceneLoaded -= OnSceneLoaded;
    }

    private void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        if (cameFromTransition && playStartTransitionOnSceneLoad && transitionAnimator != null)
        {
            StartCoroutine(PlayStartTransition());
            cameFromTransition = false;
        }
    }

    private IEnumerator PlayStartTransition()
    {
        yield return new WaitForSeconds(0.1f);
        transitionAnimator?.SetTrigger("Start");
    }

    // ADD THESE STATIC METHODS FOR EASY ACCESS FROM ANYWHERE
    public static void LoadScene(string sceneName)
    {
        if (instance != null)
        {
            instance.LoadSceneWithTransition(sceneName);
        }
        else
        {
            Debug.LogError("SceneTransitionManager instance not found!");
            SceneManager.LoadScene(sceneName);
        }
    }

    public static void LoadSceneNoTransition(string sceneName)
    {
        if (instance != null)
        {
            instance.LoadSceneImmediate(sceneName);
        }
        else
        {
            Debug.LogError("SceneTransitionManager instance not found!");
            SceneManager.LoadScene(sceneName);
        }
    }

    public void LoadSceneWithTransition(string sceneName)
    {
        StartCoroutine(TransitionToScene(sceneName));
    }

    public void LoadSceneImmediate(string sceneName)
    {
        DataPersistenceManager.instance?.SaveGame();
        SceneManager.LoadScene(sceneName);
    }

    private IEnumerator TransitionToScene(string sceneName)
    {
        if (transitionAnimator != null)
        {
            Debug.Log("Am setting the End Trigger!");
            transitionAnimator.SetTrigger("End");
        }

        yield return new WaitForSeconds(transitionDuration);
        DataPersistenceManager.instance?.SaveGame();
        cameFromTransition = true;
        SceneManager.LoadScene(sceneName);
    }

    public Animator GetTransitionAnimator() 
    {
        return transitionAnimator;
    }

}
