INCLUDE globals.ink
#layout:right #portrait:Undertaker #audio:beep_1 #speaker:Undertaker
...
->Handoff

=== Handoff ===
Do you have it?
*[Yes]
    ->Guide
*[Give me the info first]
    No.
    ->Handoff
=== Guide ===
Oh, it's beautiful...
...Now for my end of the bargain.
I know where he is.
Or at least, was...
But he doesn't deal kindly with visitors...
*[I'll be fine]
~traveledWithUndertaker = true
~loadScene("Laboratory")
->END