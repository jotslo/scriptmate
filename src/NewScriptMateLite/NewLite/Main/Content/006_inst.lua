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
        Title = "Basic Comparison",
        Description = "Declare a variable named <font color=\"rgb(85,170,255)\">myBoolean</font> and assign it to a Boolean, by comparing two values.\n\nFinally, output the variable.\n\nYour script must not contain keywords <b>true</b> or <b>false</b>.",
        Hint = "You can compare two values with the equality operator (<b>==</b>), or any other operators mentioned in the tutorial. These comparions return a Boolean value, which can be assigned to a variable.",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() if log[#log].message:find('true') or log[#log].message:find('false') then return typeof(myBoolean) == 'boolean' end return false",
        ScriptValidator = "return userCode:find('true') == nil and userCode:find('false') == nil",
        Solution = [[-- first, we compare two values, which evaluate to TRUE or FALSe
-- next, the result of this operation is assigned to a variable
myBoolean = 3 == 3

-- with myBoolean now assigned to TRUE, we can print it to the output
print(myBoolean)]]
    },
}

return module