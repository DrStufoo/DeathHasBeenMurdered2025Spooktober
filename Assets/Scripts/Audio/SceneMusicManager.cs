using UnityEngine;
using FMODUnity;

public class GroupMusicManager : MonoBehaviour
{
    [Header("Group Music")]
    [SerializeField] private EventReference groupMusic;
    [SerializeField] private float fadeTime = 1f;

    [Header("Group Ambience")]
    [SerializeField] private EventReference groupAmbience;

    public void PlayGroupMusic()
    {
        if (!groupMusic.IsNull)
        {
            AudioManager.instance.PlaySceneMusic(groupMusic, fadeTime);
        }
    }

    public void PlayGroupAmbience()
    {
        if (!groupAmbience.IsNull)
        {
            AudioManager.instance.PlaySceneAmbience(groupAmbience, fadeTime);
        }
    }

    public EventReference GetGroupMusic()
    {
        return groupMusic;
    }

    public EventReference GetGroupAmbience()
    {
        return groupAmbience;
    }
}
