INCLUDE globals.ink
#portrait:blank #layout:cg #audio:beep_1
->main
=== main ===
…
~ CurrentCharacter = 1
Far from what's left of civilization...
Hidden by the wasteland...
~playEmote("fadeIntoBarInDistance")
Inhabited by only a single man, is a bar.
This barkeep has spent centuries, unmovingly perched on his bar, waiting for any drifters to pass through.
Despite their... Affiliations.

He merely wants an honest living.
Even more, a simple dying.
But irrelvant.
He merely wants to serve any weary travellers, so often they come.
Which is... Practically never.
Probably for the best.
~playEmote("fadeIntoBlackFromBarInDistance")
Despite the rarity however...
Today is different.
~playEmote("fadeIntoBarkeepApproaching")
A stranger approaches...
~showOnlyGroup("UndertakerServe")
->END