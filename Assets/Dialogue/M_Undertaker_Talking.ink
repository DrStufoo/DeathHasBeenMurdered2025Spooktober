INCLUDE globals.ink
#layout:left #speaker:Undertaker #sprite:undertaker_handsoncounter #audio:undertaker # #portrait:undertaker_neutral
...
*[Wake him up gently]
*[Wait for him to wake]
*[Violently force him awake]
-The Undertaker wakes.

Sure, I'll give you what you want.
But... I need something back.
*[Fine]
    ~isRaiding = true
    Splendid.
    ~loadScene("Raiders")
    ->END