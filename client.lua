local cooldownActive = {}

---@param name string name of the resource / robbery
local function isActive(name)
    if not name then return end
    return cooldownActive[name] or false
end exports("isActive", isActive)

AddStateBagChangeHandler(nil, 'global', function(bagName, key, value, reserved, replicated)
    if key == "cooldownActive" then
        cooldownActive = value
    end
end)

RegisterNetEvent('cooldown:notify', function(msg)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandThefeedPostTicker(true, true)
end)