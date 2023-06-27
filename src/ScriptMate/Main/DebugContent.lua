return [[ {
    "Categories": [
        {
            "Title": "Episode 0",
            "Subtitle": "Get Started",
            "BackgroundImage": "http://www.roblox.com/asset/?id=13727003716",
            "GridPlacement": "000",
            "Template": "--[[\n\nRECOMMENDED: Watch the video tutorial series here:\nhttps://devforum.roblox.com/t/video/1972156\n\nNeed more help? Join this scripting chat server:\nhttps://roblox.com/groups/3232454\n\n]]",
            "Content": [
                {
                    "Type": "Exercise",
                    "Title": "Welcome!",
                    "Description": "It is <b>highly recommended</b> to watch the short tutorial videos before each episode.\n\n<b>Copy the link</b> in the script editor to get started.\n\nIf you have any feedback, be sure to tweet <font color=\"#1DA1F2\">@jotslo</font>.\n\nGood luck on your scripting journey!",
                    "Hint": "Press 'Test Code' to continue.",
                    "Validator": "return true",
                    "ScriptValidator": "return true"
                }
            ]
        },
        {
            "Title": "Episode 1",
            "Subtitle": "Introduction",
            "BackgroundImage": "http://www.roblox.com/asset/?id=10204192311",
            "GridPlacement": "001",
            "Template": "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n",
            "Content": [
                {
                    "Type": "Exercise",
                    "Title": "String Declaration",
                    "Description": "In the script editor, declare a variable named <font color=\"rgb(85,170,255)\">myName</font> and assign it to your own name.\n\nAfterwards, run your code with the <b>Test Code</b> button below.\n\nIf you're unsure, press the <b>Reveal Hint</b> button.\n\nMake sure you have opened the <b>Output</b> window, so you can see errors.",
                    "Hint": "You can write text with a string, which is wrapped in \"quotation marks\".",
                    "Validator": "return typeof(myName) == 'string'",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Exercise",
                    "Title": "Number Declaration",
                    "Description": "Declare a variable named <font color=\"rgb(85,170,255)\">myNumber</font> and assign it to a number.\n\nThe number must use a <b>decimal</b>, meaning it cannot be a whole number.",
                    "Hint": "Numbers are <b>not</b> wrapped in quotation marks, as they are <b>not</b> strings.",
                    "Validator": "return typeof(myNumber) == 'number' and myNumber % 1 ~= 0",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Exercise",
                    "Title": "Boolean Declaration",
                    "Description": "Declare a variable named <font color=\"rgb(85,170,255)\">myBoolean</font> and assign it to any Boolean value.",
                    "Hint": "Booleans are either <b>true</b> or <b>false</b>, and must not be wrapped in quotation marks.",
                    "Validator": "return typeof(myBoolean) == 'boolean'",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Exercise",
                    "Title": "Outputting Variables",
                    "Description": "Declare a variable with any name and assign it to a <b>string</b>.\n\nThen, use the <font color=\"rgb(85,170,255)\">print</font> function to output the variable's value.",
                    "Hint": "After assigning your variable, you can call the <b>print</b> function by typing <b>print</b>, followed by round brackets containing the variable's name.",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() log = log[#log].message for var, value in getfenv() do if typeof(value) == 'string' and typeof(log) == 'string' then if log:find(value) then return true end end end return false",
                    "ScriptValidator": "local c = (userCode:gsub('%s', '')) return c:find('=') ~= nil and c:find('print%(') ~= nil and c:find('print%(\"') == nil and c:find(\"print%('\") == nil and c:find('print%[%[') == nil"
                },
                {
                    "Type": "Exercise",
                    "Title": "Basic Addition",
                    "Description": "It's Josh's birthday tomorrow! 🥳\n\nDeclare a variable named <font color=\"rgb(85,170,255)\">joshAge</font> and assign it to <b>19</b>.\n\nNext, use the <font color=\"rgb(85,170,255)\">print</font> function to output his <b>age tomorrow</b>.",
                    "Hint": "Josh will be 20 years old tomorrow. You can use the addition operator to add two numbers together.",
                    "Validator": "if typeof(joshAge) ~= 'number' then return false end wait() local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:find('20') then return true end return false",
                    "ScriptValidator": "return userCode:find('19') ~= nil and userCode:find('+') ~= nil"
                },
                {
                    "Type": "Exercise",
                    "Title": "Order of Operations",
                    "Description": "Come up with any expression, as complex as you would like, that outputs <b>100</b>.\n\n<b>Examples:</b>\n<font face=\"Code\">print(10 ^ 2)\nprint(9 * 9 + 9 * 2 + 1)\nprint((30 - 5) * 2 + 50)</font>\n\nBonus points if you use <b>variables</b>, <b>order of operations</b> and <b>brackets</b>!",
                    "Hint": "You can complete this challenge however you like, it is simply designed to let you experiment. Even <font face=\"Code\">print(100)</font> will work!",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:find('100') then return true end return false",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Quiz",
                    "Questions": [
                        {
                            "Question": "Which of these is <b>not</b> a valid data type in Luau?",
                            "Answer": "Text",
                            "False1": "String",
                            "False2": "Number",
                            "False3": "Boolean"
                        },
                        {
                            "Question": "Which of these variable names is written in camel case?",
                            "Answer": "variableName",
                            "False1": "VariableName",
                            "False2": "variable_name",
                            "False3": "VARIABLE_NAME"
                        },
                        {
                            "Question": "Which operator concatenates two strings?",
                            "Answer": "..",
                            "False1": "&",
                            "False2": "+",
                            "False3": "-"
                        },
                        {
                            "Question": "What happens if you declare a variable <i>after</i> outputting it?",
                            "Answer": "The output window shows 'nil'",
                            "False1": "The script crashes",
                            "False2": "The output window shows the variable's value",
                            "False3": "The output window shows 'undefined'"
                        }
                    ]
                }
            ]
        },
        {
            "Title": "Episode 2",
            "Subtitle": "If Statements",
            "BackgroundImage": "http://www.roblox.com/asset/?id=10204193205",
            "GridPlacement": "002",
            "Template": "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n",
            "Content": [
                {
                    "Type": "Exercise",
                    "Title": "Basic Comparison",
                    "Description": "Declare a variable named <font color=\"rgb(85,170,255)\">myBoolean</font>, and assign to any Boolean value by comparing two values.\n\nFinally, output the contents of the variable.\n\nYour script must not contain keywords <b>true</b> or <b>false</b>.",
                    "Hint": "You can compare two values with the equality operator (<b>==</b>), or any other operators mentioned in the tutorial.",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:find('true') or log[#log].message:find('false') then return typeof(myBoolean) == 'boolean' end return false",
                    "ScriptValidator": "return userCode:find('true') == nil and userCode:find('false') == nil"
                },
                {
                    "Type": "Exercise",
                    "Title": "If Statement",
                    "Description": "Create an if statement that checks if 10 is <b>greater than or equal to</b> 5.\n\nIf it is, output the string <b>'Success'</b>",
                    "Hint": "The greater than or equal to operator (<b>&gt;=</b>) is used to check if one value is greater than or equal to another.",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:lower():find('success') then return true end return false",
                    "ScriptValidator": "return userCode:find('>=') ~= nil and userCode:find('10') ~= nil and userCode:find('5') ~= nil"
                },
                {
                    "Type": "Exercise",
                    "Title": "Else Block",
                    "Description": "Create an if statement that checks if 8 is <b>less than</b> 3.\n\nIf it is, output the string <b>'Success'</b>\n\nOtherwise, output the string <b>'Failure'</b>",
                    "Hint": "You should use an else block, which is an extension to the if statement. The else block runs when no conditions in the if statement are met.",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:lower():find('failure') then return true end return false",
                    "ScriptValidator": "return userCode:find('<') ~= nil and userCode:find('8') ~= nil and userCode:find('3') ~= nil and userCode:find('else') ~= nil"
                },
                {
                    "Type": "Exercise",
                    "Title": "Elseif Block",
                    "Description": "Create an if statement with <b>at least</b> one <b>elseif</b> block, and one <b>else</b> block.\n\nFeel free to try this challenge multiple times, to try out different formats.\n\nRemember blocks underneath the first block with a truthy condition will be ignored.",
                    "Hint": "If any blocks within an if statement are truthy, the computer runs the code within its block and ignores the remaining blocks. Feel free to rewatch the tutorial if unsure.",
                    "Validator": "return true",
                    "ScriptValidator": "return userCode:find('if') ~= nil and userCode:find('else%s') ~= nil and userCode:find('elseif') ~= nil"
                },
                {
                    "Type": "Exercise",
                    "Title": "Local Variables",
                    "Description": "Create an if statement that executes, and declare a <b>local</b> variable named <font color=\"rgb(85,170,255)\">myVar</font> inside of its scope.\n\nThe variable should be assigned to the number <b>13</b>\n\nIn the if statement's scope, output the variable's value.\n\nOutside the if statement's scope after running, output the variable's value again, where it should not have a value.",
                    "Hint": "Local variables can only be accessed inside of a scope. If you declare a variable inside the if statement, it will not have a value outside of it, and so should output nil.",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() if myVar then return false end if log[#log-1].message:lower():find('13') and log[#log].message:lower():find('nil') then return true end return false",
                    "ScriptValidator": "return userCode:find('myVar') ~= nil and not userCode:find('print(\\'') and not userCode:find('print(\"')"
                },
                {
                    "Type": "Quiz",
                    "Questions": [
                        {
                            "Question": "Which of these represents <b>less than or equal to</b>?",
                            "Answer": "&lt;=",
                            "False1": "&lt;",
                            "False2": "&gt;=",
                            "False3": "&gt;"
                        },
                        {
                            "Question": "What does the local keyword do?",
                            "Answer": "Makes a variable local to a specific scope",
                            "False1": "Makes a variable accessible from a LocalScript",
                            "False2": "Stops a variable from being accessed in other scripts",
                            "False3": "Nothing, it is entirely optional"
                        },
                        {
                            "Question": "What does this condition return?\n<font face=\"Code\">(3 == 3 or 4 &lt; 3) and true</font>",
                            "Answer": "true",
                            "False1": "false",
                            "False2": "nil",
                            "False3": "The script errors"
                        },
                        {
                            "Question": "When does the code within an else block run?",
                            "Answer": "When all other blocks in the if statement are falsy",
                            "False1": "After running the first code block in the if statement",
                            "False2": "Never",
                            "False3": "After running the code within an elseif block"
                        },
                        {
                            "Question": "Why do we use tabs/spaces to indent code?",
                            "Answer": "It makes the code easier to read",
                            "False1": "Scopes must be indented",
                            "False2": "Indentation makes the script run faster",
                            "False3": "I don't know"
                        }
                    ]
                }
            ]
        },
        {
            "Title": "Episode 3",
            "Subtitle": "Loops",
            "BackgroundImage": "http://www.roblox.com/asset/?id=10204193903",
            "GridPlacement": "003",
            "Template": "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n",
            "Content": [
                {
                    "Type": "Exercise",
                    "Title": "For Loop #1",
                    "Description": "Using a <b>for loop</b>, write a script that outputs each value from <b>1</b> to <b>100</b>.\n\nYou may only use the <font color=\"rgb(85,170,255)\">print</font> keyword once in your script.",
                    "Hint": "You can create a for loop ranging from 1 to 100. On each loop, the variable is incremented by the step value, which defaults to 1.",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() for i = 0, 99 do if not log[#log-i].message:find(100 - i) then return false end end return true",
                    "ScriptValidator": "local _, count = userCode:gsub('print', '') return userCode:find('for') ~= nil and count == 1"
                },
                {
                    "Type": "Exercise",
                    "Title": "For Loop #2",
                    "Description": "Using a <b>for loop</b>, write a script that outputs each value from <b>20</b> to <b>-20</b>, with a step of <b>-2</b>.\n\nYou may only use the <font color=\"rgb(85,170,255)\">print</font> keyword once in your script.",
                    "Hint": "You can create a for loop ranging from 20 to -20, with a third value representing the step of -2. On each loop, the variable is incremented by the step value, so the output should look like 20, 18, 16 ... -16, -18, -20",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() for i = 0, 20 do if not log[#log-i].message:find(-20 + i * 2) then return false end end return true",
                    "ScriptValidator": "local _, count = userCode:gsub('print', '') return userCode:find('for') ~= nil and count == 1"
                },
                {
                    "Type": "Exercise",
                    "Title": "While Loop",
                    "Description": "Using a <b>variable</b> and a <b>while loop</b>, write a script that outputs each value from <b>1</b> to <b>100</b>.\n\nYou may only use the <font color=\"rgb(85,170,255)\">print</font> keyword once in your script.\n\n<font color=\"rgb(238,75,43)\">Warning: Make sure your while loop doesn't run for an infinite amount of time, or Roblox Studio will hang.</font>",
                    "Hint": "An example of this challenge is given in the tutorial, incrementing a variable from 1 to 5. You should increment your variable until it reaches 100.",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() for i = 0, 99 do if not log[#log-i].message:find(100 - i) then return false end end return true",
                    "ScriptValidator": "local _, count = userCode:gsub('print', '') return userCode:find('while') ~= nil and count == 1"
                },
                {
                    "Type": "Exercise",
                    "Title": "Repeat Loop",
                    "Description": "Using a <b>variable</b> and a <b>repeat loop</b>, write a script that outputs each value from <b>0</b> to <b>50</b>.\n\nYou may only use the <font color=\"rgb(85,170,255)\">print</font> keyword once in your script.\n\n<font color=\"rgb(238,75,43)\">Warning: Make sure your repeat loop doesn't run for an infinite amount of time, or Roblox Studio will hang.</font>",
                    "Hint": "An example of this challenge is given in the tutorial, incrementing a variable from 1 to 5. You should assign your variable to 0, and increment it until it reaches 50.",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() for i = 0, 50 do if not log[#log-i].message:find(50 - i) then return false end end return true",
                    "ScriptValidator": "local _, count = userCode:gsub('print', '') return userCode:find('repeat') ~= nil and count == 1"
                },
                {
                    "Type": "Exercise",
                    "Title": "Continue Keyword",
                    "Description": "Using any loop, output each value from <b>1</b> to <b>10</b>, but skip the number <b>5</b>.\n\nYou may only use the <font color=\"rgb(85,170,255)\">print</font> keyword once in your script.\n\nYou <b>must</b> use the <font color=\"rgb(238,75,43)\">continue</font> keyword in your loop.",
                    "Hint": "You should use an if statement that checks the current value, and the continue keyword, which allows you to skip the current iteration of the loop. You can use the continue keyword inside any loop.",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() for i = 0, 4 do if not log[#log-i].message:find(10 - i) then return false end end for i = 6, 9 do if not log[#log-(i-1)].message:find(10 - i) then return false end end return true",
                    "ScriptValidator": "local _, count = userCode:gsub('print', '') return userCode:find('continue') ~= nil and count == 1"
                },
                {
                    "Type": "Exercise",
                    "Title": "Break Keyword",
                    "Description": "Write a <b>for loop</b> that outputs each value from <b>1</b> to <b>10</b>, but stop the for loop after the script has outputted <b>5</b>.\n\nYou may only use the <font color=\"rgb(85,170,255)\">print</font> keyword once in your script.",
                    "Hint": "You should use an if statement that checks the current value, and the break keyword, which allows you to break the loop and skip to the code underneath the block. You can use the break keyword inside any loop.",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() for i = 0, 4 do if not log[#log-i].message:find(5 - i) then return false end end return true",
                    "ScriptValidator": "local _, count = userCode:gsub('print', '') return userCode:find('break') ~= nil and userCode:find('10') ~= nil and count == 1"
                },
                {
                    "Type": "Exercise",
                    "Title": "Do Block",
                    "Description": "Declare a <b>local</b> variable named <font color=\"rgb(85,170,255)\">myNum</font> inside a <b>do block</b>.\n\nThe variable should be assigned to the number <b>26</b>\n\nIn the do block's scope, output the variable's value.\n\nOutside the do blocks scope after running, output the variable's value again, where it should not have a value.",
                    "Hint": "Local variables can only be accessed inside of a scope. If you declare a variable inside the do block, it will not have a value outside of it, and so should output nil.",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() if myNum then return false end if log[#log-1].message:lower():find('26') and log[#log].message:lower():find('nil') then return true end return false",
                    "ScriptValidator": "return userCode:find('myNum') ~= nil and not userCode:find('print(\\'') and not userCode:find('print(\"')"
                },
                {
                    "Type": "Quiz",
                    "Questions": [
                        {
                            "Question": "What does this script do?\n<font face=\"Code\">while 2 > 1 do print('hello!') end</font>",
                            "Answer": "Create an infinite loop, causing Roblox to hang",
                            "False1": "Outputs 'hello!' each frame",
                            "False2": "Causes an error",
                            "False3": "Outputs 'hello!' once, and then stops"
                        },
                        {
                            "Question": "Why is a do block useful?",
                            "Answer": "It creates a new scope for local variables",
                            "False1": "It runs code in a loop",
                            "False2": "It allows you to access variables in other scripts",
                            "False3": "They aren't useful"
                        },
                        {
                            "Question": "What does the third value given to the for loop represent?",
                            "Answer": "The step value",
                            "False1": "The target value",
                            "False2": "The starting value",
                            "False3": "There are only two values"
                        },
                        {
                            "Question": "Why would you use a repeat loop over a while loop?",
                            "Answer": "It runs the code block once, before checking the condition",
                            "False1": "You can't create an infinite loop",
                            "False2": "Repeat loops aren't useful",
                            "False3": "While loops don't run the code block multiple times"
                        },
                        {
                            "Question": "How do you exit a loop before finishing it?",
                            "Answer": "break",
                            "False1": "continue",
                            "False2": "exit",
                            "False3": "quit"
                        },
                        {
                            "Question": "How do you skip the remaining code block and go to the next iteration?",
                            "Answer": "continue",
                            "False1": "break",
                            "False2": "skip",
                            "False3": "cancel"
                        }
                    ]
                }
            ]
        },
        {
            "Title": "Episode 4",
            "Subtitle": "Tables",
            "BackgroundImage": "http://www.roblox.com/asset/?id=10204197516",
            "GridPlacement": "004",
            "Template": "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n",
            "Content": [
                {
                    "Type": "Exercise",
                    "Title": "Empty Table",
                    "Description": "Declare a variable named <font color=\"rgb(85,170,255)\">myTable</font> and assign it to an <b>empty table</b>.",
                    "Hint": "Tables are created with curly brackets.",
                    "Validator": "return typeof(myTable) == 'table' and next(myTable) == nil",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Exercise",
                    "Title": "List-style Table",
                    "Description": "Declare a variable named <font color=\"rgb(85,170,255)\">myTable</font> and assign it to a <b>table</b>.\n\nThe table should be formatted as a list, meaning you must <b>not</b> specify the indexes.\n\nInsert the following values to the table, in this order: <b>'s'</b>, <b>7</b>, <b>true</b>, <b>false</b>",
                    "Hint": "Tables can be created in a list-style format, where the indexes are not specified. This is done within the curly brackets.",
                    "Validator": "return typeof(myTable) == 'table' and myTable[1] == 's' and myTable[2] == 7 and myTable[3] == true and myTable[4] == false",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Exercise",
                    "Title": "List-style Table #2",
                    "Description": "Declare a variable named <font color=\"rgb(85,170,255)\">myTable</font> and assign it to a <b>table</b>.\n\nThe table should be formatted as a list, meaning you must <b>not</b> specify the indexes.\n\nInsert any values into the table.\n\nAfterwards, output the <b>length</b> of the table.",
                    "Hint": "The # operator can determine the length of a table.",
                    "Validator": "wait() if not typeof(myTable) == 'table' then return false end local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:lower():find(#myTable) then return true end return false",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Exercise",
                    "Title": "Dictionary-style Table",
                    "Description": "Declare a variable named <font color=\"rgb(85,170,255)\">ages</font> and assign it to a <b>table</b>.\n\nThe table must store the ages of the following people: <b>'John'</b> is <b>27</b>, <b>'Jane'</b> is <b>25</b>, <b>'Bob'</b> is <b>32</b>.\n\nThe names (strings) must be used as the indexes, and the ages (numbers) as the values.\n\nAfter declaring the table, output the age of <b>'John'</b>, by referring to the table.",
                    "Hint": "The table should be formatted like: {['Adam'] = 25, ...}. Afterwards, you must refer to the table and use the index to retrieve the value.",
                    "Validator": "wait() if not typeof(ages) == 'table' then return false end local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:lower():find('27') and ages['John'] == 27 and ages['Jane'] == 25 and ages['Bob'] == 32 then return true end return false",
                    "ScriptValidator": "return not userCode:find('print(\\'') and not userCode:find('print(\"') and not userCode:find('print(27')"
                },
                {
                    "Type": "Exercise",
                    "Title": "Generic For Loop",
                    "Description": "Declare a variable named <font color=\"rgb(85,170,255)\">myTable</font> and assign it to a <b>table</b>.\n\nThe table should be formatted as a list, meaning you must <b>not</b> specify the indexes.\n\nInsert any values into the table. The table must contain <b>at least 2</b> values.\n\nAfterwards, use a <b>for loop</b> to output each value in the table in order.\n\nYou may only use the <font color=\"rgb(85,170,255)\">print</font> keyword once in your script.",
                    "Hint": "You should use the generic for loop, which is mentioned in the video. For each value, simply output the variable referring to the value.",
                    "Validator": "wait() if (not typeof(myTable) == 'table') or #myTable < 2 then return false end local log = game:GetService('LogService'):GetLogHistory() for i = 0, #myTable - 1 do if not log[#log-i].message:find(myTable[#myTable-i]) then return false end end return true",
                    "ScriptValidator": "local _, count = userCode:gsub('print', '') return count == 1 and not userCode:find('print(\\'') and not userCode:find('print(\"')"
                },
                {
                    "Type": "Exercise",
                    "Title": "Generic For Loop #2",
                    "Description": "Declare a variable named <font color=\"rgb(85,170,255)\">myTable</font> and assign it to a <b>table</b>.\n\nThe table should be formatted as a dictionary, meaning you <b>must</b> specify the indexes.\n\nInsert any indexes and values into the table. The table must contain <b>at least 2</b> sets of indexes & values.\n\nAfterwards, use a <b>for loop</b> to get each index <b>and</b> value in the table.\n\nOn each loop, concatenate the index and value into a string, and output the string.\n\nYou may only use the <font color=\"rgb(85,170,255)\">print</font> keyword once in your script.",
                    "Hint": "You should use the generic for loop. For each value, concatenate both the index and the value using the '..' operator, and output the string.",
                    "Validator": "wait() if (not typeof(myTable) == 'table') then return false end local log = game:GetService('LogService'):GetLogHistory() local len = 0 for i, v in myTable do len += 1 end local function find(msg) for i, v in myTable do if msg:find(tostring(i)) and msg:find(tostring(v)) then return true end end return false end for i = 0, len - 1 do if not find(log[#log-i].message) then return false end end return true",
                    "ScriptValidator": "local _, count = userCode:gsub('print', '') return count == 1 and not userCode:find('print(\\'') and not userCode:find('print(\"')"
                },
                {
                    "Type": "Quiz",
                    "Questions": [
                        {
                            "Question": "Why are tables useful?",
                            "Answer": "They can store lots of information in a single variable",
                            "False1": "They make a script faster",
                            "False2": "Tables prevent the script from erroring",
                            "False3": "Tables are required in every script"
                        },
                        {
                            "Question": "When can you refer to a table with a dot, rather than square brackets?",
                            "Answer": "When the index is a string",
                            "False1": "When the index is a number",
                            "False2": "When the index is a Boolean",
                            "False3": "When the index is a function"
                        },
                        {
                            "Question": "What is the limit of values that can be stored in a table?",
                            "Answer": "There is no specified limit",
                            "False1": "10 values",
                            "False2": "100 values",
                            "False3": "1,000 values"
                        },
                        {
                            "Question": "What is the index of '3' in this table?\n<font face=\"Code\">{2, 3, 7, 1}</font>",
                            "Answer": "2",
                            "False1": "1",
                            "False2": "3",
                            "False3": "It doesn't have an index"
                        },
                        {
                            "Question": "How would you refer to 'x' in this table?\n<font face=\"Code\">t = {2, {1, 'x'}}</font>",
                            "Answer": "t[2][2]",
                            "False1": "t['x']",
                            "False2": "t[3]",
                            "False3": "t.x"
                        }
                    ]
                }
            ]
        },
        {
            "Title": "Episode 5",
            "Subtitle": "Functions",
            "BackgroundImage": "http://www.roblox.com/asset/?id=10204198168",
            "GridPlacement": "005",
            "Template": "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n",
            "Content": [
                {
                    "Type": "Exercise",
                    "Title": "Basic Function",
                    "Description": "Declare a function named <font color=\"rgb(85,170,255)\">myFunction</font>, that outputs the number <b>15</b> when called.\n\nAfterwards, call the function.",
                    "Hint": "You don't need to pass any arguments to the function, simply have it output the number 15.",
                    "Validator": "if not typeof(myFunction) == 'function' then return false end wait() local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:lower():find('15') then return true end return false",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Exercise",
                    "Title": "Returning Values",
                    "Description": "Declare a function named <font color=\"rgb(85,170,255)\">getName</font>, that <b>returns</b> your name when called.\n\nYou do <b>not</b> need to call the function.",
                    "Hint": "Use the 'return' keyword to return any string value.",
                    "Validator": "return typeof(getName) == 'function' and typeof(getName()) == 'string'",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Exercise",
                    "Title": "Arguments",
                    "Description": "Declare a function named <font color=\"rgb(85,170,255)\">multiply</font>, that takes <b>two numbers</b> as arguments.\n\nYou can name your parameters anything you think is suitable.\n\nYour function must then <b>multiply</b> the two value, and <b>return</b> the result.\n\nFeel free to call the function with any two numbers to test it.",
                    "Hint": "You can create two parameters between the brackets which are your variables, and then use the '*' operator to multiply them.",
                    "Validator": "return typeof(multiply) == 'function' and multiply(5, 6) == 30",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Exercise",
                    "Title": "Basic Logic",
                    "Description": "Declare a function named <font color=\"rgb(85,170,255)\">isLarge</font>, that takes <b>one number</b> as an argument.\n\nYou can name your parameter anything you think is suitable.\n\nYour function must return <b>true</b> if the number is greater than OR equal to <b>100</b>, and <b>false</b> if it is less than 100.\n\nYou do <b>not</b> need to call the function.",
                    "Hint": "You can either use an if statement, or use a condition to determine if the number is greater than or equal to 100. Refer to episode 2 for more information.",
                    "Validator": "return typeof(isLarge) == 'function' and isLarge(100) == true and isLarge(99) == false and isLarge(3434) == true and isLarge(-1) == false",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Exercise",
                    "Title": "Multple Returned Values",
                    "Description": "Declare a function named <font color=\"rgb(85,170,255)\">getNumbers</font>, that returns the numbers <b>10</b> and <b>20</b>\n\nYou must return the values separately, meaning you must not return a table.\n\nYou shouldn't create any parameters for your function.\n\nAfterwards, declare two variables, <font color=\"rgb(85,170,255)\">num1</font> and <font color=\"rgb(85,170,255)\">num2</font>, call the function, and assign them the values returned by the function.",
                    "Hint": "You can return multiple pieces of data by separating the values with a comma. When calling the function, you can assign the returned values to variables, separated by a comma.",
                    "Validator": "if typeof(getNumbers) ~= 'function' then return false end a, b = getNumbers() return typeof(num1) == 'number' and typeof(num2) == 'number' and num1 == 10 and num2 == 20 and a == 10 and b == 20",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Exercise",
                    "Title": "Libraries",
                    "Description": "Declare a table named <font color=\"rgb(85,170,255)\">myLib</font>, that contains a function named <font color=\"rgb(85,170,255)\">add</font>.\n\nThe function should take two numbers as arguments, add them together and return the result.\n\nFinally, call the function passing values <b>6</b> and <b>7</b> as arguments, and then output the result.",
                    "Hint": "You can add a function as a value to a table just like any other data type. You can then call the function by using the table name and the function name, separated by a period. The expected output is <b>13</b>.",
                    "Validator": "wait() if not (typeof(myLib) == 'table' and typeof(myLib.add) == 'function') then return false end local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:lower():find('13') and myLib.add(1,2) == 3 then return true end return false",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Quiz",
                    "Questions": [
                        {
                            "Question": "Which of these happens when you use the 'return' keyword?",
                            "Answer": "The function stops, similar to the break keyword",
                            "False1": "The function outputs a value",
                            "False2": "The function runs again, like a loop",
                            "False3": "The script crashes"
                        },
                        {
                            "Question": "Why are functions generally declared like this?\n<font face=\"Code\">function myFunc()</font>",
                            "Answer": "It is considered more readable",
                            "False1": "It is faster",
                            "False2": "It is more secure",
                            "False3": "Functions can only be declared like this"
                        },
                        {
                            "Question": "What is returned by a function if you don't return anything?",
                            "Answer": "nil",
                            "False1": "false",
                            "False2": "true",
                            "False3": "0"
                        },
                        {
                            "Question": "What happens if you try to call the same function twice?",
                            "Answer": "The function will run twice",
                            "False1": "It will ignore the second call",
                            "False2": "The script will error",
                            "False3": "Roblox Studio will hang"
                        },
                        {
                            "Question": "How would you call the function in this table?\n<font face=\"Code\">f = {function() print('Hello!') end}</font>",
                            "Answer": "f[1]()",
                            "False1": "f.function()",
                            "False2": "f.print()",
                            "False3": "f()"
                        }
                    ]
                }
            ]
        },
        {
            "Title": "Episode 6",
            "Subtitle": "Instances",
            "BackgroundImage": "http://www.roblox.com/asset/?id=10204199095",
            "GridPlacement": "006",
            "Template": "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n",
            "Content": [
                {
                    "Type": "Exercise",
                    "Title": "Properties",
                    "Description": "Manually add a new <b>Part</b> to the <b>Workspace</b>, and name it <b>MyPart</b>.\n\nIn the script editor, write a script that changes the part's name to <b>NamedPart</b>.",
                    "Hint": "You can reference the part by navigating to <b>game.Workspace.MyPart</b>. Re-assign the .Name property just as you would an index in a table.",
                    "Validator": "return workspace:FindFirstChild('NamedPart') ~= nil",
                    "ScriptValidator": "return not workspace:FindFirstChild('NamedPart')"
                },
                {
                    "Type": "Exercise",
                    "Title": "Properties #2",
                    "Description": "In the script editor, refer to the <b>Baseplate</b> part in the <b>Workspace</b>.\n\nNext, change its <b>Transparency</b> property to <b>0.5</b>.",
                    "Hint": "The Baseplate is just a <b>Part</b>, so you can reference it the same way as a standard part. You can also change the transparency of the part by setting the .Transparency property.",
                    "Validator": "return workspace:FindFirstChild('Baseplate').Transparency == 0.5",
                    "ScriptValidator": "return workspace:FindFirstChild('Baseplate').Transparency == 0"
                },
                {
                    "Type": "Exercise",
                    "Title": "Methods",
                    "Description": "In the script editor, refer to the <b>NamedPart</b> in the <b>Workspace</b>.\n\nNext, call the <b>Destroy</b> method, to destroy the part.",
                    "Hint": "After referring to the part, use the :Destroy() method to destroy it. Refer to the tutorial if you're unsure.",
                    "Validator": "return not workspace:FindFirstChild('NamedPart')",
                    "ScriptValidator": "return workspace:FindFirstChild('NamedPart') ~= nil"
                },
                {
                    "Type": "Exercise",
                    "Title": "Methods #2",
                    "Description": "Use the <b>GetChildren()</b> method to get a table containing each child in the <b>Workspace</b>.\n\nNext, iterate through the table, and output the <b>Name</b> of each child.",
                    "Hint": "The <b>GetChildren()</b> method returns a table of all the children in an instance. You can iterate through the table using a for loop, and output the child's name using the .Name property of each value in the table.",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() local len = 0 for i, v in workspace:GetChildren() do len += 1 end local function find(msg) for i, v in workspace:GetChildren() do if msg:find(v.Name) then return true end end return false end for i = 0, len - 1 do if not find(log[#log-i].message) then return false end end return true",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Exercise",
                    "Title": "Events",
                    "Description": "All instances have an event called <b>ChildAdded</b>, which fires when a child is added to the instance.\n\nWhen the event is fired, <b>one argument</b> is passed, which refers to the new instance that has been added.\n\nIn the script editor, refer to the <b>Workspace</b> instance and listen for the <b>ChildAdded</b> event.\n\nNext, output the <b>Name</b> of the child that was added.\n\nWhen you click the 'Test Code' button, a new part will be automatically added to the <b>Workspace</b>.\n\nYou will pass this challenge if your script outputs the name of the new part.",
                    "Hint": "Refer to the Engine API for an example of ChildAdded being used. Your parameter can be named anything, and you must them use the .Name property to get the name of the child.",
                    "Validator": "local name = 'NewPart' .. tostring(math.random(1000, 9999)) local part = Instance.new('Part') part.Name = name part.Parent = workspace wait() local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:find(name) then return true end return false",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Quiz",
                    "Questions": [
                        {
                            "Question": "Which of these does NOT reference a part's 'Name' property?",
                            "Answer": "part:Name",
                            "False1": "part.Name",
                            "False2": "part:FindFirstChild('Name')",
                            "False3": "part['Name']"
                        },
                        {
                            "Question": "What does the 'game' keyword refer to?",
                            "Answer": "The top-level of the explorer",
                            "False1": "The workspace",
                            "False2": "The game server",
                            "False3": "The Roblox website"
                        },
                        {
                            "Question": "Why do we use a colon when calling a method?",
                            "Answer": "It automatically passes the instance as the first argument",
                            "False1": "It is much faster than using a dot",
                            "False2": "You can't use a dot when calling a method",
                            "False3": "Methods are always called with a colon"
                        },
                        {
                            "Question": "What happens if an event is fired mulitple times",
                            "Answer": "The callback function is called each time",
                            "False1": "The function will only get called the first time",
                            "False2": "The script will error",
                            "False3": "Roblox Studio will hang"
                        },
                        {
                            "Question": "According to the Engine API, what would this method return?\n<font face=\"Code\">game.Workspace.MyPart:GetFullName()</font>",
                            "Answer": "'Workspace.MyPart'",
                            "False1": "'MyPart'",
                            "False2": "'game.Workspace.MyPart'",
                            "False3": "'Part'"
                        }
                    ]
                }
            ]
        },
        {
            "Title": "Episode 7",
            "Subtitle": "Local & Module",
            "BackgroundImage": "http://www.roblox.com/asset/?id=10204199852",
            "GridPlacement": "007",
            "Template": "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n",
            "Content": [
                {
                    "Type": "Exercise",
                    "Title": "Client & Server Communication",
                    "Description": "Take this opportunity to experiment with client and server communication.\n\nYou can do this by testing LocalScripts and server scripts, and by creating a test environment for <b>2 players</b>, as shown in the tutorial.\n\nWhen you're done, simply click 'Test Code' to move onto challenges about ModuleScripts.",
                    "Hint": "This challenge doesn't require any work, but it is highly recommended to experiment with LocalScripts in your own time. Simply click 'Test Code' when you're ready.",
                    "Validator": "return true",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Exercise",
                    "Title": "Creating a ModuleScript",
                    "Description": "Manually add a ModuleScript to the <b>ReplicatedStorage</b>, and name it <b>MyModule</b>.\n\nNext, remove the template code, and simply have the ModuleScript return a <b>string</b> of your choice.\n\nFinally, go back to the ScriptMateEnv script, <b>require</b> the ModuleScript, and output the returned string.",
                    "Hint": "You can require a ModuleScript with the <b>require</b> function, with the ModuleScript's location as the argument. The function will then return your ModuleScript's string, which you can assign to a variable, or output directly.",
                    "Validator": "wait() local mod = game.ReplicatedStorage:FindFirstChild('MyModule') if not mod then return false end local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:find(require(mod)) then return true end return false",
                    "ScriptValidator": "return userCode:find('require') ~= nil and not userCode:find('print(\"') and not userCode:find('print(\\'')"
                },
                {
                    "Type": "Exercise",
                    "Title": "Returning a Table",
                    "Description": "In the <b>MyModule</b> ModuleScript, return a table.\n\nThe table must be in list-form and contain the names of the game's admins, which are 'Josh', 'Bob', and 'Joe'.\n\nNext, go back to the ScriptMateEnv script, and <b>require</b> the ModuleScript.\n\nFinally, output the <b>2nd name</b> in the returned table.",
                    "Hint": "You can return a table like this: <b>return {}</b>. After requiring the ModuleScript, the function will return the table. You can then use it as you would any other table.",
                    "Validator": "wait() local mod = game.ReplicatedStorage:FindFirstChild('MyModule') if not mod then return false end local tbl = require(mod) if not typeof(tbl) == 'table' then return false end if #tbl ~= 3 or tbl[1] ~= 'Josh' or tbl[2] ~= 'Bob' or tbl[3] ~= 'Joe' then return false end local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:find(tbl[2]) then return true end return false",
                    "ScriptValidator": "return not userCode:find('Bob')"
                },
                {
                    "Type": "Exercise",
                    "Title": "Returning a Function",
                    "Description": "In the <b>MyModule</b> ModuleScript, return a function.\n\nThe function must take a string as an argument, concatenate <b>' :)'</b> (a space and a smiley) onto the end of the string, and then return it.\n\nNext, go back to the ScriptMateEnv script, and <b>require</b> the ModuleScript.\n\nFinally, call the function with any string, and output the returned string.",
                    "Hint": "The <b>require</b> function will return a function datatype. You can then assign it to a variable, and call it as you would any other function assigned to a variable.",
                    "Validator": "wait() local mod = game.ReplicatedStorage:FindFirstChild('MyModule') if not mod then return false end local func = require(mod) if not typeof(func) == 'function' then return false end local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:find(':)') then return true end return false",
                    "ScriptValidator": "local mod = game.ReplicatedStorage:FindFirstChild('MyModule') if not mod then return false end local func = require(mod) if not typeof(func) == 'function' then return false end return func('Hello') == 'Hello :)'"
                },
                {
                    "Type": "Exercise",
                    "Title": "Returning Nil",
                    "Description": "ModuleScripts run any code within them when required.\n\nTo demonstrate this, go to the <b>MyModule</b> ModuleScript, and call the print function to output any message.\n\nNext, simply return a nil value, so that a value is returned.\n\nFinally, go back to the ScriptMateEnv script, and <b>require</b> the ModuleScript.\n\nIf done correctly, the ModuleScript will output your message when required, and then return a nil value.",
                    "Hint": "You don't need to assign the returned value to a variable when requiring. Simply call the <b>print</b> function within the ModuleScript, and it will output the message. It does not need to be attached to a variable, or returned in any way.",
                    "Validator": "wait() local mod = game.ReplicatedStorage:FindFirstChild('MyModule') return mod.Source:find('print') ~= nil",
                    "ScriptValidator": "return userCode:find('require') ~= nil and not userCode:find('print(\"') and not userCode:find('print(\\'')"
                },
                {
                    "Type": "Quiz",
                    "Questions": [
                        {
                            "Question": "How many values can a ModuleScript return?",
                            "Answer": "1",
                            "False1": "None",
                            "False2": "An infinite amount",
                            "False3": "2"
                        },
                        {
                            "Question": "Which of these should be handled in a LocalScript?",
                            "Answer": "Dealing with a button press",
                            "False1": "Storing player data",
                            "False2": "Handling game logic",
                            "False3": "Updating players' scores"
                        },
                        {
                            "Question": "Which of these is NOT a script that you can use?",
                            "Answer": "CoreScript",
                            "False1": "LocalScript",
                            "False2": "ModuleScript",
                            "False3": "Script"
                        },
                        {
                            "Question": "Why can LocalScripts not access the server?",
                            "Answer": "Cheaters could use this to modify information on the server",
                            "False1": "This would make LocalScripts too powerful for Roblox to handle",
                            "False2": "LocalScripts would be too slow to run",
                            "False3": "They would be too easy to break"
                        },
                        {
                            "Question": "Which of these can access the <b>ReplicatedStorage</b>?",
                            "Answer": "All scripts",
                            "False1": "LocalScript",
                            "False2": "Script",
                            "False3": "ModuleScript"
                        }
                    ]
                }
            ]
        },
        {
            "Title": "Episode 8",
            "Subtitle": "Remotes",
            "BackgroundImage": "http://www.roblox.com/asset/?id=10204200695",
            "GridPlacement": "008",
            "Template": "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n",
            "Content": [
                {
                    "Type": "Exercise",
                    "Title": "Handling Remote Events #2",
                    "Description": "In the script editor, assume you are now writing a server script, and listen for a server event from the <b>RemoteEvent</b>.\n\nThe event will pass <b>two arguments</b>, one being the <b>Player</b> that fired the event, and one being a <b>table</b>.\n\nThe table contains a list of numbers. Your function must output the <b>3rd number</b> in the table, when the event is fired.\n\n<i>Note: The player argument will be a nil value for this demonstration.</i>",
                    "Hint": "Listen for .OnServerEvent and create parameters for the player and table. Then, simply use square brackets to get the 3rd value in the table.",
                    "Validator": "local remote = game.ReplicatedStorage:FindFirstChild('RemoteEvent') if not remote then return false end remote:FireServer({100.3, 123, 948, 33.09, 456}) wait() local log = game:GetService('LogService'):GetLogHistory() local msg = log[#log].message if msg:find('948') then return true end return false",
                    "ScriptValidator": "local remote = game.ReplicatedStorage:FindFirstChild('RemoteEvent') Instance.new('RemoteEvent', game.ReplicatedStorage) remote:Destroy() return true"
                },
                {
                    "Type": "Exercise",
                    "Title": "Handling Remote Functions #2",
                    "Description": "In the script editor, assume you are now writing a server script, and create a function that's called when the <b>RemoteFunction</b> is invoked.\n\nThe event will pass <b>two arguments</b>, one being the <b>Player</b> that fired the event, and one being a <b>number</b>.\n\nYour function must multiply the number by <b>3</b> and then return it.\n\n<i>Note: The player argument will be a nil value for this demonstration.</i>",
                    "Hint": "Use OnServerInvoke to listen for the RemoteFunction. Then, take the 2nd parameter, which can be named as you wish, multiply it by 3, and return the result.",
                    "Validator": "local remote = game.ReplicatedStorage:FindFirstChild('RemoteFunction') if not remote then return false end local response = remote:InvokeServer(28) remote:Clone().Parent = remote.Parent remote:Destroy() if response then return response == 28 * 3 end return false",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Quiz",
                    "Questions": [
                        {
                            "Question": "How many values can a ModuleScript return?",
                            "Answer": "1",
                            "False1": "None",
                            "False2": "An infinite amount",
                            "False3": "2"
                        },
                        {
                            "Question": "Which of these should be handled in a LocalScript?",
                            "Answer": "Dealing with a button press",
                            "False1": "Storing player data",
                            "False2": "Handling game logic",
                            "False3": "Updating players' scores"
                        },
                        {
                            "Question": "Which of these is NOT a script that you can use?",
                            "Answer": "CoreScript",
                            "False1": "LocalScript",
                            "False2": "ModuleScript",
                            "False3": "Script"
                        },
                        {
                            "Question": "Why can LocalScripts not access the server?",
                            "Answer": "Cheaters could use this to modify information on the server",
                            "False1": "This would make LocalScripts too powerful for Roblox to handle",
                            "False2": "LocalScripts would be too slow to run",
                            "False3": "They would be too easy to break"
                        },
                        {
                            "Question": "Which of these can access the <b>ReplicatedStorage</b>?",
                            "Answer": "All scripts",
                            "False1": "LocalScript",
                            "False2": "Script",
                            "False3": "ModuleScript"
                        }
                    ]
                }
            ]
        },
        {
            "Title": "Episode 9",
            "Subtitle": "Challenges",
            "BackgroundImage": "http://www.roblox.com/asset/?id=10204201473",
            "GridPlacement": "009",
            "Template": "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n",
            "Content": [
                {
                    "Type": "Exercise",
                    "Title": "FizzBuzz",
                    "Description": "This challenge has been used in interviews for Google, and will test your problem solving skills.\n\nWrite a program that outputs each number from 1 to 100.\n\nFor multiples of three, output \"Fizz\" instead of the number.\n\nFor multiples of five, output \"Buzz\" instead of the number.\n\nFor multiples of both three and five, output \"FizzBuzz\" instead of the number.",
                    "Hint": "To check whether a number is a multiple of another number, use the <b>modulo</b> operator. For example, <b>10 % 5</b> returns a value of 0, which means that 10 is a multiple of 5.",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() for i = 1, 100 do local out = '' if i % 3 == 0 then out ..= 'Fizz' end if i % 5 == 0 then out ..= 'Buzz' end if #out == 0 then out = tostring(i) end if not log[(#log-100)+i].message:find(out) then return false end end return true",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Exercise",
                    "Title": "Factorial",
                    "Description": "Write a program that outputs the <b>factorial</b> for each number from 1 to 10.\n\nThe factorial of a number is the product of all the numbers from 1 to that number.\n\nFor example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.",
                    "Hint": "You will need to embed for loops. An outer for loop to iterate from 1 to 10, and an inner for loop that takes the current number, determines the factorial and outputs it.",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() for i = 1, 10 do local t = 1 for x = 1, i do t*=x end if not log[(#log-10)+i].message:find(tostring(t)) then return false end end return true",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Exercise",
                    "Title": "Prime Numbers",
                    "Description": "Write a program that outputs all prime numbers from 1 to 100.\n\nA prime number is a number that is only divisible by 1 and itself.\n\nFor example, the first 5 prime numbers are 2, 3, 5, 7, and 11.",
                    "Hint": "You will need to embed for loops. An outer for loop to iterate from 1 to 100, and an inner for loop that takes the current number, determines whether it's a prime number and outputs it, if it is.",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() local count = 0 local function prime(n) for i = 2, n^(1/2) do if n % i == 0 then return false end end return true end for i = 2, 100 do if prime(i) then count += 1 if not log[(#log-25)+count].message:find(tostring(i)) then return false end end end return true",
                    "ScriptValidator": "return true"
                },
                {
                    "Type": "Exercise",
                    "Title": "HttpService",
                    "Description": "Using <b>HttpService</b>, write a program that outputs the contents of the following URL:\n\n<font face=\"Code\">https://JoshL.io/final</font>",
                    "Hint": "HttpService has a :GetAsync(url) method, which returns the contents of a webpage. After getting the contents, output the message.",
                    "Validator": "wait() local log = game:GetService('LogService'):GetLogHistory() if not log[#log].message:find('Congratulations, you have finished the') then return false end return true",
                    "ScriptValidator": "if userCode:find('Congratulations, you have finished the') or not userCode:find('HttpService') then return false end return true"
                },
                {
                    "Type": "Quiz",
                    "Questions": [
                        {
                            "Question": "Have you subscribed to jotslo?",
                            "Answer": "Of course!",
                            "False1": "No",
                            "False2": "lol no",
                            "False3": "Nah."
                        }
                    ]
                }
            ]
        }
    ]
}]]