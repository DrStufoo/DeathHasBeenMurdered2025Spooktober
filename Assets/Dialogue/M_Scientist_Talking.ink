INCLUDE globals.ink
#portrait:blank #layout:left #audio:beep_1 #speaker:The Scientist
...
Not often I get company...
{hasKilledScientist:
    Wait.
    ...
    You look like you've seen a ghost...
    ...Have I seen you before?
    ...
    Agh, forget it.
    What do you want?
        ->main
  - else: ..
        But let's cut the niceties.
        What do you want.
        ->main
        }


=== main ===
*[I want to kill life]
(You tell him of your journey) #speaker:???
(Of all the things you've done)
(And your goal...)
(...)
(The murder of life)

... #speaker:The Scientist
So...
You want to kill Life?
Hah!
Bloody idiot...
~notification("Idiot")
Heh...
Have you any idea what that even means?
Hah...

**[I'm serious]
    Oh, I'm sure you are.
    So was I.
    I murdered Death himself.
    I saved every single person ever...
    Granted immortality to every man, beast, and creature.
    
    I created my personal paradise.
    And within a year...
    ...It turned into my personal hell.
    
    ...
    
    ...Ludicrous.
    Humans, that is.
    They're...
    ...LUDICROUS.
    A bunch of self-righteous lunatics.
    
    We were all fools.
    Death was never an obstacle...
    It was a mercy.
    
    My point being...
    ...Man should never interfere with the higher order.
    Of all people, I should know.
    
    How's the tea?
        ***[It's good tea]
            Of course it is.
            ~notification("This tea is pretty nice")
            It's lovely tea.
            Herbal delight.
            
            (...) #speaker:???
            (Focus)
               ****[I need to find Life]
                ->Find
        
        ***[I need to find Life]
            ->Find
=== Find ===
Arghhhh... #speaker:The Scientist

No. 
You don't.
Do yourself a favor...
...And forget about it.
If you just...
...cAn'T LiVe wItH yOurSelF.
Then do us all a favor...
And throw yourself off a building.
Capiche?

*[That's not an option]
    Son of a...
    YES.
    IT IS.
    What's wrong with you?
    Can't you see?
    We're all doomed.
    All of us.
    You can do nothing.
    You are nothing.
    So do us ALL a favor.
    AND FORGET ABOUT IT.
        **[I can't]
            For @*!^'$ sake...
            ...
            How long...
            ...Have you been searching?
                ***[As long as I can remember]
                Hm.
                You've resolve...
                ...Rare these days.
                ...
                (Sigh)
                Alright.
                ...Fine.
                If you want to poke a bear...
                ...Who am I to deny you a stick?
                
                Ergh...
                Okay.
                I'll get you inside Limbo.
                ...It will take about a week to prepare the gateway.
                Resolve any unfinished business.
                Meet back here in 10 days.
                    ****[...Thank you]
                    ...
                    ...Don't.
                    ~loadScene("BarSecond")
                    ->END