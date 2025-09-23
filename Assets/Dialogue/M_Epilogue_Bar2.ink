INCLUDE globals.ink
#portrait:blank #layout:cg #audio:beep_1

(...)

(You've no unfinished business)

(No relatives, friends...)

(Nothing but resolve)

(And fatigue...)

(Just...)

(Find the nearest bar)

(Get yourself a pint...)

(...And get out of there)

    ->Branch

=== Branch ===
...
{killCount == 0:
    -> innocent
    ->END
  - else:
    -> neutral
}

=== innocent ===
{sadism == 0:
    ...
    ~showOnlyGroup("BarkeepPleased")
    ->END
  - else:
    -> neutral
}

=== neutral ===
{hasKilledEverybody:
    ...
    ~showOnlyGroup("BarkeepHorrified")
    ->END

  - else:
    ~showOnlyGroup("BarkeepNeutral")
    ->END
}
