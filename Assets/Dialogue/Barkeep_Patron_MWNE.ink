INCLUDE globals.ink
#layout:left #speaker:The Man With No Eyes #sprite:MWNE_neutral #audio:beep_1
... #portrait:mwne
->Intro
=== Intro ===
...Hello?  #sprite:MWNE_pointing
Is someone there?
*[I'm here]
        ~notification("You have revealed yourself...")
        Oh, thank goodness! #speaker:The Man With No Eyes  #sprite:MWNE_neutral
        It's good to see another face! :D  #sprite:MWNE_smiling
            ***[Doesn't look like you see much of anything...]
                ...  #sprite:MWNE_neutral
                (He laughs, but is obviously hurt)  #sprite:MWNE_smiling
                (...Why would you do that?)
                    ****[Can I get you a drink?]
                            Oh, um...  #sprite:MWNE_neutral
                            ...Yes, please. 
                            ->Drink
            ***[Can I get you a drink?]
                    Oh, I'd die for one!  #sprite:MWNE_smiling
                    What um...  #sprite:MWNE_neutral
                    What do you have?
                    ->Drink
*[Ignore him]
    (You ignore the blind man) #speaker: ??? 
    ...Hello? #speaker: The Man With No Eyes
    Anyone?  #sprite:MWNE_pointing_happy
        **[Ignore him]
            (You ignore the blind man...) #speaker: ???
            (Again...) 
            (He begins to look anxious)  #sprite:MWNE_neutral
            Oh... Oh no. #speaker: The Man With No Eyes
            There really isn't anyone here, is there?  #sprite:MWNE_sad
                ***[Ignore him]
                    Oh no...  #sprite:MWNE_neutral
                    What am I going to-
                    ...
                    Eh...  #sprite:MWNE_neutral
                    (The Man With No Eyes get up and attempts to find the door)
                        ****[Stay Silent]
                            ...
                            ->Silence
                ***[Reveal Yourself]
                    (You reveal yourself) #speaker:???
                    (Maybe he'll forget your iniquity) 
                    (I won't...)
                    
                    Oh, thank goodness! #speaker:The Man With No Eyes  #sprite:MWNE_pointing_happy
                    I must not have heard you the first few times...  #sprite:MWNE_neutral
                    Regardless, it's good to see another face! :D  #sprite:MWNE_smiling
                        ****[Can I get you a drink?]
                            Oh, I'd die for one!  #sprite:MWNE_smilin
                            What um...  #sprite:MWNE_neutral
                            What do you have?  #sprite:MWNE_sad
                            ->Drink               
                        ****[Doesn't look like you can see much of anything]
                            ...  #sprite:MWNE_neutral
                            ...  #sprite:MWNE_sad
                            (He laughs, but is obviously hurt)  #sprite:MWNE_smiling
                            (Why would you do that...?)
                                *****[Can I get you a drink?]
                                Oh, um...  #sprite:MWNE_neutral
                                ...Yes, please.  #sprite:MWNE_smiling
                                ->Drink
        **[Reveal Yourself]
            (You reveal yourself) #speaker:???
            Oh, thank goodness! #speaker:The Man With No Eyes  #sprite:MWNE_pointing_happy
            I must not have heard you the first time...  #sprite:MWNE_neutral
            Regardless, it's good to see another face! :D  #sprite:MWNE_smiling
                ***[Doesn't look like you see much of anything...]
                    ...  #sprite:MWNE_sad
                    ...  #sprite:MWNE_neutral
                    (He laughs, but is obviously hurt)  #sprite:MWNE_smiling
                    (...Why would you do that?)
                        ****[Can I get you a drink?]
                                Oh, um...  #sprite:MWNE_neutral
                                ...Yes, please.  #sprite:MWNE_sad
                                ->Drink
                ***[Can I get you a drink?]
                    Oh, I'd die for one!  #sprite:MWNE_smiling
                    What um...  #sprite:MWNE_sad
                    What do you have?  #sprite:MWNE_neutral
                    ->Drink
                    
=== Drink ===
*[Whiskey]
    Oh um... #sprite:MWNE_neutral
    That's a bit strong for me. #sprite:MWNE_smiling
    Could I have just a small shot...  #sprite:MWNE_pointing
    ...Please? #sprite:MWNE_pointing_happy
    **[Good enough for me...] 
    ->Drinking
*[Wine]
    Oh, wine? #sprite:MWNE_sad
    ...That's really nice. #sprite:MWNE_smiling
    Could I just have a small glass?  #sprite:MWNE_pointing
    ...Please? #sprite:MWNE_pointing_happy
    **[Alright]   
    ->Drinking
    
*[Water]
    Oh, you have water here? :0 #sprite:MWNE_smiling
    I'll um...  #sprite:MWNE_pointing
    Have one...
    ...Please? #sprite:MWNE_pointing_happy
    **[Good choice choice] 
    ->Drinking

=== Drinking ===
    (GULP-GULP-GULP)  #sprite:MWNE_drinking
    Thanks, eh..  #sprite:MWNE_neutral
    ...
    ...A lot. #sprite:MWNE_smiling
    Haven't had much in a uh...
    Long time.  #sprite:MWNE_pointing
    ->Info
=== Info ===
...
Anything ya want to know? :D #sprite:MWNE_smiling
*[What happened to your eyes?]
    What happened to my wh-
    Oh... #sprite:MWNE_sad
    Um.  #sprite:MWNE_neutral
    I uh...  #sprite:MWNE_sad
    Owed someone something. #sprite:MWNE_smiling
    I wasn't able to pay it back.  #sprite:MWNE_pointing
    ...
    Heh, I don't, I don't mind.  #sprite:MWNE_pointing_happy
    Hey...  #sprite:MWNE_sad
    ...You're missing an eye.  #sprite:MWNE_neutral
    What happened to yours?  #sprite:MWNE_smiling
        **[...I don't remember]
            Oh...  #sprite:MWNE_sad
            Who can, nowadays, heh!  #sprite:MWNE_smiling
            ...Heh. 
            ...  #sprite:MWNE_neutral
            ->Info
*[What brings you here?]
    What brings me here?  #sprite:MWNE_smiling
    Well eh.  #sprite:MWNE_neutral
    I don't even know where I am...  #sprite:MWNE_pointing
    Where am I, exactly?  #sprite:MWNE_pointing_happy
        **[My Bar]
            Oh, alright, then.  #sprite:MWNE_smiling
            I don't hear anyone else...  #sprite:MWNE_sad
            Do gents not visit very often?  #sprite:MWNE_smiling
                ***[You're my first visitor in years]
                    Oh, really?  #sprite:MWNE_neutral
                    You've been alone...  #sprite:MWNE_sad
                    ...For that long?  #sprite:MWNE_neutral
                    How do you keep your sanity?  #sprite:MWNE_smiling
                        ****[I don't]
                            Oh...  #sprite:MWNE_sad
                            Hm.  #sprite:MWNE_neutral
                            Can't blame you.  #sprite:MWNE_smiling
                            Anyways though, where I was headed...  #sprite:MWNE_pointing
                            Well...  #sprite:MWNE_pointing_happy
                            ->Intentions
                        ****[Patience]
                            Patience?  #sprite:MWNE_sad
                            Really?  #sprite:MWNE_smiling
                            For years? 
                            Hm.  #sprite:MWNE_pointing
                            Impressive.  #sprite:MWNE_pointing_happy
                            Anyways though, where I was headed...  #sprite:MWNE_smiling
                            Well...  #sprite:MWNE_sad
                            ->Intentions
                        ****[Happy thoughts]
                            Happy tho-  #sprite:MWNE_sad
                            HA!  #sprite:MWNE_smiling
                            HAHAH! 
                            THAT'S-  #sprite:MWNE_pointing_happy
                            ...  #sprite:MWNE_pointing
                            Funny.  #sprite:MWNE_neutral
                            Heh, thanks, I needed that. :)  #sprite:MWNE_smiling
                            Anyways though, where headed...  #sprite:MWNE_neutral
                            ->Intentions
                            
                        ****[Backgammon]
                            ...  #sprite:MWNE_neutral
                            ...
                            Backgammon takes 2...  #sprite:MWNE_sad
                            ...
                            Huh.  #sprite:MWNE_neutral
                            I uh, guess one could.
                            ...Make their own rules?  #sprite:MWNE_smiling
                            Bagh, who am I to judge?  #sprite:MWNE_pointing_happy
                            Anyways though, where I'm going...  #sprite:MWNE_smiling
                            Well...  #sprite:MWNE_sad
                            ->Intentions
        **[Somewhere safe]
            Hah!  #sprite:MWNE_smiling
            ...one could...
            Hope so.  #sprite:MWNE_pointing
            Yet, I uh...  #sprite:MWNE_smiling
            I don't hear anyone else...  #sprite:MWNE_neutral
            Do gents not visit very often? #sprite:MWNE_sad
                ***[You're my first visitor in years]
                    Oh, really?  #sprite:MWNE_smiling
                    You've been alone...  #sprite:MWNE_neutral
                    ...For that long?  #sprite:MWNE_sad
                    How do you keep your sanity?  #sprite:MWNE_smiling
                        ****[I don't]
                            Oh...  #sprite:MWNE_neutral
                            Hm.
                            Can't blame you. #sprite:MWNE_smiling
                            Anyways though, where I was headed... #sprite:MWNE_neutral
                            Well...  #sprite:MWNE_sad
                            ->Intentions
                        ****[Patience]
                            Patience?  #sprite:MWNE_sad
                            Really? #sprite:MWNE_neutral
                            For years?  #sprite:MWNE_smiling
                            Hm.   #sprite:MWNE_neutral
                            Impressive.  #sprite:MWNE_pointing
                            Anyways though, where I was headed...   #sprite:MWNE_smiling
                            Well...  #sprite:MWNE_neutral
                            ->Intentions
                        ****[Backgammon]
                            ...  #sprite:MWNE_sad
                            ...  #sprite:MWNE_neutral
                            Backgammon takes 2...  #sprite:MWNE_sad
                            ...
                            Huh.  #sprite:MWNE_neutral
                            I uh, guess one could.  #sprite:MWNE_pointing 
                            ...Make their own rules?  #sprite:MWNE_pointing_happy
                            Bagh, who am I to judge?  #sprite:MWNE_smiling
                            Anyways though, where I'm going...  #sprite:MWNE_smiling
                            Well...  #sprite:MWNE_pointing
                            ->Intentions
            
        **[The Wasteland]
            Oh... #sprite:MWNE_sad
            ...That's not good.  #sprite:MWNE_smiling
            Wait.  #sprite:MWNE_neutral
            Why are you here?  #sprite:MWNE_sad
            ... 
            ...You're not a Raider, are you?  #sprite:MWNE_pointing
                ***[Yes. I am a Raider.]
                    ...  #sprite:MWNE_neutral
                    !@*$...  #sprite:MWNE_smiling
                    Oh well...  #sprite:MWNE_pointing
                    I don't even care anymore.  #sprite:MWNE_pointing_happy
                    I've already lost most everything...  #sprite:MWNE_pointing
                    ...What more could you take?  #sprite:MWNE_sad
                    ...  #sprite:MWNE_neutral
                    That was rhetorical.  #sprite:MWNE_smiling
                    Please do not take that literally.  #sprite:MWNE_neutral
                    ...Please?  #sprite:MWNE_sad
                    Wait...
                    If this is a Raider camp...  #sprite:MWNE_neutral
                    Why is it so quiet in here...?  #sprite:MWNE_pointing
                        ****[You're my first visitor in years]
                            Oh, really?  #sprite:MWNE_smiling
                            You've been alone...  #sprite:MWNE_neutral
                            ...For that long?  #sprite:MWNE_sad
                            How do you keep your sanity?  #sprite:MWNE_smiling
                                *****[I don't]
                                    Oh...  #sprite:MWNE_neutral
                                    Hm.
                                    Can't blame you. #sprite:MWNE_smiling
                                    Anyways though, where I was headed... #sprite:MWNE_neutral
                                    Well...  #sprite:MWNE_sad
                                    ->Intentions
                                *****[Patience]
                                    Patience?  #sprite:MWNE_sad
                                    Really? #sprite:MWNE_neutral
                                    For years?  #sprite:MWNE_smiling
                                    Hm.   #sprite:MWNE_neutral
                                    Impressive.  #sprite:MWNE_pointing
                                    Anyways though, where I was headed...   #sprite:MWNE_smiling
                                    Well...  #sprite:MWNE_neutral
                                    ->Intentions
                                *****[Backgammon]
                                    ...  #sprite:MWNE_sad
                                    ...  #sprite:MWNE_neutral
                                    Backgammon takes 2...  #sprite:MWNE_sad
                                    ...
                                    Huh.  #sprite:MWNE_neutral
                                    I uh, guess one could.  #sprite:MWNE_pointing 
                                    ...Make their own rules?  #sprite:MWNE_pointing_happy
                                    Bagh, who am I to judge?  #sprite:MWNE_smiling
                                    Anyways though, where I'm going...  #sprite:MWNE_smiling
                                    Well...  #sprite:MWNE_pointing
                                    ->Intentions
                ***[Of course not. I'm a bloody barkeep]
                    ...Really? #sprite:MWNE_neutral
                    Thank goodness... #sprite:MWNE_smiling
                    Wait. #sprite:MWNE_neutral
                    If this is a Bar, then... #sprite:MWNE_sad
                Why don't I hear anyone else... #sprite:MWNE_pointing
                Do gents not visit very often? #sprite:MWNE_pointing_happy
                        ****[You're my first visitor in years]
                            Oh, really?  #sprite:MWNE_smiling
                            You've been alone...  #sprite:MWNE_neutral
                            ...For that long?  #sprite:MWNE_sad
                            How do you keep your sanity?  #sprite:MWNE_smiling
                                *****[I don't]
                                    Oh...  #sprite:MWNE_neutral
                                    Hm.
                                    Can't blame you. #sprite:MWNE_smiling
                                    Anyways though, where I was headed... #sprite:MWNE_neutral
                                    Well...  #sprite:MWNE_sad
                                    ->Intentions
                                *****[Patience]
                                    Patience?  #sprite:MWNE_sad
                                    Really? #sprite:MWNE_neutral
                                    For years?  #sprite:MWNE_smiling
                                    Hm.   #sprite:MWNE_neutral
                                    Impressive.  #sprite:MWNE_pointing
                                    Anyways though, where I was headed...   #sprite:MWNE_smiling
                                    Well...  #sprite:MWNE_neutral
                                    ->Intentions
                                *****[Backgammon]
                                    ...  #sprite:MWNE_sad
                                    ...  #sprite:MWNE_neutral
                                    Backgammon takes 2...  #sprite:MWNE_sad
                                    ...
                                    Huh.  #sprite:MWNE_neutral
                                    I uh, guess one could.  #sprite:MWNE_pointing 
                                    ...Make their own rules?  #sprite:MWNE_pointing_happy
                                    Bagh, who am I to judge?  #sprite:MWNE_smiling
                                    Anyways though, where I'm going...  #sprite:MWNE_smiling
                                    Well...  #sprite:MWNE_pointing
                                    ->Intentions
                
                ***[I'm Santa Claus]
                Oh, heh!  #sprite:MWNE_smiling
                That's a... #sprite:MWNE_pointing_happy
                ...That's a good one. #sprite:MWNE_pointing
                I guess that makes me... #sprite:MWNE_neutral
                The Queen of England? #sprite:MWNE_smiling
                Heh. 
                Anyways though, where I'm going... #sprite:MWNE_pointing
                ->Intentions
    
    
    
*[What's your name?]
    Oh, me? #sprite:MWNE_smiling
    My name is... #sprite:MWNE_neutral
    ...#sprite:MWNE_sad
    I...
    I don't even remember. #sprite:MWNE_neutral
    ...Hm.
    What's yours? #sprite:MWNE_smiling
        **[The Barkeep]
            ...Hm. #sprite:MWNE_neutral
            Guess you don't remember either.
            Eh, who can nowadays?#sprite:MWNE_smiling
            Anyways... 
            ->Info
        **[I don't remember either]
            Eh, who can nowadays? #sprite:MWNE_smiling 
            Hah...
            Anyways... #sprite:MWNE_sad
            ->Info
        **[Santa Claus]
            Sant- #sprite:MWNE_neutral
            Hah! #sprite:MWNE_smiling
            That's... #sprite:MWNE_pointing
            Heh...#sprite:MWNE_pointing_happy
            Good for you, mate. #sprite:MWNE_smiling
            Anyways... #sprite:MWNE_neutral
            ->Info
*[How's the world doing?]
    How's the- #sprite:MWNE_neutral
    ... 
    ...Oh. #sprite:MWNE_sad
    It's... #sprite:MWNE_neutral
    It's going to get better.
    I'm sure of it! #sprite:MWNE_smiling
    ...Just... #sprite:MWNE_neutral
    ...Have to give it time. #sprite:MWNE_smiling
    **[I believe you]
        You... #sprite:MWNE_neutral
        You do? :D #sprite:MWNE_smiling
        ...Wow. #sprite:MWNE_pointing
        Thank you. #sprite:MWNE_pointing_happy
        Anyways... #sprite:MWNE_neutral
        ->Info
    **[You're a fool]
        ... #sprite:MWNE_smiling
        ...Oh. #sprite:MWNE_neutral 
        You really think so? #sprite:MWNE_sad
        ...hm.  :( 
        Anyways... #sprite:MWNE_neutral
        ->Info

== Intentions ==
Between you and I.. #sprite:MWNE_neutral
I'm kind of... #sprite:MWNE_sad
...Running from something. #sprite:MWNE_pointing

    *[A masked-man?]
        A maske- #sprite:MWNE_neutral
        Oh, no, nothing like that, hah! #sprite:MWNE_smiling
        It's not a person, so much as... #sprite:MWNE_neutral
        A uh... #sprite:MWNE_sad
        ...
            **[A what?]
                I just... #sprite:MWNE_neutral
                ...
                Can you keep a secret? #sprite:MWNE_sad
                    ***[Yes]
                        And do you promise not to kill me? #sprite:MWNE_neutral
                        Well, obviously not kill, but uh. #sprite:MWNE_smiling
                        Hurt me? 
                            ****[Yes]
                                Okay, well... #sprite:MWNE_neutral
                                ->Confession

=== Confession ===

I was... #sprite:MWNE_neutral
I was part of the research team that... #sprite:MWNE_sad
...
Murdered Death. #sprite:MWNE_neutral
I know everybody blames it on that uh... #sprite:MWNE_pointing
High-brow scientist... #sprite:MWNE_pointing_happy
But it was something of a team-effort. #sprite:MWNE_neutral
... #sprite:MWNE_sad
Don't look at me like that! #sprite:MWNE_pointing
I didn't WANT to kill him! #sprite:MWNE_pointing_happy
I certainly didn't want all of this to happen!  #sprite:MWNE_smiling
I just... #sprite:MWNE_neutral
...Wanted to help people. #sprite:MWNE_sad
Soon enough, he went Rogue.
By the time the whole deed was done, we had all moved on. #sprite:MWNE_neutral
...This might sound horrible, but...
...I'm kind of glad he got all of the blame. #sprite:MWNE_smiling
I don't... #sprite:MWNE_neutral
I don't think I could have lasted...
NEAR long as I have, with a uh... #sprite:MWNE_sad
HORDE of half-dead people chasing me my whole life. #sprite:MWNE_pointing
...I wonder where he is... #sprite:MWNE_pointing_happy
Maybe he's alright. #sprite:MWNE_pointing
Agh, it doesn't matter. #sprite:MWNE_sad
Nobody's REALLY alright nowadays, anyway. #sprite:MWNE_neutral
But...
That's why I'm wandering. #sprite:pointing
Can't let the past catch up to me... #sprite:MWNE_pointing_happy
'Course, you probably think I'm a mad-man now... #sprite:MWNE_neutral
I just... #sprite:MWNE_sad
Wish I could've changed things... 
What do you think? #sprite:MWNE_neutral
    *[This wasn't your fault]
        ...
        ...You really don't think so? #sprite:MWNE_sad
        ...Huh.
        That's... #sprite:MWNE_neutral
        ...Surprising. #sprite:MWNE_smiling
        ... #sprite:MWNE_neutral
        Thank you...  #sprite:MWNE_smiling
        ...
        I should... #sprite:MWNE_neutral
        Probably go now. #sprite:MWNE_pointing
        ->End

    *[This is all your fault]
        ... #sprite:MWNE_neutral
        ...You really think so? #sprite:MWNE_sad
        **[I know so]
            ...Oh no. #sprite:MWNE_neutral
            You're...
            ...You're right. #sprite:MWNE_sad
            ...
            I should... #sprite:MWNE_pointing
            Probably go now. #sprite:MWNE_pointing_happy
            ->End



=== Silence ===
(He's gone...) #sprite:default
(You abandoned a man in need)
(And for what?)
(What did you gain by this?)
(You gained what you are;)
(Nothing.)
(It was worthless)
(YOU are worthless)
(What am I going to even do to you?)
(I'll...)
(Banish you.)
(Yeah, that's right, I'll just banish you.)
(Enjoy the main menu, dipshit)
~loadScene("MainMenu")
->END


=== End ===
    Thanks for the drink... #sprite:MWNE_pointing_happy
    Here, take this.
    I know, it's not much, but... #sprite:MWNE_pointing
    It's was always a lot of fun for me.#sprite:MWNE_pointing_happy
    I'll see ya around...
    (You Gained: Rube Cube!) #sprite:default
    ~hasSouvenir3 = true
    ...
    ~loadScene("Soldier")
    ->END
