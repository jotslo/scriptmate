-- (C) 2023 jotslo. All rights reserved.
-- Redistribution of ScriptMate and/or its contents is forbidden.

local oldData = plugin:GetSetting("scriptmate001")

-- if user previously had scriptmate lite, load the original lite plugin
if oldData then
    require(script.Parent:WaitForChild("OldLite").Main)(plugin)

-- otherwise, show the new demo version of the plugin
else
    require(script.Parent:WaitForChild("NewLite").Main)(plugin)
end