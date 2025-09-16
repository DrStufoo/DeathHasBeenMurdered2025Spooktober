INCLUDE globals.ink
#layout:left #portrait:default #audio:beep_1 #speaker:???
...
->main
=== main ===
He's asleep.
->Choice
=== Choice ===
What will you do?
*[Interrogate Him]
    ->Talking
    You decide to wake him up, sparing some blood.
    (Your Valiance has increased!)
    (To check your Morality Stats, press "Escape")

*[Pit-Pocket Him]
    ->Dossier
    You decide to Pit-Pocket him.
    (You try not to wake him)
    ...
    (You've gained a Dossier!)

*["Neutralize Him"]
    ->Dossier
    You decide to strike first.
    Ask questions later.
    ...
    ~hasKilledNobody = false
    ~killCount = killCount + 1
    He's not dead, but he's close.
    You decide to loot his body.
    ...
    (You've gained a Dossier!)
    
=== Dossier ===
    This should have activated and deactivated these things.
    ~showOnlyGroup("Dossier")
    ->END

=== Talking ===
~showOnlyGroup("UndertakerTalking")
->END