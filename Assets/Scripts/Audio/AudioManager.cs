using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using FMODUnity;
using FMOD.Studio;

public class AudioManager : MonoBehaviour
{
    private List<EventInstance> eventInstances;

    private EventInstance ambienceEventInstance;
    private EventInstance musicEventInstance;

    // Music and ambience system fields
    private EventInstance currentSceneMusicInstance;
    private EventInstance currentSceneAmbienceInstance;
    private bool isFadingMusic = false;
    private bool isFadingAmbience = false;

    private float masterVolume = 1f;
    
    public static AudioManager instance {get; private set;}

    private void Awake()
    {
        if(instance != null)
        {
            Debug.LogError("Found more than 1 AudioManager in the Scene");
        }
        instance = this;
    
        eventInstances = new List<EventInstance>();
    }

    public void PlayOneShot(EventReference sound, Vector3 worldPos)
    {
        RuntimeManager.PlayOneShot(sound, worldPos);
    }

    public EventInstance CreateInstance (EventReference eventReference)
    {
        EventInstance eventInstance = RuntimeManager.CreateInstance(eventReference);
        eventInstances.Add(eventInstance);
        return eventInstance;
    }

    // Music system methods
    public void PlaySceneMusic(EventReference musicEvent, float fadeTime = 1f)
    {
        if (isFadingMusic) return;
        StartCoroutine(FadeToNewMusic(musicEvent, fadeTime));
    }

    private System.Collections.IEnumerator FadeToNewMusic(EventReference newMusic, float fadeTime)
    {
        isFadingMusic = true;
        
        // Fade out current music if it exists
        if (currentSceneMusicInstance.isValid())
        {
            yield return StartCoroutine(FadeOut(currentSceneMusicInstance, fadeTime));
            currentSceneMusicInstance.stop(FMOD.Studio.STOP_MODE.ALLOWFADEOUT);
            currentSceneMusicInstance.release();
        }
        
        // Start new music and fade in
        currentSceneMusicInstance = CreateInstance(newMusic);
        currentSceneMusicInstance.start();
        yield return StartCoroutine(FadeIn(currentSceneMusicInstance, fadeTime));
        
        isFadingMusic = false;
    }

    // Ambience system methods
    public void PlaySceneAmbience(EventReference ambienceEvent, float fadeTime = 1f)
    {
        if (isFadingAmbience) return;
        StartCoroutine(FadeToNewAmbience(ambienceEvent, fadeTime));
    }

    private System.Collections.IEnumerator FadeToNewAmbience(EventReference newAmbience, float fadeTime)
    {
        isFadingAmbience = true;
        
        // Fade out current ambience if it exists
        if (currentSceneAmbienceInstance.isValid())
        {
            yield return StartCoroutine(FadeOut(currentSceneAmbienceInstance, fadeTime));
            currentSceneAmbienceInstance.stop(FMOD.Studio.STOP_MODE.ALLOWFADEOUT);
            currentSceneAmbienceInstance.release();
        }
        
        // Start new ambience and fade in
        currentSceneAmbienceInstance = CreateInstance(newAmbience);
        currentSceneAmbienceInstance.start();
        yield return StartCoroutine(FadeIn(currentSceneAmbienceInstance, fadeTime));
        
        isFadingAmbience = false;
    }

    // Shared fade methods
    private System.Collections.IEnumerator FadeOut(EventInstance audioInstance, float fadeTime)
    {
        float elapsed = 0f;
        
        while (elapsed < fadeTime)
        {
            elapsed += Time.deltaTime;
            float volume = Mathf.Lerp(1f, 0f, elapsed / fadeTime);
            audioInstance.setParameterByName("volume", volume);
            yield return null;
        }
        
        audioInstance.setParameterByName("volume", 0f);
    }

    private System.Collections.IEnumerator FadeIn(EventInstance audioInstance, float fadeTime)
    {
        float elapsed = 0f;
        audioInstance.setParameterByName("volume", 0f);
        
        while (elapsed < fadeTime)
        {
            elapsed += Time.deltaTime;
            float volume = Mathf.Lerp(0f, 1f, elapsed / fadeTime);
            audioInstance.setParameterByName("volume", volume);
            yield return null;
        }
        
        audioInstance.setParameterByName("volume", 1f);
    }

    private void CleanUp()
    {
        // Stop scene music
        if (currentSceneMusicInstance.isValid())
        {
            currentSceneMusicInstance.stop(FMOD.Studio.STOP_MODE.IMMEDIATE);
            currentSceneMusicInstance.release();
        }
        
        // Stop scene ambience
        if (currentSceneAmbienceInstance.isValid())
        {
            currentSceneAmbienceInstance.stop(FMOD.Studio.STOP_MODE.IMMEDIATE);
            currentSceneAmbienceInstance.release();
        }
        
        // Existing cleanup code
        foreach (EventInstance eventInstance in eventInstances)
        {
            eventInstance.stop(FMOD.Studio.STOP_MODE.IMMEDIATE);
            eventInstance.release();
        }
    }

    private void OnDestroy()
    {
        CleanUp();
    }

    public void SetMasterVolume(float volume)
    {
        masterVolume = Mathf.Clamp01(volume);
        
        // Set FMOD master volume
        FMOD.Studio.Bus masterBus = FMODUnity.RuntimeManager.GetBus("bus:/");
        masterBus.setVolume(masterVolume);
    }

    public float GetMasterVolume()
    {
        return masterVolume;
    }
}
