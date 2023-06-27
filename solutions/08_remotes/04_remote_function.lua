-- we are now writing a server script
-- remotefunction will receive two args:

-- arg 1: the player who invoked the function
-- arg 2: a number

game.ReplicatedStorage.RemoteFunction.OnServerInvoke = function(player, args)
    -- we return the number multiplied by 3
    return args * 3
end