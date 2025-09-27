INCLUDE globals.ink
#portrait:blank #layout:cg #audio:beep_1
(...)
~playEmote("fadeIntoMarauderOverRaiders")
{isRaiding:->Heist|->Discovery}
=== Heist ===

(After...)

(...Some difficulty)

(You've found the Raider camp)

(The midnight hour is close at hand)

(They're probably drunk)

(Easiest sabotage you'll ever rig...)

(...Unless)

(You didn't WANT to be a genocidal maniac)

(You could just sneak in, and steal the necklace)

(Spare some blood)

(What will you do?)

*[Burn it all down]

    (You decide to scorch these hooligans)
    
    (Sneak behind the camp)
    
    (Find something...)
    
    (Flammable)
    
    (...)
        ~showOnlyGroup("Burn")
        ->END
    
*[Steal the necklace]
    ~notification("The fates will remember this...")
    (You decide to merely steal the necklace)
    
    (Sparing some blood)
    
    (Sneak into the Leader's tent)
    
    (Try not to get caught...)
    
    (...)
        ~showOnlyGroup("Heist")
        ->END
        
=== Discovery ===
<color=\#FF0000>WARNING:</color>

(While tracking the Scientist's alleged location...)

(You've found a camp of Raiders)

(Raiders are dangerous, thieving hooligans)

(It's the dead of night...)

(They're probably drunk...)

(You COULD try to sneak away)

(Or...)

(...You could rid the wasteland of these addicts)

(Once and for all)

(For the good of the people, of course...)

(What will you do?)

*[Burn it all down]

    (You decide to scorch these hooligans)
    
    (...Sneak behind the camp)
    
    (Try to find something...)
    
    (Flammable)
    
    (...)
        ~showOnlyGroup("Burn")
        ->END
    
*[Sneak away]
    ~notification("The fates will remember this...")
    (You decide to sneak away)
    
    (No blood shed, no blood spared)
    
    (Luckily enough, you don't get caught...)
    
    (And can continue to the Scientist)
    
    (Now get a move-on...)
    
    (...)
        ~hasKilledEverybody = false
        ~loadScene("Laboratory")
        ->END