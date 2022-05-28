Config = {
    Language = "en", -- "en" or "sv".

    Locations = {
        WashMoney = {
            vec(1123.9759521484375, -3194.841796875, -40.4007453918457),
            vec(1122.41162109375, -3194.984130859375, -40.40163421630859),
            vec(1125.638427734375, -3194.937744140625, -40.40134048461914),
            vec(1127.279541015625, -3194.72509765625, -40.39999008178711),
            --vec(X.X, Y.Y, Z.Z), -- use this to add more locations to open menu for washing money.
        },

        EnterMoneyWash = vec(1142.99, -986.34, 45.92),
        LeaveMoneyWash = vec(1118.66, -3193.82, -40.4),
    },

    Blip = {
        Show = true,
        Icon = 500, -- https://docs.fivem.net/docs/game-references/blips/
        Scale = 0.7,
        Color = 1,
    },

    General = {
        EnableTimer = false,
        TimeToWash = 60, -- in seconds.
        ShowTextDist = 0.7,
    },
    
    Translation = {
        ["en"] = {
            ["BlipName"] = "Moneywash",
            ["EnterWash"] = "Press ~b~E~s~ to ~g~enter~s~ the ~y~moneywash~s~",
            ["LeaveWash"] = "Press ~b~E~s~ to ~r~leave~s~ the ~y~moneywash~s~",
            ["WashMoney"] = "Press ~b~E~s~ to ~b~wash~s~ your ~y~dirty money~s~",
            ["WaitTime"] = "You need to ~r~wait~s~ %s seconds for the ~g~money~s~ to be washed.",
            ["YouWashed"] = "You ~b~washed~s~ ~g~$%s~s~.",
            ["NotEnough"] = "~r~You don't~s~ have ~y~enough~s~ dirty money to wash the submitted amount."
        },

        ["sv"] = {
            ["BlipName"] = "Pengatvätt",
            ["EnterWash"] = "Tryck på ~b~E~s~ för att ~g~gå in~s~ till ~y~pengatvätten~s~",
            ["LeaveWash"] = "Tryck på ~b~E~s~ för att ~r~lämna~s~ ~y~pengatvätten~s~",
            ["WashMoney"] = "Tryck på ~b~E~s~ för att ~b~tvätta~s~ dina ~y~svarta pengar~s~",
            ["WaitTime"] = "Du måste ~r~vänta~s~ %s sekunder på att ~g~pengarna~s~ ska tvättas.",
            ["YouWashed"] = "Du ~b~tvättade~s~ ~g~%s SEK~s~.",
            ["NotEnough"] = "Du har ~r~inte~s~ ~y~tillräckligt~s~ med svarta pengar för att tvätta den angivna summan."
        },
    },
}