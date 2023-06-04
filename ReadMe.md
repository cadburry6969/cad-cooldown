Global cooldown for all your scripts and robberies/heists

# Usage

```lua
    -- # client

    -- check cooldown
    -- name is the cooldown name or script name
    exports['cad-cooldown']:isActive(name)

    -- start cooldown
    -- name is the cooldown name or script name
    -- time is hours (1 = 1 hour / 0.5 = 30 mins)
    TriggerServerEvent('cooldown:startCooldown', name, timer)
```

```lua
    -- # server

    -- check cooldown
    -- name is the cooldown name or script name
    exports['cad-cooldown']:isActive(name)

    -- start cooldown
    -- name is the cooldown name or script name
    -- time is hours (1 = 1 hour / 0.5 = 30 mins)
    exports['cad-cooldown']:startCooldown(name, timer)
```

# Commands
```lua
    -- force add a cooldown
    `/cooldownadd [name] [time]`

    -- remove a cooldown
    `/cooldownclear [name]` 
```