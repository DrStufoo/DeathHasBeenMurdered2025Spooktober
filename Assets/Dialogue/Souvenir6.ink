#layout:left  #audio:beep_1 #speaker:Old Coin
INCLUDE globals.ink
{hasSpokenSouvenir6: ->TalkTwice| ->TalkOnce}
=== TalkOnce ===
It's an Old Coin.
You don't remember the Ruler it commemorates.
...An old friend gave it you.
You wonder if he ever redeemed himself.

~hasSpokenSouvenir6 = true
->END

=== TalkTwice ===
It's still a Coin.
...You wish it could still buy things...
You stop smiling...
->END