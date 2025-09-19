INCLUDE globals.ink
#layout:left #speaker:Marauder #sprite:marauder_standing #audio:beep_1 # #portrait:marauder
Heheh...
What's wrong, partner?
Cat got your tongue?
*[...You look familiar]
    Oh, I'm a man of many faces.
    And none of them have ever step foot here.
    Consider this visit an introduction.
    To whom do I owe the pleasure?
    **[Just Barkeep is fine]
        A bit vague, don't you think?
        Don't ya remember anything?
        You're Mr...?
            ***[...Barkeep]
                Lovely.
                So, Mr. Barkeep...
                What's it take to get a bit of service in this joint?
                What kinda poison ya serve?
                    ****[The best]
                        That's the spirit!
                        ->DrinkChoice
=== DrinkChoice ===
Pour your thickest broth.
*[...Okay?]
    Splendid.
    (CHsbshdhssssssss)
    Ah.
    I appreciate it, pal.
    Anyways...
    What's a guy like you doing in the middle of nowhere?
    Not a convenient place for business...
    Ya hiding?
    ...Dealing?
    **[What are YOU doing here?]
        Me?
        Hah!
        I'm here on business.
        I've been tracking this fella...
        An Undertaker, by the looks of it.
        Wears a mask, formal clothes.
        I've got a bit of a bone to pick...
        You wouldn't know anything about that...
        ...Would you?
            ***[He blew through a while back]
                Did he now?
                Suppose I'm getting closer, then.
                If he ever comes back...
                ...Send my condolences, won't you?
                ->EaseUp
            ***[Never heard of him]
                Oh really?
                That's pretty interesting...
                ...Seeing as I've tracked him here.
                ->EaseUp

=== EaseUp ===
...
Hey, ease up!
I'm joking!
Heheh.
Enough of this.
I'm not just hunting this Undertaker.
That's just business, too.
I have a much...
Broader goal.
Tell me, Mr. Barkeep.
How old are you?
    *[...I don't know]
    Of course you don't.
    None of us do.
    Tell me, Mr. Barkeep, why is that?
    Why is it that we have been alive...
    SO LONG...
    THAT WE CAN'T EVEN REMEMBER HOW OLD WE ARE?
    ...
    Its not...
    Ideal, let's say.
    Humour me though, Mr. Barkeep...
    Who's fault is this?
    Who could've possibly caused such a...
    Cataclysmic event...
    That we don't die?
    I'll save you the effort.
    It was...
    HIM.
    The bloody Scientist I'm searching for.
    The Undertaker's a stepping stone.
    I am looking for the Scientist.
    ...I'll find him.
    ->Questions
=== Questions ===
...
*[Why are you looking for the Scientist?]
    WHY am I searching for the bastard?
    Well.
    A few reasons, really.
    First of all...
    To punch him in the face for robbing my Death.
    Second of all...
    I need his...
    ...Particular skill-set.
    Nobody's ever gotten close to him in the realm of science.
    He knows things none have even dreamt of.
    He's lied in the face of eternals.
    Murdered the father of all Death.
    ...And doomed us all.
    ...
    I simply need to go where he's gone.
    That's all.
    ->Info
    
*[How long have you been searching?]
How LONG have I been searching for the bastard?
...Hm.
Never thought about it.
Might as well have started yesterday.
Never lost any resolve.
I will find him.
I will kill him.
->Questions

=== Info ===
*[What will you do then?]
    Heh...
    Simple.
    I will find Life.
    I will kill her.
    No more eternal torment.
    No more blood in the streets.
    Nothing at all.
    At long last...
    Rest.
    Sounds good, doesn't it?
        **[...Yes]
        Of course it does.
        That's why I will stop...
        AT NOTHING.
        To find this Undertaker.
        To find this Scientist.
        To find Life.
        It's simple, really.
        Fool-proof, even.
        And the best part?
        I've got ALL the time in the world.
        Any other questions, Mr. Barkeep?
        ->Info2
=== Info2 ===
*[What's with the mask?]
    Heh!
    While my mind is COMPLETELY whole...
    My body...
    Has limits.
    Steep ones.
    Every encounter leaves a mark.
    ...Guess that's why you live here.
    But some marks?
    More noticeable than others.
    And I can't be scaring the kiddies now, can I?
    Hah!
    Anyways...
    We all have to smile sometimes, don't we?
    **[I guess so...]
        Of course you do.
        Anything else?
        ->Info2
*[No, that's all]
    Peachy.
    I appreciate the drink, Mr.
    Soon enough, I'll pay you back in full...
    ...But until then, take this.
    ~notification("You have gained a souvenir: Old Coin")
    ~hasSouvenir7 = true
    Not that it's worth anything anymore!
    Hah!
    ...Heh.
    ...
    I'll be seeing you around, Mr. Barkeep.
    Or, hopefully...
    Never again.
        **[Bye...]
        ~loadScene("Girl")
        ->END