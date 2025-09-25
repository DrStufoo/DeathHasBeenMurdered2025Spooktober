using UnityEngine;
using FMODUnity;

public class SimpleAudioPlayer : MonoBehaviour
{
    [SerializeField] private EventReference audioEvent;

    void Start()
    {
        if (!audioEvent.IsNull)
        {
            AudioManager.instance.CreateInstance(audioEvent).start();
        }
    }
}