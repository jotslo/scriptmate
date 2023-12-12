local module = {}

module.Metadata = {
    Title = "Episode 1",
    Subtitle = "Introduction",
    BackgroundImage = "http://www.roblox.com/asset/?id=10204192311",
    GridPlacement = "001",
    Template = [[--> Watch the video tutorial before completing this challenge
--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156
--> Recommended scripting chat server @ roblox.com/groups/3232454

]]
}

module.Content = {
    {
        Type = "Exercise",
        Title = "String Declaration",
        Description = [[In the script editor, declare a variable named <font color="rgb(85,170,255)">myName</font> and assign it to your first name.

Afterwards, run your code with the <b>Test Code</b> button below.

If you're unsure, press the <b>Reveal Hint</b> button.

Make sure you have opened the <b>Output</b> window, so you can see errors.]],
        Hint = "You can write text with a string, which is wrapped in \"quotation marks\".",
        Validator = "return typeof(myName) == 'string'",
        ScriptValidator = "return true"
    },
    {
        Type = "Exercise",
        Title = "Number Declaration",
        Description = "Declare a variable named <font color=\"rgb(85,170,255)\">myNumber</font> and assign it to a number.\n\nThe number must use a <b>decimal</b>, meaning it cannot be a whole number.",
        Hint = "Numbers are <b>not</b> wrapped in quotation marks, as they are <b>not</b> strings.",
        Validator = "return typeof(myNumber) == 'number' and myNumber % 1 ~= 0",
        ScriptValidator = "return true"
    },
    {
        Type = "Exercise",
        Title = "Boolean Declaration",
        Description = "Declare a variable named <font color=\"rgb(85,170,255)\">myBoolean</font> and assign it to any Boolean value.",
        Hint = "Booleans are either <b>true</b> or <b>false</b>, and must not be wrapped in quotation marks.",
        Validator = "return typeof(myBoolean) == 'boolean'",
        ScriptValidator = "return true"
    },
    {
        Type = "Exercise",
        Title = "Outputting Variables",
        Description = "Declare a variable with any name and assign it to a <b>string</b>.\n\nThen, use the <font color=\"rgb(85,170,255)\">print</font> function to output the variable's value.",
        Hint = "After assigning your variable, you can call the <b>print</b> function by typing <b>print</b>, followed by round brackets containing the variable's name.",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() log = log[#log].message for var, value in getfenv() do if typeof(value) == 'string' and typeof(log) == 'string' then if log:find(value) then return true end end end return false",
        ScriptValidator = "local c = (userCode:gsub('%s', '')) return c:find('=') ~= nil and c:find('print%(') ~= nil and c:find('print%(\"') == nil and c:find(\"print%('\") == nil and c:find('print%[%[') == nil"
    },
    {
        Type = "Exercise",
        Title = "Basic Addition",
        Description = "It's Josh's birthday tomorrow! 🥳\n\nDeclare a variable named <font color=\"rgb(85,170,255)\">joshAge</font> and assign it to <b>19</b>.\n\nNext, use the <font color=\"rgb(85,170,255)\">print</font> function to output his <b>age tomorrow</b>.",
        Hint = "Josh will be 20 years old tomorrow. You can use the addition operator to add two numbers together.",
        Validator = "if typeof(joshAge) ~= 'number' then return false end wait() local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:find('20') then return true end return false",
        ScriptValidator = "return userCode:find('19') ~= nil and userCode:find('+') ~= nil"
    },
    {
        Type = "Exercise",
        Title = "Order of Operations",
        Description = "Come up with any expression, as complex as you would like, that outputs <b>100</b>.\n\n<b>Examples:</b>\n<font face=\"Code\">print(10 ^ 2)\nprint(9 * 9 + 9 * 2 + 1)\nprint((30 - 5) * 2 + 50)</font>\n\nBonus points if you use <b>variables</b>, <b>order of operations</b> and <b>brackets</b>!",
        Hint = "You can complete this challenge however you like, it is simply designed to let you experiment. Even <font face=\"Code\">print(100)</font> will work!",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:find('100') then return true end return false",
        ScriptValidator = "return true"
    },
    {
        Type =  "Quiz",
        Questions = {
            {
                Question = "Which of these is <b>not</b> a valid data type in Luau?",
                Answer = "Text",
                False1 = "String",
                False2 = "Number",
                False3 = "Boolean"
            },
            {
                Question = "Which of these variable names is written in camel case?",
                Answer = "variableName",
                False1 = "VariableName",
                False2 = "variable_name",
                False3 = "VARIABLE_NAME"
            },
            {
                Question = "Which operator concatenates two strings?",
                Answer = "..",
                False1 = "&",
                False2 = "+",
                False3 = "-"
            },
            {
                Question = "What happens if you declare a variable <i>after</i> outputting it?",
                Answer = "The output window shows 'nil'",
                False1 = "The script crashes",
                False2 = "The output window shows the variable's value",
                False3 = "The output window shows 'undefined'"
            },
            {
                Question = "Which of these scripts will cause an error?",
                Answer = "<font face=\"Code\">1var = true</font>",
                False1 = "<font face=\"Code\">var3 = [[false]]</font>",
                False2 = "<font face=\"Code\">MY_VAR = 'yes'</font>",
                False3 = "<font face=\"Code\">v4r = 9.6</font>"
            }
        }
    }
}

return module