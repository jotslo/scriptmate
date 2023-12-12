local module = {}

module.Metadata = {
    Title = "Episode 4",
    Subtitle = "Tables",
    BackgroundImage = "http://www.roblox.com/asset/?id=10204197516",
    GridPlacement = "004",
    Template = "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n"
}

module.Content = {
    {
        Type = "Exercise",
        Title = "Empty Table",
        Description = "Declare a variable named <font color=\"rgb(85,170,255)\">myTable</font> and assign it to an <b>empty table</b>.",
        Hint = "Tables are created with curly brackets.",
        Validator = "return typeof(myTable) == 'table' and next(myTable) == nil",
        ScriptValidator = "return true"
    },
    {
        Type = "Exercise",
        Title = "List-style Table",
        Description = "Declare a variable named <font color=\"rgb(85,170,255)\">myTable</font> and assign it to a <b>table</b>.\n\nThe table should be formatted as a list, meaning you must <b>not</b> specify the indexes.\n\nInsert the following values to the table, in this order: <b>'s'</b>, <b>7</b>, <b>true</b>, <b>false</b>",
        Hint = "Tables can be created in a list-style format, where the indexes are not specified. This is done within the curly brackets.",
        Validator = "return typeof(myTable) == 'table' and myTable[1] == 's' and myTable[2] == 7 and myTable[3] == true and myTable[4] == false",
        ScriptValidator = "return true"
    },
    {
        Type = "Exercise",
        Title = "List-style Table #2",
        Description = "Declare a variable named <font color=\"rgb(85,170,255)\">myTable</font> and assign it to a <b>table</b>.\n\nThe table should be formatted as a list, meaning you must <b>not</b> specify the indexes.\n\nInsert any values into the table.\n\nAfterwards, output the <b>length</b> of the table.",
        Hint = "The # operator can determine the length of a table.",
        Validator = "wait() if not typeof(myTable) == 'table' then return false end local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:lower():find(#myTable) then return true end return false",
        ScriptValidator = "return true"
    },
    {
        Type = "Exercise",
        Title = "Dictionary-style Table",
        Description = "Declare a variable named <font color=\"rgb(85,170,255)\">ages</font> and assign it to a <b>table</b>.\n\nThe table must store the ages of the following people: <b>'John'</b> is <b>27</b>, <b>'Jane'</b> is <b>25</b>, <b>'Bob'</b> is <b>32</b>.\n\nThe names (strings) must be used as the indexes, and the ages (numbers) as the values.\n\nAfter declaring the table, output the age of <b>'John'</b>, by referring to the table.",
        Hint = "The table should be formatted like: {['Adam'] = 25, ...}. Afterwards, you must refer to the table and use the index to retrieve the value.",
        Validator = "wait() if not typeof(ages) == 'table' then return false end local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:lower():find('27') and ages['John'] == 27 and ages['Jane'] == 25 and ages['Bob'] == 32 then return true end return false",
        ScriptValidator = "return not userCode:find('print%(\\'') and not userCode:find('print%(\"') and not userCode:find('print%(27')"
    },
    {
        Type = "Exercise",
        Title = "Generic For Loop",
        Description = "Declare a variable named <font color=\"rgb(85,170,255)\">myTable</font> and assign it to a <b>table</b>.\n\nThe table should be formatted as a list, meaning you must <b>not</b> specify the indexes.\n\nInsert any values into the table. The table must contain <b>at least 2</b> values.\n\nAfterwards, use a <b>for loop</b> to output each value in the table in order.\n\nYou may only use the <font color=\"rgb(85,170,255)\">print</font> keyword once in your script.",
        Hint = "You should use the generic for loop, which is mentioned in the video. For each value, simply output the variable referring to the value.",
        Validator = "wait() if (not typeof(myTable) == 'table') or #myTable < 2 then return false end local log = game:GetService('LogService'):GetLogHistory() for i = 0, #myTable - 1 do if not log[#log-i].message:find(myTable[#myTable-i]) then return false end end return true",
        ScriptValidator = "local _, count = userCode:gsub('print', '') return count == 1 and not userCode:find('print%(\\'') and not userCode:find('print%(\"')"
    },
    {
        Type = "Exercise",
        Title = "Generic For Loop #2",
        Description = "Declare a variable named <font color=\"rgb(85,170,255)\">myTable</font> and assign it to a <b>table</b>.\n\nThe table should be formatted as a dictionary, meaning you <b>must</b> specify the indexes.\n\nInsert any indexes and values into the table. The table must contain <b>at least 2</b> sets of indexes & values.\n\nAfterwards, use a <b>for loop</b> to get each index <b>and</b> value in the table.\n\nOn each loop, concatenate the index and value into a string, and output the string.\n\nYou may only use the <font color=\"rgb(85,170,255)\">print</font> keyword once in your script.",
        Hint = "You should use the generic for loop. For each value, concatenate both the index and the value using the '..' operator, and output the string.",
        Validator = "wait() if (not typeof(myTable) == 'table') then return false end local log = game:GetService('LogService'):GetLogHistory() local len = 0 for i, v in myTable do len += 1 end local function find(msg) for i, v in myTable do if msg:find(tostring(i)) and msg:find(tostring(v)) then return true end end return false end for i = 0, len - 1 do if not find(log[#log-i].message) then return false end end return true",
        ScriptValidator = "local _, count = userCode:gsub('print', '') return count == 1 and not userCode:find('print%(\\'') and not userCode:find('print%(\"')"
    },
    {
        Type = "Quiz",
        Questions = {
            {
                Question = "Why are tables useful?",
                Answer = "They can store lots of information in a single variable",
                False1 = "They make a script faster",
                False2 = "Tables prevent the script from erroring",
                False3 = "Tables are required in every script"
            },
            {
                Question = "When can you refer to a table with a dot, rather than square brackets?",
                Answer = "When the index is a string",
                False1 = "When the index is a number",
                False2 = "When the index is a Boolean",
                False3 = "When the index is a function"
            },
            {
                Question = "What is the limit of values that can be stored in a table?",
                Answer = "There is no specified limit",
                False1 = "10 values",
                False2 = "100 values",
                False3 = "1,000 values"
            },
            {
                Question = "What is the index of '3' in this table?\n<font face=\"Code\">{2, 3, 7, 1}</font>",
                Answer = "2",
                False1 = "1",
                False2 = "3",
                False3 = "It doesn't have an index"
            },
            {
                Question = "How would you refer to 'x' in this table?\n<font face=\"Code\">t = {2, {1, 'x'}}</font>",
                Answer = "t[2][2]",
                False1 = "t['x']",
                False2 = "t[3]",
                False3 = "t.x"
            }
        }
    }
}

return module