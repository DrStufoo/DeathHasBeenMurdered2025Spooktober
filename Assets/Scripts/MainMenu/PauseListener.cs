using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PauseListener : MonoBehaviour
{
    [SerializeField] private GameObject pauseMenu;
    private bool isPaused = false;
    public GameObject music;

    // Update is called once per frame
    void Update()
    {   
        
        if(Input.GetKeyDown(KeyCode.Escape))
        {
            if(isPaused)
            {
                UnPause();
            }
            else
            {
                Pause();
            }

        }
    }

        public void Pause()
        {
            pauseMenu.SetActive(true);
            isPaused = true;
            Time.timeScale = 0f;
            music.SetActive(false);
        }

        public void UnPause()
        {
            pauseMenu.SetActive(false);
            isPaused = false;
            Time.timeScale = 1f;
            music.SetActive(true);   
        }

        public void ResumeTime()
        {
            Time.timeScale = 1f;
        }
}
