-- you need to manually add a modulescript called MyModule
-- store it in ReplicatedStorage

--[[
ModuleScript example:

return "Hello"
]]

-- require the module
local myModule = require(game.ReplicatedStorage.MyModule)

-- print the response
print(myModule)