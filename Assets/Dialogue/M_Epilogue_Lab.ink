INCLUDE globals.ink
#portrait:blank #layout:cg #audio:beep_1
...
->Branch
=== Branch ===
{traveledWithUndertaker:->HereWithUndertaker|->HereSolo}

=== HereWithUndertaker ===
#layout:left #speaker:undertaker
After a long journey...
You and the Undertaker arrive.

"Good luck."
*[Enter]
    ~showOnlyGroup("ScientistBusy")
    ->END

=== HereSolo ===
After years of traveling alone...
At long last...
The laboratory.
*[Enter]
    ~showOnlyGroup("ScientistAtWork")
    ->END