INCLUDE globals.ink
#layout:left #speaker:Little Girl #sprite:MWNE_neutral #audio:beep_1 # #portrait:default
...
->TooLow

=== TooLow ===
...
Egh!
...
...Hello?
*[Can I... Help you?]
    Eh!
    ...
    I can't reach...
    **[(Pull her a chair)]
    Oh!
    Thank you. :D
        ***[...]
        ->Intro
*[Ignore]
    ->TooLow
=== Intro ===
I'm Phaelum.
What's your name? :)
*[...Barkeep is fine.]
    Barkeep?
    That's a silly name!
    I'll call you...
    Jack. :D
    **[Alright]
        ->Main
        
    **[That name sucks]
        (You prepare to tell her that name sucks)
        (...But decide not to be a jerk for no reason)
        ->Main
*[I don't remember]
    You don't remember your name? :0
    That's sad...
    I'll call you...
    Jack. :D
    **[Alright]
        ->Main
        
    **[That name sucks]
        (You prepare to tell her that name sucks)
        (...But decide not to be a jerk for no reason)
        ->Main
=== Main ===
So, Jack...
Have you seen my mama?
*[...What?]
    I've been looking for my mama!
    She's been missing for a long time...
    So I'm going to find her! >:D
    **[That's very brave of you]
    Thank you, mister!
    So...
    Have you seen my mama?
        ***[What does she look like?]
        Well...
        She kind of looks like me!
        But taller! ^^
        I haven't seen her in a while...
            ****[When did you see her last?]
            ->SeenLast
            
=== SeenLast ===
Well...
A few weeks ago, I guess?
She was getting real sick.
So she went to get medicine. :D
She promised she'd find me though.
She never did, so I'm gonna find her! 
I hope she's okay...
    *[I'm sure she is]
        You think so? ^^
        **[I know so]
            Of course she is! >:D
            I'll find her!
            ->How
        **[Not really]
            (You again decide to crush this girl's dreams)
            (...Why would you do that?)
            (Come on man, just...)
            (Just don't)
            (Be better)
            (Go back)
                ***[I know so]
                    Of course she is! >:D
                    I'll find her!
                    ->How
    *[Your mama is dead]
        (You decide to tell her that her mother is likely convulsing in a ditch somewhere.)
        (Why would you even consider that?)
        (What is wrong with you?)
        (No)
        (Go back)
     I hope she's okay...
    **[I'm sure she is]
        You think so? ^^
        ***[I know so]
            Of course she is! >:D
            I'll find her!
            ->How
        ***[Not really]
            (You again decide to crush this girl's dreams)
            (...Why would you do that?)
            (Come on man, just...)
            (Just don't)
            (Be better)
            (Go back)
                ****[I know so]
                    Of course she is! >:D
                    I'll find her!
                    ->How


=== How ===
*[What's your plan?]
    Well...
    I'm not sure.
    I was just going to ask people if they've seen her. :D
    But...
    I'm not sure if that's going to work...
    There are a LOT of people, after all!
    ...Even today.
    **[It's not very safe out here...]
        What do you mean?
            ***[This is Raider territory]
                What does that mean?
                    ****[...]
                    (You don't know what to tell her)
                    (...)
                    (You tell her it's dangerous)
                    Oh...
                    Well...
                    I can take it! >:D
                    How do you stay safe out here?
                        *****[I stay inside...]
                            That's kind of silly!
                            How do you find people?
                            Like...
                            Where's your mama? :D
                            ->BarMother

=== BarMother ===
(...)
*[She's gone]
*[I don't know]
*[Somewhere far away]
    -Oh...
    Maybe...
    Maybe I could help you find her!
    Then you could help me find my mama!
    What do you say? ^^
    **[I don't know...]
        Oh come on, mister!
        I could really use your help! :D
        Won't you help me...
        ...Please?
        ->Choice
    
    
=== Choice ===
*[Help the Girl]
    (You tell the little girl you'll help her)
    ->BrandNewStart
*[Refuse]
    (You tell the little girl you won't help her)
    ->BadEnding
=== BrandNewStart ===
Really!
Oh, that's great! :D
It gets kinda lonely out there...
But now I'll have you! ^^
Well...
...What are we waiting for!
Let's get going!
    *[Alright]
    ~showOnlyGroup("BarkeepEndingGood")
    ->END
=== BadEnding === 
    ...Oh.
    ...Okay. :(
    Well...
    I guess I have to go now, then. 
    Here, take this!
    It's not much, but...
    Flowers always make me feel better. =]
    (You Have Gained a Souvenir: "Single Flower"!)
    ~hasSouvenir8 = true
        *[Thank you...]
        ~showOnlyGroup("BarkeepEndingBad")
        ->END