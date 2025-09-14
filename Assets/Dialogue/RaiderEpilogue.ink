INCLUDE globals.ink
#portrait:blank #layout:cg #audio:beep_1
{isRaiding:->Heist|->Discovery}

=== Heist ===
~playEmote("MarauderOverRaiders")
You've finally found the Raider Camp.
~showOnlyGroup("HeistPlan")
->END

=== Discovery ===
~playEmote("MarauderOverRaiders")
ALERT!
While travelling to the Scientist alleged location, you've come into contact with a band of Raiders...
Raiders are dangerous, thieving hooligans.
You could try to sneak away...
Or you could rid the wasteland of these maggots once and for all.
For the good of the people, of course.
What will you do?
*[Sneak away]
    You decide to sneak away...
    ...Luckily you aren't spotted.
    You can continue on to the Laboratory, unscathed.
    ~loadScene("Laboratory")
    ->END
*[Infiltrate the camp]
    You decide to do the world a favor and rid the world of these rats.
    ~showOnlyGroup("Burn")
    ->END