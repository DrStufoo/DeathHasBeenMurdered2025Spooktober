INCLUDE globals.ink
#layout:left #speaker:The Man With No Eyes #sprite:MWNE_neutral #audio:beep_1 # #portrait:MWNEPortrait
...
...Is someone there?
*[I'm here]
    ->Greeting
*[Ignore him]
    (You stay silent)
    (He looks confused)
    ...Hello?
    Anyone?
    **[I'm here]
        Oh, thank goodness!
        ->Greeting
    **[Continue to ignore him]
        (You stay silent)
        (He looks anxious)
        Oh dear...
        There really isn't anyone here, is there?
        ***[I'm here]
            AGH!
            Sonnuva...
            Sorry friend, you scared me there!
            (He clears his throat)
            ->Greeting
        ***[Continue to ignore him]    
            (For the third time, you ignore the blind man.)
            (He simply looks tired)
            (He curses himself and tries to find the door)
                ****[Reveal yourself]
                ****[Let him leave]
                    With some difficulty, he leaves.
                    ->Silence
=== Greeting ===
Hello there, friend! :D
Not very often I get to see a friendly face...
*[Nor I, friend]
    Ah, a pity.
    Nowadays, what isn't...
*[Doesn't look like you often see anything]
    (He smiles at the joke, but is obviously hurt)
    (Why the frick would you say that?)
    (Your Sadism has increased!)
    ~sadism = sadism + 1
    Anyways...
    
    -->Info

=== Info ===
->END

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

