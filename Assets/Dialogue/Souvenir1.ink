#layout:right #portrait:default#audio:beep_1 #speaker:Mask
INCLUDE globals.ink
{hasSpokenSouvenir2: ->TalkTwice| ->TalkOnce}
=== TalkOnce ===
It's a Mask.
...An old friend gave it you.
You wonder if he ever found the masked-man.
You calm down a little.
(Your insanity has decreased!)
(Check your morality stats by pressing "Escape"!)
~insanity = insanity - 1
~hasSpokenSouvenir2 = true
->END

=== TalkTwice ===
It's still a mask.
...You remember that your friend isn't here anymore.
You stop smiling...
->END