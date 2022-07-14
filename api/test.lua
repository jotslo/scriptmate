local name = 'NewPart' .. tostring(math.random(1000, 9999)) local part = Instance.new('Part') part.Name = name part.Parent = workspace wait() local log = game:GetService('LogService'):GetLogHistory() if log[#log-i].message:find(name) then return true end return false

--[[wait()
local log = game:GetService('LogService'):GetLogHistory()

local len = 0
for i, v in workspace:GetChildren() do
    len += 1
end

local function find(msg)
    for i, v in workspace:GetChildren() do
        if msg:find(v.Name) then
            return true
        end
    end
    return false
end

for i = 0, len - 1 do
    if not find(log[#log-i].message) then
        return false
    end
end

return true]]