local AIO = AIO or require("AIO")

local MyHandlers = AIO.AddHandlers("racialSwitch", {})

local racialUtilityList = {
    20572,
    59752,
    20594,
    58984,
    20549,
    7744,
    26297,
    28730,
    59542,
    7
}

local racialPassiveList = {
    20573,
    65222,
    20555,
    58943,
    20550,
    822,
    20591,
    20592,
    5227,
    6562,
    20582,
    20551,
    21009,
    20585,
    20596,
    58985,
    20599,
    20598
}

function MyHandlers.racialActivate(player, spellId)
    for i = 1, #racialUtilityList do
        if player:HasSpell(racialUtilityList[i]) then
            player:RemoveSpell(racialUtilityList[i])
        end
    end
    player:LearnSpell(spellId)

    --TODO add a check if the player has any other spell learned
end

function MyHandlers.racialDeactivateUtility(player, spellId)
    for i = 1, #racialUtilityList do
        if spellId == racialUtilityList[i] then
            return player:RemoveSpell(spellId)
        end
    end
end

function MyHandlers.racialDeactivatePassive(player, spellId)
    for i = 1, #racialPassiveList do
        if spellId == racialPassiveList[i] then
            return player:RemoveSpell(spellId)
        end
    end
end

function MyHandlers.unLearnAllRacials(player, spellId)
    for i = 1, #racialUtilityList do
        player:RemoveSpell(racialUtilityList[i])
    end
    for i = 1, #racialPassiveList do
        player:RemoveSpell(racialPassiveList[i])
    end
end




local function showWindowPls(event, player, command)
    if (command == "tf") then
        AIO.Handle(player, "racialSwitch", "MyAddonFrame")
        return false
    end
end
RegisterPlayerEvent(42, showWindowPls)
