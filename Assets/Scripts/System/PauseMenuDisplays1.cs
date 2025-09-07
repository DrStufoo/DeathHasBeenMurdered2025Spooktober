using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using TMPro;

public class AchievementsMenu : MonoBehaviour, IDataPersistence
{
    private int insanity = 0;
    private int sadism = 0;
    private int valiance = 0;

    public TextMeshProUGUI insanityText;   
    public TextMeshProUGUI sadismText;   
    public TextMeshProUGUI valianceText;   

    public void Update()
    {  
        //Here's how to get a variable
        int insanity = ((Ink.Runtime.IntValue) DialogueManager
        .GetInstance()
        .GetVariableState("insanity")).value;

        int sadism = ((Ink.Runtime.IntValue) DialogueManager
        .GetInstance()
        .GetVariableState("sadism")).value;

        int valiance = ((Ink.Runtime.IntValue) DialogueManager
        .GetInstance()
        .GetVariableState("valiance")).value;
    
        insanityText.text = "Insanity: " + insanity;
        sadismText.text = "Sadism: " + sadism;
        valianceText.text = "Valiance: " + valiance;
    } 

    public void LoadData(GameData data)
    {
        this.insanity = data.insanity;
        this.sadism = data.sadism;
        this.valiance = data.valiance;   
    }

    public void SaveData(GameData data)
    {
        data.insanity = this.insanity;
        data.sadism = this.sadism;
        data.valiance = this.valiance;
    }
}
