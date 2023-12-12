local module = {}

module.Metadata = {
    Title = "Episode 5",
    Subtitle = "Functions",
    BackgroundImage = "http://www.roblox.com/asset/?id=10204198168",
    GridPlacement = "005",
    Template = "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n"
}

module.Content = {
    {
        Type = "Exercise",
        Title = "Basic Function",
        Description = "Declare a function named <font color=\"rgb(85,170,255)\">myFunction</font>, that outputs the number <b>15</b> when called.\n\nAfterwards, call the function.",
        Hint = "You don't need to pass any arguments to the function, simply have it output the number 15.",
        Validator = "if not typeof(myFunction) == 'function' then return false end wait() local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:lower():find('15') then return true end return false",
        ScriptValidator = "return true",
        Solution = [[-- declare a function named myFunction
-- when called, output number 15
function myFunction()
    print(15)
end

-- call the function
myFunction()]]
    },
    {
        Type = "Exercise",
        Title = "Returning Values",
        Description = "Declare a function named <font color=\"rgb(85,170,255)\">getName</font>, that <b>returns</b> the name 'Josh' when called.\n\nYou do <b>not</b> need to call the function.",
        Hint = "Use the 'return' keyword to return any string value.",
        Validator = "return typeof(getName) == 'function' and typeof(getName()) == 'string'",
        ScriptValidator = "return true",
        Solution = [[-- declare getName function that returns your name
-- my name is "Josh", so i will return that

function getName()
    return "Josh"
end]]
    },
    {
        Type = "Exercise",
        Title = "Arguments",
        Description = "Declare a function named <font color=\"rgb(85,170,255)\">multiply</font>, that takes <b>two numbers</b> as arguments.\n\nYou can name your parameters anything you think is suitable.\n\nYour function must then <b>multiply</b> the two value, and <b>return</b> the result.\n\nFeel free to call the function with any two numbers to test it.",
        Hint = "You can create two parameters between the brackets which are your variables, and then use the '*' operator to multiply them.",
        Validator = "return typeof(multiply) == 'function' and multiply(5, 6) == 30",
        ScriptValidator = "return true",
        Solution = [[-- declare multiply function that takes two numbers
-- we then multiply the values and return

function multiply(num1, num2)
    return num1 * num2
end

multiply(6, 3)]]
    },
    {
        Type = "Exercise",
        Title = "Basic Logic",
        Description = "Declare a function named <font color=\"rgb(85,170,255)\">isLarge</font>, that takes <b>one number</b> as an argument.\n\nYou can name your parameter anything you think is suitable.\n\nYour function must return <b>true</b> if the number is greater than OR equal to <b>100</b>, and <b>false</b> if it is less than 100.\n\nYou do <b>not</b> need to call the function.",
        Hint = "You can either use an if statement, or use a condition to determine if the number is greater than or equal to 100. Refer to episode 2 for more information.",
        Validator = "return typeof(isLarge) == 'function' and isLarge(100) == true and isLarge(99) == false and isLarge(3434) == true and isLarge(-1) == false",
        ScriptValidator = "return true",
        Solution = [[-- function named isLarge that takes one number as argument
-- if >= 100, return true
-- otherwise, return false

function isLarge(number)
    -- number >= 100 returns true or false itself
    -- so we can just return the result of that expression
    return number >= 100
end]]
    },
    {
        Type = "Exercise",
        Title = "Multple Returned Values",
        Description = "Declare a function named <font color=\"rgb(85,170,255)\">getNumbers</font>, that returns the numbers <b>10</b> and <b>20</b>\n\nYou must return the values separately, meaning you must not return a table.\n\nYou shouldn't create any parameters for your function.\n\nAfterwards, declare two variables, <font color=\"rgb(85,170,255)\">num1</font> and <font color=\"rgb(85,170,255)\">num2</font>, call the function, and assign them the values returned by the function.",
        Hint = "You can return multiple pieces of data by separating the values with a comma. When calling the function, you can assign the returned values to variables, separated by a comma.",
        Validator = "if typeof(getNumbers) ~= 'function' then return false end a, b = getNumbers() return typeof(num1) == 'number' and typeof(num2) == 'number' and num1 == 10 and num2 == 20 and a == 10 and b == 20",
        ScriptValidator = "return true",
        Solution = [[-- declare getNumbers to return nums 10 and 20
-- return values separately
-- we then assign these to num1 and num2 vars

local function getNumbers()
    return 10, 20
end

local num1, num2 = getNumbers()]]
    },
    {
        Type = "Exercise",
        Title = "Libraries",
        Description = "Declare a table named <font color=\"rgb(85,170,255)\">myLib</font>, that contains a function named <font color=\"rgb(85,170,255)\">add</font>.\n\nThe function should take two numbers as arguments, add them together and return the result.\n\nFinally, call the function passing values <b>6</b> and <b>7</b> as arguments, and then output the result.",
        Hint = "You can add a function as a value to a table just like any other data type. You can then call the function by using the table name and the function name, separated by a period. The expected output is <b>13</b>.",
        Validator = "wait() if not (typeof(myLib) == 'table' and typeof(myLib.add) == 'function') then return false end local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:lower():find('13') and myLib.add(1,2) == 3 then return true end return false",
        ScriptValidator = "return true",
        Solution = [[-- declare myLib table containing add function
local myLib = {
    add = function(x, y)
        return x + y
    end
}

-- call function, assign to var and then output
local result = myLib.add(6, 7)
print(result)]]
    },
    {
        Type = "Quiz",
        Questions = {
            {
                Question = "Which of these happens when you use the 'return' keyword?",
                Answer = "The function stops, similar to the break keyword",
                False1 = "The function outputs a value",
                False2 = "The function runs again, like a loop",
                False3 = "The script crashes"
            },
            {
                Question = "Why are functions generally declared like this?\n<font face=\"Code\">function myFunc()</font>",
                Answer = "It is considered more readable",
                False1 = "It is faster",
                False2 = "It is more secure",
                False3 = "Functions can only be declared like this"
            },
            {
                Question = "What is returned by a function if you don't return anything?",
                Answer = "nil",
                False1 = "false",
                False2 = "true",
                False3 = "0"
            },
            {
                Question = "What happens if you try to call the same function twice?",
                Answer = "The function will run twice",
                False1 = "It will ignore the second call",
                False2 = "The script will error",
                False3 = "Roblox Studio will hang"
            },
            {
                Question = "How would you call this??\n<font face=\"Code\">f = {function() print('Hello!') end}</font>",
                Answer = "f[1]()",
                False1 = "f.function()",
                False2 = "f.print()",
                False3 = "f()"
            }
        }
    }
}

return module