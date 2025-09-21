using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class ForceTMPLayoutUpdate : MonoBehaviour
{
    public TextMeshProUGUI targetTMP;

    void Update()
    {
        // Force an immediate layout rebuild
        LayoutRebuilder.ForceRebuildLayoutImmediate(targetTMP.rectTransform);
    }
}