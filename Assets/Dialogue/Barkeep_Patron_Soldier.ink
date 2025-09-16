INCLUDE globals.ink
#layout:left #speaker:Soldier #sprite:MWNE_neutral #audio:beep_1 # #portrait:MWNEPortrait
...
At attention
*[Dismissed]
    ->End



=== End ===
    Here, take this.
    It's not much, but well...
    I made it myself.
    (You Have Gained a Souvenir: "Questionable Explosive"!)
    ~hasSouvenir4 = true
    Bye.
    ~loadScene("Marauder")
    ->END