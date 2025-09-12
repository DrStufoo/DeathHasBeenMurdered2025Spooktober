INCLUDE globals.ink
#layout:right #portrait:LuckyCat#audio:beep_1 #speaker:Lucky Cat
...

{hasSpokenSouvenir1: ->TalkTwice| ->TalkOnce}
=== TalkOnce ===
It's a Lucky Cat.
...An old friend gave it you.
You remember your companion and smile.
You feel a little better.
(Your insanity has decreased!)
(Check your morality stats by pressing "Escape"!)
~insanity = insanity - 1
~hasSpokenSouvenir1 = true
->END

=== TalkTwice ===
It's still a Lucky Cat.
...You remember that your friend isn't here anymore.
You stop smiling...
->END