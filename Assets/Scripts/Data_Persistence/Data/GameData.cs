using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]

public class GameData
{
    public long lastUpdated;
    
    public int insanity = 0;
    public int sadism = 0;
    public int valiance = 0;

    // Character tracking
    public int currentCharacter = 0;
    public int barkeep_LevelsCompleted = 0;
    public int barkeep_TotalLevels = 5;
    public int marauder_LevelsCompleted = 0;
    public int marauder_TotalLevels = 7;
    public string currentSceneName;

    public string globalVariablesStateJson;
    //The values defined here will be the default
    //the game starts with when there's no data to load
    public GameData()
    {
        //default for starting a new game
        //if issue, change this to character selection screen :D
        currentSceneName = "Bar_Undertaker";

        this.globalVariablesStateJson = "";
        
        this.insanity = 0;
        this.sadism = 0;
        this.valiance = 0;
    
        this.currentCharacter = 0;
        this.barkeep_LevelsCompleted = 0;
        this.barkeep_TotalLevels = 5;
        this.marauder_LevelsCompleted = 0;
        this.marauder_TotalLevels = 7;
    }
   
    public int GetPercentageComplete()
    {
        if (currentCharacter == 1)
        {
            if (barkeep_TotalLevels == 0) return 0;
            return (barkeep_LevelsCompleted * 100 / barkeep_TotalLevels);
        }
        else if (currentCharacter == 2)
        {
            if (marauder_TotalLevels == 0) return 0;
            return (marauder_LevelsCompleted * 100 / marauder_TotalLevels);
        }
        return 0;
    }
}

