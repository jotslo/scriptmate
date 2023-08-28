-- fixes modulescript caching causing unwanted behaviour in ep. 7

return [[local newRequire = require local function require(moduleScript) local newScript = moduleScript:Clone() newScript.Source ..= "\n--" .. game:GetService("HttpService"):GenerateGUID() local response = newRequire(newScript) newScript:Destroy() return response end ]]