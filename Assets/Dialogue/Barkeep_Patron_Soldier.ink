INCLUDE globals.ink
#layout:left #speaker:Soldier #sprite:soldier_standing #audio:beep_1 # #portrait:soldier
Sargeant Nescio, at attention. #sprite:soldier_salute
*[...At ease?]
    ->Intro


=== Intro ===
Thank you, Lietuenant. #sprite:soldier_standing
...
    *[Can I get you a drink?]
        Never.
        Alcohol is forbidden in the trenches. #sprite:soldier_salute
        ... #sprite:soldier_standing
        **[Well, you're not in the trenches currently, are you?]
        ...
        ...No. #sprite:soldier_curious
        Civilian, quick! #sprite:soldier_angry
        One water! 
        Double speed! #sprite:soldier_salute
        ***[Alright]
            ->Drinking
        ***[Come on, you can do better that that]
          ->ChooseDrink
=== ChooseDrink ===
... #sprite:soldier_curious
I suppose you're right. #sprite:soldier_standing
I'm...  #sprite:soldier_curious
Not used to talking to civilians. #sprite:soldier_sad
What would you recommend?
    *[Whiskey]
    *[Bourbon]
    *[Wine]
        -...
        Give me three. #sprite:soldier_angry
        ->Drinking
=== Drinking ===
VAR hasAskedOnce3 = false
(Gulg-gulg-gulg) #sprite:soldier_drinking
Ah... #sprite:soldier_standing
You deserve a medal, doc. #sprite:soldier_angry
Anyways... #sprite:soldier_curious
How goes civilian life in this quadrant? #sprite:soldier_standing
Have the enemy been over-run? #sprite:soldier_angry

    *[...There are no enemies here.]
    Jolly-good! #sprite:soldier_salute
    Victory is ours, then? #sprite:soldier_angry
        **[...How long have you been out of duty?]
        Not long! #sprite:soldier_salute
        Just since... Well. #sprite:soldier_standing
        What year is it? #sprite:soldier_curious
        Agh, doesn't matter! #sprite:soldier_salute
        Is there something I'm not aware of? #sprite:soldier_standing
        Are there enemies here?! #sprite:soldier_curious
        DO WE NEED TO ACT NOW?! #sprite:soldier_angry
            ***[Calm down...]
            Ah, of course! #sprite:soldier_salute
            Well, what are you waiting for? #sprite:soldier_curious
            What is it? #sprite:soldier_angry
            ****[The War is over...]
            ->Realization
=== Realization ===
What? #sprite:soldier_curious
Nonsense! #sprite:soldier_angry
Why, I was out in the trenches a few days ago! #sprite:soldier_standing
Or at least... #sprite:soldier_curious
What year is it?
Agh, doesn't matter! #sprite:soldier_salute
Enough worthless scrabble! #sprite:soldier_angry
What was the issue? #sprite:soldier_standing
Where is the enemy! #sprite:soldier_curious
    *[The War is over, mate]
    ... 
    Hahah! #sprite:soldier_standing
    It's even FUNNIER the second time! :D #sprite:soldier_angry
    Hahah!
    Heh... #sprite:soldier_standing
    ...
    Why are you looking at me like that? #sprite:soldier_curious
    ... 
    What are you saying? #sprite:soldier_standing
        **[The War. Is over.]
            ...
            That... #sprite:soldier_curious
            That doesn't make any sense! #sprite:soldier_angry
            I was...
            I was JUST there! #sprite:soldier_standing
            I... #sprite:soldier_curious
            ->Shock
                        

=== Shock ===
How... 
Why don't I... #sprite:soldier_sad
Remember...?
Civilian! #sprite:soldier_angry

How long... #sprite:soldier_curious
Has the War been over? #sprite:soldier_standing
    *[Centuries]
        ... 
        ... #sprite:soldier_curious
        Did we win? #sprite:soldier_standing
            **[...Yes]
                Ahah! #sprite:soldier_angry
                Of course we did!  
                Those commies didn't stand a chance! #sprite:soldier_salute
                Er, fascists. #sprite:soldier_standing
                Wait... #sprite:soldier_curious
                Who...
                Who were we fighting? #sprite:soldier_standing
                ...
                Ergh, it doesn't matter! #sprite:soldier_angry
                We won, didn't we!  #sprite:soldier_salute
                Hahahah!  #sprite:soldier_standing
                ...
                ->Memory
            **[Nobody did]
                    Nobody won...? #sprite:soldier_curious
                    But... #sprite:soldier_standing
                    That means we both lost... #sprite:soldier_curious
                    Which means... 
                    THE ENEMY LOST! #sprite:soldier_angry
                    Ahahahah!
                    Of course they lost! #sprite:soldier_standing
                    Those commies didn't stand a chance! #sprite:soldier_standing
                    Er, facists.
                    Wait... #sprite:soldier_curious
                    Who...
                    Who were we fighting? #sprite:soldier_standing
                    ...
                    Ergh, it doesn't matter! #sprite:soldier_angry
                    We won, didn't we! #sprite:soldier_standing
                    Haha! 
                        ... #sprite:soldier_curious
                            ->Memory


=== Memory ===
What... #sprite:soldier_sad
What else has changed?
*[What do you remember?]
    Well... #sprite:soldier_curious
    I was...
    In the trenches... #sprite:soldier_standing
    We were getting rained down by snipers, and... #sprite:soldier_angry
    ...
    I don't remember anything else... #sprite:soldier_curious
    How long ago did you say the war was? #sprite:soldier_standing
    **[...Centuries]
    Cent- #sprite:soldier_angry
    But... #sprite:soldier_standing
    ... #sprite:soldier_curious
    Oh... #sprite:soldier_sad
    Why don't I...
    Why can't I remember?! #sprite:soldier_standing
    ***[Whats under your helmet?]
        My helmet? #sprite:soldier_curious
        What does that have to do with anything? #sprite:soldier_standing
            ****[Nevermind...]
            This is... #sprite:soldier_sad
            ... #sprite:soldier_curious
            What happened to the president? #sprite:soldier_standing
            The government? 
            I gave EVERYTHING to them! #sprite:soldier_angry
                *****[They're gone...]
                I... #sprite:soldier_standing
                That can't be...
                ... #sprite:soldier_curious
                I did so many... #sprite:soldier_standing
                Bad... ##sprite:soldier_curious
                HORRIBLE. #sprite:soldier_shellshock
                VILE things... #sprite:soldier_angry
                And... #sprite:soldier_standing
                For what?
                ... #sprite:soldier_curious
                What have I done? #sprite:soldier_sad
                ->Confession

=== Confession ===
*[(Comfort them)]
(You tell her it's not her fault) #speaker:???
(The past doesn't have to define her future)
... 
(She looks a little better) #sprite:soldier_standing
~notification("The Soldier will remember that...")
~valiance = valiance + 1
... #speaker:The Soldier
Do you really think so? #sprite:soldier_curious
    **[I know so]
    ...
    Heh. #sprite:soldier_standing
    That really...
    ...Thank you. #sprite:soldier_salute
    I... #sprite:soldier_standing
    I need to get out of here... #sprite:soldier_curious
    Thank you so much for the help. #sprite:soldier_standing
    As a bit of a reward... #sprite:soldier_angry
    ->End
    
*[(Blame them)]
    (You tell them all of the pain they've caused is their fault) #speaker:???
    (You tell them that even if there were no war, she still would've killed)
    (You tell them there is no hope for scum like her.)
    ... #sprite:soldier_standing
    Do... Do you really think so?    #speaker:The Soldier
        **[I know so]
        ... #sprite:soldier_curious
        ... #sprite:soldier_sad
        I need to leave. #sprite:soldier_standing
        ...Thanks for the drink, civilian. #sprite:soldier_angry
        ~notification("The Soldier will remember this")
        (Your Sadism has increased!) 
        ~sadism = sadism + 1
        ... #sprite:default
        The Soldier is gone.
        Good riddance...
        ***[Continue the game]
            ~loadScene("Marauder")
            ->END

=== End ===
    Take this. #sprite:soldier_angry
    It's not much, but well... #sprite:soldier_curious
    I made it myself. #sprite:soldier_standing
    Next time someone gives you trouble, you'll be ready! >:D #sprite:soldier_angry
    ~notification("You gained a souvenir: Questionable Explosive")
    ~hasSouvenir4 = true
    ...I'll be seeing you...  #sprite:empty
        ...
        ~loadScene("Marauder")
        ->END