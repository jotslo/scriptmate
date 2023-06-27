-- first add a RemoteEvent to ReplicatedStorage manually

-- let's assume we're writing a localscript
-- we fire the remoteevent and pass a string

game.ReplicatedStorage.RemoteEvent:FireServer("Hello World!")