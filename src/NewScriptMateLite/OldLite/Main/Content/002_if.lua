local module = {}

module.Metadata = {
    Title = "Episode 2",
    Subtitle = "If Statements",
    BackgroundImage = "http://www.roblox.com/asset/?id=10204193205",
    GridPlacement = "002",
    Template = "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n",
}

module.Content = {
    {
        Type = "Exercise",
        Title = "Basic Comparison",
        Description = "Declare a variable named <font color=\"rgb(85,170,255)\">myBoolean</font> and assign it to a Boolean, by comparing two values.\n\nFinally, output the variable.\n\nYour script must not contain keywords <b>true</b> or <b>false</b>.",
        Hint = "You can compare two values with the equality operator (<b>==</b>), or any other operators mentioned in the tutorial. These comparions return a Boolean value, which can be assigned to a variable.",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:find('true') or log[#log].message:find('false') then return typeof(myBoolean) == 'boolean' end return false",
        ScriptValidator = "return userCode:find('true') == nil and userCode:find('false') == nil"
    },
    {
        Type = "Exercise",
        Title = "If Statement",
        Description = "Create an if statement that checks if 10 is <b>greater than or equal to</b> 5.\n\nIf it is, output the string <b>'Success'</b>",
        Hint = "The greater than or equal to operator (<b>&gt;=</b>) is used to check if one value is greater than or equal to another.",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:lower():find('success') then return true end return false",
        ScriptValidator = "return userCode:find('>=') ~= nil and userCode:find('10') ~= nil and userCode:find('5') ~= nil"
    },
    {
        Type = "Exercise",
        Title = "Else Block",
        Description = "Create an if statement that checks if 8 is <b>less than</b> 3.\n\nIf it is, output the string <b>'Success'</b>\n\nOtherwise, output the string <b>'Failure'</b>",
        Hint = "You should use an else block, which is an extension to the if statement. The else block runs when no conditions in the if statement are met.",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:lower():find('failure') then return true end return false",
        ScriptValidator = "return userCode:find('<') ~= nil and userCode:find('8') ~= nil and userCode:find('3') ~= nil and userCode:find('else') ~= nil"
    },
    {
        Type = "Exercise",
        Title = "Elseif Block",
        Description = "Create an if statement with <b>at least</b> one <b>elseif</b> block, and one <b>else</b> block.\n\nFeel free to try this challenge multiple times, to try out different formats.\n\nRemember blocks underneath the first block with a truthy condition will be ignored.",
        Hint = "If any blocks within an if statement are truthy, the computer runs the code within its block and ignores the remaining blocks. Feel free to rewatch the tutorial if unsure.",
        Validator = "return true",
        ScriptValidator = "return userCode:find('if') ~= nil and userCode:find('else%s') ~= nil and userCode:find('elseif') ~= nil"
    },
    {
        Type = "Exercise", ----------REWRITE
        Title = "Local Variables",
        Description = "Create an if statement that executes, and declare a <b>local</b> variable named <font color=\"rgb(85,170,255)\">myVar</font> inside of its scope.\n\nThe variable must be assigned to the number <b>13</b>.\n\nIn the if statement's scope, output the variable's value.",
        Hint = "Local variables can only be accessed inside of a scope. If you declare a variable inside the if statement, it can be accessed anywhere inside of the if statement.",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() if myVar then return false end if log[#log].message:lower():find('13') then return true end return false",
        ScriptValidator = "return userCode:find('myVar') ~= nil and not userCode:find('print%(\\'') and not userCode:find('print%(\"')"
    },
    {
        Type = "Quiz",
        Questions = {
            {
                Question = "Which of these represents <b>less than or equal to</b>?",
                Answer = "&lt;=",
                False1 = "&lt;",
                False2 = "&gt;=",
                False3 = "&gt;"
            },
            {
                Question = "What does the local keyword do?",
                Answer = "Makes a variable local to a specific scope",
                False1 = "Makes a variable accessible from a LocalScript",
                False2 = "Stops a variable from being accessed in other scripts",
                False3 = "Nothing, it is entirely optional"
            },
            {
                Question = "What does this condition return?\n<font face=\"Code\">(3 == 3 or 4 &lt; 3) and true</font>",
                Answer = "true",
                False1 = "false",
                False2 = "nil",
                False3 = "The script errors"
            },
            {
                Question = "When does the code within an else block run?",
                Answer = "When all other blocks in the if statement are falsy",
                False1 = "After running the first code block in the if statement",
                False2 = "Never",
                False3 = "After running the code within an elseif block"
            },
            {
                Question = "Why do we use tabs/spaces to indent code?",
                Answer = "It makes the code easier to read",
                False1 = "Scopes must be indented",
                False2 = "Indentation makes the script run faster",
                False3 = "I don't know"
            }
        }
    }
}

return module