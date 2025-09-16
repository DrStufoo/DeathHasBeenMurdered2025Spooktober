INCLUDE globals.ink
#portrait:blank #speaker:Barkeep #layout:cg #audio:beep_1
...
->main
=== main ===
...You look tired, friend.
What did you do?

    *[What I had to]
    Mm. I see.
    Are you sure?
        **[Yes]
        Well...
        Good luck.
        ***[Won't need it]
        Bloody 'ell...
        ~loadScene("Limbo")
        ->END
