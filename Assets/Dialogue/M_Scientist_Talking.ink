INCLUDE globals.ink
... #portrait:blank #layout:left #audio:beep_1 #speaker:The Scientist #sprite:scientist_neutral2

Not often I get company... #sprite:scientist_neutral1
{hasKilledScientist:
    Wait. #sprite:scientist_neutral1
    ... #sprite:scientist_drama1
    You look like you've seen a ghost... #sprite:scientist_drama2
    ...Have I seen you before? #sprite:scientist_drama3
    ... #sprite:scientist_drama2
    Agh, forget it. #sprite:scientist_neutral1
    What do you want? #sprite:scientist_neutral2
        ->main 
  - else: ...
        But let's cut the niceties. #sprite:scientist_neutral2
        What do you want. #sprite:scientist_neutral3
        ->main
        }


=== main ===
*[I want to kill life]
(You tell him of your journey) #speaker:???
(Of all the things you've done) #sprite:scientist_neutral2
(And your goal...)  
(...) #sprite:scientist_neutral1
(The murder of life)

... #speaker:The Scientist #sprite:scientist_neutral2
So...  
You want to kill Life? #sprite:scientist_drama1
Hah! #sprite:scientist_drama3
Bloody idiot... #sprite:scientist_drama2
~notification("Idiot")
Heh... #sprite:scientist_neutral1
Have you any idea what that even means?
Hah... #sprite:scientist_neutral2

**[I'm serious]
    Oh, I'm sure you are. #sprite:scientist_neutral2
    So was I. #sprite:scientist_neutral1
    I murdered Death himself. #sprite:scientist_neutral3
    I saved every single person ever...
    Granted immortality to every man, beast, and creature. #sprite:scientist_neutral2
    
    I created my personal paradise.
    And within a year... #sprite:scientist_drama1
    ...It turned into my personal hell. #sprite:scientist_drama2
    
    ... #sprite:scientist_neutral2
    
    ...Ludicrous. #sprite:scientist_neutral1
    Humans, that is. #sprite:scientist_neutral2
    They're... #sprite:scientist_neutral1
    ...LUDICROUS. #sprite:scientist_neutral3
    A bunch of self-righteous lunatics. 
    
    We were all fools. #sprite:scientist_neutral1
    Death was never an obstacle... #sprite:scientist_neutral2
    It was a mercy. 
    
    My point being... #sprite:scientist_drama1
    ...Man should never interfere with the higher order. #sprite:scientist_drinking
    Of all people, I should know.
    
    How's the tea? #sprite:scientist_neutral2
        ***[It's good tea]
            Of course it is. #sprite:scientist_neutral3
            ~notification("This tea is pretty nice")
            It's lovely tea.
            Herbal delight. #sprite:scientist_neutral2
            
            (...) #speaker:??? 
            (Focus)
               ****[I need to find Life]
                ->Find
        
        ***[I need to find Life]
            ->Find
=== Find ===
Arghhhh... #speaker:The Scientist #sprite:scientist_neutral1

No.  #sprite:scientist_neutral2
You don't. #sprite:scientist_neutral1
Do yourself a favor... #sprite:scientist_neutral2
...And forget about it. #sprite:scientist_neutral3
If you just... #sprite:scientist_drama1
...cAn'T LiVe wItH yOurSelF. #sprite:scientist_drama3
Then do us all a favor... #sprite:scientist_drama2
And throw yourself off a building. #sprite:scientist_drama1
Capiche? #sprite:scientist_drama3

*[That's not an option]
    Son of a... #sprite:scientist_drama1
    YES. #sprite:scientist_neutral1
    IT IS. 
    What's wrong with you? #sprite:scientist_neutral2
    Can't you see? #sprite:scientist_neutral3
    We're all doomed. 
    All of us. #sprite:scientist_neutral1
    You can do nothing.
    You are nothing. #sprite:scientist_neutral2
    So do us ALL a favor. #sprite:scientist_neutral3
    AND FORGET ABOUT IT. #sprite:scientist_drama1
        **[I can't]
            For @*!^'$ sake... #sprite:scientist_drama3
            ... #sprite:scientist_drama1
            How long... #sprite:scientist_neutral1
            ...Have you been searching? #sprite:scientist_neutral2
                ***[As long as I can remember]
                Hm. #sprite:scientist_neutral2
                You've resolve... #sprite:scientist_neutral1
                ...Rare these days. #sprite:scientist_neutral3
                ... 
                (Sigh) #sprite:scientist_neutral2
                Alright. #sprite:scientist_neutral1
                ...Fine. 
                If you want to poke a bear... #sprite:scientist_drama1
                ...Who am I to deny you a stick? #sprite:scientist_drama3
                
                Ergh... #sprite:scientist_drama2
                Okay. #sprite:scientist_neutra2
                I'll get you inside Limbo. #sprite:scientist_neutral3
                It won't be instant...
                Give me a week prepare the gateway. #sprite:scientist_neutral2
                Resolve any unfinished business. #sprite:scientist_neutral1
                Meet back here in 10 days. #sprite:scientist_neutral2
                    ****[...Thank you]
                    ... #sprite:scientist_drama1
                    ...Don't.  #sprite:scientist_drinking
                    ~loadScene("BarSecond")
                    ->END