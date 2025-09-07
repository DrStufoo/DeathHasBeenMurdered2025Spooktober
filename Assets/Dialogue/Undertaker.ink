INCLUDE globals.ink
#layout:left #speaker:Undertaker #sprite:undertaker_neutral #audio:undertaker # #portrait:undertaker_neutral
{hasTalkedToBarkeepOnce:->Drink}
Oh...
Hey stranger.
Betcha don't see a lotta folks out here anymore, heh! #sprite:undertaker_flirty
Heh... 
...

*[You'd be surprised]
    Really? Heh, in that case, the company's gotta be some a' them-
    ...
    Not ideals. #sprite:undertaker_handsoncounter
    **[Care for a drink?]
    Oh a drink? Heh, I thought you'd never ask!
        ***[What'll it be?]
        ->Drink
*[Not a lot]
    Heh, with the kind of folk's drifting through, that's uh...
    ...Probably for the best.
    **[Care for a drink?]
        ->Drink  
*[What'll it be?]
    ->Drink
*[(Be silent)]
    ...
    (Your silence is deafening)
    ...
    So uh...
    ...
    Can I have a drink?
    **Alright, mate.
      What'll it be?
      ->Drink
    ** No.
    ->PleaseLoop
=== PleaseLoop ===
    {noSaid >= 10: ->Enough}
    ...
    ...
    ...Please?
    +[No]
    ~noSaid = noSaid + 1
    (You've denied this man {noSaid} time's.
    ->PleaseLoop

    *[Alright fine]
    What'll it be?
    ->Drink
== Enough ==
    ...
    ALRIGHT
    WHY NOT
    WHAT HAVE I DONE TO DESERVE SUCH
    SUCH
    SUCH LUDICROUSY
    I AM BUT THIRSTY
    I HAVE HAD A DIFFICULT LAST FEW DECADES
    I JUST
    I JUST-
    I-
    ...
    I just wanna drink...
    Can I... PLEASE.
    ...Have a drink?
    *[Yes.]
        Oh, at long bloody last...
        **What'll it be?
        ->Drink
    *[...No]
    ...
    (The Undertaker has left.)
    (For he has seen everything.)
    ->END
=== Drink ===
Oh, heh.
Not sure...
Whattya got? #sprite:undertaker_flirty
*[(List all the drinks you know)]
    (You tell him you have a Whiskey, a Porter, and a Rye.
    Plus some cider, if he'd give it a try.)
    ...
    ...Ooookay then, anything else?
    **[(List even more)]
        (You tell him you have 2 Rums, one Buttered, one Cold,)
        (and a Scotch at least seven years old.)
        ...
        That's... Alright then.
        Do ya... Know any more?
            ***[(List literally every alcholic beverage you know)]
            (You tell him you can bring on the wine,)
            (Start with a port,)
            (And wash it all down with a beer of some sort,)
            (Some brandy, some sherry, some grog, and some gale,)
            (Some old mountain dew, and a good howling gale)
            (Mead, Stout, Vermouth, and  Gin,)
            (Vodka, Bourbon, and a Sly Grin,)
            (Moonshine, Tequila, Cognac, and Schnapps,)
            (Some old Sour Mash, and two Belly Flops,)
            (Goldwasser, Ouzo, White Lightning, Green Toad,)
            (Absinthe, Sambuca,)
            (AND ONE FOR THE ROAD)
            ...
            You uh...
            You rehearse that buddy?
            I'm...
            Okay then, just...
            Take a bloody whisky...
            ->pouringDrink
    **[That was all of it]
        Oh, well uh. In that case...
    ->Drink
*[(Whiskey's pretty good here)]
    Ah, whiskey?
    That'll do, then.
    ->pouringDrink

*[(It's all bloody horrible)]
    Oh really? All of it?
    Heh, what isn't these days...
    (He sighs)
    Alright. Just...
    Pour me a whiskey... Please.
    ->pouringDrink
=== pouringDrink ===
->END




