INCLUDE globals.ink
#layout:left #speaker:Soldier #sprite:MWNE_neutral #audio:beep_1 # #portrait:soldier
Sargeant Nescio, at attention.
*[...At ease?]
    ->Intro


=== Intro ===
Thank you, Lietuenant.
...
    *[Can I get you a drink?]
        Never. 
        Alcohol is forbidden in the trenches.
        ...
        **[Well, you're not in the trenches currently, are you?]
        ...
        ...No.
        Civilian, quick!
        One water! 
        Double speed!
        ***[Alright]
            ->Drinking
        ***[Come on, you can do better that that]
          ->ChooseDrink
=== ChooseDrink ===
...
I suppose you're right.
I'm... 
Not used to talking to civilians.
What would you recommend?
    *[Whiskey]
    *[Bourbon]
    *[Wine]
        -...
        Give me three.
        ->Drinking
=== Drinking ===
VAR hasAskedOnce3 = false

(Gulg-gulg-gulg)
Ah...
You deserve a medal, doc.
Anyways...
How goes civilian life in this quadrant?
Have the enemy been over-run?

    *[...There are no enemies here.]
    Jolly-good!
    Victory is ours, then?
        **[...How long have you been out of duty?]
        Not long!
        Just since... Well.
        What year is it?
        Agh, doesn't matter!
        Is there something I'm not aware of?
        Are there enemies here?!
        DO WE NEED TO ACT NOW?!
            ***[Calm down...]
            Ah, of course!
            Well, what are you waiting for?
            What is it?
            ****[The War is over...]
            ->Realization
=== Realization ===
What?
Nonsense!
Why, I was out in the trenches a few days ago!
Or at least...
What year is it?
Agh, doesn't matter!
Enough worthless scrabble!
What was the issue?
Where is the enemy!
    *[The War is over, mate]
    ...
    Hahah!
    It's even FUNNIER the second time! :D
    Hahah!
    Heh...
    ...
    Why are you looking at me like that?
    ...
    What are you saying?
        **[The War. Is over.]
            ...
            That...
            That doesn't make any sense!
            I was...
            I was JUST there!
            I...
            ->Shock
                        

=== Shock ===
How...
Why don't I...
Remember...?
Civilian! 

How long...
Has the War been over?
    *[Centuries]
        ...
        ...
        Did we win?
            **[...Yes]
                Ahah!
                Of course we did! 
                Those commies didn't stand a chance!
                Er, fascists.
                Wait...
                Who...
                Who were we fighting?
                ...
                Ergh, it doesn't matter!
                We won, didn't we! 
                Hahahah! 
                ...
                ->Memory
            **[Nobody did]
                    Nobody won...?
                    But...
                    That means we both lost...
                    Which means...
                    THE ENEMY LOST!
                    Ahahahah!
                    Of course they lost!
                    Those commies didn't stand a change!
                    Er, facists.
                    Wait...
                    Who...
                    Who were we fighting?
                    ...
                    Ergh, it doesn't matter!
                    We won, didn't we! 
                    Haha! 
                        ...
                            ->Memory


=== Memory ===
What...
What else has changed?
*[What do you remember?]
    Well...
    I was...
    In the trenches...
    We were getting rained down by snipers, and...
    ...
    I don't remember anything else...
    How long ago did you say the war was?
    **[...Centuries]
    Cent-
    But...
    ...
    Oh...
    Why don't I...
    Why can't I remember?!
    ***[Whats under your helmet?]
        My helmet?
        What does that have to do with anything?
            ****[Nevermind...]
            This is...
            ...
            What happened to the president?
            The government?
            I gave EVERYTHING to them!
                *****[They're gone...]
                I...
                That can't be...
                ...
                I did so many...
                HORRIBLE things...
                And... 
                For what?
                ...
                What have I done?
                ->Confession

=== Confession ===
*[(Comfort them)]
(You tell her it's not her fault) #speaker:???
(The past doesn't have to define her future)
... 
(She looks a little better)
~notification("The Soldier will remember that...")
~valiance = valiance + 1
... #speaker:The Soldier
Do you really think so?
    **[I know so]
    ...
    Heh.
    That really...
    ...Thank you.
    I...
    I need to get out of here...
    Thank you so much for the help.
    As a bit of a reward...
    ->End
    
*[(Blame them)]
    (You tell them all of the pain they've caused is their fault) #speaker:???
    (You tell them that even if there were no war, she still would've killed)
    (You tell them there is no hope for scum like her.)
    ...
    Do... Do you really think so?    #speaker:The Soldier
        **[I know so]
        ...
        I need to leave.
        ...Thanks for the drink, civilian.
        ~notification("The Soldier will remember this")
        (Your Sadism has increased!)
        ~sadism = sadism + 1
        ...
        The Soldier is gone.
        Good riddance...
        ***[Continue the game]
            ~loadScene("Marauder")
            ->END

=== End ===
    Take this.
    It's not much, but well...
    I made it myself.
    Next time someone gives you trouble, you'll be ready! >:D
    ~notification("You gained a souvenir: Questionable Explosive")
    ~hasSouvenir4 = true
    ...I'll be seeing you...
    *[Bye]
    ~loadScene("Marauder")
    ->END