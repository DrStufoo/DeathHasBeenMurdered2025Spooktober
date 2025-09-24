using UnityEngine;
using FMOD.Studio;

public class PlayerController : MonoBehaviour
{
    private EventInstance mouseMoving;
    private Vector2 lastMousePos;

    private void Start()
    {        
        mouseMoving = AudioManager.instance.CreateInstance(FMODEvents.instance.mouseMoving);
        Cursor.visible = false;
        lastMousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
    }

    void Update()
    {
        Vector2 mousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        transform.position = new Vector3(mousePos.x, mousePos.y, transform.position.z);
        
        UpdateSound(mousePos);
        lastMousePos = mousePos;
    }


    private void UpdateSound(Vector2 currentMousePos)
    {
        bool isMoving = Vector2.Distance(currentMousePos, lastMousePos) > 0.01f;
        
        if (isMoving)
        {
            PLAYBACK_STATE playbackState;
            mouseMoving.getPlaybackState(out playbackState);
            if (playbackState.Equals(PLAYBACK_STATE.STOPPED))
            {
                mouseMoving.start();
            }
        }
        else
        {
            mouseMoving.stop(STOP_MODE.ALLOWFADEOUT);
        }
    }
}