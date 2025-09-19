using UnityEngine;
using UnityEngine.UI;

public class UIPostProcessOverlay : MonoBehaviour
{
    [Header("Grain")]
    [Range(0f, 1f)] public float grainIntensity = 0.1f;
    [Range(1f, 10f)] public float grainScale = 5f;

    private Material overlayMaterial;
    private Canvas overlayCanvas;
    private Image overlayImage;

    void Start()
    {
        CreateOverlay();
    }

    void CreateOverlay()
    {
        // Create shader
        Shader overlayShader = Shader.Find("UI/AnimatedGrain");
        if (overlayShader == null)
        {
            Debug.LogError("Shader not found! Create the AnimatedGrain shader first.");
            return;
        }

        overlayMaterial = new Material(overlayShader);
        
        // Create overlay canvas
        GameObject canvasObj = new GameObject("UI Grain Overlay");
        overlayCanvas = canvasObj.AddComponent<Canvas>();
        overlayCanvas.renderMode = RenderMode.ScreenSpaceOverlay;
        overlayCanvas.sortingOrder = 1000;
        
        // Create overlay image
        GameObject imageObj = new GameObject("Grain");
        imageObj.transform.SetParent(overlayCanvas.transform);
        overlayImage = imageObj.AddComponent<Image>();
        overlayImage.material = overlayMaterial;
        overlayImage.raycastTarget = false;
        
        // Fill screen
        RectTransform rect = overlayImage.rectTransform;
        rect.anchorMin = Vector2.zero;
        rect.anchorMax = Vector2.one;
        rect.offsetMin = Vector2.zero;
        rect.offsetMax = Vector2.zero;
        
        UpdateShaderProperties();
    }

    void Update()
    {
        UpdateShaderProperties();
    }

    void UpdateShaderProperties()
    {
        if (overlayMaterial != null)
        {
            overlayMaterial.SetFloat("_GrainIntensity", grainIntensity);
            overlayMaterial.SetFloat("_GrainScale", grainScale);
            overlayMaterial.SetFloat("_AnimTime", Time.time);

        }
    }
}