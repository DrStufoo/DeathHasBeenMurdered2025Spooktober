INCLUDE globals.ink
#audio:beep_1
There is some gold here.
You could easily steal it...
(Steal the gold, or leave it?)
    *[Steal the gold.]
        You've stolen 5 gold!
        ...Not Like there's any use for it here..
        (Your valiance has decreased and your sadism has increased)
        (To check your morality stats, press "Escape"!)
        ~goldAmount = goldAmount + 5
        ~sadism = sadism + 1
        ~valiance = valiance - 1   
        ~achievement_thief = true
        (Yout have gained the "Thief" achievement and now have {goldAmount} gold!
    
    *[Leave the gold.]
        You left the gold, demonstrating VALIANCE.
        (Your valiance has increased by 1)
        ~valiance = valiance + 1  
    
    *[Stare at the gold.]
    You... Stare at the gold?
    ...
    The gold stares back.
    Your insanity has increased!
    ~insanity = insanity + 2
    {insanity >= 5: ->PsychoDialogue|->END}
    ->END

=== PsychoDialogue ===
You've... 
...Gone insane.
(Achievement: "Psycho" unlocked! View your achievements by pressing "escape"!)
->END