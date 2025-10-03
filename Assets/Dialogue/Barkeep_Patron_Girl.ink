INCLUDE globals.ink
#layout:left #speaker:Little Girl #audio:beep_1 # #portrait:default
...
Oop! #sprite:girl_up1
...
Ergh... #sprite:girl_up2
...
Erm... #sprite:girl_up3
...
Aha! #sprite:girl_up4
...Hello, there! #sprite:girl_neutral1
~notification("The Little Girl has arrived...")
I'm Phaelum. #sprite:girl_happy
What's your name? :) #sprite:girl_neutral1
*[...Barkeep is fine.]
    Barkeep? #sprite:girl_neutral2
    That's a silly name! #sprite:girl_explain
    I'll call you... #sprite:girl_neutral2
    Mister! :D #sprite:girl_happy
    **[Alright]
        ->Main
        
    **[That name sucks]
        (You prepare to tell her that name sucks) 
        (...But decide not to be a jerk for no reason)
        ->Main
*[I don't remember]
    You don't remember your name? :o #sprite:girl_neutral1
    That's sad... #sprite:girl_sad
    I'll call you...
    Mister! :D #sprite:girl_happy
    **[Alright]
        ->Main
        
    **[That name sucks]
        (You prepare to tell her that name sucks)
        (...But decide not to be a jerk for no reason)
        ->Main
=== Main ===
So, Mister... #sprite:girl_neutral2
Have you seen my mama? #sprite:girl_neutral1
*[...What?]
    I've been looking for my mama! #sprite:girl_happy
    She's been missing for a long time... #sprite:girl_sad
    So I'm going to find her! >:D #sprite:girl_explain
    **[That's very brave of you]
    Thank you, mister! #sprite:girl_explain
    So... #sprite:girl_neutral1
    Have you seen my mama? #sprite:girl_neutral2
        ***[What does she look like?]
        Well... #sprite:girl_neutral2
        She kind of looks like me! #sprite:girl_neutral1
        But taller! ^^ #sprite:girl_happy
        I haven't seen her in a while... #sprite:girl_neutral2
            ****[When did you see her last?]
            ->SeenLast
            
=== SeenLast ===
Well... #sprite:girl_neutral2
A few weeks ago, I guess? #sprite:girl_explain
She was getting real sick. #sprite:girl_sad
But she told me she went to get medicine. :D #sprite:girl_happy
...She promised she'd find me though. #sprite:girl_neutral2
...And she never did. #sprite:girl_sad
So...  #sprite:girl_neutral1
I'm gonna find her!  #sprite:girl_happy
I hope she's okay... #sprite:girl_explain
    *[I'm sure she is]
        You think so? ^^ #sprite:girl_happy
        **[I know so]
            Of course she is! >:D #sprite:girl_neutral1
            I'll find her! #sprite:girl_explain
            ->How
        **[Not really]
            (You again decide to crush this girl's dreams)
            (...Why would you do that?) #sprite:girl_up4
            (Come on man, just...) #sprite:girl_u3
            (Just don't) #sprite:girl_up2
            (Be better) #sprite:girl_up3
            (Go back) #sprite:girl_up4
                ***[I know so]
                    Of course she is! >:D #sprite:girl_happy
                    I'll find her! #sprite:girl_explain
                    ->How
    *[Your mama is dead]
        (You decide to tell her that her mother is likely convulsing in a ditch somewhere.) #sprite:girl_up4
        (Why would you even consider that?) #sprite:girl_up3
        (What is wrong with you?) #sprite:girl_up2
        (No) #sprite:girl_up3
        (Go back) #sprite:girl_up4
     I hope she's okay... #sprite:girl_explain
    **[I'm sure she is]
        You think so? ^^ #sprite:girl_neutral1
        ***[I know so]
            Of course she is! >:D #sprite:girl_happy
            I'll find her! #sprite:girl_explain
            ->How
        ***[Not really]
            (You again decide to crush this girl's dreams) #sprite:girl_happy
            (...Why would you do that?) #sprite:girl_neutral1
            (Come on man, just...) #sprite:girl_happy1
            (Just don't) #sprite:girl_neutral1
            (Be better) #sprite:girl_happy
            (Go back) #sprite:girl_neutral1
                ****[I know so]
                    Of course she is! >:D #sprite:girl_neutral2
                    I'll find her! #sprite:girl_happy
                    ->How


=== How ===
*[What's your plan?]
    Well... #sprite:girl_neutral2
    I'm not sure. #sprite:girl_neutral1
    I was just going to ask people if they've seen her. :D #sprite:girl_explain
    But... #sprite:girl_neutral1
    I'm not sure if that's going to work... #sprite:girl_neutral2
    There are a LOT of people, after all! #sprite:girl_explain
    ...Even today. #sprite:girl_neutral2
    **[It's not very safe out here...]
        What do you mean? #sprite:girl_explain
            ***[This is Raider territory]
                Oh, ok. #sprite:girl_neutral1
                ... #sprite:girl_neutral2
                ... #sprite:girl_neutral1
                What does that mean? #sprite:girl_explain
                    ****[...]
                    (You don't know what to tell her) #sprite:girl_neutral2
                    (...) 
                    (You tell her it's dangerous) #sprite:girl_neutral1
                    Oh... 
                    Well... #sprite:girl_neutral2
                    I can take it! >:D #sprite:girl_happy
                    How do YOU stay safe out here? #sprite:girl_explain
                        *****[I stay inside...]
                            That's kind of silly! #sprite:girl_neutral1
                            How do you find people? #sprite:girl_neutral1
                            Like... #sprite:girl_neutral2
                            Where's your mama? :D #sprite:girl_happy
                            ->BarMother

=== BarMother ===
(...) 
*[She's gone]
*[I don't know]
*[Somewhere far away]
    -Oh... #sprite:girl_neutral1
    Maybe... #sprite:girl_neutral2
    Maybe I could help you find her! #sprite:girl_happy
    We could be partners!
    Then you could help me find my mama! #sprite:girl_explain
    What do you say? ^^ #sprite:girl_neutral1
    **[I don't know...]
        Oh come on, mister! #sprite:girl_explain
        I could really use your help! :D #sprite:girl_neutral1
        Won't you help me... #sprite:girl_neutral2
        ...Please? #sprite:girl_sad
        ->Choice
    
    
=== Choice ===
*[Help the Girl]
    (You tell the little girl you'll help her)
    ->BrandNewStart
*[Refuse]
    (You tell the little girl you won't help her)
    ->BadEnding
=== BrandNewStart ===
Really! #sprite:girl_neutral1
Oh, that's great! :D #sprite:girl_happy
It gets kinda lonely out there... #sprite:girl_neutral2
But now I'll have you! ^^ #sprite:girl_neutral1
Well... 
...What are we waiting for! #sprite:girl_explain 
Let's get going! #sprite:girl_explain
    *[Alright]
    ~showOnlyGroup("BarkeepEndingGood")
    ->END
=== BadEnding === 
    ...Oh. #sprite:girl_neutral1
    ...Okay. :( #sprite:girl_sad
    Well... #sprite:girl_explain
    I guess I have to go now, then. #sprite:girl_neutral1 
    Here, take this! #sprite:girl_happy
    It's not much, but...
    Flowers always make me feel better. =] #sprite:girl_neutral1
    ~notification("You've been gifted a flower")
    ~hasSouvenir8 = true
    Welp!
    Gotta go! >:]
    ... #sprite:girl_up4
    ... #sprite:girl_up3
    ... #sprite:girl_up2
    ... #sprite:girl_up1
    ... #sprite:default
    ...
    Good-bye, Mister! :D #sprite:girl_up1
    ... #sprite:empty
        ~showOnlyGroup("BarkeepEndingBad")
        ->END