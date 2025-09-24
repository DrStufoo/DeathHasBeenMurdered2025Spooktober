using UnityEngine;
using FMODUnity;

public class GroupMusicManager : MonoBehaviour
{
    [Header("Group Music")]
    [SerializeField] private EventReference groupMusic;
    [SerializeField] private float fadeTime = 1f;

    public void PlayGroupMusic()
    {
        if (!groupMusic.IsNull)
        {
            AudioManager.instance.PlaySceneMusic(groupMusic, fadeTime);
        }
    }

    public EventReference GetGroupMusic()
    {
        return groupMusic;
    }
}