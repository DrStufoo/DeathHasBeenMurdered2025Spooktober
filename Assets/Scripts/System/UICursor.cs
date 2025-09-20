using UnityEngine;
using UnityEngine.UI;

public class UICursor : MonoBehaviour
{
    private RectTransform rectTransform;
    
    void Start()
    {
        rectTransform = GetComponent<RectTransform>();
        Cursor.visible = false;
    }
    
    void Update()
    {
        // Set UI cursor position to mouse position
        rectTransform.position = Input.mousePosition;
    }
}
