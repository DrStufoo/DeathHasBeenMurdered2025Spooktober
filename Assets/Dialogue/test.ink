INCLUDE globals.ink
#portrait:undertaker_surprised #speaker:Undertaker
#layout:left
Eh?
'Ello bruv. #portrait:undertaker_neutral
->main


=== main ===
#audio:beep_1 #portrait:undertaker_neutral
Now what'll it be?

*[Do you have whisky?]
    No. #portrait:undertaker_angry
    ->main
*[Do you have wine?]
    Not now, not ever.   #portrait:undertaker_angry 
    ->main
*[Do you have bourbon?]
    Shutup. #portrait:undertaker_angry
    ->main
*[Do you have time for this nonsense?]
    Do i- #portrait:undertaker_angry
    ... #portrait:undertaker_thoughtful
    No. #portrait:undertaker_shook
    ~playEmote("vanishing")
    ->END