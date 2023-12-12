local module = {}

module.Metadata = {
    Title = "Finished?",
    Subtitle = "Get More",
    BackgroundImage = "http://www.roblox.com/asset/?id=10204201473",
    GridPlacement = "999",
    Template = "--[[\n\nGet ScriptMate:\nhttps://create.roblox.com/marketplace/asset/9819681341/ScriptMate\n\n]]"
}


module.Content = {
    {
        Type = "Exercise",
        Title = "Hello!",
        Description = [[<b>Congratulations</b> on finishing the basics!

Want more? Please consider purchasing <b>ScriptMate</b>!

Here's what you get:
• Extra challenges for every new video
• View solutions to all challenges
• Use code macros to save time
• Access all future updates
• Support me and my free tutorials

Good luck on your scripting journey!
<i>~ jotslo :)</i>]],
        Hint = "Press 'Test Code' to continue.",
        Validator = "return true",
        ScriptValidator = "return true"
    }
}

return module