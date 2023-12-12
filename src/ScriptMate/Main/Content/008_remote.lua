local module = {}

module.Metadata = {
    Title = "Episode 8",
    Subtitle = "Remotes",
    BackgroundImage = "http://www.roblox.com/asset/?id=10204200695",
    GridPlacement = "008",
    Template = "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n",
    NoTC = true
}

module.Content = {
    {
        Type = "Exercise",
        Title = "Handling Remote Events",
        Description = "Manually, add a <b>RemoteEvent</b> to the <b>ReplicatedStorage</b> and do <b>not</b> rename it.\n\nNext, return to the ScriptMateEnv script editor, and assume you are writing a LocalScript.\n\nFinally, fire the RemoteEvent's server-side event, and pass any string as an argument.",
        Hint = "Use the :FireServer() method to fire the event on the server. Then, pass any string as an argument, between the brackets when calling the method.",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() local msg = log[#log].message if msg:find('Server received arguments') and not msg:find('nil') then return true end return false",
        ScriptValidator = "local eventListener = game.HttpService:FindFirstChild('EventListener') local event = game.ReplicatedStorage:FindFirstChild('RemoteEvent') if event then Instance.new('RemoteEvent', game.ReplicatedStorage) event:Destroy() event = game.ReplicatedStorage:FindFirstChild('RemoteEvent') end if event and not eventListener then eventListener = Instance.new('ModuleScript') eventListener.Name = 'EventListener' eventListener.Source = [[local storage = game:GetService('ReplicatedStorage') local event = storage:FindFirstChild('RemoteEvent') local function onEvent(player, message) if message then if typeof(message) == 'string' then print('Server received arguments: [player], \\'' .. message .. '\\'') elseif typeof(message) == 'table' and message[3] == 948 then return true else print('Server received unexpected non-string argument.') end else print('Server did not receive expected arguments.') end end event.OnServerEvent:Connect(onEvent) storage.ChildRemoved:Connect(function() if not event or not event.Parent then event = storage:FindFirstChild('RemoteEvent') if event then event.OnServerEvent:Connect(onEvent) end end end) return true]] eventListener.Parent = game.HttpService end require(eventListener) return true",
        Solution = [[-- let's assume we're writing a localscript
-- we fire the remoteevent and pass a string
game.ReplicatedStorage.RemoteEvent:FireServer("Hello World!")]],
        ExtraCode = [[
            local rem = game.ReplicatedStorage:FindFirstChild('RemoteEvent')

            if not rem then
                rem = Instance.new('RemoteEvent')
                rem.Name = 'RemoteEvent'
                rem.Parent = game.ReplicatedStorage
            end
        ]]
    },
    {
        Type = "Exercise",
        Title = "Handling Remote Events #2",
        Description = "In the script editor, assume you are now writing a server script, and listen for a server event from the <b>RemoteEvent</b>.\n\nThe event will pass <b>two arguments</b>, one being the <b>Player</b> that fired the event, and one being a <b>table</b>.\n\nThe table contains a list of numbers. Your function must output the <b>3rd number</b> in the table, when the event is fired.\n\n<i>Note: The player argument will be a nil value for this demonstration.</i>",
        Hint = "Listen for .OnServerEvent and create parameters for the player and table. Then, simply use square brackets to get the 3rd value in the table.",
        Validator = "local remote = game.ReplicatedStorage:FindFirstChild('RemoteEvent') if not remote then return false end remote:FireServer({100.3, 123, 948, 33.09, 456}) wait() local log = game:GetService('LogService'):GetLogHistory() local msg = log[#log].message if msg:find('948') then return true end return false",
        ScriptValidator = "local remote = game.ReplicatedStorage:FindFirstChild('RemoteEvent') Instance.new('RemoteEvent', game.ReplicatedStorage) remote:Destroy() return true",
        Solution = [[-- we're now listening for an event as the server
-- the client is going to pass 2 args to the server

-- arg 1: the player who fired the event
-- arg 2: a table

game.ReplicatedStorage.RemoteEvent.OnServerEvent:Connect(function(player, args)
    -- when fired, we output the 3rd value in the table
    print(args[3])
end)]],
        ExtraCode = [[
            local rem = game.ReplicatedStorage:FindFirstChild('RemoteEvent')

            if not rem then
                rem = Instance.new('RemoteEvent')
                rem.Name = 'RemoteEvent'
                rem.Parent = game.ReplicatedStorage
            end
        ]]
    },
    {
        Type = "Exercise",
        Title = "Handling Remote Functions",
        Description = "Manually, add a <b>RemoteFunction</b> to the <b>ReplicatedStorage</b> and do <b>not</b> rename it.\n\nNext, return to the ScriptMateEnv script editor, and assume you are writing a LocalScript.\n\nThen, invoke the <b>RemoteFunction</b> and pass any string as an argument.\n\nFinally, output the returned value.",
        Hint = "To invoke a RemoteFunction, call the :InvokeServer() method. Then, pass any string as an argument, between the brackets when calling the method. You must then output the returned value.",
        Validator = "local remote = game.ReplicatedStorage:FindFirstChild('RemoteFunction') if not remote then return false end wait() local log = game:GetService('LogService'):GetLogHistory() local msg = log[#log].message if msg:find('to you too') then return true end return false",
        ScriptValidator = "local funcListener = game.HttpService:FindFirstChild('FuncListener') local func = game.ReplicatedStorage:FindFirstChild('RemoteFunction') if func and not funcListener then funcListener = Instance.new('ModuleScript') funcListener.Name = 'FuncListener' funcListener.Source = [[local func = game.ReplicatedStorage:FindFirstChild('RemoteFunction') func.OnServerInvoke = function(player, message) if message then if typeof(message) == 'string' then return \"'\" .. message .. \"' to you too.\" end end return 'Incorrect arguments sent.' end return true]] end require(funcListener) return true",
        Solution = [[-- let's assume we're writing a localscript
-- we invoke the remotefunction and pass a string        
local response = game.ReplicatedStorage.RemoteFunction:InvokeServer("Hello World!")

-- finally, we output the response
print(response)]],
        ExtraCode = [[
            local rem = game.ReplicatedStorage:FindFirstChild('RemoteFunction')

            if not rem then
                rem = Instance.new('RemoteFunction')
                rem.Name = 'RemoteFunction'
                rem.Parent = game.ReplicatedStorage
            end
        ]]
    },
    {
        Type = "Exercise",
        Title = "Handling Remote Functions #2",
        Description = "In the script editor, assume you are now writing a server script, and create a function that's called when the <b>RemoteFunction</b> is invoked.\n\nThe event will pass <b>two arguments</b>, one being the <b>Player</b> that fired the event, and one being a <b>number</b>.\n\nYour function must multiply the number by <b>3</b> and then return it.\n\n<i>Note: The player argument will be a nil value for this demonstration.</i>",
        Hint = "Use OnServerInvoke to listen for the RemoteFunction. Then, take the 2nd parameter, which can be named as you wish, multiply it by 3, and return the result.",
        Validator = "local remote = game.ReplicatedStorage:FindFirstChild('RemoteFunction') if not remote then return false end local response = remote:InvokeServer(28) remote:Clone().Parent = remote.Parent remote:Destroy() if response then return response == 28 * 3 end return false",
        ScriptValidator = "return true",
        Solution = [[-- we are now writing a server script
-- remotefunction will receive two args:

-- arg 1: the player who invoked the function
-- arg 2: a number

game.ReplicatedStorage.RemoteFunction.OnServerInvoke = function(player, args)
    -- we return the number multiplied by 3
    return args * 3
end]],
        ExtraCode = [[
            local rem = game.ReplicatedStorage:FindFirstChild('RemoteFunction')

            if not rem then
                rem = Instance.new('RemoteFunction')
                rem.Name = 'RemoteFunction'
                rem.Parent = game.ReplicatedStorage
            end
        ]]
    },
    {
        Type = "Quiz",
        Questions = {
            {
                Question = "Which of these calls a RemoteFunction?",
                Answer = "InvokeServer()",
                False1 = "FireServer()",
                False2 = "CallServer()",
                False3 = "TriggerServer()"
            },
            {
                Question = "Which is true about Remote Events?",
                Answer = "They're used to communicate between the server and client",
                False1 = "They can only be fired from the client",
                False2 = "They can only be fired from the server",
                False3 = "They're always used for player authentication"
            },
            {
                Question = "Why must you consider security when using remotes?",
                Answer = "Exploiters can fire any remote with any info",
                False1 = "To improve performance of your game",
                False2 = "Reducing the game's file size",
                False3 = "You don't need to"
            },
            {
                Question = "Where should remotes be stored in your game?",
                Answer = "ReplicatedStorage",
                False1 = "Workspace",
                False2 = "ServerStorage",
                False3 = "Lighting"
            },
            {
                Question = "How do you restrict who can use a remote?",
                Answer = "Check the player on the server",
                False1 = "Check the player on the client",
                False2 = "Use a password system",
                False3 = "Use Roblox's authentication system"
            }
        }
    }
}

return module