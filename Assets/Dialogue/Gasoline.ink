INCLUDE globals.ink
#portrait:blank #speaker:Gasoline #layout:cg #audio:beep_1

->main

=== main ===
...
It's a can of gasoline.

Time to wreck some stuff up.

->Burn

=== Burn ===
They're all dead.
You've burned them all.
~killCount = killCount + 1
~hasKilledNobody = false
{isRaiding: ->EndHeist|->End}

=== EndHeist ===
You sift through the bone and ash.
Shining is the Golden Artifact you've searched for.
Was it worth it?
~loadScene("UndertakerMeetup")
->END

=== End ===
...
You can now continue to your journey in peace.
...
...Was it worth it
~loadScene("Laboratory")
->END