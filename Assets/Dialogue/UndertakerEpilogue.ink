INCLUDE globals.ink
#portrait:blank #layout:cg #audio:beep_1
->main
=== main ===
And so, the Undertaker departed...
~playEmote("fadeIntoBarInDistance")

This run, you gained {valiance} Valiance!
You also gained {sadism} Sadism!

Whether or not the Undertaker faced his demons, we don't yet know.
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
~ loadScene("Bar_MWNE")
->END
