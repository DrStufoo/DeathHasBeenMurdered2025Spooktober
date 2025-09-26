using System.Collections;
using UnityEngine;

public class CameraWobble : MonoBehaviour
{
    [Header("Wobble Settings")]
    [SerializeField] private bool enableWobble = true;
    [SerializeField] private float wobbleSpeed = 2f;
    [SerializeField] private float wobbleIntensityX = 0.5f;
    [SerializeField] private float wobbleIntensityY = 0.5f;
    
    private Vector3 originalPosition;
    private Coroutine wobbleCoroutine;

    void Start()
    {
        originalPosition = transform.position;
        
        if (enableWobble)
        {
            StartWobbling();
        }
    }

    public void SetWobbleEnabled(bool enabled)
    {
        enableWobble = enabled;
        
        if (enabled)
        {
            StartWobbling();
        }
        else
        {
            StopWobbling();
        }
    }

    private void StartWobbling()
    {
        if (wobbleCoroutine != null)
            StopCoroutine(wobbleCoroutine);
        
        wobbleCoroutine = StartCoroutine(WobbleCamera());
    }

    private void StopWobbling()
    {
        if (wobbleCoroutine != null)
        {
            StopCoroutine(wobbleCoroutine);
            wobbleCoroutine = null;
        }
        
        transform.position = originalPosition;
    }

    private IEnumerator WobbleCamera()
    {
        while (enableWobble)
        {
            float wobbleX = Mathf.Sin(Time.time * wobbleSpeed) * wobbleIntensityX;
            float wobbleY = Mathf.Cos(Time.time * wobbleSpeed * 0.8f) * wobbleIntensityY;
            
            Vector3 wobbleOffset = new Vector3(wobbleX, wobbleY, 0);
            transform.position = originalPosition + wobbleOffset;
            
            yield return null;
        }
    }

    private void OnDestroy()
    {
        StopWobbling();
    }
}
