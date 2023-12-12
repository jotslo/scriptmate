local module = {}

module.Metadata = {
    Title = "Episode 7",
    Subtitle = "Local & Module",
    BackgroundImage = "http://www.roblox.com/asset/?id=10204199852",
    GridPlacement = "007",
    Template = "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n"
}

module.Content = {
    {
        Type = "Exercise",
        Title = "Client & Server Communication",
        Description = "Take this opportunity to experiment with client and server communication.\n\nYou can do this by testing LocalScripts and server scripts, and by creating a test environment for <b>2 players</b>, as shown in the tutorial.\n\nWhen you're done, simply click 'Test Code' to move onto challenges about ModuleScripts.",
        Hint = "This challenge doesn't require any work, but it is highly recommended to experiment with LocalScripts in your own time. Simply click 'Test Code' when you're ready.",
        Validator = "return true",
        ScriptValidator = "return true"
    },
    {
        Type = "Exercise",
        Title = "Creating a ModuleScript",
        Description = "Manually add a ModuleScript to the <b>ReplicatedStorage</b>, and name it <b>MyModule</b>.\n\nNext, remove the template code, and simply have the ModuleScript return a <b>string</b> of your choice.\n\nFinally, go back to the ScriptMateEnv script, <b>require</b> the ModuleScript, and output the returned string.",
        Hint = "You can require a ModuleScript with the <b>require</b> function, with the ModuleScript's location as the argument. The function will then return your ModuleScript's string, which you can assign to a variable, or output directly.",
        Validator = [[
            wait()
            local mod = game.ReplicatedStorage:FindFirstChild('MyModule')
            local log = game:GetService('LogService'):GetLogHistory()

            if not mod then
                return false
            end

            local newMod = Instance.new('ModuleScript')
            newMod.Source = mod.Source

            local result = require(newMod)

            if log[#log].message:find(result) then
                return true
            end

            return false
        ]],
        ScriptValidator = "return userCode:find('require') ~= nil and not userCode:find('print%(\"') and not userCode:find('print%(\\'')"
    },
    {
        Type = "Exercise",
        Title = "Returning a Table",
        Description = "In the <b>MyModule</b> ModuleScript, return a table.\n\nThe table must be in list-form and contain the names of the game's admins, which are 'Josh', 'Bob', and 'Joe'.\n\nNext, go back to the ScriptMateEnv script, and <b>require</b> the ModuleScript.\n\nFinally, output the <b>2nd name</b> in the returned table.",
        Hint = "You can return a table like this: <b>return {}</b>. After requiring the ModuleScript, the function will return the table. You can then use it as you would any other table.",
        Validator = [[
            wait()
            local mod = game.ReplicatedStorage:FindFirstChild('MyModule')
            local log = game:GetService('LogService'):GetLogHistory()

            if not mod then
                return false
            end

            local newMod = Instance.new('ModuleScript')
            newMod.Source = mod.Source

            local result = require(newMod)

            if typeof(result) == "table" and #result == 3 and result[1] == 'Josh' and result[2] == 'Bob' and result[3] == 'Joe' then
                return true
            end

            return false
        ]],
        ScriptValidator = "return true"
    },
    {
        Type = "Exercise",
        Title = "Returning a Function",
        Description = "In the <b>MyModule</b> ModuleScript, return a function.\n\nThe function must take a string as an argument, concatenate <b>' :)'</b> (a space and a smiley) onto the end of the string. The function must then output the new string.\n\nNext, go back to the ScriptMateEnv script, and <b>require</b> the ModuleScript.\n\nFinally, call the function in ScriptMateEnv with a string of your choice.",
        Hint = "The <b>require</b> function will return a function datatype. You can then assign it to a variable, and call it as you would any other function assigned to a variable.",
        Validator = [[
            wait()
            local mod = game.ReplicatedStorage:FindFirstChild('MyModule')
            

            if not mod then
                return false
            end

            local newMod = Instance.new('ModuleScript')
            newMod.Source = mod.Source

            local result = require(newMod)

            if typeof(result) == "function" then
                result('Validating!')

                wait()
                local log = game:GetService('LogService'):GetLogHistory()

                if log[#log].message:find('Validating! :)') then
                    return true
                end
            end

            return false
        ]],
        --Validator = "wait() local mod = game.ReplicatedStorage:FindFirstChild('MyModule') if not mod then return false end local func = require(mod) if not typeof(func) == 'function' then return false end local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:find(':)') then return true end return false",
        ScriptValidator = "return true"
    },
    {
        Type = "Exercise",
        Title = "Returning Nil",
        Description = "ModuleScripts run any code within them when required.\n\nTo demonstrate this, go to the <b>MyModule</b> ModuleScript, and call the print function to output any message.\n\nNext, simply return a nil value, so that a value is returned.\n\nFinally, go back to the ScriptMateEnv script, and <b>require</b> the ModuleScript.\n\nIf done correctly, the ModuleScript will output your message when required, and then return a nil value.",
        Hint = "You don't need to assign the returned value to a variable when requiring. Simply call the <b>print</b> function within the ModuleScript, and it will output the message. It does not need to be attached to a variable, or returned in any way.",
        Validator = [[
            wait()
            local mod = game.ReplicatedStorage:FindFirstChild('MyModule')

            if not mod then
                return false
            end

            local newMod = Instance.new('ModuleScript')
            newMod.Source = mod.Source

            return newMod.Source:find('print') ~= nil
        ]],
        --Validator = "wait() local mod = game.ReplicatedStorage:FindFirstChild('MyModule') return mod.Source:find('print') ~= nil",
        ScriptValidator = "return userCode:find('require') ~= nil and not userCode:find('print%(\"') and not userCode:find('print%(\\'')"
    },
    {
        Type = "Quiz",
        Questions = {
            {
                Question = "How many values can a ModuleScript return?",
                Answer = "1",
                False1 = "None",
                False2 = "An infinite amount",
                False3 = "2"
            },
            {
                Question = "Which of these should be handled in a LocalScript?",
                Answer = "Dealing with a button press",
                False1 = "Storing player data",
                False2 = "Handling game logic",
                False3 = "Updating players' scores"
            },
            {
                Question = "Which of these is NOT a script that you can use?",
                Answer = "CoreScript",
                False1 = "LocalScript",
                False2 = "ModuleScript",
                False3 = "Script"
            },
            {
                Question = "Why can LocalScripts not access the server?",
                Answer = "Cheaters could use this to modify information on the server",
                False1 = "This would make LocalScripts too powerful for Roblox to handle",
                False2 = "LocalScripts would be too slow to run",
                False3 = "They would be too easy to break"
            },
            {
                Question = "Which of these can access the <b>ReplicatedStorage</b>?",
                Answer = "All scripts",
                False1 = "LocalScript",
                False2 = "Script",
                False3 = "ModuleScript"
            }
        }
    }
}

return module