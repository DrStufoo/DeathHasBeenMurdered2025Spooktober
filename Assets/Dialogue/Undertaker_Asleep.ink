INCLUDE globals.ink
#layout:right #portrait:default #audio:beep_1 #speaker:???
...
->main
=== main ===
He's asleep.
...
You could wake him up, interrogate him.
~ ToggleObjects("UndertakerTalking", "UndertakerAsleep")
...Or you could pit-pocket him, using stealth.
...Or you could just "neutralize" him.... Permanately.
And find any information off his colvulsing body.
->Choice

=== Choice ===
What will you do?

*[Interrogate Him]
    You decide to wake him up, sparing some blood.
    (Your Valiance has increased!)
    (To check your Morality Stats, press "Escape")
    ->Talking
*[Pit-Pocket Him]
    You decide to Pit-Pocket him.
    (You try not to wake him)
    ...
    (You've gained a Dossier!)
    ->Dossier
*["Neutralize Him"]
    You decide to strike first.
    Ask questions later.
    ...
    ~hasKilledNobody = false
    ~killCount = killCount + 1
    He's not dead, but he's close.
    You decide to loot his body.
    ...
    (You've gained a Dossier!)
    *[Read the Dossier]
        ->Dossier
    
=== Dossier ===
~ ToggleObjects("UndertakerTalking", "UndertakerAsleep")
This should have activated and deactivated these things
->END

=== Talking ===
->END