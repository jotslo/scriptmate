-- first, let's declare a variable for fun
x = 5

-- we then want the if statement to run
if x == 5 then
    -- we assign myVar to 13 in the scope
    local myVar = 13

    -- we print the value of myVar to the output
    print(myVar) -- 13 is outputted
end

-- we then print the value of myVar to the output
-- this will output nil, as myVar doesn't exist here
print(myVar) -- nil is outputted