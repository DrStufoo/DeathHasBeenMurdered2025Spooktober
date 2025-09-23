INCLUDE globals.ink
#layout:cg #audio:beep_1

~playEmote("scientistAtWork")

(...)

(There he is)

(The fool that started it all...)

(He's too busy to notice you)

(You could get either reveal yourself)

(Try to talk to him)

(...Hope he helps you)

(Or...)

(...You could strangle him)

(Get any information off his convulsing body)

(...)

(What will you do?)

*[(Reveal yourself)]
    ~notification("The fates will remember this...")
    (You spare some blood, and reveal yourself)
    
    (Go talk with the Man Who Sold the World..)
    
    (...)
    
    (He's surprisingly...)
    
    (...Receptive?)
        ~showOnlyGroup("ScientistTalk")
        ->END
*[(Strike the Scientist)]
    ~notification("The fates will remember this...")
    (You decide to strike first...)
    
    (...And pull any information off his seizing corpse)
    
    (...)
        ~showOnlyGroup("ScientistDead")
        ->END