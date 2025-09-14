INCLUDE globals.ink
#layout:left #speaker:Undertaker #sprite:undertaker_handsoncounter #audio:undertaker # #portrait:undertaker_neutral
...
*[Read the Dossier]
-It's mostly mad ravings.
...Some of it talks of a masked-man.
You chuckle.
You know enough to begin your journey
*[Begin your journey]
    ~isRaiding = false
    ~loadScene("Raiders")
    ->END