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

    // Add these fields to your existing AudioManager class:
    private EventInstance currentSceneMusicInstance;
    private bool isFadingMusic = false;
    
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

    // Replace your music methods in SceneGroupManager with these clean versions:

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

    private System.Collections.IEnumerator FadeOut(EventInstance musicInstance, float fadeTime)
    {
        float elapsed = 0f;
        
        while (elapsed < fadeTime)
        {
            elapsed += Time.deltaTime;
            float volume = Mathf.Lerp(1f, 0f, elapsed / fadeTime);
            musicInstance.setParameterByName("volume", volume);
            yield return null;
        }
        
        musicInstance.setParameterByName("volume", 0f);
    }

    private System.Collections.IEnumerator FadeIn(EventInstance musicInstance, float fadeTime)
    {
        float elapsed = 0f;
        musicInstance.setParameterByName("volume", 0f);
        
        while (elapsed < fadeTime)
        {
            elapsed += Time.deltaTime;
            float volume = Mathf.Lerp(0f, 1f, elapsed / fadeTime);
            musicInstance.setParameterByName("volume", volume);
            yield return null;
        }
        
        musicInstance.setParameterByName("volume", 1f);
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

    private void CleanUp()
    {
        // Stop scene music
        if (currentSceneMusicInstance.isValid())
        {
            currentSceneMusicInstance.stop(FMOD.Studio.STOP_MODE.IMMEDIATE);
            currentSceneMusicInstance.release();
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

}
