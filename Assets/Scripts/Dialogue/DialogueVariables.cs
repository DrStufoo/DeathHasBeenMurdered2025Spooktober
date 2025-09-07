using UnityEngine;
using System.Collections.Generic;
using Ink.Runtime;

public class DialogueVariables
{
    public Dictionary<string, Ink.Runtime.Object> variables {get; private set;}

    private Story globalVariablesStory;

    private const string saveVariablesKey = "INK_VARIABLES";

public DialogueVariables(TextAsset loadGlobalsJSON, string globalStateJson) 
{
    // create the story
    globalVariablesStory = new Story(loadGlobalsJSON.text);
    // if we have saved data, load it
    // note that this will be an empty string if we don't have saved data, in which case we won't load
    if (!globalStateJson.Equals(""))
    {
        globalVariablesStory.state.LoadJson(globalStateJson);
    }

    // initialize the dictionary
    variables = new Dictionary<string, Ink.Runtime.Object>();
    foreach (string name in globalVariablesStory.variablesState)
    {
        Ink.Runtime.Object value = globalVariablesStory.variablesState.GetVariableWithName(name);
        variables.Add(name, value);
        Debug.Log("Initialized global dialogue variable: " + name + " = " + value);
    }
}

    public string GetGlobalVariablesStateJson() 
    {
        // Load the current state of all of our variables to the globals story
        VariablesToStory(globalVariablesStory);
        // return the story variable state
        return  globalVariablesStory.state.ToJson();
    }

   public void StartListening(Story story)
   {
        //it's important that this is like this.
        VariablesToStory(story);       
        story.variablesState.variableChangedEvent += VariableChanged;
   }

   public void StopListening(Story story)
   {
        story.variablesState.variableChangedEvent -= VariableChanged;
   }   
   
    private void VariableChanged(string name, Ink.Runtime.Object value)
    {
        //only maintain variables that were initialized from the globals ink file
        if (variables.ContainsKey(name))
        {
            variables.Remove(name);
            variables.Add(name, value);
        }
    }

    private void VariablesToStory(Story story)
    {
        foreach (KeyValuePair<string, Ink.Runtime.Object> variable in variables)
        {
            story.variablesState.SetGlobal(variable.Key, variable.Value);
        }
    }


}
