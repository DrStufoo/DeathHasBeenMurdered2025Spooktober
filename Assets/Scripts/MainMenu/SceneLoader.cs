using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using Ink.Runtime;

public class SceneLoader : MonoBehaviour
{
    public string nextScene = "";
    public float sceneTransitionTimer = 5f;


    public void LoadScene()
    {
        SceneManager.LoadScene(nextScene);
    }

    private void Update()
    {
        bool goToMainMenu = ((Ink.Runtime.BoolValue) DialogueManager
        .GetInstance()
        .GetVariableState("goToMainMenu")).value;

        if(goToMainMenu)
        {
            Invoke("LoadScene", sceneTransitionTimer);

        }
    }
}
