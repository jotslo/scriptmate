-- declare function that checks if prime
local function isPrime(number)
    -- loop from 2 to number - 1
    for i = 2, number - 1 do
        -- if number is divisible by i, it is not prime
        if number % i == 0 then
            return false
        end
    end

    -- if we get here, number is prime
    return true
end

-- loop from 1 to 100
for i = 1, 100 do
    -- if i is prime, print it
    if isPrime(i) then
        print(i)
    end
end