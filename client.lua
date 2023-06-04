---@param name string name of the resource / robbery
local function isActive(name)
    if not name then return end
    return GlobalState.cooldownActive[name] or false
end exports("isActive", isActive)

RegisterNetEvent('cooldown:notify', function(msg)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandThefeedPostTicker(true, true)
end)