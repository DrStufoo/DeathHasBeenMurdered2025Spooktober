INCLUDE globals.ink
#layout:cg #audio:beep_1 #sprite:life_neutral
{killCount == 0:-> innocent|->neutral}

=== innocent ===
...
Hello, there! #sprite:life_wave
I've never seen...
One of you before. #sprite:life_neutral
...What's your name? #sprite:life_curious

*[Tell her]
    Hm. 
    That's a silly name! =] #sprite:life_hysteria
    **[What's yours?]
        Me? #sprite:life_curious 
        I have none. #sprite:life_neutral
        I simply am. #sprite:life_happy
        But... #sprite:life_wave
        why are you? #sprite:life_neutral
        What have you come for? #sprite:life_sad
            ***[Tell her the State of humanity]
                (You tell her how humanity has fallen) 
                (How many years you've lived) #sprite:life_curious
                (How tired you've grown)
                (How pained humanity's become)
                
                ... #sprite:life_neutral
                ...I'm sorry, traveller. #sprite:life_sad
                This was never meant to happen.
                But you've killed my brother. #sprite:life_scared
                Or... #sprite:life_sad
                At least humanity had.
                But... #sprite:life_curious
                Your light... #sprite:life_sad
                Is still bright? #sprite:life_hysteria
                Hm. #sprite:life_neutral
                I'd have thought they would send an assaisain.
                ...Curious. #sprite:life_wave
                Perhaps... 
                There is still hope. #sprite:life_neutral
                Hm... #sprite:life_curious
                    ****[Please help us]
                    (You beg her to help) 
                    (She's hesitant) #sprite:life_sad
                    (But she remembers your clean hands)
                    (Perhaps you deserve it...) #spritre:life_curious
                    ...Okay, traveller. #sprite:life_neutral
                    Perhaps... 
                    Our time is up. #sprite:life_wave
                    Alright. #sprite:life_neutral
                    It is time for our story to end. #sprite:life_sad
                    
                    Good-bye, traveller. #sprite:life_scared
                    ... #sprite:life_sad
                    ...I'm coming, brother. 
                    ~goodEnding = true
                    ~showOnlyGroup("Ending")
                    ->END
                    
                    
=== neutral ===
{hasKilledEverybody:-> murderer|...}
...
Hello, there! #sprite:life_wave

I'm Life.  #sprite:life_neutral
...What's your name? #sprite:life_hysteria
What have you come for? #sprite:life_curious
*[Try to talk her]
        (You tell her how humanity has fallen) #sprite:life_neutral
        (How many years you've lived)
        (How tired you've grown) #sprite:life_curious
        (How pained humanity's become)
                
        ...
        ...I'm sorry, traveller. #sprite:life_sad
        This was never meant to happen. 
        Perhaps... #sprite:life_happy
        <color=\#FF0000>You shouldn't have killed my brother</color> #sprite:life_scared
        (...) #sprite:empty
        (...She's gone) 
        (She can't be gone.)
        (Find her)
        (...Please)
            ~neutralEnding = true
            ~showOnlyGroup("Ending")
            ->END
*[Try to kill her]
    Oop! #sprite:happy
    (You attempted to lash at her) #sprite:empty
    (She just disappeared)
    
    (...)
    (...She's gone)
    (She can't be gone.)
    (Find her)
    (...Please)
        ~neutralEnding = true
        ~showOnlyGroup("Ending")
        ->END
    
=== murderer ===
...
Hello, there! #sprite:life_wave

I'm... #sprite:life_neutral
...Life. #sprite:life_curious
...
You're not a... #sprite:life_sad
What...
ARE you? #sprite:life_scared

*[Death]
    You're... 
    ...Not healthy. #sprite:life_sad
    What happened to you?
    ....What. #sprite:life_curious
    What did you do? #sprite:life_sad
    **[(Demonstrate)]
        (You lash at Life, as you have to so many others) #sprite:life_scared
        (Your aim is true)
        (She will not survive this)
        ...
        (C O U G H) #sprite:life_terrified
        ...
        ...I'm coming, brother. #life_sad
        ~badEnding = true
        ~showOnlyGroup("Ending")
        ->END
        
        
        
        
        
