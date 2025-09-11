using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.SceneManagement;



public class DataPersistenceManager : MonoBehaviour
{
    [Header("Debugging")]
    [SerializeField] private bool disableDataPersistence = false;
    [SerializeField] private bool initializeDataIfNull = false;

    [SerializeField] private bool overrideSelectedProfileId = false;
    [SerializeField] private string testSelectedProfileId = "";

    [Header("File Storage Config")]
    [SerializeField] private string fileName;
    [SerializeField] private bool useEncryption;

    private GameData gameData;

    private List<IDataPersistence> dataPersistenceObjects;

    private FileDataHandler dataHandler;
    
    private string selectedProfileId = "";

    public static DataPersistenceManager instance {get; private set;}



    private void Awake()
    {
            if (instance != null)
            {
                Debug.Log("Found more than one Data Persistence Manager in the scenem than killed it");
                Destroy(this.gameObject);
                return;
            }
            instance = this;        
            DontDestroyOnLoad(this.gameObject);
            
            if(disableDataPersistence)
            {
                Debug.LogWarning("Data Persistence is currently disabled!");
            }

            this.dataHandler = new FileDataHandler(Application.persistentDataPath, fileName, useEncryption);

            InitializeSelectedProfileId();
    
    }

    private void OnEnable()
    {
        SceneManager.sceneLoaded += OnSceneLoaded;
    }

    private void OnDisable()
    {
        SceneManager.sceneLoaded -= OnSceneLoaded;
    }

    public void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        Debug.Log("OnSceneLoaded Called");
        this.dataPersistenceObjects = FindAllDataPersistenceObjects();
        LoadGame();
    }

    public void ChangeSelectedProfileId(string newProfileId)
    {
        //update the profile to use for saving and loading
        this.selectedProfileId = newProfileId;
        //load the game, which will use that profile, updating our game accordingly
        LoadGame();
    }

    public void DeleteProfileData(string profileId)
    {
        //delete the data for this profileId
        dataHandler.Delete(profileId);
        //initialize the selected profileId
        InitializeSelectedProfileId();
        //reload the game so that our data matches the newly selected profileId
        LoadGame();
    }

    private void InitializeSelectedProfileId()
    {
        this.selectedProfileId = dataHandler.GetMostRecentlyUpdatedProfileId();
       
        if(overrideSelectedProfileId)
        {
            this.selectedProfileId = testSelectedProfileId;
            Debug.LogWarning("Overrode selected profile id with test id: " + testSelectedProfileId);
        }
    }
 
    public void NewGame()
    {
        this.gameData = new GameData();
    }

    public void LoadGame()
    {
        if (disableDataPersistence)
        {
            return;
        }
        
        //load any saved data from a file using the data handler
        this.gameData = dataHandler.Load(selectedProfileId);

        //start a new game if the data is null and we're configured to initialize data for debugging purposes
        if(this.gameData == null && initializeDataIfNull)
        {
            NewGame();
        }

        //if no data can be loaded, initialize to a new game
        if (this.gameData == null)
        {
            Debug.Log("No data was found. A New Game needs to be started before data can be loaded.");
            return;
        }

        //push the loaded data to all other scripts that need it
        foreach (IDataPersistence dataPersistenceObj in dataPersistenceObjects)
            {
                dataPersistenceObj.LoadData(gameData);
            }
    }

    public void SaveGame()
    {
        if (disableDataPersistence)
        {
            return;
        }

        //if we don't have any data to save, we're screwed
        if (this.gameData == null)
        {
            Debug.LogWarning("No data was found. Screwed again.");
        }
        //pass the data to other scripts so they can update it
        foreach (IDataPersistence dataPersistenceObj in dataPersistenceObjects)
            {
                dataPersistenceObj.SaveData(gameData);
            }

        //timestamp the data so we know when it was last saved
        gameData.lastUpdated = System.DateTime.Now.ToBinary();

            //update the current scene in our data
            Scene scene = SceneManager.GetActiveScene();
            // DON'T save this for certain scenes, like our main menu ^^
            if (!scene.name.Equals("MainMenu") && this.gameData != null)
            {
                gameData.currentSceneName = scene.name;
            }

        //save that data to a file using the data handler
        dataHandler.Save(gameData, selectedProfileId);

        //save that data to a file using the data handler
        dataHandler.Save(gameData, selectedProfileId);

    }

    public string GetSavedSceneName() 
    {
        // error out and return null if we don't have any game data yet
        if (gameData == null) 
        {
            Debug.LogError("Tried to get scene name but data was null.");
            return null;
        }

        // otherwise, return that value from our data
        return gameData.currentSceneName;
    }


    private void OnApplicationQuit()
    {
        SaveGame();
    }

    private List<IDataPersistence> FindAllDataPersistenceObjects()
    {
        IEnumerable<IDataPersistence> dataPersistenceObjects = FindObjectsByType<MonoBehaviour>(FindObjectsSortMode.None)
            .OfType<IDataPersistence>();

        return new List<IDataPersistence>(dataPersistenceObjects); 
    }

    public bool HasGameData()
    {
        return gameData != null;
    }

    public Dictionary<string, GameData> GetAllProfilesGameData()
    {
        return dataHandler.LoadAllProfiles();
    }
}
