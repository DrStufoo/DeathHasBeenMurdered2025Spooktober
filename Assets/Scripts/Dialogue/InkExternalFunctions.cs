using UnityEngine;
using Ink.Runtime;

public class InkExternalFunctions
{
    public void Bind(Story story, Animator emoteAnimator)
    {
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

        Debug.Log(emoteName);
        });
    }

    public void Unbind(Story story)
    {
        
        story.UnbindExternalFunction("playEmote");
    }
}
