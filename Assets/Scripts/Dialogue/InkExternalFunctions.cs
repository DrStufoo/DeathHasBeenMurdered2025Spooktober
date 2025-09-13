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
                Debug.LogWarning("Tried to play emote, but emote animator was not initialized when entering dialogue mode.");
            }
            Debug.Log("Playing emote: " + emoteName);
        });
        
       // ADD THIS: Memory notice function
        story.BindExternalFunction("showMemoryNotice", (string characterName) => {
            DialogueManager.GetInstance().ShowMemoryNotice(characterName);
        });

        // Scene loading functions using the new manager
        story.BindExternalFunction("loadScene", (string sceneName) => {
            Debug.Log("loadScene called from Ink with scene: " + sceneName);
            if (SceneTransitionManager.instance != null)
            {
                SceneTransitionManager.instance.LoadSceneWithTransition(sceneName);
            }
            else
            {
                Debug.LogError("SceneTransitionManager instance not found!");
            }
        });

        story.BindExternalFunction("loadSceneImmediate", (string sceneName) => {
            Debug.Log("loadSceneImmediate called from Ink with scene: " + sceneName);
            if (SceneTransitionManager.instance != null)
            {
                SceneTransitionManager.instance.LoadSceneImmediate(sceneName);
            }
            else
            {
                Debug.LogError("SceneTransitionManager instance not found!");
            }
        });

        // Save game function
        story.BindExternalFunction("saveGame", () => {
            Debug.Log("saveGame called from Ink");
            if (DataPersistenceManager.instance != null)
            {
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
        story.UnbindExternalFunction("playEmote");
        story.UnbindExternalFunction("loadScene");
        story.UnbindExternalFunction("loadSceneImmediate");
        story.UnbindExternalFunction("saveGame");
        story.UnbindExternalFunction("showMemoryNotice"); // ADD THIS LINE

        
    }
}