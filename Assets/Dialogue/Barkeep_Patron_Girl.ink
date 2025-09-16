INCLUDE globals.ink
#layout:left #speaker:Little Girl #sprite:MWNE_neutral #audio:beep_1 # #portrait:MWNEPortrait
...
Have you seen my mama?
*[...]
    ->End



=== End ===
    Well, you look sad.
    Here, take this.
    It's not much, but well...
    Flowers always make me feel better.
    (You Have Gained a Souvenir: "Single Flower"!)
    ~hasSouvenir8 = true
    *[Thank you...]
    ~showOnlyGroup("BarkeepEnding")
    ->END