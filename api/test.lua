local initCode = userCode:sub(1, (userCode:find('if')))
local conditions = userCode:gmatch('elseif([^t][^h][^e][^n]+)then')

for condition in conditions do
    local testScript = Instance.new('ModuleScript')
    testScript.Source = initCode .. '\nreturn ' .. condition
    local response = require(testScript)
    testScript:Destroy()
    if response then
        return true
    end
end

return false