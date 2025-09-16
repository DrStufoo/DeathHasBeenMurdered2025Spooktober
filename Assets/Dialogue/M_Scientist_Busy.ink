INCLUDE globals.ink
#portrait:blank #layout:cg #audio:beep_1
...
->main
=== main ===
There he is...
The fool that started it all.
He's too busy to notice you...

You could either try to talk to him...
...Or take some revenge and scavenge the secrets off his dead body.
At least, he'd wish he was dead.
    *[Talk]
    Wise choice.
    ~showOnlyGroup("ScientistTalk")
    ->END
    
    *[Attack him]
    You bloody sadist...
    ~showOnlyGroup("ScientistDead")
    ->END