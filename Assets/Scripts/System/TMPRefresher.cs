using UnityEngine;
using TMPro;

public class DialogueLayoutFix : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI textComponent;
    
    public void ForceTextRefresh()
    {
        if (textComponent != null)
        {
            textComponent.ForceMeshUpdate();
        }
    }
}