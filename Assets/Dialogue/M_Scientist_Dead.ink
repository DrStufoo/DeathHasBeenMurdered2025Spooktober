INCLUDE globals.ink
#layout:cg #audio:beep_1

~playEmote("fadeIntoScientistDead")
(He's...)

(He's dead)

(...Or close enough)

~notification("The fates will remember this...")
~hasKilledScientist = true
~killCount = killCount + 1

(You look through his pockets...)

(His lab...)

(His notes...)

(Journals...)

(You find every secret of the Scientist)

(...)

(With no way to decipher them)

(You try to decipher them)

(You spend days...)

(Weeks...)

(Months...)

(Years...)

(Decades...)

(But...)

(...)

(...You never understand how he did it.)


~playEmote("black")

(...) #layout:left #speaker:??? 

You've Failed

You've killed your only lead

Your hope is gone

You have nothing

You can only wait until your body turns into a corpse

Or perhaps a pile of blood

You've cast yourself into your own personal Limbo

...

Absolutely unacceptable...

(Sigh)

Fine

I'll grant you mercy

Go again

...Try not to kill your only hope.

...
    ~showOnlyGroup("ScientistAtWork2")
    ->END