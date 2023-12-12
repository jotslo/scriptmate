local module = {}

module.Metadata = {
    Title = "TweenService",
    Subtitle = "Tweening",
    BackgroundImage = "http://www.roblox.com/asset/?id=14823633087",
    GridPlacement = "010",
    Template = "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n"
}

module.Content = {
    {
        Type = "Exercise",
        Title = "Changing Position",
        Threaded = true,
        HideScript = true,
        Description = [[First, manually create a part in the Workspace, name it "MyPart", and set its position to <b>(0, 0, 0)</b>

Next, write a script that tweens the part to the position <b>(10, 10, 10)</b>.

The tween must last for 1 second. You can choose the style.]],
        Hint = "This is shown in the tutorial. In your property table, simply add 'Position' with a value of Vector3.new(10, 10, 10).",
        Validator = [[
            print("Validating...")
            task.wait(1.1)
            local part = workspace:FindFirstChild("MyPart")

            if part then
                return math.floor(part.Position.X) == 10 and math.floor(part.Position.Y) == 10 and math.floor(part.Position.Z) == 10
            end

            return false
        ]],
        ScriptValidator = [[
            local cam = workspace.CurrentCamera

            if not workspace:FindFirstChild("MyPart") then return false end

            workspace.MyPart.Position = Vector3.new(0, 0, 0)

            if cam then
                cam.CameraType = Enum.CameraType.Scriptable
                task.wait()
                local c = workspace.MyPart.CFrame + Vector3.new(20, 6, 20) 
                cam.CFrame = CFrame.new(c.Position, workspace.MyPart.Position)
                task.wait(1)
            end

            return workspace:FindFirstChild('MyPart') ~= nil and workspace.MyPart:IsA('BasePart') and math.floor(workspace.MyPart.Position.X) == 0 and math.floor(workspace.MyPart.Position.Y) == 0 and math.floor(workspace.MyPart.Position.Z) == 0
        ]],
        Solution = [[-- a part has been added to the workspace, at position (0, 0, 0)

local tweenService = game:GetService("TweenService")
local part = game.Workspace.MyPart

-- create a tweeninfo value lasting 1 second
local info = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- create a property table
local property = {Position = Vector3.new(10, 10, 10)}

-- create a tween
local tween = tweenService:Create(part, info, property)

-- play the tween
tween:Play()]],
        ExtraCode = [[
            if workspace:FindFirstChild("MyPart") then
                workspace.MyPart:Destroy()
            end

            local part = Instance.new("Part")
            part.Name = "MyPart"
            part.Parent = workspace
            part.Position = Vector3.new(0, 0, 0)
        ]]
    },
    {
        Type = "Exercise",
        Title = "Cancelling a Tween",
        Threaded = true,
        HideScript = true,
        Description = [[Write a script that tweens <b>MyPart</b> Transparency to <b>1</b> over 3 seconds.

After 1 second, cancel the tween.

Your tween must have a <b>linear</b> easing style.]],
        Hint = "An example of cancelling is in the tutorial. Transparency is a property and takes a number value.",
        Validator = [[
            print("Validating...")
            task.wait(1.1)
            local part = workspace:FindFirstChild("MyPart")

            if part then
                return part.Transparency > 0.2 and part.Transparency < 0.5
            end

            return false
        ]],
        ScriptValidator = [[
            local cam = workspace.CurrentCamera

            if not workspace:FindFirstChild("MyPart") then return false end

            workspace.MyPart.Position = Vector3.new(0, 0, 0)
            workspace.MyPart.Transparency = 0

            if cam then
                cam.CameraType = Enum.CameraType.Scriptable
                task.wait()
                local c = workspace.MyPart.Position + Vector3.new(10, 3, 12) 
                cam.CFrame = CFrame.new(c, workspace.MyPart.Position)
                task.wait(1)
            end
            
            return userCode:find(':Cancel()') ~= nil
        ]],
        Solution = [[-- a part has been added to the workspace, with a transparency of 0

local tweenService = game:GetService("TweenService")
local part = game.Workspace.MyPart

-- create a tweeninfo value lasting 3 seconds
local info = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

-- create a property table
local property = {Transparency = 1}

-- create a tween
local tween = tweenService:Create(part, info, property)

-- play the tween
tween:Play()

-- wait 1 second
task.wait(1)

-- cancel the tween
tween:Cancel()]],
        ExtraCode = [[
            if workspace:FindFirstChild("MyPart") then
                workspace.MyPart:Destroy()
            end

            local part = Instance.new("Part")
            part.Name = "MyPart"
            part.Parent = workspace
            part.Transparency = 0
        ]]
    },
    {
        Type = "Exercise",
        Title = "Cutscene",
        Threaded = true,
        HideScript = true,
        Description = [[Let's create a cutscene!

<font face="Code">game.Workspace.CurrentCamera</font> is a property that contains the player's current camera instance.

Use TweenService to tween the camera's <b>CFrame</b> property to (0, 0, 0) over 3 seconds.

After 1 second, pause the tween.

Wait for 2 seconds, then resume the tween.

You may use an easing style of your choice.]],
        Hint = "Set CFrame with CFrame.new(0, 0, 0). Feel free to research this. Everything else is shown in the tutorial.",
        Validator = [[
            print("Validating...")
            local camera = workspace.CurrentCamera
            local currentCFrame = camera.CFrame
            camera.CameraType = Enum.CameraType.Scriptable

            task.wait(1.5)
            if currentCFrame.X == camera.CFrame.X and currentCFrame.Y == camera.CFrame.Y and currentCFrame.Z == camera.CFrame.Z then
                print'1'
                return false
            end

            currentCFrame = camera.CFrame

            task.wait(0.5)

            if currentCFrame.X ~= camera.CFrame.X or currentCFrame.Y ~= camera.CFrame.Y or currentCFrame.Z ~= camera.CFrame.Z then
                return false
            end

            task.wait(3.5)

            return math.floor(camera.CFrame.X) == 0 and math.floor(camera.CFrame.Y) == 0 and math.floor(camera.CFrame.Z) == 0
        ]],
        ScriptValidator = "if workspace.CurrentCamera then workspace.CurrentCamera.CFrame = CFrame.new(10, 10, 10) end return userCode:find(':Pause()') ~= nil and userCode:find(':Play()') ~= nil",
        Solution = [[local tweenService = game:GetService("TweenService")

-- get the current camera
local camera = workspace.CurrentCamera

-- create a tweeninfo value lasting 3 seconds
local info = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

-- create a property table
local property = {CFrame = CFrame.new(0, 0, 0)}

-- create a tween
local tween = tweenService:Create(camera, info, property)

-- play the tween
tween:Play()

-- wait 1 second
task.wait(1)

-- pause the tween
tween:Pause()

-- wait 2 seconds
task.wait(2)

-- resume the tween
tween:Play()]],
        ExtraCode = [[
            local camera = workspace.CurrentCamera
            camera.CFrame = CFrame.new(10, 10, 10)
        ]]
    },
    {
        Type = "Exercise",
        Title = "Moving Up",
        Threaded = true,
        HideScript = true,
        Description = [[Write a script that moves <b>MyPart</b> up by 10 studs over 1 second.
        
When you test code, the part will be placed in a random position before your code runs.

You may use an easing style of your choice.]],
        Hint = "You can use the Position property to get the current position of the part. You can add Vector3 values together with the + operator.",
        Validator = [[
            print("Validating...")
            local part = workspace:FindFirstChild("MyPart")
            if not part then return end
            local yPos = part.Position.Y
            task.wait(1.1)

            if part then
                local v = math.floor(part.Position.Y) - math.floor(yPos)
                return v <= 11 and v >= 9
            end

            return false
        ]],
        ScriptValidator = [[
            local cam = workspace.CurrentCamera

            if not workspace:FindFirstChild("MyPart") then return false end
            
            if not workspace:FindFirstChild('MyPart') then Instance.new('Part', workspace).Name = 'MyPart' end workspace.MyPart.Position = Vector3.new(math.random(-10, 10), math.random(1, 10), math.random(-10, 10)) workspace.MyPart.Transparency =0
            
            if cam then
                cam.CameraType = Enum.CameraType.Scriptable
                task.wait()
                local c = workspace.MyPart.CFrame + Vector3.new(20, 6, 20) 
                cam.CFrame = CFrame.new(c.Position, workspace.MyPart.Position)
                task.wait(1)
            end
            
            return true
        ]],
        Solution = [[local tweenService = game:GetService("TweenService")
local part = game.Workspace.MyPart

-- create a tweeninfo value lasting 1 second
local info = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

-- create a property table, adding 10 to the Y value
local property = {Position = part.Position + Vector3.new(0, 10, 0)}

-- create a tween
local tween = tweenService:Create(part, info, property)

-- play the tween
tween:Play()]]
    },
    {
        Type = "Exercise",
        Title = "Explosion",
        Threaded = true,
        HideScript = true,
        Description = [[Manually set <b>MyPart</b>'s size to (1, 1, 1) and shape to <b>Ball</b>.

Write a script that tweens the part's size to (10, 10, 10) and transparency to 1 over 0.5 seconds.

When the tween is completed, destroy the part.]],
        Hint = "Use the .Completed event and the :Destroy() method to destroy the part.",
        Validator = [[
            print("Validating...")
            local part = workspace:FindFirstChild("MyPart")
            if not part then return end
            local size = part.Size
            local transparency = part.Transparency

            task.wait(0.4)
            
            if part then
                if (part.Size.X) < 2 or (part.Size.Y) < 2 or (part.Size.Z) < 2 or part.Transparency < 0.2 then
                    return false
                end
            end

            task.wait(0.6)

            if workspace:FindFirstChild("MyPart") then
                return false
            end

            return true
        ]],
        ScriptValidator = [[
            if not workspace:FindFirstChild('MyPart') then Instance.new('Part', workspace).Name = 'MyPart' end workspace.MyPart.Size = Vector3.new(1, 1, 1) workspace.MyPart.Shape = Enum.PartType.Ball workspace.MyPart.Transparency = 0

            local cam = workspace.CurrentCamera

            if cam then
                cam.CameraType = Enum.CameraType.Scriptable
                task.wait()
                local c = workspace.MyPart.CFrame + Vector3.new(6, 6, 6) 
                cam.CFrame = CFrame.new(c.Position, workspace.MyPart.Position)
                task.wait(1)
            end

            return true
        ]],
        Solution = [[
local tweenService = game:GetService("TweenService")
local part = game.Workspace.MyPart

-- create a tweeninfo value lasting 0.5 seconds
local info = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

-- create a property table, setting size to 10x10 and transparency to 1
local properties = {Size = Vector3.new(10, 10, 10), Transparency = 1}

-- create a tween
local tween = tweenService:Create(part, info, properties)

-- play the tween
tween:Play()

-- when the tween is completed, destroy the part
tween.Completed:Connect(function()
    part:Destroy()
end)]]
    },
    {
        Type = "Quiz",
        Questions = {
            {
                Question = "Which of these is NOT a valid easing style?",
                Answer = "Square",
                False1 = "Circular",
                False2 = "Quad",
                False3 = "Sine"
            },
            {
                Question = "Which of these is NOT a valid easing direction?",
                Answer = "OutIn",
                False1 = "In",
                False2 = "Out",
                False3 = "InOut"
            },
            {
                Question = "How would you wait until a tween is completed?",
                Answer = "tween.Completed:Wait()",
                False1 = "tween:Wait()",
                False2 = "tween:WaitForCompletion()",
                False3 = "tween:Completed()"
            },
            {
                Question = "Which of these data types can't be tweened?",
                Answer = "Function",
                False1 = "CFrame",
                False2 = "Color3",
                False3 = "Number"
            },
            {
                Question = "How do you make a tween repeat forever?",
                Answer = "Set the repeat count to -1",
                False1 = "Use TweenService:Repeat()",
                False2 = "Tweens can't repeat",
                False3 = "Disable the cancel option"
            }
        }
    }
}

return module