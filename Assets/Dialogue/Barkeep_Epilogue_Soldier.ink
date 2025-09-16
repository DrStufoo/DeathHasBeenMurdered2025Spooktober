INCLUDE globals.ink
#portrait:blank #layout:cg #audio:beep_1
->main
=== main ===
And so, the Man With No Eyes departed...
~playEmote("fadeIntoBarInDistance")

You now have {valiance} Valiance!
You also have {sadism} Sadism!

Whether or not the Man With No Eyes faced his demons, we don't yet know.
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
A stranger approaches...
~ showOnlyGroup("SoldierServe")
->END
