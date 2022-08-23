local remote = game.ReplicatedStorage:FindFirstChild('RemoteEvent')
local handler

if not remote then
    return false
end

if handler

handler = remote.OnServerEvent:Connect(function(player, message)
    print('Received arguments: [player], \\'' .. message .. '\\'')
    handler:Disconnect()
    handler = nil
end)

remote:Clone().Parent = remote.Parent
remote:Destroy()
return true

local remote = game.ReplicatedStorage:FindFirstChild('RemoteEvent')

if not remote then return false end

remote.OnServerEvent:Connect(function(player, message)
    if remote then
        print('Received arguments: [player], \\'' .. message .. '\\'')
        remote:Clone().Parent = remote.Parent
        remote:Destroy()
    end
end)

return true


local eventListener = script.Parent:FindFirstChild('EventListener')
local event = game.ReplicatedStorage:FindFirstChild('RemoteEvent')

if event and not eventListener then
    eventListener = Instance.new('ModuleScript')
    eventListener.Source = [[local event = game.ReplicatedStorage:FindFirstChild('RemoteEvent')

    event.OnServerEvent:Connect(function(player, message)
        print('Server received arguments: [player], \\'' .. message .. '\\'')
    end)]]
    require(eventListener)
end

return true


local funcListener = script.Parent:FindFirstChild('FuncListener')
local func = game.ReplicatedStorage:FindFirstChild('RemoteFunction')

if func and not funcListener then
    funcListener = Instance.new('ModuleScript')
    funcListener.Name = "FuncListener"
    funcListener.Source = [[local func = game.ReplicatedStorage:FindFirstChild('RemoteFunction')

    func.OnServerInvoke = function(player, message)
        return \"'\" .. message .. \"' to you too.\"
    end
    
    return true]]
    require(funcListener)
end

return true


local funcListener = script.Parent:FindFirstChild('FuncListener') local func = game.ReplicatedStorage:FindFirstChild('RemoteFunction') if func and not funcListener then funcListener = Instance.new('ModuleScript') funcListener.Name = "FuncListener" funcListener.Source = [[local func = game.ReplicatedStorage:FindFirstChild('RemoteFunction') func.OnServerInvoke = function(player, message) return \"'\" .. message .. \"' to you too.\" end return true]] require(funcListener) end return true

----

local eventListener = game.HttpService:FindFirstChild('EventListener') local event = game.ReplicatedStorage:FindFirstChild('RemoteEvent') if event and not eventListener then eventListener = Instance.new('ModuleScript') eventListener.Source = [[local event = game.ReplicatedStorage:FindFirstChild('RemoteEvent') event.OnServerEvent:Connect(function(player, message) print('Server received arguments: [player], \\'' .. message .. '\\'') end)]] eventListener.Parent = game.HttpService require(eventListener) end return true



local remote = game.ReplicatedStorage:FindFirstChild('RemoteEvent') if not remote then return false end remote.OnServerEvent:Connect(function(player, message) if remote then print('Received arguments: [player], \\'' .. message .. '\\'') remote:Clone().Parent = remote.Parent remote:Destroy() end end) return true