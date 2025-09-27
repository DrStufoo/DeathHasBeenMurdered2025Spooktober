INCLUDE globals.ink
#portrait:blank #layout:cg #audio:beep_1
->main
=== main ===
(...)

(The tent of the Raider Leader...)

(You just need his necklace...)

(Just do it quickly...)

(Are you ready?)
*[Yes]
~playEmote("Vanishing")
(You get ready to swipe it...)

(...)

(Eureka!)

(Now quickly!)

(Get out of there, before those hooligans awake!)

...
~loadScene("UndertakerMeetup")
->END

*[No]
    ->ready
    
=== ready ==
    ...
    ...You're not?
    Hm.
    Well, I guess we can just...
    Wait here for a few minutes?
    ...
    ...
    Are you ready yet?
    *[Yes]
    ~playEmote("Vanishing")
    (Great...)
    
    (...)
    
    (You get ready to swipe it...)
    
    (...)

    (Eureka!)
    
    (Now quickly!)
    
    (Get out of there, before those hooligans awake!)
    
    ...
    ~loadScene("UndertakerMeetup")
    ->END
    
    *[Nope]
    ->ready
    