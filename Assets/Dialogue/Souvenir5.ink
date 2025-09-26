#layout:left  #audio:beep_1 #speaker:Alleged Antidote
INCLUDE globals.ink
{hasSpokenSouvenir5: ->TalkTwice| ->TalkOnce}
=== TalkOnce ===
It's an antidote.
...An old... Aquantiance gave it you.
You frown at his memory.
~hasSpokenSouvenir5 = true
->END

=== TalkTwice ===
It's still an antidote.
It's still making you displeased.
->END