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
    }

    //TO-DO Create an int variable to base completion on :D
   
    //public int GetPercentageComplete()
    //{
    //    int totalCollected = 0;
    //    foreach (bool collcted in coinsCollected.Values)
    //        {
    //           if (collected)
    //            {
    //                totalCollected++;
    //            }
    //        }
        
        //ensure we don't divide by 0 when calculating the percentage
       // int percentageCompleted = -1;
       // if (coinsCollected.Count != 0)
       // {
       //     percentageCompleted =(totalCollected * 100 / coinsCollected.Count);
       // }
       // return percentageCompleted;
    //}
}
