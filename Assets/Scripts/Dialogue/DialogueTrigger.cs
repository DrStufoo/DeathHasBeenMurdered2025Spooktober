using UnityEngine;

public class DialogueTrigger : MonoBehaviour
{
    [Header("Visual Cue")]
    [SerializeField] private GameObject visualCue;

    [Header ("Emote Animator")]
    [SerializeField] private Animator emoteAnimator;

    [Header("Ink JSON")]
    [SerializeField] private TextAsset inkJSON;


    private bool playerInRange;

    private void Awake()
    {
        playerInRange = false;
        visualCue.SetActive(false);
    }

    private void Update()
{
    // ADD THIS DEBUG
    if (playerInRange)
    {
        Debug.Log($"Player in range. DialogueIsPlaying: {DialogueManager.GetInstance().dialogueIsPlaying}, InteractionsEnabled: {DialogueManager.GetInstance().interactionsEnabled}");
    }

    if (playerInRange && !DialogueManager.GetInstance().dialogueIsPlaying)
    {
        // Only show visual cue if interactions are enabled
        if (DialogueManager.GetInstance().interactionsEnabled)
        {
            visualCue.SetActive(true);
            if (Input.GetMouseButtonDown(0))
            {
                Debug.Log("Starting dialogue!"); // ADD THIS
                DialogueManager.GetInstance().EnterDialogueMode(inkJSON, emoteAnimator);
            }
        }
        else
        {
            Debug.Log("Interactions disabled - hiding visual cue"); // ADD THIS
            visualCue.SetActive(false);
        }
    }
    else
    {
        visualCue.SetActive(false);
    }
}


    private void OnTriggerEnter2D(Collider2D collider)
    {
        if (collider.gameObject.tag == "Player")
        {
            playerInRange = true;
        }
    }

    private void OnTriggerExit2D(Collider2D collider)
    {
        if (collider.gameObject.tag == "Player")
        {
            playerInRange = false;
        }        
    }

}
