INCLUDE globals.ink
#portrait:blank #speaker:Barkeep #layout:cg #audio:beep_1
...
*[Hey, Lloyd]
    ...
    **[Slow tonight, isn't it? Heh...]
    ...
    Yes.
    It is, Mr. Torrence.
    
    What'll it be?
        ->DrinkChoice

=== DrinkChoice ===
*[Bourbon]
    ...
    (He pours you a glass)
    (You slowly sip it)
    
    
    
    What brings you out her
    
    Really?
    Didn't expect ya to be...
    ...Clean?
    Hm.
    
    Perhaps there is hope.
    Good luck, stranger.
        **[Won't need it]
        Bloody 'ell...
        ~loadScene("Limbo")
        ->END
