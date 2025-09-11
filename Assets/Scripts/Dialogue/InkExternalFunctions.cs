using UnityEngine;
using Ink.Runtime;

public class InkExternalFunctions
{
    public void Bind(Story story, Animator emoteAnimator)
    {
        // Existing emote function
        story.BindExternalFunction("playEmote", (string emoteName) => {
            if (emoteAnimator != null)
            {
                emoteAnimator.Play(emoteName);
            }
            else
            {
                Debug.LogWarning("Tried to play emote, but emote animator was" + 
                "not initialized when entering dialogue mode.");
            }
            Debug.Log("Playing emote: " + emoteName);
        });

        // New scene loading functions
        story.BindExternalFunction("loadScene", (string sceneName) => {
            if (SceneLoader.instance != null)
            {
                Debug.Log("Loading scene: " + sceneName);
                SceneLoader.instance.LoadSceneWithTransition(sceneName);
            }
            else
            {
                Debug.LogError("SceneLoader instance not found!");
            }
        });

        story.BindExternalFunction("loadSceneImmediate", (string sceneName) => {
            if (SceneLoader.instance != null)
            {
                Debug.Log("Loading scene immediately: " + sceneName);
                SceneLoader.instance.LoadSceneImmediate(sceneName);
            }
            else
            {
                Debug.LogError("SceneLoader instance not found!");
            }
        });

        // Optional: Add a save game function too
        story.BindExternalFunction("saveGame", () => {
            if (DataPersistenceManager.instance != null)
            {
                Debug.Log("Saving game from Ink dialogue");
                DataPersistenceManager.instance.SaveGame();
            }
            else
            {
                Debug.LogError("DataPersistenceManager instance not found!");
            }
        });
    }

    public void Unbind(Story story)
    {
        // Unbind all functions
        story.UnbindExternalFunction("playEmote");
        story.UnbindExternalFunction("loadScene");
        story.UnbindExternalFunction("loadSceneImmediate");
        story.UnbindExternalFunction("saveGame");
    }
}