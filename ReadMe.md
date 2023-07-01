Global cooldown for all your scripts and robberies/heists

# Exports/Events

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

# Usage

- Demo (Client)
```lua
RegisterCommand('check', function()
  if exports['cad-cooldown']:isActive('test') then
      print('cooldown active')
  else
      print('cooldown not active')
  end
end)

RegisterCommand('startcool', function()
  TriggerServerEvent('cooldown:startCooldown', 'test', 1)
end)
```
- Demo (Server)
```lua
RegisterCommand('check', function()
  if exports['cad-cooldown']:isActive('testserver') then
      print('cooldown active')
  else
      print('cooldown not active')
  end
end)

RegisterCommand('startcool', function()
   exports['cad-cooldown']:startCooldown('testserver', 1)
end)
```

```
Note: names are available on both client & server
```

# Commands
```lua
    -- force add a cooldown
    `/cooldownadd [name] [time]`

    -- remove a cooldown
    `/cooldownclear [name]` 
```
