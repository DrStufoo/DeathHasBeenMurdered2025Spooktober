INCLUDE globals.ink
#layout:left #portrait:default #audio:beep_1 #speaker:???
...
->main
=== main ===
He's asleep.
...Bloody alcoholic.

You need information from him.
Or maybe...<color=\#FF0000>Off</color> of him?
Who's to say we can't pull the knowledge of his corpse?
Your call...
->Choice
=== Choice ===
What will you do?
*[Interrogate Him]
    You decide to wake him up, sparing some blood.
    (Your Valiance has increased!)
    ~notification("Your Valiance is {valiance}!")
    (To check your Morality Stats, press "Escape")
    **[Alright]
    ->Talking

*[Pit-Pocket Him]
    You decide to Pit-Pocket him.
    No blood shed, no friendships made.
    ~notification("Your Valiance was not affect by this...")
    (To check your morality stats, press "Escape")
    **[Alright]
    ~notification("You found a dossier!")
    ...
    You can work with this...
    ->Dossier
*[Strangle him]
    You decide to strike first.
    Ask questions later.
    ...
    ~notification("You're Sadism and Kill-Count has increased...")
    ~hasKilledNobody = false
    ~killCount = killCount + 1
    He's not dead...
    ...But he certainly wishes he was.
    You decide to loot his body.
    ...
    ~notification("You found a dossier!")
    **[Alright]
    You can work with this...
    ->Dossier
=== Dossier ===
    ...
    ~showOnlyGroup("Dossier")
    ->END

=== Talking ===
~showOnlyGroup("UndertakerTalking")
->END