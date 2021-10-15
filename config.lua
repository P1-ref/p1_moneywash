Config = {}

Config.Language = "en" -- "en" or "sv".

Config.WashMoney = vector3(1123.94, -3194.84, -40.4) -- location for the marker to wash money.

Config.EnterMoneyWash = vector3(1142.99, -986.34, 45.92) -- location for the marker to enter interior for moneywash.

Config.Blip = { -- https://docs.fivem.net/docs/game-references/blips/
	Icon = 500,
	Scale = 0.7,
	Color = 1
}

Config.EnableTimer = true -- if you want a timer to for the money to be washed. Set to false if you want the money to be washed immediately.

Config.TimeToWash = 60 -- in seconds.

Config.MarkerType = 23

Config.ShowTextDist = 1.0

Config.ShowMarkerDist = 5.0

Config.ShowBlip = false -- set to true if you want a blip on the map for where to enter the moneywash.

Config.Interior = vector3(1117.35, -3195.61, -40.4)

Config.InteriorLeave = vector3(1118.66, -3193.82, -40.4)

Config.LangEN = {
    ["washTitle"] = "How much do you want to wash?",
    ["blipName"] = "Moneywash",
    ["enterWash"] = "Press ~INPUT_CONTEXT~ to ~g~enter~s~ the ~y~moneywash~s~.",
    ["leaveWash"] = "Press ~INPUT_CONTEXT~ to ~r~leave~s~ the ~y~moneywash~s~.",
    ["washMoney"] = "Press ~INPUT_CONTEXT~ to ~b~wash~s~ your ~y~dirty money~s~.",
    ["noDirtyMoney"] = "You have ~r~no~s~ ~y~dirty money~s~!",
    ["invAmount"] = "~r~Invalid~s~ amount!",
    ["waitTime"] = "You ~r~need~s~ to wait %s seconds for the ~g~money~s~ to be washed.",
    ["youWashed"] = "You ~b~washed~s~ ~g~$%s~s~.",
    ["notEnough"] = "~r~You don't~s~ have ~y~enough~s~ dirty money to wash the submitted amount."
}

Config.LangSV = {
    ["washTitle"] = "Hur mycket vill du tvätta?",
    ["blipName"] = "Pengatvätt",
    ["enterWash"] = "Tryck på ~INPUT_CONTEXT~ för att ~g~gå in~s~ till ~y~pengatvätten~s~.",
    ["leaveWash"] = "Tryck på ~INPUT_CONTEXT~ för att ~r~lämna~s~ ~y~pengatvätten~s~.",
    ["washMoney"] = "Tryck på ~INPUT_CONTEXT~ för att ~b~tvätta~s~ dina ~y~svarta pengar~s~.",
    ["noDirtyMoney"] = "Du har ~r~inga~s~ ~y~svarta pengar~s~!",
    ["invAmount"] = "~r~Ogiltig~s~ mängd!",
    ["waitTime"] = "Du ~r~måste~s~ vänta %s sekunder på att ~g~pengarna~s~ ska tvättas.",
    ["youWashed"] = "Du ~b~tvättade~s~ ~g~%s SEK~s~.",
    ["notEnough"] = "Du har ~r~inte~s~ ~y~tillräckligt~s~ med svarta pengar för att tvätta den angivna summan."
}