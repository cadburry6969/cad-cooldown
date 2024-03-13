local cooldownActive = {}
GlobalState.cooldownActive = {}
GlobalState.globalCooldown = os.time() + (Config.StartCooldownTimer * 60)

local function checkCooldown()
    if next(cooldownActive) then
        local currentTime = os.time()
        for sName, data in pairs(cooldownActive) do
            if data.endTime < currentTime then
                cooldownActive[sName] = nil
                GlobalState.cooldownActive = cooldownActive
                print(string.format('^3Cooldown: %s ^2(Started: %s | Ended: %s)^0', sName, os.date("%c", data.startTime), os.date("%c", data.endTime)))
            end
        end
    end
    SetTimeout(Config.CooldownCheckWait, checkCooldown)
end checkCooldown()

---@param name string name of the resource / robbery
local function isActive(name)
    if GlobalState.globalCooldown then return true end
    if not name then return false end
    return cooldownActive[name] or false
end exports("isActive", isActive)

---@param name string name of the resource / robbery
---@param time number time in minutes
local function startCooldown(name, time)
    if not name then return end
    time = time or Config.DefaultCooldownTimer
    local endTime = os.time() + (time * 60)
    cooldownActive[name] = { startTime = os.time(), endTime = endTime }
    GlobalState.cooldownActive = cooldownActive
end exports("startCooldown", startCooldown)

RegisterNetEvent('cooldown:startCooldown', function(name, time)
    if not name then return end
    time = time or Config.DefaultCooldownTimer
    local endTime = os.time() + (time * 60)
    cooldownActive[name] = { startTime = os.time(), endTime = endTime }
    GlobalState.cooldownActive = cooldownActive
end)

RegisterCommand('cooldownadd', function(source, args, raw)
    if args[1] and args[2] then
        local name = tostring(args[1])
        local time = tonumber(args[2])
        if cooldownActive[name] then
            TriggerClientEvent('cooldown:notify', source, 'Cooldown already active')
        else
            local endTime = os.time() + (time * 60)
            cooldownActive[name] = { startTime = os.time(), endTime = endTime }
            GlobalState.cooldownActive = cooldownActive
            TriggerClientEvent('cooldown:notify', source, string.format('Cooldown enabled: %s for %d hrs', name, time))
        end
    end
end, true)

RegisterCommand('cooldownclear', function(source, args, raw)
    if args[1] then
        local name = tostring(args[1])
        if cooldownActive[name] then
            cooldownActive[name] = nil
            GlobalState.cooldownActive = cooldownActive
            TriggerClientEvent('cooldown:notify', source, string.format('Cooldown disabled: %s', name))
        else
            TriggerClientEvent('cooldown:notify', source, 'Cooldown not active')
        end
    end
end, true)

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    local endTimer = (Config.EndCooldownTimer * 60)
    if eventData.secondsRemaining == endTimer then
        GlobalState.globalCooldown = os.time() + endTimer
    end
end)

CreateThread(function()
    while true do
        Wait(Config.LoopCheckTimer * 60 * 1000)
        if GlobalState.globalCooldown then
            if os.time() > GlobalState.globalCooldown then
                GlobalState.globalCooldown = nil
            end
        end
    end
end)