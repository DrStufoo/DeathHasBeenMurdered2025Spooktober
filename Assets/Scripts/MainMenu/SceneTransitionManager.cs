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
        // Only play "Start" if we came here via a transition
        if (cameFromTransition && playStartTransitionOnSceneLoad && transitionAnimator != null)
        {
            StartCoroutine(PlayStartTransition());
            cameFromTransition = false; // Reset after playing
        }
    }

    private IEnumerator PlayStartTransition()
    {
        yield return new WaitForSeconds(0.1f);
        transitionAnimator?.SetTrigger("Start");
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
        // Play end transition
        if (transitionAnimator != null)
        {
            Debug.Log("Am setting the End Trigger!");
            transitionAnimator.SetTrigger("End");
        }

        // Wait for transition
        yield return new WaitForSeconds(transitionDuration);

        // Save game before loading
        DataPersistenceManager.instance?.SaveGame();

        // Mark that the next scene load came from a transition
        cameFromTransition = true;

        // Load the new scene
        SceneManager.LoadScene(sceneName);
    }
}
 