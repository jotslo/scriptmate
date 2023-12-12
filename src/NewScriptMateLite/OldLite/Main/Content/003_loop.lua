local module = {}

module.Metadata = {
    Title = "Episode 3",
    Subtitle = "Loops",
    BackgroundImage = "http://www.roblox.com/asset/?id=10204193903",
    GridPlacement = "003",
    Template = "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n"
}

module.Content = {
    {
        Type = "Exercise",
        Title = "For Loop #1",
        Description = "Using a <b>for loop</b>, write a script that outputs each value from <b>1</b> to <b>100</b>.\n\nYou may only use the <font color=\"rgb(85,170,255)\">print</font> keyword once in your script.",
        Hint = "You can create a for loop ranging from 1 to 100. On each loop, the variable is incremented by the step value, which defaults to 1.",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() for i = 0, 99 do if not log[#log-i].message:find(100 - i) then return false end end return true",
        ScriptValidator = "local _, count = userCode:gsub('print', '') return userCode:find('for') ~= nil and count == 1"
    },
    {
        Type = "Exercise",
        Title = "For Loop #2",
        Description = "Using a <b>for loop</b>, write a script that outputs each value from <b>20</b> to <b>-20</b>, with a step of <b>-2</b>.\n\nYou may only use the <font color=\"rgb(85,170,255)\">print</font> keyword once in your script.",
        Hint = "You can create a for loop ranging from 20 to -20, with a third value representing the step of -2. On each loop, the variable is incremented by the step value, so the output should look like 20, 18, 16 ... -16, -18, -20",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() for i = 0, 20 do if not log[#log-i].message:find(-20 + i * 2) then return false end end return true",
        ScriptValidator = "local _, count = userCode:gsub('print', '') return userCode:find('for') ~= nil and count == 1"
    },
    {
        Type = "Exercise",
        Title = "While Loop",
        Description = "Using a <b>variable</b> and a <b>while loop</b>, write a script that outputs each value from <b>1</b> to <b>100</b>.\n\nYou may only use the <font color=\"rgb(85,170,255)\">print</font> keyword once in your script.\n\n<font color=\"rgb(238,75,43)\">Warning: Make sure your while loop doesn't run for an infinite amount of time, or Roblox Studio will hang.</font>",
        Hint = "An example of this challenge is given in the tutorial, incrementing a variable from 1 to 5. You should increment your variable until it reaches 100.",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() for i = 0, 99 do if not log[#log-i].message:find(100 - i) then return false end end return true",
        ScriptValidator = "local _, count = userCode:gsub('print', '') return userCode:find('while') ~= nil and count == 1"
    },
    {
        Type = "Exercise",
        Title = "Repeat Loop",
        Description = "Using a <b>variable</b> and a <b>repeat loop</b>, write a script that outputs each value from <b>0</b> to <b>50</b>.\n\nYou may only use the <font color=\"rgb(85,170,255)\">print</font> keyword once in your script.\n\n<font color=\"rgb(238,75,43)\">Warning: Make sure your repeat loop doesn't run for an infinite amount of time, or Roblox Studio will hang.</font>",
        Hint = "An example of this challenge is given in the tutorial, incrementing a variable from 1 to 5. You should assign your variable to 0, and increment it until it reaches 50.",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() for i = 0, 50 do if not log[#log-i].message:find(50 - i) then return false end end return true",
        ScriptValidator = "local _, count = userCode:gsub('print', '') return userCode:find('repeat') ~= nil and count == 1"
    },
    {
        Type = "Exercise",
        Title = "Continue Keyword",
        Description = "Using any loop, output each value from <b>1</b> to <b>10</b>, but skip the number <b>5</b>.\n\nYou may only use the <font color=\"rgb(85,170,255)\">print</font> keyword once in your script.\n\nYou <b>must</b> use the <font color=\"rgb(238,75,43)\">continue</font> keyword in your loop.",
        Hint = "You should use an if statement that checks the current value, and the continue keyword, which allows you to skip the current iteration of the loop. You can use the continue keyword inside any loop.",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() for i = 0, 4 do if not log[#log-i].message:find(10 - i) then return false end end for i = 6, 9 do if not log[#log-(i-1)].message:find(10 - i) then return false end end return true",
        ScriptValidator = "local _, count = userCode:gsub('print', '') return userCode:find('continue') ~= nil and count == 1"
    },
    {
        Type = "Exercise",
        Title = "Break Keyword",
        Description = "Write a <b>for loop</b> that outputs each value from <b>1</b> to <b>10</b>, but stop the for loop after the script has outputted <b>5</b>.\n\nYou may only use the <font color=\"rgb(85,170,255)\">print</font> keyword once in your script.",
        Hint = "You should use an if statement that checks the current value, and the break keyword, which allows you to break the loop and skip to the code underneath the block. You can use the break keyword inside any loop.",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() for i = 0, 4 do if not log[#log-i].message:find(5 - i) then return false end end return true",
        ScriptValidator = "local _, count = userCode:gsub('print', '') return userCode:find('break') ~= nil and userCode:find('10') ~= nil and count == 1"
    },
    {
        Type = "Exercise",
        Title = "Do Block",
        Description = [[Declare a <b>local</b> variable named <font color="rgb(85,170,255)">myNum</font> inside of a <b>do block</b>.

The variable must be assigned to the number <b>26</b>.

Next, output the variable's value.]],
        Hint = "Local variables can only be accessed inside of a scope. If you declare a local variable inside the do block, it can only be accessed inside of it.",
        Validator = [[
wait()

local log = game:GetService("LogService"):GetLogHistory()

if myNum then return false end

if log[#log].message:lower():find("26") then
    return true
end

return false]],
        ScriptValidator = "return userCode:find('myNum') ~= nil and not userCode:find('print%(\\'') and not userCode:find('print%(\"')"
        --[[
        Description = "Declare a <b>local</b> variable named <font color=\"rgb(85,170,255)\">myNum</font> inside a <b>do block</b>.\n\nThe variable should be assigned to the number <b>26</b>\n\nIn the do block's scope, output the variable's value.\n\nOutside the do blocks scope after running, output the variable's value again, where it should not have a value.",
        Hint = "Local variables can only be accessed inside of a scope. If you declare a variable inside the do block, it will not have a value outside of it, and so should output nil.",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() if myNum then return false end if log[#log-1].message:lower():find('26') and log[#log].message:lower():find('nil') then return true end return false",
        ScriptValidator = "return userCode:find('myNum') ~= nil and not userCode:find('print%(\\'') and not userCode:find('print%(\"')"]]
    },
    {
        Type = "Quiz",
        Questions = {
            {
                Question = "What does this script do?\n<font face=\"Code\">while 2 > 1 do print('hello!') end</font>",
                Answer = "Create an infinite loop, causing Roblox to hang",
                False1 = "Outputs 'hello!' each frame",
                False2 = "Causes an error",
                False3 = "Outputs 'hello!' once, and then stops"
            },
            {
                Question = "Why is a do block useful?",
                Answer = "It creates a new scope for local variables",
                False1 = "It runs code in a loop",
                False2 = "It allows you to access variables in other scripts",
                False3 = "They aren't useful"
            },
            {
                Question = "What does the third value given to the for loop represent?",
                Answer = "The step value",
                False1 = "The target value",
                False2 = "The starting value",
                False3 = "There are only two values"
            },
            {
                Question = "Why would you use a repeat loop, rather than a while loop?",
                Answer = "It runs the code block once, before checking the condition",
                False1 = "You can't create an infinite loop",
                False2 = "Repeat loops aren't useful",
                False3 = "While loops don't run the code block multiple times"
            },
            {
                Question = "How do you exit a loop before finishing it?",
                Answer = "break",
                False1 = "continue",
                False2 = "exit",
                False3 = "quit"
            },
            {
                Question = "How do you skip the remaining code block and go to the next iteration?",
                Answer = "continue",
                False1 = "break",
                False2 = "skip",
                False3 = "cancel"
            }
        }
    }
}

return module