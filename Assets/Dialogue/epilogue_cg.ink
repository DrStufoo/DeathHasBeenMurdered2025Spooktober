INCLUDE globals.ink
#portrait:MITW #layout:left #audio:beep_1 #speaker:???

->main

=== main ===

(Click on things to Interact with them)
(Click on things to Skip typing)
(Press WASD and Space to select a choice)
(Got it?)
(Too bad)
(Enjoy the game!)
~playEmote("default")
#layout:cg
…
Long ago, there was a man…
A brilliant scientist, the likes of which humanity has never seen.
Not merely a scientist, but an ambitious inventor.
His skills would have helped countless people in the medical industry.
…But no.
He was determined to save lives with a more…
<color=\#FF0000>Direct Approach...</color>
And so… He began his work.
Months he hid, beneath the ground, toiling away day and night…
He invented a device.
An ominous machine…
…A gateway to other worlds.
He trudged through this new horizon,  intent on his purpose.
Soon enough, he found…
<color=\#FF0000>Death Himself</color>
~playEmote("fadeIntoScientistWithDeath")
The first human to ever make contact…
And Death… Led with peace.
Curious about the peculiar man, he extended his hand.
The Scientist feigned goodwill.
But he was not here for peace.
He was here…
...
~playEmote("fadeIntoBlackFromScientistDeath")
<color=\#FF0000>To save lives...</color>

He emerged from the gateway.
News spread quickly.
All of humanity rejoiced, every nation and state joining in triumph.
For in the void, so long ago…
~activateGameObject = true
~playEmote("fadeIntoScientistKilledDeath")
<color=\#FF0000>Death Has Been Murdered</color>
He thought Death an obstacle.

He was a fool.

Immortality has been shoved down the throats of every man, beast, and creature cursed with the breath of life.

Lose an arm? Could be worse.
Thrown into the ocean? You'll be fine.
Buckshot to the face?
Unfortunately enough...
...You'll live.

But forget the ludicrous Scientist.
~playEmote("fadeIntoBlackFromScientistKilledDeath")
A fathomless amount of time has passed.
Most remnants of humanity have been torn to paranoid scrappers or lunatic raiders.
Yet...
Not all.
~playEmote("fadeIntoBarInDistance")
Somewhere in the wasteland, live a lonely Barkeep, and a vengeful Marauder.
The elegant Barkeep spends his time in his bar.
Waiting to serve tired travelers.
He's a simple man, doing simple good.
~playEmote("fadeIntoBlackFromBarInDistance")
But while the Barkeep simply bides his time...
~playEmote("fadeIntoMarauderOverRaiders")
The Marauder has a mission.
A purpose.
He won't accept his Death being robbed of him.
He's spent the centuries searching for a way to reclaim  it.
Perhaps, one day, he will find it.
Or perhaps he will meet a fate...
~playEmote("fadeIntoBlackFromMarauder")
<color=\#FF0000>Worse than Death...</color>
~ loadScene("MainMenu")
...
...
->END
