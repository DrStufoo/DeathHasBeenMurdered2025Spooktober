using UnityEngine;
using Ink.Runtime;

public class SouvenirManager : MonoBehaviour
{
    [SerializeField] private GameObject[] souvenirs; // Assign in Inspector

    private void Update()
    {
        for (int i = 0; i < souvenirs.Length; i++)
        {
            string varName = "hasSouvenir" + (i + 1); // "hasSouvenir1", "hasSouvenir2", etc.
            bool hasSouvenir = ((BoolValue)DialogueManager
                .GetInstance()
                .GetVariableState(varName)).value;

            souvenirs[i].SetActive(hasSouvenir);
        }
    }
}

