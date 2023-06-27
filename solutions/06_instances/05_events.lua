-- we listen for the ChildAdded event on the Workspace
game.Workspace.ChildAdded:Connect(function(child)
    -- we then print the name of the child that was added
    print(child.Name)
end)

-- the plugin will automatically add a part when you test code