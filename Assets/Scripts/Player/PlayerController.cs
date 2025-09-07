using UnityEngine;
using UnityEngine.SceneManagement;

public class PlayerController : MonoBehaviour
{
    private Vector2 target;
    // Update is called once per frame
    void Update()
    {
        //getting cords of mousepos in game
        Vector2 mousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
       
        target = new Vector2(mousePos.x, mousePos.y);
        

        //move the player towards coords
        transform.position = Vector2.MoveTowards(transform.position, target, Time.deltaTime * 300.0f);
    }
}
