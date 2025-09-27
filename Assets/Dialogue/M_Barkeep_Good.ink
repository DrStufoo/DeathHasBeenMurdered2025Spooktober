INCLUDE globals.ink
#portrait:blank #speaker:Barkeep #layout:cg #audio:beep_1
...
*[Hey, Lloyd]
    ...
    **[Slow tonight, isn't it? Heh...]
    ...
    Yes.
    It is, Mr. Torrence.
        ->DrinkChoice

=== DrinkChoice ===
...
...Your hands.
They're...
...Clean?
Hm.
...
What can I get for you?
*[Water]
    ...
    HAH!
    Hahah..
    Heh.
    Really?
    
    Didn't expect a man like you to be...
    Sober.
    
    Hm.
    
    (He pours you a drink)
    (You chug it quickly)
    
    Heh.
    Perhaps there is hope.
    Good luck, stranger.
        **[Won't need it]
        Bloody 'ell...
        ~loadScene("Limbo")
        ->END
