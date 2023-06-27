-- add a remotefunction to replicatedstorage manually

-- let's assume we're writing a localscript
-- we invoke the remotefunction and pass a string

game.ReplicatedStorage.RemoteFunction:InvokeServer("Hello World!")