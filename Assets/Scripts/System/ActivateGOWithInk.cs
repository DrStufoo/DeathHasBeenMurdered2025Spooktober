using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using Ink.Runtime;

public class ActivateGOWithInk : MonoBehaviour
{
    public GameObject gameObject;

    private void Update()
    {
        bool activateGameObject = ((Ink.Runtime.BoolValue) DialogueManager
        .GetInstance()
        .GetVariableState("activateGameObject")).value;

        if(activateGameObject)
        {
            gameObject.SetActive(true);
        }
        else
        {
            gameObject.SetActive(false);
        }
    }

}
