using UnityEngine;

public class MemoryNoticePanel : MonoBehaviour
{
    public GameObject rememberPanel;

    public void HidePanel()
    {
        Debug.Log("am deactivating myself!");
        rememberPanel.SetActive(false);
    }
}