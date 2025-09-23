INCLUDE globals.ink
#layout:left #speaker:??? #sprite:undertaker_sleep #audio:undertaker # #portrait:undertaker_neutral
...  ) 
(...He still sleeps)
->Wake
VAR askedWaked = 0
=== Wake ===
+[Wait for him to wake]
    {askedWaked >= 12:
    ->Patience
  - else:
    ...
    }

    
    ~askedWaked = askedWaked + 1
    (You wait a few minutes for the Undertaker to wake...)
    (He doesn't budge.)
    (You've waited {askedWaked * 5} minutes!)
    ->Wake
*[Wake him up gently]
    (He slowly raises his eyes) #speaker:??? #sprite:undertaker_adjust1
    Sonnuva... #speaker:The Undertaker #sprite:undertaker_adjust2
    $^@%!!! #sprite:undertaker_angry
    It's <color=\#FF0000>YOU</color>!
    ->main

*[Violently force him awake]
    $^@%!!! #speaker:The Undertaker #sprite:undertaker_adjust1
    WHAT IN THE BLOODY- #sprite:undertaker_angry
    ...
    It's <color=\#FF0000>YOU</color>! #sprite:undertaker_confused
    ->main

=== Patience ===
... #speaker:???
(You've...)
(You've waited an entire hour...)
(And he STILL hasn't budged.)
(WHAT HAS THIS MAN BEEN DRINKING?)
(WHAT HAVE <color=\#FF0000>YOU</color> BEEN DRINKING TO WAIT THIS LONG?)
(IT'S-)
(...)
(Almost motivating...)
(Hmm...)
(Fascinating)
(...)
(I'm impressed.)
~notification("The Fates will remember that...")
(But now, we must continue)
(Good luck, child)
*[Wake him up gently]
    (He slowly raises his eyes) #speaker:??? #sprite:undertaker_adjust1
    Sonnuva... #speaker:The Undertaker #sprite:undertaker_adjust2
    $^@%!!! #sprite:undertaker_angry
    It's <color=\#FF0000>YOU</color>!
    ->main

*[Violently force him awake]
    $^@%!!! #speaker:The Undertaker #sprite:undertaker_adjust1
    WHAT IN THE BLOODY- #sprite:undertaker_angry
    ...
    It's <color=\#FF0000>YOU</color>! #sprite:undertaker_confused
    ->main

=== main ===
What are you doing here?! #speaker:The Undertaker  #sprite:undertaker_confused
...
*[I need your help]
    What?! #speaker:The Undertaker #sprite:undertaker_angry
    What could you need?! #sprite:undertaker_neutral
    **[Information]
    ... #speaker:The Undertaker #sprite:undertaker_handsoncounter
    ...Information?
    Really? #sprite:undertaker_neutral
    What could you possibly want to know? #sprite:undertaker_confused
        ***[Where is the Scientist]
            ->Scientist
        ***[Are you single?]
            ...#speaker:???
            (Your tactics, confuse, and frighten me)
            ...What? #speaker:The Undertaker #sprite:undertaker_confused
            ****[Where's the Scientist?]
            ->Scientist
    

*[(Threaten Him)] 
    (You threaten the Undertaker with Violence) #speaker:???
    (It's intimidating) #sprite:undertaker_adjust1
    (But he's still clueless) #sprite:undertaker_adjust2
    ~notification("Idiot")
    ->main
    
*[(Ignore him)]
    (You say nothing) #speaker:???
    ... #sprite:undertaker_handsoncounter
    (This gets us nowhere...)
    ...
    ~notification("Idiot")
    ->main

=== Scientist ===
(BLGHTH!) #sprite:undertaker_drinking
(The Undertaker chokes) #sprite:undertaker_angry
Ahem... #speaker:The Undertaker #sprite:undertaker_adjust1
...What? #sprite:undertaker_neutral
*[Where is he?]
    ... #speaker:The Undertaker #sprite:undertaker_handsoncounter
    I don't know what you're talking about. #sprite:undertaker_neutral
    **[(Threaten him)]
        (You flash your "firearm")#speaker:???
        (He reconsiders...) #sprite:undertaker_confused
        Alright, alright... #speaker:The Undertaker #sprite:undertaker_neutral
        I might know... 
        ...Something. #sprite:undertaker_neutral
            ->Bargain
    **[Beg him]
        (You tell him it's for good) #speaker:???
        (You'd be doing a service)
        ... #speaker:The Undertaker
        HAHAHAHAH! #sprite:undertaker_drinking
        (He doesn't care) #speaker:??? #sprite:undertaker_adjust1
        (Of course he doesn't) #sprite:undertaker_adjust2
        ~notification("Idiot")
            ***[(Threaten him)]
                (You flash your "firearm")#speaker:???
                (He reconsiders...) #sprite:undertaker_confused
                Alright, alright... #speaker:The Undertaker #sprite:undertaker_neutral
                I might know... 
                ...Something. #sprite:undertaker_neutral
                    ->Bargain

=== Bargain ==
But... #speaker:The Undertaker #sprite:undertaker_handsoncounter
It would cost you. #sprite:undertaker_neutral
*[What?]
    A few miles from here... #speaker:The Undertaker #sprite:undertaker_neutral
    ...There's a camp of Raiders. #sprite:undertaker_handsoncounter
    Particularly villanous hooligans. #sprite:undertaker_angry
    It sure would be a shame if... #sprite:undertaker_handsoncounter
    They somehow...
    Disappeared? #sprite:undertaker_neutral
        **[I see...]
        If you manage to eliminate those... #speaker:The Undertaker #sprite:undertaker_handsoncounter
        Pests... #sprite:undertaker_hand_on_head
        I'd tell you what you need to know.
        ***[Take the deal]
            Excellent. #speaker:The Undertaker #sprite:undertaker_flirty
            Bring me the Leader's necklace, and I'll give you what you need. #sprite:undertaker_neutral
            Good luck! #sprite:undertaker_handsoncounter
            ...
                ~isRaiding = true
                ~loadScene("Raiders")
                ->END
        ***[Don't take the deal]
            ... #speaker:The Undertaker
            (It's sketchy, yes...) #speaker:???
            (But what other choice do you have?)
            (Grow a conscious later)
            ****[Take the deal]
                Excellent. #speaker:The Undertaker #sprite:undertaker_flirty
                Bring me the Leader's necklace, and I'll give you what you need. #sprite:undertaker_neutral
                Good luck! #sprite:undertaker_handsoncounter
                ...
                    ~isRaiding = true
                    ~loadScene("Raiders")
                    ->END