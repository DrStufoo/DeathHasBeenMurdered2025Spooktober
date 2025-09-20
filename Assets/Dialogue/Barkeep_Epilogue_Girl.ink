INCLUDE globals.ink
#portrait:blank #layout:cg #audio:beep_1
->main
=== main ===
And so, the Marauder departed...
You wonder what he'll get up to...
~playEmote("fadeIntoBarInDistance")

You now have {valiance} Valiance!
You also have {sadism} Sadism!

Whether the Marauder found peace, we don't yet know.
Regardless, the Bar is empty, and you are alone.
~playEmote("fadeIntoBlackFromBarInDistance")

Alone for days.
Alone for Weeks.
Alone for Months.
Alone for Years.

But... 
Not today.
After all this time alone...

~playEmote("fadeIntoBarkeepApproaching")
A...
Stranger approaches?
    
    *[Begin]
    ?
    ...
    ~ showOnlyGroup("GirlServe")
    ->END