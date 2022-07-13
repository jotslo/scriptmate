wait()
local log = game:GetService('LogService'):GetLogHistory()

local len = 0
for i, v in myTable do
    len += 1
end

local function find(msg)
    for i, v in myTable do
        if msg:find(i) and msg:find(v) then
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

return true