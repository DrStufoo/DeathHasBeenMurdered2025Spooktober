INCLUDE globals.ink
#portrait:blank #layout:cg #audio:beep_1
...
It's been a long time since you've been here last.
Not that it matters.
->Branch
=== Branch ===
...
{killCount = 0:-> innocent|->neutral}
=== innocent ===
...
~showOnlyGroup("BarkeepPleased")
->END
=== neutral ===
{hasKilledEverybody:-> murderer|}
...
~showOnlyGroup("BarkeepNeutral")
->END
=== murderer ===
...
~showOnlyGroup("BarkeepHorrified")
->END