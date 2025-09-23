INCLUDE globals.ink
#speaker:Gasoline #layout:cg #audio:beep_1 #sprite:gasoline
{hasFoundGas:->Ready |->First}
=== First ===

...

It's a can of gasoline.

This will do perfectly...
    ->Ready

=== Ready ===
Are you ready to strike?

*[Yes]
    (Excellent)
    
    (Now...)
    
    (Let's paint the wasteland <color=\#FF0000>RED</color>)
    
    (...)
        ~showOnlyGroup("Burned")
        ->END

*[Not yet]
    ...
    Hm.
    ~hasFoundGas = true
    ->END