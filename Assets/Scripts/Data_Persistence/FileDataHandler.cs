using System.Collections;
using System.Collections.Generic;
using System;
using System.IO;
using UnityEngine;

public class FileDataHandler
{
    private string dataDirPath = "";
    private string dataFileName = "";
    private bool useEncryption = false;
    private readonly string encryptionCodeWord = "word";

    public FileDataHandler(string dataDirPath, string dataFileName, bool useEncryption)
    {
        this.dataDirPath = dataDirPath;
        this.dataFileName = dataFileName;
        this.useEncryption = useEncryption;
    }

    public GameData Load(string profileId)
    {
        //base case - if the profileId is null, return right away
        if (profileId == null)
        {
            return null;
        }



        //use Path.Combine to account for different OS's having different path seperators
        string fullPath = Path.Combine(dataDirPath, profileId, dataFileName);
        GameData loadedData = null;
        if(File.Exists(fullPath))
        {
            try
            {
                //load the serialized data from the file
                string dataToLoad = "";
                using (FileStream stream = new FileStream(fullPath, FileMode.Open))
                {
                    using (StreamReader reader = new StreamReader(stream))
                    {
                        dataToLoad = reader.ReadToEnd();
                    }
                }

                if (useEncryption)
                {
                    dataToLoad = EncryptDecrypt(dataToLoad);
                }

                //deserialize the data from Json back into the c# object
                loadedData = JsonUtility.FromJson<GameData>(dataToLoad);
            }
            catch (Exception e)
            {
                Debug.LogError("Error occured when trying to load data from file:" + fullPath + "\n" + e);
            }
        }
        return loadedData;
    }

    public void Save(GameData data, string profileId)
    {
        // base case - if the profileId is null, return right away

        if(profileId == null)
        {
            return;
        }

        //use Path.Combine to account for different OS's having different path seperators
        string fullPath = Path.Combine(dataDirPath, profileId, dataFileName);

        try
        {
            //create the directory the file will be written to if it doesn't already exist
            Directory.CreateDirectory(Path.GetDirectoryName(fullPath));

            //serialize game data object to a JSON string
            string dataToStore = JsonUtility.ToJson(data, true);

            if(useEncryption)
            {
                dataToStore = EncryptDecrypt(dataToStore);
            }

            //write the serialized data to the file
            using (FileStream stream = new FileStream(fullPath, FileMode.Create))
            {
                using (StreamWriter writer = new StreamWriter(stream))
                {
                    writer.Write(dataToStore);
                }
                
            }

        }
        catch (Exception e)
        {
            Debug.LogError("Error occured when trying to save data to file:" + fullPath + "\n" + e);
        }

    }

    
    public void Delete(string profileId)
    {
        if (profileId == null)
        {
            return;
        }

        string fullPath = Path.Combine(dataDirPath, profileId, dataFileName);
        try
        {
            //ensure the data file exists at this path before deleting the directory
            if (File.Exists(fullPath))
            {
                //delete the profile folder and everything within it
                Directory.Delete(Path.GetDirectoryName(fullPath), true);
            }
            else
            {
                Debug.LogWarning("Tried to delete profile data, but data was not found at path: " + fullPath);
            }
        }

        catch (Exception e)
        {
            Debug.LogError("Failed to delete profile data for profileId: "
            + profileId + " at path: " + fullPath + "\n" + e);
        }

    }


    public Dictionary<string, GameData> LoadAllProfiles()
    {
        Dictionary<string, GameData> profileDictionary = new Dictionary<string, GameData>();

        //loop over all directory names in the data directory path
        IEnumerable<DirectoryInfo> dirInfos = new DirectoryInfo(dataDirPath).EnumerateDirectories();
        foreach (DirectoryInfo dirInfo in dirInfos)
        {
            string profileId = dirInfo.Name;

            //defensive check - make sure exists
            //if it doesn't we're screwed
            string fullPath = Path.Combine(dataDirPath, profileId, dataFileName);
            if(!File.Exists(fullPath))
            {
                Debug.LogWarning("Skipping directory when loading all profiles because it does not contain data: " + profileId);
                continue;
            }

            GameData profileData = Load(profileId);
            //defensive programming - enure the profile data isn't null,
            //it if it,
            //you screwed up, donkey
            if (profileData != null)
            {
                profileDictionary.Add(profileId, profileData);
            }
            else
            {
                Debug.LogError("Tried to load profile id, but forgot what i was doing halfway through");
            }
        }

        return profileDictionary;
    }

    public string GetMostRecentlyUpdatedProfileId()
    {
        string mostRecentProfileId = null;

        Dictionary<string, GameData> profilesGameData = LoadAllProfiles();
        foreach (KeyValuePair<string, GameData> pair in profilesGameData)
        {
            string profileId = pair.Key;
            GameData gameData = pair.Value;
            

            //skip this entry if the gamedata is null
            if (gameData == null)
                {
                    continue;
                }

            //if this is the first data we've come across that exists, it's the most recent one so far
            if(mostRecentProfileId == null)
                {
                    mostRecentProfileId = profileId; 
                }
            //otherwise, compare to see which date is the most recent
            else
            {
                DateTime mostRecentDateTime = DateTime.FromBinary(profilesGameData[mostRecentProfileId].lastUpdated);
                DateTime newDateTime = DateTime.FromBinary(gameData.lastUpdated);
                //the greatest DateTime value is the most recent
                if (newDateTime > mostRecentDateTime)
                {
                    mostRecentProfileId = profileId;
                } 
            }
        }
        return mostRecentProfileId;
    }

    private string EncryptDecrypt(string data)
        {    
            string modifiedData = "";
            for (int i = 0; i <data.Length; i++)
            {
                modifiedData += (char) (data[i] ^ encryptionCodeWord[i % encryptionCodeWord.Length]);
            }
            return modifiedData;
        }

}
