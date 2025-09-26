using UnityEngine;

public class IgnoreParentTransform : MonoBehaviour
{
    private Vector3 worldPosition;
    private Vector3 worldScale;
    private float worldRotation;
    
    void Start()
    {
        // Store initial world transform
        worldPosition = transform.position;
        worldScale = transform.lossyScale;
        worldRotation = transform.eulerAngles.z;
    }
    
    void LateUpdate()
    {
        // Maintain world position and scale
        transform.position = worldPosition;
        transform.rotation = Quaternion.Euler(0, 0, worldRotation);
        
        // Counter parent's scale
        Vector3 parentScale = transform.parent.lossyScale;
        transform.localScale = new Vector3(
            worldScale.x / parentScale.x,
            worldScale.y / parentScale.y,
            worldScale.z / parentScale.z
        );
    }
}