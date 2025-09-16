INCLUDE globals.ink
#layout:left #speaker:Marauder #sprite:MWNE_neutral #audio:beep_1 # #portrait:MWNEPortrait
...
You seen a ghost?
*[Yes]
    ->End



=== End ===
    Here, take this.
    It's not much, but well...
    I made it myself.
    (You Have Gained a Souvenir: "Old Coin"!)
    ~hasSouvenir6 = true
    Bye.
    ~loadScene("Girl")
    ->END