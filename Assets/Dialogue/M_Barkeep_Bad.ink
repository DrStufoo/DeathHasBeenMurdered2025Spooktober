INCLUDE globals.ink
#portrait:blank #speaker:Barkeep #layout:cg #audio:beep_1
...
->main
=== main ===
Your hands...
They're red.
...What have you done?

    *[What I had to]
    Do you really believe that?
        **[Yes]
        Well...
        Good luck.
        ***[Won't need it]
        Bloody 'ell...
        ~loadScene("Limbo")
        ->END
