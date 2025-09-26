using UnityEngine;
using Ink.Runtime;

public class SpookyDeactivator : MonoBehaviour
{
    [SerializeField] private GameObject[] objectsToDeactivate = new GameObject[7];

    private void Update()
    {
        if (DialogueManager.GetInstance() != null)
        {
            bool spookyActivate = ((BoolValue)DialogueManager
                .GetInstance()
                .GetVariableState("spookyActivate")).value;

            if (spookyActivate)
            {
                DeactivateObjects();
            }
        }
    }

    private void DeactivateObjects()
    {
        foreach (GameObject obj in objectsToDeactivate)
        {
            if (obj != null && obj.activeInHierarchy)
            {
                obj.SetActive(false);
            }
        }
    }
}
