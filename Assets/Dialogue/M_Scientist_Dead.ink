INCLUDE globals.ink
#portrait:blank #layout:cg #audio:beep_1
...
->main
=== main ===
He's...
He's dead.
...Or close enough.
~hasKilledScientist = true
~killCount = killCount + 1
~sadism = sadism + 1
(Your Sadism has increased!)

You look through his pockets.

There's a journal...
It has the secrets of the Scientist within.
You know what to do.

You'd best complete your unfinished business.
You're going to purgatory.
    *[I just need a drink]
    Bloody alcoholic...
    ~loadScene("BarSecond")
    ->END
