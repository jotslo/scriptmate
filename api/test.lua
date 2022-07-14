if userCode:find('require') ~= nil and not userCode:find('print(\"') and not userCode:find('print(\'') then
    return 'local newRequire = require local function require(moduleScript) return newRequire:Clone()' .. userCode
end
return false