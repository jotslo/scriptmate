--[[
ModuleScript example:

-- return the table of admins
return {"Josh", "Bob", "Joe"}
]]

-- require the module
local myModule = require(game.ReplicatedStorage.MyModule)

-- print the 2nd admin within the response
print(myModule[2])