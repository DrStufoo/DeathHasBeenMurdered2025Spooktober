INCLUDE globals.ink
#layout:cg #audio:beep_1
~playEmote("fadeIntoMarauderOverRaiders")
{isRaiding:->Duty|->Sadism}

=== Duty ===

(...)

(They're dead)

(They're all dead)

~notification("The fates will remember this...")
~killCount = killCount + 12

(There's nothing left but blood)

(...You notice something shiny in the ground)

(You run your fingers through the ash)

(And pull out the Leader's necklace)

(...Job well done)

(Find the Undertaker)

(Give him the necklace)

(And finally find the bloody Scientist...)

(...)
    ~loadScene("Laboratory")
    ->END

=== Sadism ===
(...)

(They're dead)

(They're all dead)

~notification("The fates will remember this...")
~killCount = killCount + 12

(There's nothing left but blood)

(...You notice something shiny in the ground)

(You run your fingers through the ash)

(And pull out the Leader's skull)

(...Job well done)

(The wasteland is safer now...)

(...)

(Isn't it?)

(Doesn't matter)

(You're wasting time)

(Get a move-on)

(Find the bloody Scientist...)

(...)
    ~loadScene("Laboratory")
    ->END