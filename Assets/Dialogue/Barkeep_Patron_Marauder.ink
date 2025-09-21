INCLUDE globals.ink
#layout:left #speaker:Marauder #sprite:marauder_standing #audio:beep_1 #portrait:marauder
Heheh... 
What's wrong, partner? #sprite:marauder_confused
Cat got your tongue? #sprite:marauder_scared
Heh... #sprite:marauder_crossed_arms
*[...You look familiar]
    Oh, I'm a man of many faces. #sprite:marauder_standing
    And none of them have ever step foot here. #sprite:marauder_crossed_arms
    Consider this visit an introduction. #sprite:marauder_confused
    To whom do I owe the pleasure? #sprite:marauder_standing
    **[Just Barkeep is fine]
        A bit vague, don't you think? #sprite:marauder_confused
        Don't ya remember anything? #sprite:marauder_standing
        You're Mr...? #sprite:marauder_gun_1
            ***[...Barkeep]
                Lovely. #sprite:marauder_standing
                So, Mr. Barkeep... #sprite:marauder_confused
                What's it take to get a bit of service in this joint? #sprite:marauder_standing
                What kinda poison ya serve? #sprite:marauder_standing
                    ****[The best]
                        That's the spirit! #sprite:marauder_confused
                        ->DrinkChoice
=== DrinkChoice === 
Pour your thickest broth. #sprite:marauder_standing
*[...Okay?]
    Splendid. #sprite:marauder_confused
    (CHsbshdhssssssss) #sprite:marauder_drinking
    (...?)
    Ah. #sprite:marauder_sad
    I appreciate it, pal. #sprite:marauder_confused
    Anyways... #sprite:marauder_sad
    What's a guy like you doing in the middle of nowhere? #sprite:marauder_arms_crossed
    Not a convenient place for business...#sprite:marauder_standing
    Ya hiding? 
    ...Dealing? #sprite:marauder_gun_1
    **[What are YOU doing here?]
        Me? #sprite:marauder_gun_2
        Hah! #sprite:marauder_gun_1
        I'm here on business. #sprite:marauder_standing
        I've been tracking this fella...#sprite:marauder_standing
        An Undertaker, by the looks of it. 
        Wears a mask, formal clothes. #sprite:marauder_crossed_arms
        I've got a bit of a bone to pick... #sprite:marauder_gun_2
        You wouldn't know anything about that...
        ...Would you? #sprite:marauder_gun_1
            ***[He blew through a while back]
                Did he now?
                Suppose I'm getting closer, then. #sprite:marauder_standing
                If he ever comes back...
                ...Send my condolences, won't you? #sprite:marauder_gun_1
                ->EaseUp
            ***[Never heard of him]
                Oh really? #sprite:marauder_standing
                That's pretty interesting...
                ...Seeing as I've tracked him here. #sprite:marauder_gun_1
                ->EaseUp

=== EaseUp ===
...
Hey, ease up! #sprite:marauder_standing
I'm joking! #sprite:marauder_crossed_arms
Heheh.
Enough of this. #sprite:marauder_sad
I'm not JUST hunting this Undertaker. #sprite:marauder_scared
That's just business, too. #sprite:marauder_standing
I have a much...
Broader goal. #sprite:marauder_sad
Tell me, Mr. Barkeep. #sprite:marauder_confused
How old are you? #sprite:marauder_standing
    *[...I don't know]
    Of course you don't. 
    None of us do. #sprite:marauder_confused
    Tell me, Mr. Barkeep, why is that? #sprite:marauder_standing
    Why is it that we have been alive... #sprite:marauder_crossed_arms
    SO LONG... #sprite:marauder_scared
    THAT WE CAN'T EVEN REMEMBER HOW OLD WE ARE? #sprite:marauder_gun_1
    ... #sprite:marauder_gun_2
    Its not... #sprite:marauder_gun_1
    Ideal, let's say. #sprite:marauder_standing
    Humour me though, Mr. Barkeep... #sprite:marauder_confused
    Who's fault is this? 
    Who could've possibly caused such a... #sprite:marauder_standing
    Cataclysmic event... #sprite:marauder_crossed_arms
    That we don't die?
    I'll save you the effort. #sprite:marauder_standing
    It was... #sprite:marauder_confused
    HIM. #sprite:marauder_scared
    The bloody Scientist I'm searching for. #sprite:marauder_confused
    The Undertaker's a stepping stone. #sprite:marauder_gun_2
    I am looking for the Scientist. #sprite:marauder_gun_1
   ...I'll find him. #sprite:marauder_standing
    ->Questions
=== Questions ===
...
...
*[Why are you looking for the Scientist?]
    WHY am I searching for the bastard? #sprite:marauder_crossed_arms
    Well. #sprite:marauder_confused
    A few reasons, really. #sprite:marauder_standing
    First of all... #sprite:marauder_thankful
    To punch him in the face for robbing my Death. #sprite:marauder_gun_1
    Second of all... #sprite:marauder_standing
    I need his... 
    ...Particular skill-set. #sprite:marauder_confused
    Nobody's ever gotten close to him in the realm of science.
    He knows things none have even dreamt of. #sprite:marauder_standing
    He's lied in the face of eternals. 
    Murdered the father of all Death. #sprite:marauder_confused
    ...And doomed us all. #sprite:marauder_sad
    ...
    I simply need to go where he's gone. #sprite:marauder_standing
    That's all. #sprite:marauder_crossed_arms
    ->Info
    
*[How long have you been searching?]
How LONG have I been searching for the bastard? #sprite:marauder_crossed_arms
...Hm. #sprite:marauder_confused
Never thought about it. #sprite:marauder_standing
Might as well have started yesterday. 
Never lost any resolve. #sprite:marauder_gun_1
I will find him. #sprite:marauder_gun_2
I will kill him. #sprite:marauder_gun_1
Simple as that. #sprite:marauder_standing
->Questions

=== Info ===
*[What will you do then?]
    Heh... #sprite:marauder_standing
    Simple. #sprite:marauder_confused
    I will find Life. #sprite:marauder_gun_2
    I will kill her. #sprite:marauder_gun_1
    No more eternal torment. #sprite:marauder_sad
    No more blood in the streets.
    Nothing at all. #sprite:marauder_crossed_arms
    At long last...
    Rest.
    Sounds good, doesn't it? #sprite:marauder_standing
        **[...Yes]
        Of course it does. #sprite:marauder_confused
        That's why I will stop...
        AT NOTHING. #sprite:marauder_scared
        To find this Undertaker. #sprite:marauder_standing
        To find this Scientist. #sprite:marauder_confused
        To find Life. #sprite:marauder_gun_2
        It's simple, really. #sprite:marauder_gun_1
        Fool-proof, even. #sprite:marauder_standing
        And the best part? #sprite:marauder_confused
        I've got ALL the time in the world. #sprite:marauder_sad
        Any other questions, Mr. Barkeep? #sprite:marauder_standing
        ->Info2
=== Info2 ===
*[What's with the mask?]
    Heh! #sprite:marauder_confused
    While my mind is COMPLETELY whole... #sprite:marauder_standing
    My body...
    Has limits.  #sprite:marauder_gun_2
    Steep ones. #sprite:marauder_gun_1
    Every encounter leaves a mark. #sprite:marauder_confused
    ...Guess that's why you live here. #sprite:marauder_crossed_arms
    But some marks? #sprite:marauder_standing
    More noticeable than others.
    And I can't be scaring the kiddies now, can I? #sprite:marauder_confused
    Hah! #sprite:marauder_standing
    Anyways... #sprite:marauder_sad
    We all have to smile sometimes, don't we?
    **[I guess so...]
        Of course you do. #sprite:marauder_standing
        Anything else? #sprite:marauder_confused
        ->Info2
*[No, that's all]
    Peachy. #sprite:marauder_standing
    I appreciate the drink, Mr. #sprite:marauder_thankful
    Soon enough, I'll pay you back in full...  #sprite:marauder_standing
    ...But until then, take this. #sprite:marauder_confused
    ~notification("You gained an Old Coin")
    ~hasSouvenir7 = true
    Not that it's worth anything anymore! #sprite:marauder_sad
    Hah! #sprite:marauder_confused
    ...Heh. #sprite:marauder_standing
    ...
    I'll be seeing you around, Mr. Barkeep. #sprite:marauder_confused
    Or, hopefully...
    Never again. #sprite:default
    ...
    ~loadScene("Girl")
    ->END