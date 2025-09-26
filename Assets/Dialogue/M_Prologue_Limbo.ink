INCLUDE globals.ink
#layout:cg #audio:beep_1
{goodEnding:-> innocent|->neutral}

=== innocent ===

(...)

(And so, our story ends)

(Life saw your valiance)

(Your lack of sadism)

(And decided you worthy of mercy)

(...And so she ended herself)

(And with her death...)

(Followed all living creatures)

(After all these centuries...)

(It's over)

~playEmote("black")

(Peace...)

(At last...)

...

#layout:right

<color=\#FF0000>Congratulations.</color>

<color=\#FF0000>You have won the game!</color>

<color=\#FF0000>This ending was the:</color>

<color=\#FFFF00>Good Ending! :D</color>

<color=\#FF0000>Throughout your whole journey...</color>

<color=\#FF0000>You caused no harm.</color>

<color=\#FF0000>There are 2 more endings:</color>

<color=\#0000FF>Neutral</color> and <color=\#00FF00>Good</color>

<color=\#FF0000>Regardless, thank you for playing.</color>

<color=\#FF0000>Enjoy your day...</color>

<color=\#FF0000>It may be your last.</color>
    ~loadScene("MainMenu")
    ->END
    


=== neutral ===
{badEnding:-> murderer|...}

~playEmote("fadeIntoMarauderLimbo")

(...)

(And so, our story ends)

(Life saw your valiance)

(Your sadism)

(And decided you unworthy of mercy)

(...And so left)

(...And never returned.)

(And with her dissappearence...)

(So vanished all your hope)

(Trapped in a strange world...)

(...You attempted to escape)

(...)

(You never did)

(It seems, after all this time, it was for nothing)

(It seems you're trapped...)


(In Limbo)
~playEmote("black")

#layout:right

<color=\#FF0000>Congratulations.</color>

<color=\#FF0000>You have finished the game</color>

<color=\#FF0000>This ending was the:</color>

<color=\#FFFF00>Neutral Ending</color>

<color=\#FF0000>Throughout your whole journey...</color>

<color=\#FF0000>You caused at least some harm.</color>

<color=\#FF0000>There are 2 more endings:</color>

<color=\#FF0000>Bad</color> and <color=\#00FF00>Good</color>

<color=\#FF0000>Regardless, thank you for playing.</color>

<color=\#FF0000>Enjoy your day...</color>

<color=\#FF0000>It may be your last.</color>
    ~loadScene("MainMenu")
    ->END
    


    
=== murderer ===
(...)
~playEmote("fadeIntoBadEnding")

(And so, our story ends)

(Life saw your sadism)

(And felt perhaps, for the first time...)

(Fear)

(And that day...)

(...Far within Limbo, where none could ever see...)

<color=\#FF0000>Life Has Been Murdered</color>

(And with her death...)

(Followed all living creatures)

(After all these centuries...)

(It's over)

...

~playEmote("black")

(But was it worth it?)

#layout:right

<color=\#FF0000>Congratulations.</color>

<color=\#FF0000>You have beaten the game</color>

<color=\#FF0000>This ending was the:</color>

<color=\#FFFF00> Bad Ending!</color>

<color=\#FF0000>Throughout your whole journey...</color>

<color=\#FF0000>You caused at least some harm.</color>

<color=\#FF0000>There are 2 more endings:</color>

<color=\#FF0000>BAD</color> and <color=\#00FF00>Good</color>

<color=\#FF0000>Regardless, thank you for playing.</color>

<color=\#FF0000>Enjoy your day...</color>

<color=\#FF0000>It may be your last.</color>
    ~loadScene("MainMenu")
    ->END
    
