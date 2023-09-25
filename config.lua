Config = Config or {}

Config.CooldownCheckWait = 30 * 1000 -- 30 secs
Config.DefaultCooldownTimer = 60 -- in mins

-- disallow all idenfier for below time when server starts and ends
-- type 0 to disable this module
Config.StartCooldownTimer = 60 -- mins after restart
Config.EndCooldownTimer = 60 -- mins prior restart