INCLUDE globals.ink
#layout:left #speaker:The Man With No Eyes #sprite:MWNE_neutral #audio:beep_1
... #portrait:marauder
->Intro
=== Intro ===
...Is someone there?
*[I'm here]
        ~notification("You have revealed yourself...")
        Oh, thank goodness! #speaker:The Man With No Eyes
        It's good to see another face! :D
            ***[Doesn't look like you see much of anything...]
                ...
                (He laughs, but is obviously hurt)
                (...Why would you do that?)
                    ****[Can I get you a drink?]
                            Oh, um...
                            ...Yes, please.
                            ->Drink
            ***[Can I get you a drink?]
                    Oh, I'd die for one!
                    What um...
                    What do you have?
                    ->Drink
*[Ignore him]
    (You ignore the blind man) #speaker: ??? 
    ...Hello? #speaker: The Man With No Eyes
    Anyone?
        **[Ignore him]
            (You ignore the blind man...) #speaker: ???
            (Again...)
            (He begins to look anxious)
            Oh... Oh no. #speaker: The Man With No Eyes
            There really isn't anyone here, is there?
                ***[Ignore him]
                    Oh no...
                    What am I going to-
                    ...
                    Eh...
                    (The Man With No Eyes get up and attempts to find the door)
                        ****[Stay Silent]
                            ...
                            ->Silence
                ***[Reveal Yourself]
                    (You reveal yourself) #speaker:???
                    (He'll forget you iniquity)
                    (I won't...)
                    
                    Oh, thank goodness! #speaker:The Man With No Eyes
                    I must not have heard you the first few times...
                    Regardless, it's good to see another face! :D
                        ****[Can I get you a drink?]
                            Oh, I'd die for one!
                            What um...
                            What do you have?
                            ->Drink               
                        ****[Doesn't look like you can see much of anything]
                            ...
                            (He laughs, but is obviously hurt)
                            (Why would you do that...?)
                                *****[Can I get you a drink?]
                                Oh, um...
                                ...Yes, please.
                                ->Drink
        **[Reveal Yourself]
            (You reveal yourself) #speaker:???
            Oh, thank goodness! #speaker:The Man With No Eyes
            I must not have heard you the first time...
            Regardless, it's good to see another face! :D
                ***[Doesn't look like you see much of anything...]
                    ...
                    (He laughs, but is obviously hurt)
                    (...Why would you do that?)
                        ****[Can I get you a drink?]
                                Oh, um...
                                ...Yes, please.
                                ->Drink
                ***[Can I get you a drink?]
                    Oh, I'd die for one!
                    What um...
                    What do you have?
                    ->Drink
                    
=== Drink ===
*[Whiskey]
    Oh um... #sprite:MWNE_sad
    That's a bit strong for me. #sprite:MWNE_neutral
    Could I have just a small shot...
    ...Please? #sprite:MWNE_smiling
    **[Good enough for me...] 
    ->Drinking
*[Wine]
    Oh, wine? #sprite:MWNE_sad
    ...That's really nice. #sprite:MWNE_smiling
    Could I just have a small glass?
    ...Please? #sprite:MWNE_sad
    **[Alright]   
    ->Drinking
    
*[Water]
    Oh, you have water here? :0 #sprite:MWNE_smiling
    I'll um...  #sprite:MWNE_sad
    Have one...
    ...Please? #sprite:MWNE_smiling
    **[Good choice choice] 
    ->Drinking

=== Drinking ===
    (GULP-GULP-GULP)
    Thanks, eh..
    ...
    ...A lot. 
    Haven't had much in a uh...
    Long time.
    Anyways, enough of me.
    VAR hasAskedOnce2 = false
    ->Info
=== Info ===
{hasAskedOnce2:Anything else you wanted to know?|Anything you want to know?}
~hasAskedOnce2 = true 

*[What happened to your eyes?]
    What happened to my wh-
    Oh...
    Um.
    I uh...
    Owed someone something.
    I wasn't able to pay it back.
    ...
    Heh, I don't, I don't mind.
    ...
    ...You're missing an eye.
    ...What happened to yours?
        **[...I don't remember]
            Oh...
            Who can, nowadays, heh!
            ...Heh.
            ...
            ->Info
*[What brings you here?]
    What brings me here?
    Well eh.
    I don't even know where I am...
    Where am I, exactly?
        **[My Bar]
            Oh, alright, then.
            I don't hear anyone else...
            Do gents not visit very often?
                ***[You're my first visitor in years]
                    Oh, really?
                    You've been alone...
                    ...For that long?
                    How do you keep your sanity?
                        ****[I don't]
                            Oh...
                            Hm.
                            Can't blame you.
                            Anyways though, where I was headed...
                            Well...
                            ->Intentions
                        ****[Patience]
                            Patience?
                            Really?
                            For years?
                            Hm. 
                            Impressive.
                            Anyways though, where I was headed...
                            Well...
                            ->Intentions
                        ****[Happy thoughts]
                            Happy tho-
                            HA!
                            HAHAH!
                            THAT'S-
                            ...
                            Funny.
                            Heh, thanks, I needed that. :)
                            Anyways though, where headed...
                            ->Intentions
                            
                        ****[Backgammon]
                            ...
                            ...
                            Backgammon takes 2...
                            ...
                            Huh.
                            I uh, guess one could.
                            ...Make their own rules?
                            Bagh, who am I to judge?
                            Anyways though, where I'm going...
                            Well...
                            ->Intentions
        **[Somewhere safe]
            Hah!
            ...one could...
            Hope so. 
            Yet, I uh...
            I don't hear anyone else...
            Do gents not visit very often?
                ***[You're my first visitor in years]
                    Oh, really?
                    You've been alone...
                    ...For that long?
                    How do you keep your sanity?
                        ****[I don't]
                            Oh...
                            Hm.
                            Can't blame you.
                            Anyways though, where I was headed...
                            Well...
                            ->Intentions
                        ****[Patience]
                            Patience?
                            Really?
                            For years?
                            Hm. 
                            Impressive.
                            Anyways though, where I was headed...
                            Well...
                            ->Intentions
                        ****[Happy thoughts]
                            Happy tho-
                            HA!
                            HAHAH!
                            THAT'S-
                            ...
                            Funny.
                            Heh, thanks, I needed that. :)
                            Anyways though, where headed...
                            ->Intentions
                            
                        ****[Backgammon]
                            ...
                            ...
                            Backgammon takes 2...
                            ...
                            Huh.
                            I uh, guess one could.
                            ...Make their own rules?
                            Bagh, who am I to judge?
                            Anyways though, where I'm going...
                            Well...
                            ->Intentions
            
        **[The Wasteland]
            Oh...
            ...That's not good.
            Oh no.
            ...Wait.
            Why are you here?
            ...
            ...You're not a Raider, are you?
                ***[Yes. I am a Raider.]
                    ...
                    !@*$...
                    Oh well...
                    I don't even care anymore.
                    I've already lost most everything...
                    ...What more could you take?
                    ...
                    That was rhetorical.
                    Please do not take that literally.
                    ...Please?
                    Wait...
                    If this is a Raider camp...
                    Why is it so quiet in here...?
                        ****[You're my first visitor in years]
                                                Oh, really?
                                                You've been alone...
                                                ...For that long?
                                                How do...
                                                How do you keep your sanity?
                                                    *****[I don't]
                                                        Oh...
                                                        Hm.
                                                        Can't blame you.
                                                        Anyways though, where I was headed...
                                                        Well...
                                                        ->Intentions
                                                    ******[Patience]
                                                        Patience?
                                                        Really?
                                                        For years?
                                                        Hm. 
                                                        Impressive.
                                                        Anyways though, where I was headed...
                                                        Well...
                                                        ->Intentions
                                                    ******[Happy thoughts]
                                                        Happy tho-
                                                        HA!
                                                        HAHAH!
                                                        THAT'S-
                                                        ...
                                                        Funny.
                                                        Heh, thanks, I needed that. :)
                                                        Anyways though, where headed...
                                                        ->Intentions
                                                        
                                                    ******[Backgammon]
                                                        ...
                                                        ...
                                                        Backgammon takes 2...
                                                        ...
                                                        Huh.
                                                        I uh, guess one could.
                                                        ...Make their own rules?
                                                        Bagh, who am I to judge?
                                                        Anyways though, where I'm going...
                                                        Well...
                                                        ->Intentions
                ***[Of course not. I'm a bloody barkeep]
                    ...Really?
                    Thank goodness...
                    Wait.
                    If this is a Bar, then...
                Why don't I hear anyone else...
                Do gents not visit very often?
                    ****[You're my first visitor in years]
                        Oh, really?
                        You've been alone...
                        ...For that long?
                        How...
                        How do you keep your sanity?
                            *****[I don't]
                                Oh...
                                Hm.
                                Can't blame you.
                                Anyways though, where I was headed...
                                Well...
                                ->Intentions
                            ******[Patience]
                                Patience?
                                Really?
                                For years?
                                Hm. 
                                Impressive.
                                Anyways though, where I was headed...
                                Well...
                                ->Intentions
                            ******[Happy thoughts]
                                Happy tho-
                                HA!
                                HAHAH!
                                THAT'S-
                                ...
                                Funny.
                                Heh, thanks, I needed that. :)
                                Anyways though, where headed...
                                ->Intentions
                                
                            ******[Backgammon]
                                ...
                                ...
                                Backgammon takes 2...
                                ...
                                Huh.
                                I uh, guess one could.
                                ...Make their own rules?
                                Bagh, who am I to judge?
                                Anyways though, where I'm going...
                                Well...
                                ->Intentions
                
                ***[I'm Santa Claus]
                Oh, heh!
                That's a...
                ...That's a good one.
                I guess that makes me...
                The Queen of England?
                Heh.
                Anyways though, where I'm going...
                ->Intentions
    
    
    
*[What's your name?]
    Oh, me?
    My name is...
    ...
    I...
    I don't even remember.
    ...Hm.
    What's yours?
        **[The Barkeep]
            ...Hm.
            Guess you don't remember either.
            Eh, who can nowadays?
            Anyways...
            ->Info
        **[I don't remember either]
            Eh, who can nowadays? 
            Hah...
            Anyways...
            ->Info
        **[Santa Claus]
            Sant-
            Hah!
            That's...
            Good for you.
            Heh...
            Anyways...
            ->Info
*[How's the world doing?]
    How's the-
    ...
    ...Oh.
    It's...
    It's going to get better.
    I'm sure of it!
    ...Just...
    ...Have to give it time.
    **[I believe you]
        You...
        You do? :D
        ...Wow.
        Thank you.
        Anyways...
        ->Info
    **[You're a fool]
        ...
        ...Oh.
        You really think so?
        ...hm.  :(
        Anyways...
        ->Info

== Intentions ==
Between you and I..
I'm kind of...
...Running from something.

    *[A masked-man?]
        A maske-
        Oh, no, nothing like that, hah!
        It's not a person, so much as...
        A uh...
        ...
            **[A what?]
                I just...
                ...
                Can you keep a secret?
                    ***[Yes]
                        And do you promise not to kill me?
                        Well, obviously not kill, but uh.
                        Hurt me?
                            ****[Yes]
                                Okay, well...
                                ->Confession

=== Confession ===

I was...
I was part of the research team that...
...
Murdered Death.
I know everybody blames it on that High-Brow Scientist, but uh...
...It was something of a team-effort.
...
Don't look at me like that!
I didn't WANT to kill him!
I certainly didn't want all of this to happen!
I just...
...Wanted to help people.
Soon enough, he went Rogue.
...But he didn't do it alone.
He could have, of course.
But he had a team, for a time.
Eventually, he went rogue and worked under-wraps.
By the time the whole deed was done, we had all moved on.
...This might sound horrible, but...
...I'm kind of glad he got all of the blame.
I don't...
I don't think I could have lasted near as long as I have with a horde of half-dead people chasing me my whole life.
...I wonder where he is...
Maybe he's alright.
Agh, it doesn't matter.
Nobody's REALLY alright nowadays, anyway.

But...
That's why I'm wandering.
Can't let the past catch up to me...
'Course, you probably think I'm a mad-man now...
I just...
Wish I could've changed things...
What do you think?
    *[This wasn't your fault]
        ...
        ...You really don't think so?
        ...Huh.
        That's...
        ...Surprising.
        ...
        Thank you...
        ...
        I should...
        Probably go now.
        ->End

    *[This is all your fault]
        ...
        ...You really think so?
        ...Oh no.
        You're...
        ...You're right.
        ...
        I should...
        Probably go now.
        ->End



=== Silence ===
(He's gone...)
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

*[Wait no please]
    I don't care
    ->END

=== End ===
    Thanks for the drink...
    Here, take this.
    I know, it's not much, but...
    It's was always a lot of fun for me.
    (You Have Gained a Souvenir: Rube Cube!)
    ~hasSouvenir3 = true
    *[Good-Bye]
    ~loadScene("Soldier")
    ->END
