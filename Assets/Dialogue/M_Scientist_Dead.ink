INCLUDE globals.ink
#portrait:blank #layout:cg #audio:beep_1

~playEmote("fadeIntoMarauderOverRaiders")
(Show the CG of Scientist Dead)

(He's...)

(He's dead)

(...Or close enough)

~notification("The fates will remember this...")
~hasKilledScientist = true
~killCount = killCount + 1

(You look through his pockets...)

(There's a journal)

(...It has the secrets of the Scientist within)

(You try to decipher them)

(You spend days...)

(Weeks...)

(Months...)

(Years...)

(Decades...)

(But...)

(...)

(...You never understand how he did it.)

(...)

(You've killed your only lead)

(Your hope is gone)

(You have nothing)

(You can only wait until your body turns into a corpse)

(Or perhaps a pile of blood)

(You've cast yourself into your own personal Limbo)

(...)

(Was it worth it?)

<color=\#FF0000>...</color> #audio:undertaker

<color=\#FF0000>You've Failed.</color>

<color=\#FF0000>Pick up from your last save.</color>

<color=\#FF0000>Try not to kill your only hope...</color>

<color=\#FF0000>...</color>
    ~loadScene("MainMenu")
    ->END