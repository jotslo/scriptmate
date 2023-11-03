return {
    {
        Name = "if",
        Description = "Creates an if statement",
        Code = [[if 3 == 3 then
    print("This is true!")
elseif 4 ~= 3 then
    print("This never runs!")
else
    print("This doesn't run either!")
end]]
    },
    {
        Name = "tween",
        Description = "Creates a demo tween",
        Code = [[local tweenService = game:GetService("TweenService")

local object = game.Workspace.YourPart

local tweenInfo = TweenInfo.new(
    1, --seconds to complete
    Enum.EasingStyle.Quad, --easing style
    Enum.EasingDirection.Out, --easing direction
    0, --repeat count
    false, --reverses?
    0 --delay before starting
)

local properties = {
    Position = Vector3.new(0, 10, 0)
}

local tween = tweenService:Create(object, tweenInfo, properties)

tween:Play()]]
    }
}