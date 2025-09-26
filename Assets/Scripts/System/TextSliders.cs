using UnityEngine;
using UnityEngine.UI;
using FMODUnity;

public class TypingSpeedController : MonoBehaviour
{
    [SerializeField] private Slider typingSpeedSlider;
    [SerializeField] private Slider wobbleIntensitySlider;
    [SerializeField] private Slider masterVolumeSlider;
    [SerializeField] private Slider typingVolumeSlider;
    
    private void Start()
    {
        SetupSlider();
        SetupWobbleIntensitySlider();
        SetupMasterVolumeSlider();
        SetupTypingVolumeSlider();
    }
    
    private void SetupSlider()
    {
        if (typingSpeedSlider == null) return;
        
        // Set slider range (0 = fast, 1 = slow)
        typingSpeedSlider.minValue = 0f;
        typingSpeedSlider.maxValue = 1f;
        
        // Convert current typing speed to slider value
        if (DialogueManager.GetInstance() != null)
        {
            float currentSpeed = DialogueManager.GetInstance().GetTypingSpeed();
            typingSpeedSlider.value = ConvertSpeedToSlider(currentSpeed);
        }
        else
        {
            typingSpeedSlider.value = 0.5f; // Default middle
        }
        
        // Add listener
        typingSpeedSlider.onValueChanged.AddListener(OnTypingSpeedChanged);
    }
    
    private void OnTypingSpeedChanged(float sliderValue)
    {
        if (DialogueManager.GetInstance() != null)
        {
            float actualSpeed = ConvertSliderToSpeed(sliderValue);
            DialogueManager.GetInstance().SetTypingSpeed(actualSpeed);
        }
        UnityEngine.EventSystems.EventSystem.current.SetSelectedGameObject(null);
    }
    
    private float ConvertSliderToSpeed(float sliderValue)
    {
        // 0 = slow (1.0f), 1 = fast (0.08f)
        return Mathf.Lerp(0.2f, 0.01f, sliderValue);
    }
    
    private float ConvertSpeedToSlider(float speed)
    {
        // Convert speed back to slider position
        return Mathf.InverseLerp(0.2f, 0.01f, speed);
    }
        
    private void SetupWobbleIntensitySlider()
    {
        if (wobbleIntensitySlider == null) return;
        
        wobbleIntensitySlider.minValue = 0f;
        wobbleIntensitySlider.maxValue = 100f;
        
        if (DialogueManager.GetInstance() != null)
        {
            wobbleIntensitySlider.value = DialogueManager.GetInstance().GetWobbleIntensity();
        }
        else
        {
            wobbleIntensitySlider.value = 2f;
        }
        
        wobbleIntensitySlider.onValueChanged.AddListener(OnWobbleIntensityChanged);
    }

    private void OnWobbleIntensityChanged(float sliderValue)
    {
        if (DialogueManager.GetInstance() != null)
        {
            DialogueManager.GetInstance().SetWobbleIntensity(sliderValue);
        }
        
        UnityEngine.EventSystems.EventSystem.current.SetSelectedGameObject(null);
    }

    private void SetupMasterVolumeSlider()
    {
        if (masterVolumeSlider == null) return;
        
        masterVolumeSlider.minValue = 0f;
        masterVolumeSlider.maxValue = 1f;
        
        if (AudioManager.instance != null)
        {
            masterVolumeSlider.value = AudioManager.instance.GetMasterVolume();
        }
        else
        {
            masterVolumeSlider.value = 1f; // Default full volume
        }
        
        masterVolumeSlider.onValueChanged.AddListener(OnMasterVolumeChanged);
    }

    private void OnMasterVolumeChanged(float sliderValue)
    {
        if (AudioManager.instance != null)
        {
            AudioManager.instance.SetMasterVolume(sliderValue);
        }
        
        UnityEngine.EventSystems.EventSystem.current.SetSelectedGameObject(null);
    }

    private void SetupTypingVolumeSlider()
    {
        if (typingVolumeSlider == null) return;
        
        typingVolumeSlider.minValue = 0f;
        typingVolumeSlider.maxValue = 1f;
        
        if (DialogueManager.GetInstance() != null)
        {
            typingVolumeSlider.value = DialogueManager.GetInstance().GetTypingVolume();
        }
        else
        {
            typingVolumeSlider.value = 1f; // Default full volume
        }
        
        typingVolumeSlider.onValueChanged.AddListener(OnTypingVolumeChanged);
    }

    private void OnTypingVolumeChanged(float sliderValue)
    {
        if (DialogueManager.GetInstance() != null)
        {
            DialogueManager.GetInstance().SetTypingVolume(sliderValue);
        }
        
        UnityEngine.EventSystems.EventSystem.current.SetSelectedGameObject(null);
    }
}
