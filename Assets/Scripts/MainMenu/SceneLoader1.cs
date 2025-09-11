using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using Ink.Runtime;

public class MainMenuLoader : MonoBehaviour
{
    [SerializeField] Animator transitionAnim;

    private void Start()
    {
        transitionAnim.SetTrigger("Start");
    }

    private void Update()
    {
        bool goToMainMenu = ((Ink.Runtime.BoolValue) DialogueManager
        .GetInstance()
        .GetVariableState("goToMainMenu")).value;

        if(goToMainMenu)
        {
            transitionAnim.SetTrigger("End");
            Invoke("LoadSceneMainMenu", 3f);
        }
    }

    public void LoadSceneMainMenu()
    {
    SceneManager.LoadScene("MainMenu");
    }
}
