local module = {}

module.Metadata = {
    Title = "Welcome!",
    Subtitle = "Get Started",
    BackgroundImage = "http://www.roblox.com/asset/?id=13727003716",
    GridPlacement = "000",
    Template = "--[[\n\nRECOMMENDED: Watch the video tutorial series here:\nhttps://devforum.roblox.com/t/video/1972156\n\nNeed more help? Join this scripting chat server:\nhttps://roblox.com/groups/3232454\n\n]]"
}


module.Content = {
    {
        Type = "Exercise",
        Title = "Welcome!",
        Description = [[It is <b>highly recommended</b> to watch the short tutorial videos before each episode.

<b>Copy the link</b> in the script editor to get started.


<b>Want all episodes and macro access?</b>
Purchase the full version of ScriptMate to start learning today!


Thanks for trying out ScriptMate!]],
        Hint = "Press 'Test Code' to continue.",
        Validator = "return true",
        ScriptValidator = "return true"
    }
}

return module