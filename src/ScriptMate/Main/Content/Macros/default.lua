return {
    {
        Name = "var",
        Description = "Creates a variable",
        Code = [[local myMessage = "Hello, world!"]]
    },
    {
        Name = "print",
        Description = "Prints a message",
        Code = [[print("Hello, world!")]]
    },
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
        Name = "for",
        Description = "Creates a for loop",
        Code = [[for i = 1, 10 do
    print(i)
end]]
    },
    {
        Name = "genfor",
        Description = "Creates a generic for loop",
        Code = [[for i, v in myTable do
    print(i, v)
end]]
    },
    {
        Name = "while",
        Description = "Creates a while loop",
        Code = [[while x == 5 do
    print("This runs while x is 5!")
end]]
    },
    {
        Name = "repeat",
        Description = "Creates a repeat loop",
        Code = [[repeat
    print("This runs until x is 5!")
until x == 5]]
    },
    {
        Name = "continue",
        Description = "Skips the rest of the loop",
        Code = [[-- Example
for i = 1, 10 do
    if i == 5 then
        continue
    end
    
    -- if we reach this point, i is not 5
    print(i)
end]]
    },
    {
        Name = "break",
        Description = "Stops the loop",
        Code = [[-- Example
for i = 1, 10 do
    if i == 5 then
        break
    end

    -- if we reach this point, i has not reached 5 yet
    print(i)
end]]
    },
    {
        Name = "do",
        Description = "Creates a do statement",
        Code = [[do
    local x = 3
    print(x) --only available in the do statement!
end]]    
    },
    {
        Name = "table",
        Description = "Creates a table",
        Code = [[local myTable = {"test", 3, true}]]
    },
    {
        Name = "dict",
        Description = "Creates a dict-like table",
        Code = [[local myTable = {
    ["key"] = "value",
    ["key2"] = "value2"
}]]
    },
    {
        Name = "function",
        Description = "Creates a function",
        Code = [[function myFunction()
    print("Hello, world!")
end

myFunction() --run the contents of the function]]
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