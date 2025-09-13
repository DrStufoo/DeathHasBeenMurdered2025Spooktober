using UnityEngine;

public class PlayerController : MonoBehaviour
{
    [Header("Player Settings")]
    [SerializeField] private int sortingOrder = 1000; // High number to stay above UI
    
    private SpriteRenderer spriteRenderer;

    private void Start()
    {        
        Cursor.visible = false;
        
        // Get the sprite renderer and set it to render above everything
        spriteRenderer = GetComponent<SpriteRenderer>();
        if (spriteRenderer != null)
        {
            spriteRenderer.sortingOrder = sortingOrder;
        }
    }

    void Update()
    {
        // Only move if mouse is clicked
        if (Input.GetMouseButton(0))
        {
            // Get mouse position in world coordinates
            Vector2 mousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
            
            // Instantly move player to mouse position
            transform.position = new Vector3(mousePos.x, mousePos.y, transform.position.z);
        }
    }
}