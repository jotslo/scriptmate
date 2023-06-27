-- declare function to get factorial of number
local function getFactorial(number)
    -- declare factorial variable
    -- starts at 1 because 0! = 1
    -- must also multiply by 1
    local factorial = 1

    -- loop from 1 to number
    for i = 1, number do
        -- multiply factorial by i for each number up to target
        factorial = factorial * i
    end

    return factorial
end

for i = 1, 10 do
    local value = getFactorial(i)

    -- after getting factorial of i, output it
    print(value)
end