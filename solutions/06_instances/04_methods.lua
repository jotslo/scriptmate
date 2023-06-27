-- let's get all children in the workspace
local children = game.Workspace:GetChildren()

-- we then loop through all children, outputting name of each child
for index, child in children do
    print(child.Name)
end