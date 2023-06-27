-- we're now listening for an event as the server
-- the client is going to pass 2 args to the server

-- arg 1: the player who fired the event
-- arg 2: a table

game.ReplicatedStorage.RemoteEvent.OnServerEvent:Connect(function(player, args)
    -- when fired, we output the 3rd value in the table
    print(args[3])
end)