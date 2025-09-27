INCLUDE globals.ink
#layout:left #portrait:default #audio:beep_1 #speaker:???
...
He's asleep.
...Bloody alcoholic.
->main
=== main ===
You need information from him.
Or maybe... <color=\#FF0000>Off</color> him?
Who's to say we can't pull the knowledge off his corpse?
Your call...
->Choice
=== Choice ===
What will you do?
*[Interrogate Him]
    You decide to wake him up, sparing some blood.
    (Your Valiance has increased!)
    ~valiance = valiance + 1
    ~notification("Your Valiance is {valiance}!")
    (To check your Morality Stats, press "Escape")
    ...
    ~showOnlyGroup("UndertakerTalking")
    ->END

*[Pick-Pocket Him]
    You decide to Pick-Pocket him.
    No blood shed, no friendships made...
    ~notification("Your Valiance was not affect by this...")
    (To check your morality stats, press "Escape")
    ...
    You found a dossier!
    You can work with this...
    ...
    ~showOnlyGroup("Dossier")
    ->END
*[Strangle him]
    You decide to strike first.
    Ask questions later.
    ...
    ~notification("Your Sadism increased...")
    ~hasKilledEverybody = true
    ~killCount = killCount + 1
    (Your Kill-Count has also increased)
    ...
    He's not dead...
    ...But he certainly wishes he was.
    You decide to loot his body.
    ...
    You found a Dossier!
    ...You can work with this.
    ...
    ~showOnlyGroup("Dossier")
    ->END