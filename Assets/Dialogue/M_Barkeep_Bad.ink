INCLUDE globals.ink
#portrait:blank #speaker:Barkeep #layout:cg #audio:beep_1
...
*[Hey, Lloyd]
    ...
    **[Slow tonight, isn't it? Heh...]
    ...
    Your hands...
    ...They're covered in red.
        ***[Can I get a drink]
            ->DrinkChoice

=== DrinkChoice ===
...
I serve PEOPLE here.
...Not whatever you've become.
Get out of my sight.
...
        *[You'll regret this]
        ~loadScene("Limbo")
        ->END
