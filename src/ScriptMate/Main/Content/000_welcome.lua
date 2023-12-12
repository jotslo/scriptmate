local module = {}

module.Metadata = {
    Title = "Episode 0",
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

If you have any feedback, be sure to tweet <font color="#1DA1F2">@jotslo</font>.

Good luck on your scripting journey!]],
        Hint = "Press 'Test Code' to continue.",
        Validator = "return true",
        ScriptValidator = "return true"
    }
}

return module