using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Ink.Runtime;
using UnityEngine.EventSystems;
using FMODUnity;
using FMOD.Studio;

public class DialogueManager : MonoBehaviour, IDataPersistence
{
    private float typingVolume = 1f;

    [Header("Text Wobble")]
    [SerializeField] private bool enableTextWobble = true;
    [SerializeField] private float wobbleIntensity = 2f;
    [SerializeField] private float wobbleSpeed = 5f;

    [Header("Params")]
    [SerializeField] private float typingSpeed = 0.04f;

    [Header("Load Globals JSON")]

    [SerializeField] private TextAsset loadGlobalsJSON;

    [Header("Dialogue UI")]

    [SerializeField] private GameObject dialoguePanel;

    [SerializeField] private GameObject continueIcon;

    [SerializeField] private TextMeshProUGUI dialogueText;

    [SerializeField] private TextMeshProUGUI displayNameText;

    [Header("Memory Notice")]
    [SerializeField] private GameObject memoryNoticePanel;
    [SerializeField] private TextMeshProUGUI memoryNoticeText;
    [SerializeField] private Animator memoryNoticeAnimator;

    [SerializeField] private Animator spriteAnimator;
    [SerializeField] private Animator portraitAnimator;

    // Add this property near the top of your DialogueManager class:
    public bool interactionsEnabled = true;

    private Animator layoutAnimator;

    [Header("Choices UI")]

    [SerializeField] private GameObject[] choices;

    private TextMeshProUGUI[] choicesText;

    [Header("Audio")]

    [SerializeField] private DialogueAudioInfoSO defaultAudioInfo;

    [SerializeField] private DialogueAudioInfoSO[] audioInfos;

    [SerializeField] private bool makePredictable;

    private DialogueAudioInfoSO currentAudioInfo;

    private Dictionary<string, DialogueAudioInfoSO> audioInfoDictionary;

    private FMOD.Studio.EventInstance currentTypingSound;

    private Story currentStory;

    public bool dialogueIsPlaying { get; private set;}

    private bool canContinueToNextLine = false;

    private Coroutine displayLineCoroutine;
    private Coroutine wobbleCoroutine; // ADD THIS LINE

    private static DialogueManager instance;

    private const string SPEAKER_TAG = "speaker";
    private const string SPRITE_TAG = "sprite";
    private const string PORTRAIT_TAG = "portrait";
    private const string LAYOUT_TAG = "layout";
    private const string AUDIO_TAG = "audio";

    private DialogueVariables dialogueVariables;

    private InkExternalFunctions inkExternalFunctions;

    private void Awake()
    {
        if (instance != null)
        {
            Debug.LogWarning("Found more than one Dialogue Manager in the Scene!");
        }
        instance = this;

        inkExternalFunctions = new InkExternalFunctions();
        // Remove: audioSource = this.gameObject.AddComponent<AudioSource>();
        currentAudioInfo = defaultAudioInfo;
    }


    public static DialogueManager GetInstance()
    {
        return instance;
    }


    private void Start()
    {
        dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);

        // Hide memory notice at start
        if (memoryNoticePanel != null)
        memoryNoticePanel.SetActive(false);
        
        layoutAnimator = dialoguePanel.GetComponent<Animator>();

        choicesText = new TextMeshProUGUI[choices.Length];
        int index = 0;
        foreach (GameObject choice in choices)
        {
            choicesText[index] = choice.GetComponentInChildren<TextMeshProUGUI>();
            index++;
        }

        InitializeAudioInfoDictionary();
    }

public void ShowNotification(string message)
{
    if (memoryNoticePanel != null && memoryNoticeText != null)
    {
        memoryNoticeText.text = message;
        memoryNoticePanel.SetActive(true);
        
        if (memoryNoticeAnimator != null)
        {
            memoryNoticeAnimator.SetTrigger("Show");
        }
    }
}



    private void InitializeAudioInfoDictionary()
    {
        audioInfoDictionary = new Dictionary<string, DialogueAudioInfoSO>();
        audioInfoDictionary.Add(defaultAudioInfo.id, defaultAudioInfo);
        foreach (DialogueAudioInfoSO audioInfo in audioInfos)
        {
            audioInfoDictionary.Add(audioInfo.id, audioInfo);
        }

    }

    public void LoadData(GameData data)
        {
            // now we can create a new DialogueVariables object that's being initialized based on any loaded data
            dialogueVariables = new DialogueVariables(loadGlobalsJSON, data.globalVariablesStateJson);
            
            this.typingSpeed = data.typingSpeed;
            this.wobbleIntensity = data.wobbleIntensity;
        }

    public void SaveData(GameData data)
        {
            // when we save the game, we get the current global state from our dialogue variables and then save that to our data
            string globalStateJson = dialogueVariables.GetGlobalVariablesStateJson();
            data.globalVariablesStateJson = globalStateJson;

           data.typingSpeed = this.typingSpeed;
           data.wobbleIntensity = this.wobbleIntensity;
        }
        
    public Ink.Runtime.Object GetVariableState(string variableName)
        {
            Ink.Runtime.Object variableValue = null;
            dialogueVariables.variables.TryGetValue(variableName, out variableValue);
                if (variableValue == null)
                {
                    Debug.LogWarning("Ink Variable was found to be null:" + variableName);
                }
            return variableValue;
        }

    private void SetCurrentAudioInfo(string id)
    {
        DialogueAudioInfoSO audioInfo = null;
        audioInfoDictionary.TryGetValue(id, out audioInfo);
        if (audioInfo != null)
        {
            this.currentAudioInfo = audioInfo;
        }
        else{
            Debug.LogWarning("Failed to find the audio info for id: " + id);
        }
    }

    public void SetInteractionEnabled(bool enabled)
    {
     interactionsEnabled = enabled;
    }

    // ADD THIS METHOD: Called by Animation Event
    public void HideMemoryNotice()
    {
        if (memoryNoticePanel != null)
        {
            memoryNoticePanel.SetActive(false);
        }
    }

    private void Update()
    {
    

        //return right away if dialogue isn't playing or interactions are disabled
        if(!dialogueIsPlaying || !interactionsEnabled)
        {
            return;
        }
        // Instant skip typing effect with left click
        if (Input.GetMouseButtonDown(0) && !canContinueToNextLine && displayLineCoroutine != null)
        {
            StopCoroutine(displayLineCoroutine);
            dialogueText.maxVisibleCharacters = dialogueText.text.Length;
            
            // Start wobble if enabled
            if (enableTextWobble)  // Add this condition check
            {
                if (wobbleCoroutine != null)
                    StopCoroutine(wobbleCoroutine);
                wobbleCoroutine = StartCoroutine(WobbleText());
            }
            
            continueIcon.SetActive(true);
            DisplayChoices();
            canContinueToNextLine = true;
        }


        //handle continuing to the next line when mouse is clicked anywhere
        if (currentStory.currentChoices.Count == 0 
            && canContinueToNextLine && Input.GetMouseButtonDown(1))
        {
            ContinueStory();
        }
    }

    public void EnterDialogueMode(TextAsset inkJSON, Animator emoteAnimator)
    {
        // Reset memory notice before starting dialogue
        ResetMemoryNoticeAnimation();
     
        currentStory = new Story(inkJSON.text);
        dialogueIsPlaying = true;
        dialoguePanel.SetActive(true);

        dialogueVariables.StartListening(currentStory);
        inkExternalFunctions.Bind(currentStory, emoteAnimator);

        //reset portrait, layout, and speaker
        displayNameText.text = "???";
        portraitAnimator.Play("default");
        layoutAnimator.Play("right");

        ContinueStory();
    }

    private void ResetMemoryNoticeAnimation()
    {
        if (memoryNoticePanel != null && memoryNoticeAnimator != null)
        {
            // Force the panel to be inactive
            memoryNoticePanel.SetActive(false);
            
            // Reset the animator to its default state
            memoryNoticeAnimator.Rebind();
            memoryNoticeAnimator.Update(0f);
        }
    }

    private IEnumerator ExitDialogueMode()
    {
        yield return new WaitForSeconds(0.2f);

        // Stop wobble when exiting dialogue
        if (wobbleCoroutine != null)
        {
            StopCoroutine(wobbleCoroutine);
            wobbleCoroutine = null;
        }

        // Reset memory notice when exiting dialogue
        ResetMemoryNoticeAnimation();

        dialogueVariables.StopListening(currentStory);
        inkExternalFunctions.Unbind(currentStory);

        dialogueIsPlaying= false;
        dialoguePanel.SetActive(false);
        dialogueText.text = "";

        //go back to default audio
        SetCurrentAudioInfo(defaultAudioInfo.id);
    }

    public void ContinueStory()
    {
    
        if (currentStory.canContinue)
        {
            if (displayLineCoroutine != null)
            {
                StopCoroutine(displayLineCoroutine);
            }

            string nextLine = currentStory.Continue();
            //handle case where the last line is an external function
            if (nextLine.Equals("") && !currentStory.canContinue)
            {
                StartCoroutine(ExitDialogueMode());
            }
            else
            {
            //handle tags
            HandleTags(currentStory.currentTags);
            //set text for the current dialogue line
            displayLineCoroutine = StartCoroutine(DisplayLine(nextLine));                
            }
        }
        
        else
           {
              StartCoroutine(ExitDialogueMode());
           }
    }

 
private IEnumerator DisplayLine(string line)
    {
    // STOP ANY EXISTING WOBBLE FIRST
    if (wobbleCoroutine != null)
    {
        StopCoroutine(wobbleCoroutine);
        wobbleCoroutine = null;
    }
    //set the text to the full line, but set the visible characters to 0
    dialogueText.text = line;
    dialogueText.maxVisibleCharacters = 0;
   
    //hide items while typing
    continueIcon.SetActive(false);
    HideChoices();

    canContinueToNextLine = false;

    bool isAddingRichTextTag = false;

        //display each letter one at a time
        foreach (char letter in line.ToCharArray())
        {

        //if mouse is held down, finish the whole string of text right away
        if (Input.GetMouseButton(0)) // Changed from GetMouseButtonDown to GetMouseButton
        {
            dialogueText.maxVisibleCharacters = line.Length;
            break;
        }
            
        //check for rich txt tag, if found, add it without waiting
        if (letter == '<'|| isAddingRichTextTag)
        {
            isAddingRichTextTag = true;
            if (letter =='>')
            {
                isAddingRichTextTag = false;
            }
        }
        //if not rich text, add the next letter and wait a small time
        else
        {
            
            PlayDialogueSound(dialogueText.maxVisibleCharacters, dialogueText.text[dialogueText.maxVisibleCharacters]);
            dialogueText.maxVisibleCharacters++;
            yield return new WaitForSeconds(typingSpeed);
        }

        }

        // START WOBBLE EFFECT AFTER TYPING IS COMPLETE
        if (enableTextWobble)
        {
            if (wobbleCoroutine != null)
                StopCoroutine(wobbleCoroutine);
            wobbleCoroutine = StartCoroutine(WobbleText());
        }

        //actions to take after the entire line has finished
        continueIcon.SetActive(true);
         DisplayChoices();
        canContinueToNextLine = true;

        // Enable continue button (add this if using Option A above)
        if (dialogueText.GetComponent<Button>() != null)
        {
            dialogueText.GetComponent<Button>().interactable = true;
        }
 
    }





    private IEnumerator WobbleText()
    {
        while (dialogueIsPlaying && enableTextWobble)
        {
            dialogueText.ForceMeshUpdate();
            var textInfo = dialogueText.textInfo;
            
            // Store original positions temporarily each frame
            Vector3[][] frameOriginals = new Vector3[textInfo.meshInfo.Length][];
            for (int i = 0; i < textInfo.meshInfo.Length; i++)
            {
                frameOriginals[i] = new Vector3[textInfo.meshInfo[i].vertices.Length];
                System.Array.Copy(textInfo.meshInfo[i].vertices, frameOriginals[i], textInfo.meshInfo[i].vertices.Length);
            }
            
            // Apply wobble as offset from current frame's original positions
            for (int i = 0; i < textInfo.characterCount; i++)
            {
                var charInfo = textInfo.characterInfo[i];
                int materialIndex = charInfo.materialReferenceIndex;
                int vertexIndex = charInfo.vertexIndex;
                
                Vector3[] vertices = textInfo.meshInfo[materialIndex].vertices;
                
                // Calculate wobble offset
                float wobbleX = Mathf.Sin(Time.time * wobbleSpeed + i) * wobbleIntensity;
                float wobbleY = Mathf.Cos(Time.time * wobbleSpeed + i * 0.7f) * wobbleIntensity;
                Vector3 wobbleOffset = new Vector3(wobbleX, wobbleY, 0);
                
                // Apply wobble to all 4 vertices of this character from this frame's original position
                for (int j = 0; j < 4; j++)
                {
                    vertices[vertexIndex + j] = frameOriginals[materialIndex][vertexIndex + j] + wobbleOffset;
                }
            }
            
            // Update the mesh
            for (int i = 0; i < textInfo.meshInfo.Length; i++)
            {
                textInfo.meshInfo[i].mesh.vertices = textInfo.meshInfo[i].vertices;
                dialogueText.UpdateGeometry(textInfo.meshInfo[i].mesh, i);
            }
            
            yield return null;
        }
    }


   private void PlayDialogueSound(int currentDisplayedCharacterCount, char currentCharacter)
{
    EventReference[] dialogueTypingSoundEvents = currentAudioInfo.dialogueTypingSoundEvents;
    int frequencyLevel = currentAudioInfo.frequencyLevel;
    float minPitch = currentAudioInfo.minPitch;
    float maxPitch = currentAudioInfo.maxPitch;
    bool stopAudioSource = currentAudioInfo.stopAudioSource;

    if (currentDisplayedCharacterCount % frequencyLevel == 0)
    {
        if (stopAudioSource)
        {
            // Stop previous sound
            currentTypingSound.stop(FMOD.Studio.STOP_MODE.IMMEDIATE);
            currentTypingSound.release();
        }

        // Random event selection
        int randomIndex = Random.Range(0, dialogueTypingSoundEvents.Length);
        EventReference selectedEvent = dialogueTypingSoundEvents[randomIndex];
        
        // Create and configure the event
        currentTypingSound = AudioManager.instance.CreateInstance(selectedEvent);
        
        // Random pitch
        float randomPitch = Random.Range(minPitch, maxPitch);
        currentTypingSound.setParameterByName("pitch", randomPitch);

        currentTypingSound.setParameterByName("typingVolume", typingVolume);

        
        // Play the sound
        currentTypingSound.start();
    }
}

    private void HideChoices()
    {
        foreach (GameObject choiceButton in choices)
        {
            choiceButton.SetActive(false);
        }
    }

    private void HandleTags(List<string> currentTags)
    {
        //loop throguh each tag and handle it accordingly
        foreach (string tag in currentTags)
        {
            //parse the tag
            string[] splitTag = tag.Split(':');
            if (splitTag.Length != 2)
            {
                Debug.LogError("Tag could not be appropiately parsed: "+tag);
            }
            string tagKey = splitTag[0].Trim();
            string tagValue = splitTag[1].Trim();

            //handle the tag
            switch(tagKey)
            {
                case SPEAKER_TAG:
                    displayNameText.text = tagValue;
                    break;
                case SPRITE_TAG:
                    spriteAnimator.Play(tagValue);
                    break;
                case PORTRAIT_TAG:
                    portraitAnimator.Play(tagValue);
                    break;
                case LAYOUT_TAG:
                    // Use coroutine to wait a frame before playing layout animation
                    StartCoroutine(PlayLayoutAfterFrame(tagValue));
                    break;
                case AUDIO_TAG:
                    SetCurrentAudioInfo(tagValue);
                    break;
                default:
                Debug.LogWarning("Tag came in but is not currently being handled:" + tag);
                break;
            }
        }
    }

    // Add this new coroutine method:
    private IEnumerator PlayLayoutAfterFrame(string layoutName)
    {
        yield return null; // Wait one frame
        
        layoutAnimator.Play(layoutName);
        
        // Force TextMeshPro to update
        StartCoroutine(ForceTextUpdate());
    }

    private IEnumerator ForceTextUpdate()
    {
        yield return null; // Wait one frame
        
        // Store current text
        string currentText = dialogueText.text;
        
        // Force complete refresh
        dialogueText.enabled = false;
        dialogueText.enabled = true;
        dialogueText.SetText(currentText);
        dialogueText.ForceMeshUpdate();
    }


    private void DisplayChoices()
    {
        List<Choice> currentChoices = currentStory.currentChoices;

        //defensive check to make sure our UI won't explode
        if (currentChoices.Count > choices.Length)
        {
            Debug.LogError("More choices were given than the UI can support. Number of choices given: " + currentChoices.Count );
        }

        int index = 0;
        //enable and initialize the choices up to the amount of choices for this line of dialogue
        foreach(Choice choice in currentChoices)
        {
             choices[index].gameObject.SetActive(true);
             choicesText[index].text = choice.text;
             index ++;
        }

        //go through the remaining choices the UI supports and make sure they're hidden
        for (int i = index; i < choices.Length; i++)
        {
            choices[i].gameObject.SetActive(false);
        }
    }

    public void MakeChoice(int choiceIndex)
    {
        if (canContinueToNextLine)
        {
            currentStory.ChooseChoiceIndex(choiceIndex);
            
            // ADD THIS LINE:
            UnityEngine.EventSystems.EventSystem.current.SetSelectedGameObject(null);
            
            ContinueStory();
        }
    }


    public void SetTypingSpeed(float newSpeed)
    {
        this.typingSpeed = Mathf.Clamp(newSpeed, 0.01f, 1.0f);
    }

    // NEW: Public method to get current typing speed
    public float GetTypingSpeed()
    {
        return this.typingSpeed;
    }

        public void SetWobbleIntensity(float newIntensity)
        {
            this.wobbleIntensity = Mathf.Clamp(newIntensity, 0f, 100f);
            Debug.Log("Wobble intensity set to: " + this.wobbleIntensity); // Add this line
        }


        public float GetWobbleIntensity()
        {
            return this.wobbleIntensity;
        }

    public void SetTypingVolume(float newVolume)
    {
        this.typingVolume = Mathf.Clamp01(newVolume);
    }

    public float GetTypingVolume()
    {
        return this.typingVolume;
    }

}
