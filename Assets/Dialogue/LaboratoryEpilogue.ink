INCLUDE globals.ink
#portrait:blank #layout:cg #audio:beep_1
{traveledWithUndertaker:->HereWithUndertaker|->HereSolo}

=== HereWithUndertaker ===
#layout:left #speaker:undertaker
Alright... Here we are.
Good luck.
*[Enter]
    ~showOnlyGroup("ScientistBusy")
    ->END

=== HereSolo ===
At long last...
The laboratory.
*[Enter]
    ~showOnlyGroup("ScientistBusy")
    ->END