using UnityEngine;

public class PlayerController : MonoBehaviour
{
    private void Start()
    {        
        Cursor.visible = false;
    }

    void Update()
    {

            // Get mouse position in world coordinates
            Vector2 mousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
            
            // Instantly move player to mouse position
            transform.position = new Vector3(mousePos.x, mousePos.y, transform.position.z);
    }
}