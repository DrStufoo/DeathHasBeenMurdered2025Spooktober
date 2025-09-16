INCLUDE globals.ink
#portrait:blank #layout:cg #audio:beep_1
...

{hasKilledScientist:->Solo| ->Scientist}

=== Solo ===
So... Here at last.
After YEARS, you've deciphered the Scientist's mad ramblimbs...
And here you are.

Find Life.
Kill her.
->Branch


=== Scientist ===
So... Here at last.
The Scientist has again opened the Gateway.

He didn't go with you.
...Coward.
No matter.

Find Life.
Kill her.
->Branch

=== Branch ===
...
{killCount = 0:-> innocent|->neutral}

=== innocent ===
...
~showOnlyGroup("Ending1")
->END

=== neutral ===
{hasKilledEverybody:-> murderer|...}
~showOnlyGroup("Ending2")
->END


=== murderer ===
...
~showOnlyGroup("Ending3")
->END