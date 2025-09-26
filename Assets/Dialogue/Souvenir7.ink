#layout:left  #audio:beep_1 #speaker:Flower
INCLUDE globals.ink
{hasSpokenSouvenir7: ->TalkTwice| ->TalkOnce}
=== TalkOnce ===
It's a beautiful flower...
...An old friend gave it you.

You wonder if she ever found her mama.
...
...You know she didn't.
You feel a little uneasy.
(Your insanity has increased!)
(Check your morality stats by pressing "Escape"!)
~insanity = insanity + 1
~hasSpokenSouvenir7 = true
->END

=== TalkTwice ===
It's still a flower.
...You remember your friend's hopes...
You begin smiling...
->END