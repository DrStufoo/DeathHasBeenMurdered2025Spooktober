#layout:left  #audio:beep_1 #speaker:Trustless Grenade
INCLUDE globals.ink
{hasSpokenSouvenir3: ->TalkTwice| ->TalkOnce}
=== TalkOnce ===
It's a home-made grenade.
...An old friend gave it you.

You wonder if she ever forgave herself.
You calm down a little.
(Your insanity has decreased!)
(Check your morality stats by pressing "Escape"!)
~insanity = insanity - 1
~hasSpokenSouvenir3 = true
->END

=== TalkTwice ===
It's still a grenade.
...You remember your friend's screams...
You stop smiling...
->END