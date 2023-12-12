local module = {}

module.Metadata = {
    Title = "Episode 6",
    Subtitle = "Instances",
    BackgroundImage = "http://www.roblox.com/asset/?id=10204199095",
    GridPlacement = "006",
    Template = "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n"
}

module.Content = {
    {
        Type = "Exercise",
        Title = "Properties",
        Description = "Manually add a new <b>Part</b> to the <b>Workspace</b>, and name it <b>MyPart</b>.\n\nIn the script editor, write a script that changes the part's name to <b>NamedPart</b>.",
        Hint = "You can reference the part by navigating to <b>game.Workspace.MyPart</b>. Re-assign the .Name property just as you would an index in a table.",
        Validator = "return workspace:FindFirstChild('NamedPart') ~= nil",
        ScriptValidator = "return not workspace:FindFirstChild('NamedPart')"
    },
    {
        Type = "Exercise",
        Title = "Properties #2",
        Description = "In the script editor, refer to the <b>Baseplate</b> part in the <b>Workspace</b>.\n\nNext, change its <b>Transparency</b> property to <b>0.5</b>.",
        Hint = "The Baseplate is just a <b>Part</b>, so you can reference it the same way as a standard part. You can also change the transparency of the part by setting the .Transparency property.",
        Validator = "return workspace:FindFirstChild('Baseplate').Transparency == 0.5",
        ScriptValidator = "return workspace:FindFirstChild('Baseplate').Transparency ~= 0.5"
    },
    {
        Type = "Exercise",
        Title = "Methods",
        Description = "In the script editor, refer to the <b>NamedPart</b> in the <b>Workspace</b>.\n\nNext, call the <b>Destroy</b> method, to destroy the part.",
        Hint = "After referring to the part, use the :Destroy() method to destroy it. Refer to the tutorial if you're unsure.",
        Validator = "return not workspace:FindFirstChild('NamedPart')",
        ScriptValidator = "return workspace:FindFirstChild('NamedPart') ~= nil"
    },
    {
        Type = "Exercise",
        Title = "Methods #2",
        Description = "Use the <b>GetChildren()</b> method to get a table containing each child in the <b>Workspace</b>.\n\nNext, iterate through the table, and output the <b>Name</b> of each child.",
        Hint = "The <b>GetChildren()</b> method returns a table of all the children in an instance. You can iterate through the table using a for loop, and output the child's name using the .Name property of each value in the table.",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() local len = 0 for i, v in workspace:GetChildren() do len += 1 end local function find(msg) for i, v in workspace:GetChildren() do if msg:find(v.Name, 1, true) then return true end end return false end for i = 0, len - 1 do if not find(log[#log-i].message) then return false end end return true",
        ScriptValidator = "return true"
    },
    {
        Type = "Exercise",
        Title = "Events",
        Description = "All instances have an event called <b>ChildAdded</b>, which fires when a child is added to the instance.\n\nWhen the event is fired, <b>one argument</b> is passed, which refers to the new instance that has been added.\n\nIn the script editor, refer to the <b>Workspace</b> instance and listen for the <b>ChildAdded</b> event.\n\nNext, output the <b>Name</b> of the child that was added.\n\nWhen you click the 'Test Code' button, a new part will be automatically added to the <b>Workspace</b>.\n\nYou will pass this challenge if your script outputs the name of the new part.",
        Hint = "Refer to the Engine API for an example of ChildAdded being used. Your parameter can be named anything, and you must them use the .Name property to get the name of the child.",
        Validator = "local name = 'NewPart' .. tostring(math.random(1000, 9999)) local part = Instance.new('Part') part.Name = name part.Parent = workspace wait() local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:find(name) then return true end return false",
        ScriptValidator = "return true"
    },
    {
        Type = "Quiz",
        Questions = {
            {
                Question = "Which of these does NOT reference a part's 'Name' property?",
                Answer = "part:Name",
                False1 = "part.Name",
                False2 = "part[\"Name\"]",
                False3 = "part['Name']"
            },
            {
                Question = "What does the 'game' keyword refer to?",
                Answer = "The top-level of the explorer",
                False1 = "The workspace",
                False2 = "The game server",
                False3 = "The Roblox website"
            },
            {
                Question = "Why do we use a colon when calling a method?",
                Answer = "It automatically passes the instance as the first argument",
                False1 = "It is much faster than using a dot",
                False2 = "You can't use a dot when calling a method",
                False3 = "Methods are always called with a colon"
            },
            {
                Question = "What happens if an event is fired mulitple times?",
                Answer = "The callback function is called each time",
                False1 = "The function will only get called the first time",
                False2 = "The script will error",
                False3 = "Roblox Studio will hang"
            },
            {
                Question = "According to the Engine API, what would this method return?\n<font face=\"Code\">game.Workspace.MyPart:GetFullName()</font>",
                Answer = "'Workspace.MyPart'",
                False1 = "'MyPart'",
                False2 = "'game.Workspace.MyPart'",
                False3 = "'Part'"
            }
        }
    }
}

return module