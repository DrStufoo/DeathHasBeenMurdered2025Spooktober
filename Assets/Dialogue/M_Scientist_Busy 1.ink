INCLUDE globals.ink
... #audio:beep_1 #layout:cg

~playEmote("scientistAtWork")

(...)


(Try not to kill the bastard this time...)
~notification("Idiot")
(...)
*[(Reveal yourself)]
    ~notification("The fates will remember this...")
    (You spare some blood, and reveal yourself)
    
    (Go talk with the Man Who Sold the World..)
    
    (...)
    
    (He's surprisingly...)
    
    (...Receptive?)
        ~showOnlyGroup("ScientistTalk")
        ->END
