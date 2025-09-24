using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using FMODUnity;

public class FMODEvents : MonoBehaviour
{
    [field: Header("Mouse Moving SFX")]
    [field: SerializeField] public EventReference mouseMoving{ get; private set;}

    [field: Header("On Hover SFX")]
    [field: SerializeField] public EventReference onHover{ get; private set;}

    public static FMODEvents instance {get; private set;}

    private void Awake()
    {
        if(instance != null)
        {
            Debug.LogError("Found more than 1 FMODSEvents instance in the scene");
        }
        instance = this;
    }

}
