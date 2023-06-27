-- declare myLib table containing add function
local myLib = {
    add = function(x, y)
        return x + y
    end
}

-- call function, assign to var and then output
local result = myLib.add(6, 7)
print(result)