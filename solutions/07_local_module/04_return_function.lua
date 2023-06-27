--[[
ModuleScript example:

-- create a function which concatenates string + smiley
function concatSmiley(str)
    return str .. " :)"
end

-- return the function for use in main script
return concatSmiley
]]

-- require the module
local concatFunction = require(game.ReplicatedStorage.MyModule)

-- print the response
print(concatFunction("Hello")) -- Hello :)