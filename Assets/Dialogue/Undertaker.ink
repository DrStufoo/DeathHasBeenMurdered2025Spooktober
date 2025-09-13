INCLUDE globals.ink
#layout:left #speaker:Undertaker #sprite:undertaker_handsoncounter #audio:undertaker # #portrait:undertaker_neutral
...
    ~showMemoryNotice("The Undertaker")
...Hey there stranger.  #sprite:undertaker_neutral
Bet you don't get a lot of gents blowing through here... #sprite:undertaker_handsoncounter
Heh...

*[Can I get you a drink?]
    Love one...  #sprite:undertaker_neutral
    **[What'll it be?]
    Eh... I'm not sure...   #sprite:undertaker_adjust1
    What do you suggest?  #sprite:undertaker_neutral
    ->Drink
*[(Stay silent)]
    ...  #sprite:undertaker_handsoncounter
    So...
    ...Can I get a drink?   #sprite:undertaker_neutral
    **[Yes]
    Appreciate 'cha...  #sprite:undertaker_handsoncounter
    Not quite sure what I'd like though...
    What do you suggest?  #sprite:undertaker_neutral
        ->Drink
    **[No]
        ->PleaseLoop
=== PleaseLoop ===
    {noSaid >= 10: ->Enough}
    ...  #sprite:undertaker_handsoncounter
    ...  #sprite:undertaker_adjust1
    ...  #sprite:undertaker_handsoncounter
    ...Please?  #sprite:undertaker_neutral
    +[No]
    ~noSaid = noSaid + 1
    (You've denied this man {noSaid} time's)
    ->PleaseLoop

    *[Alright fine]
    Oh, finally...  #sprite:undertaker_handsoncounter
    If you had asked me one more time, I'd have...
    ...Gotten upset.  #sprite:undertaker_neutral
    But regardless, I appreciate ya...  #sprite:undertaker_handsoncounter
    Whiskey for me, please.  #sprite:undertaker_adjust2
    ->Drink

== Enough ==
    ...  #sprite:undertaker_handsoncounter
    I...  #sprite:undertaker_handsoncounter
    SWEAR TO ALL THE CRUELTY IN THIS CRUEL, CRUEL WORLD.   #sprite:undertaker_neutral
    IF YOU DO NOT SERVE ME A BLOODY PINT.
    I WILL HANG YOU BY YOUR EYE-PATCH.  #sprite:undertaker_handsoncounter
    I JUST. #sprite:undertaker_neutral
    ...  #sprite:undertaker_handsoncounter
    I just wanna drink...  #sprite:undertaker_sad
    Can I... PLEASE.
    ...Have a drink?  #sprite:undertaker_handsoncounter
    *[Yes]
        Oh, at long bloody last...  #sprite:undertaker_neutral
        **[What'll it be?]
        Eh... I don't even know...  #sprite:undertaker_handsoncounter
        What would you suggest?  #sprite:undertaker_adjust1
        ->Drink
    *[...No]
    ... #sprite:default
    (The Undertaker has left.) 
    (For he has seen everything.)
    ...
    (I guess...)
    (You really screwed up.)
    (...Jerk.)
    (I don't even know what to do with you.)
    (You're clearly a sociopath.)
    (I guess... I guess I'll just uh.)
    (Banish you.)
    (Yeah, I'll just banish you.)
    (Enjoy purgatory, dipshit.)
    ~loadScene("MainMenu")
    ...
    ->END

=== OneForTheRoad ===
...What?  #sprite:undertaker_neutral
*[(Sing all the drinks you know)]
    (You tell him you have:) #sprite:undertaker_adjust2
    1 Whiskey,  #sprite:undertaker_handsoncounter
    1 Porter, 
    1 Rye,
    1 Cider, and to give it a try.
    ...
    (He's moderately confused.) 
    ...Alright then, mate.  #sprite:undertaker_neutral
    Anything... Else?  #sprite:undertaker_handsoncounter
    **[(List even more)]
        (You tell him you have:) #sprite:undertaker_hand_on_head
        2 Rums;
        1 Buttered,
        1 Cold,
        1 Scotch;
        At least 7 years old.
        ...
        (He's rather impressed) #sprite:undertaker_handsoncounter
        Do ya... 
        Know any more? #sprite:undertaker_neutral
            ***[(List literally every alcoholic beverage)]

            (You tell him you:)
            Can bring on the Wine, #sprite:undertaker_handsoncounter
            Start with a Port,
            Then wash it all down;
            With a Beer of some sort.
            You have,
            1 Sherry, #sprite:undertaker_adjust1
            1 Grog,
            1 Ale,
            And 1 Howling Gale, #sprite:undertaker_adjust2
            1 Old mountain Dew,
            And 1 Good Howling Gale,
            1 Mead
            1 Stout,
            1 Vermouth, #sprite:undertaker_hand_on_head
            And 1 Gin,
            1 Vodka,
            1 Bourbon,
            And 1 Sly Grin, #sprite:undertaker_handsoncounter
            1 Moonshine,
            1 Tequila,
            1 Cognag,
            1 Schnapps, #sprite:undertaker_adjust2
            1 Old Sour Mash,
            And 2 Belly Flops,#sprite:undertaker_adjust1
            1 Goldwasser,
            1 Ouzo,
            1 White Lighting,#sprite:undertaker_handsoncounter
            And 1 Green Toad,
            1 Absithe,
            1 Sambuca,
            AND 1 FOR THE ROAD.
            ...
            (You are out of breath)
            (The Undertaker seems to smile) #sprite:undertaker_flirty
            (You've made a wastelander smile)
            (Your Valiance has increased!)
            ~valiance = valiance + 1
            (Check your Morality Stats by pressing "Escape")
            Heheh, that's... #sprite:undertake_hand_on_head
            ...Very nice. #sprite:undertaker_flirty
            I think I'll have...#sprite:undertaker_handsoncounter
            ...A water. #sprite:undertaker_neutral
                ****[...Are you serious?]
                    Of course I am, hah!
                    I'll take a uh...
                    Whiskey.
                    *****[Alright]
                    ->Drinking
            ***[That was all]
                Eh, a pity.
                Any, I think... 
                I'll have a whiskey.
                ****[Certainly]
                    I appreciate it, friend...
                    ->Drinking
    **[That was all]
        Eh, a pity. #sprite:undertaker_hand_on_head
        Any, I think...  #sprite:undertaker_handsoncounter
        I'll have a whiskey. #sprite:undertaker_neutral
        ***[Certainly]
            I appreciate it, friend... #sprite:undertaker_handsoncounter
            ->Drinking
    *[Just tell him the menu]
        ->Drink
        
=== Drink ===
*[Whiskey]
    A classic man, eh? #sprite:undertaker_neutral
    An alcoholic can drink away most anything with a whiskey... #sprite:undertaker_handsoncounter
    I'll take two. #sprite:undertaker_neutral
    **[Good enough for me...] 
    ->Drinking
*[Wine]
    A fancy man, eh? #sprite:undertaker_neutral
    Most all elegance died decades ago... #sprite:undertaker_adjust1
    I'll take one.#sprite:undertaker_handsoncounter
    **[Fair enough]   
    ->Drinking
    
*[Water]
    Not a drinking man? #sprite:undertaker_handsoncounter
    ...Strange profession for an abstainer. #sprite:undertaker_neutral
    Eh, ship it to 'ell. #sprite:undertaker_handsoncounter
    I'll take a water... #sprite:undertaker_hand_on_head
    **[Wise choice] 
    ->Drinking
    
*[Sing]
    ...
    ->OneForTheRoad
    
=== Drinking ===
(GULP-GULP-GULP) #sprite:undertaker_drinking
Ah. #sprite:undertaker_handsoncounter
...
...Thanks. #sprite:undertaker_hand_on_head
Suppose you haven't heard much from the outside...
Trust me, it's for the best. #sprite:undertaker_neutral
But regardless...#sprite:undertaker_handsoncounter
->Info
VAR hasAskedOnce1 = false

VAR indifference = 0
=== Info ===
#sprite:undertaker_handsoncounter
{hasAskedOnce1:Anything else you were wanting to know?|Anything you want to know?}
~hasAskedOnce1 = true 
*[What's with the mask?]
    With the- #sprite:undertaker_handsoncounter
    ...Oh you mean the uh.
    Oh, you mean the, heh. 
    This.  #sprite:undertaker_adjust1
    See, In my line of work, there's... #sprite:undertaker_handsoncounter
    A lot of...
    Health concerns. #sprite:undertaker_neutral
    A lot. #sprite:undertaker_handsoncounter
    ...And one can never be too paranoid.
    **[What line of work?]
        ...Me?#sprite:undertaker_neutral
        It's... Heheh...#sprite:undertaker_handsoncounter
        ->Profession
    **[I don't care]
    Whatever...
    ~indifference = indifference + 1
    ->Info

+[Where ya headed?]
    Oh, me? #sprite:undertaker_hand_on_head
    Heh.
    ...Nowhere in particular. #sprite:undertaker_handsoncounter
    Just... #sprite:undertaker_neutral
    Away. #sprite:undertaker_handsoncounter

    ++[From what?]
        Well, I just...  #sprite:undertaker_neutral
        ... 
        ...Listen, I think... #sprite:undertaker_handsoncounter
        ...I think I'm being followed. #sprite:undertaker_adjust2
        I've heard whispers, seen tracks... #sprite:undertaker_adjust2
        Even saw his face, once. #sprite:undertaker_handsoncounter
        He was...
        Smiling. #sprite:undertaker_neutral
        Not a warm smile, a cold, calculating smile... 
        I saw him...#sprite:undertaker_handsoncounter
        Or it, from afar... #sprite:undertaker_neutral
        ...And so I ran. #sprite:undertaker_handsoncounter
        And kept running.
        And here I am. #sprite:undertaker_neutral
            ***[What are you going to do?]
            I... 
            I don't know.#sprite:undertaker_handsoncounter
            I've been running for...
            A while. #sprite:undertaker_sad
            I don't know what I'd do if he found me...
            ->Plans
            ***[I don't care]
                ~indifference = indifference + 1
                ...Not a very subtle person, are ya? #sprite:undertaker_handsoncounter
                ...Eh, no matter.
                ->Info
    **[I don't care]
        ...Okay. #sprite:undertaker_handsoncounter
        ~indifference = indifference + 1
        ->Info
*[How's the world doing?]
    How's the... #sprite:undertaker_hand_on_head
    Heh. #sprite:undertaker_handsoncounter
    HAHAHAH! Hah... Eh...
    Just uh...
    ...Dandy. #sprite:undertaker_neutral
    We're... Dandy.#sprite:undertaker_handsoncounter
    ...Blood in the streets. #sprite:undertaker_adjust1
    Constant screams of the non-dead. #sprite:undertaker_adjust2
    Endless, compounding logistical issues of a non-dwindling population.
    Like I said...#sprite:undertaker_neutral
    Dandy.#sprite:undertaker_handsoncounter
    ->Info
=== Plans ===
What would you suggest I do?  #sprite:undertaker_neutral
    +[Keep running]
        ...I can try. #sprite:undertaker_handsoncounter
        But... 
        For how long? #sprite:undertaker_sad 
        **[Forever]
            ...Forever?#sprite:undertaker_handsoncounter
            Well... #sprite:undertaker_hand_on_head
            I guess I have an eternity... #sprite:undertaker_sad
            But...
            I... I don't know how much longer I can TAKE IT. #sprite:undertaker_handsoncounter
            I feel crazy... #sprite:undertaker_neutral
            ***[You are]
                (Your sadism has increased!)
                ~sadism = sadism + 1
                Oh God... #sprite:undertaker_handsoncounter
                I'm completely insane, aren't I? #sprite:undertaker_sad
                Oh no...
                I... #sprite:undertaker_adjust1
                I need to get out of here.#sprite:undertaker_handsoncounter
                I'll keep running.
                Forever. #sprite:undertaker_sad
                Thanks for the advice. #sprite:undertaker_neutral
                    ****[You still need to pay]
                        Egh, you're right. #sprite:undertaker_neutral
                        ->End
            ***[You're not insane, friend]
            You don't think I am? #sprite:undertaker_handsoncounter
            But...  
            What about the masked-man? #sprite:undertaker_sad
            ->Plans
        ++[Well... Maybe you shouldn't run.]
            I shouldn't? #sprite:undertaker_sad
            Wha-?#sprite:undertaker_handsoncounter
            Then...
            ->Plans
*[Try and make peace?]
    Huh... #sprite:undertaker_sad
    ...With the masked-man? #sprite:undertaker_neutral
    Never thought of that. #sprite:undertaker_handsoncounter
    I don't know though. #sprite:undertaker_hand_on_head
    He's some kind of...
    Marauder. #sprite:undertaker_handsoncounter
    I don't trust folks like those. #sprite:undertaker_neutral
    But maybe... #sprite:undertaker_handsoncounter
        **[It's worth the shot]
        Heh, I guess you could be right... #sprite:undertaker_handsoncounter
        What is he gonna do, kill me? #sprite:undertaker_neutral
        Heh!
        ...Heh. #sprite:undertaker_adjust2
        ...There are things far worse than death. #sprite:undertaker_handsoncounter
        Our existence is but one of them. #sprite:undertaker_neutral
        ...But heh.#sprite:undertaker_handsoncounter
        Can't run forever.
        ...Maybe I will try to talk it out... #sprite:undertaker_hand_on_head 
            ***[Do it]
            You know what? #sprite:undertaker_handsoncounter
            I will. #sprite:undertaker_neutral
            I'll show him. #sprite:undertaker_handsoncounter
            I won't run forever. #sprite:undertaker_adjust1
            Next time I see that masked freak, I'll ask him what he wants, head-on! #sprite:undertaker_neutral
            ...Hopefully it's not me as a puddle of red... #sprite:undertaker_handsoncounter
            I'll do it anyways.
            Better to lose your head than fear the loss of it for... #sprite:undertaker_adjust1
            Ever... #sprite:undertaker_handsoncounter
            Thanks a lot, friend. #sprite:undertaker_hand_on_head
            I almost feel a little... 
            ...Hopeful? #sprite:undertaker_handsoncounter
            Wow... #sprite:undertaker_neutral
            (You've helped the Undertaker)
            Your Valiance has increased!
            ~valiance = valiance + 1
            ->End

=== Profession ===
    HEH. Heh... #sprite:undertaker_handsoncounter
    I'm an Undertaker.  #sprite:undertaker_neutral
    What does Undertaker's do? #sprite:undertaker_handsoncounter
    Heheheh...
    We have the grand and honorable role of preparing dead bodies for... #sprite:undertaker_adjust1
    ...Disposal.  #sprite:undertaker_handsoncounter
    You'd THINK that with immortality, people wouldn't need us. #sprite:undertaker_neutral 
    I'd have thought that.  #sprite:undertaker_hand_on_head
    ...But no. #sprite:undertaker_neutral
    People can't die, of course. #sprite:undertaker_handsoncounter
    But they can still get...
    ...Ruined. #sprite:undertaker_neutral
    And we can't just have pools of blood fill the streets, can we?
    So... #sprite:undertaker_handsoncounter
    It's MY job...
    ...To make sure...#sprite:undertaker_adjust1
    That the OCEAN of blood caused by an eternity of injuries... #sprite:undertaker_adjust2
    ...Stay...
    ...Contained.#sprite:undertaker_handsoncounter
    ...
    Do...
    Do you know how HARD IT IS. 
    TO GET RID OF DEAD MEN.
    THAT ARE STILL ALIVE? #sprite:undertaker_neutral
    IT'S...
    ...#sprite:undertaker_handsoncounter
    ...Shove it all to 'ell. #sprite:undertaker_hand_on_head
    Nobody should have to witness it.
    At least I'm not the one going through it...
    ...Yet. #sprite:undertaker_handsoncounter
    Eventually, we'll be nothing more than a puddle of blood soaked in some dirt.
    That's our future. #sprite:undertaker_neutral
    Our hope.
    Where did we go so wrong...?#sprite:undertaker_handsoncounter
        *[We flew too high...]
            Maybe... One of us did. #sprite:undertaker_handsoncounter
            But what did I ever do? #sprite:undertaker_neutral
            
        *[I don't know]
            Eh, who does? #sprite:undertaker_neutral
            But still, I can't shake my mind off it... #sprite:undertaker_handsoncounter
            
        *[We didn't fly high enough]
            How could we even think about flying higher than we did? #sprite:undertaker_neutral
            We killed the father of every single death ever. #sprite:undertaker_handsoncounter
            And in a final act of indignation...
            Gave us what we wanted. #sprite:undertaker_hand_on_head
            If only he would've just...
            Killed us all. #sprite:undertaker_handsoncounter
    -...
    Agh, what am I saying? #sprite:undertaker_neutral
    Maybe... 
    Maybe I'm just insane. #sprite:undertaker_handsoncounter
        **[You are insane]
            (Your sadism has increased!)
            Maybe I am...
            But yes. #sprite:undertaker_adjust1
            My line of work? #sprite:undertaker_adjust2
            Lots of health concerns. #sprite:undertaker_handsoncounter
            ->Info
        **[You're not insane]
    Eh, maybe not...
    But yes. #sprite:undertaker_adjust1
    My line of work? #sprite:undertaker_adjust2
    Lots of health concerns. #sprite:undertaker_handsoncounter
    ->Info

=== End ===
Anyways...  #sprite:undertaker_adjust2
What do I owe ya? #sprite:undertaker_neutral
*[It's on the house.]
    Oh, really? #sprite:undertaker_hand_on_head
    Well, I don't have much, but take this. 
    Consider it a tip. #sprite:undertaker_flirty
    (You have gained a Souvenir:"Mask"! ) #speaker:???
    ~hasSouvenir2 = true
    I'll be seeing ya around, then. #sprite:undertaker_leaving #speaker:undertaker
    ...Maybe. #sprite:default
    **[Bye]
    (You're Valiance has increased!)
    ~valiance = valiance + 1
        ***[View Playthrough]
        ->nextScene
*[What do you have?]
    On me? #sprite:undertaker_handsoncounter
    ...Not much. #sprite:undertaker_neutral
    Not anything of value to a barkeep, at least. #sprite:undertaker_hand_on_head
    Except...
    Ah, here you are!
    (You have gained a Souvenir: "Mask"!)
    ~hasSouvenir2 = true
    It's not much, but uh, you can remember me by it. #sprite:undertaker_neutral
        **[Alright...]
        Appreciate it, mate. #sprite:undertaker_adjust1
        I'll be seeing you around. #sprite:undertaker_leaving
        Try to stay in one piece. #default
            ***[Bye]
            ->nextScene
=== nextScene ===
    ...
    ~loadScene("Undertaker_Ending")
    ->END
