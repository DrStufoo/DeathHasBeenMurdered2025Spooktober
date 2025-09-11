INCLUDE globals.ink
#layout:left #portrait:MITW #audio:beep_1 #speaker:???
{hasLooked:
    ...
    ->alreadySeen
  - else:
    ...
    ->main
}

=== main ===
You notice an ominous set of eyes.
They notice you back.
The eye-contact is driving you mad.
(Your Insanity has increased!)
~insanity = insanity + 1
(To check your Morality stats, press "Escape"!)
~hasLooked = true
->END

=== alreadySeen ===
The eyes continue to stare at you.
...
You try not to think about it.
->END
