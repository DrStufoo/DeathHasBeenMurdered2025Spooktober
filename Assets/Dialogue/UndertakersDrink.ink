INCLUDE globals.ink
#layout:right #portrait:default #audio:beep_1 #speaker:Undertaker's Drink
{hasDrankUndertakersDrink: ->Drank| ->notDrank}

=== notDrank ===
...
It's a very stale drink.
You wonder how long this drink has been abandoned...
Doesn't matter.
There's an unconscious Morticion to tend to.
...
...So go do that.
*[Drink the Stale beverage (Bad Idea)]
    (You drink the old beverage)
    ...
    (It's horrible)
    (Of course it's horrible)
    (I told you not to drink it)
    (And yet, you still did)
    (Enjoy your cavities, dipshit)
    ~hasDrankUndertakersDrink = true
    ->END
*[Mind your own business (Good Idea)]
    (You decide to not drink the questionable beverage)
    (I'm proud of you)
    ->END
=== Drank ===
...
The drink is gone.
You drank it.
Why would you do that?
->END