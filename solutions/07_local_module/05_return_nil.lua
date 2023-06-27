--[[
ModuleScript example:

-- output a random message
print("hello from the module!")

-- return a nil value so modulescript can function
return nil
]]

-- require the module
require(game.ReplicatedStorage.MyModule)

-- the response will have been outputted by now
-- anything past this point will run afterwards