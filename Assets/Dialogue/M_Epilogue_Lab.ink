INCLUDE globals.ink
#portrait:blank #layout:cg #audio:beep_1
{traveledWithUndertaker:->HereWithUndertaker|->HereSolo}

=== HereWithUndertaker ===
~playEmote("fadeIntoOutsideLabWithUndertaker")
(After a...)

(...VERY long journey)

(...Thanks to the Undertaker's guidence)

(You both arrive at the Scientist's Laboratory)

*[Ask the Undertaker to go with you]
    (You ask the Undertaker if he'll join you)
    
    (...)
    
    (He laughs in your face)
    ~notification("Idiot")
    
    (Why would you think he'd help you?)
    
    (Right proper donut...)

    (Anyways)
    
    (Get a move-on)
    
    (Sneak in there)
    
    (Find the Scientist)
    
    (Make him help)
    
    (...)
        ~showOnlyGroup("ScientistAtWork")
        ->END

*[Go in Alone]
    (You decide to go it alone)
    
    (...The Undertaker parts)

    (Get a move-on)
    
    (Sneak in there)
    
    (Find the Scientist)
    
    (Make him help)
    
    (...)    
        ~showOnlyGroup("ScientistAtWork")
        ->END

=== HereSolo ===
~playEmote("fadeIntoOutsideLab")
(After a...)

(VERY long time alone)

(You've finally found it...)

(...The Scientist's Laboratory)

(At long last...)

(Sneak in there)
    
(Find the Scientist)
    
(Make him help)
    
(...)    
    ~showOnlyGroup("ScientistAtWork")
    ->END