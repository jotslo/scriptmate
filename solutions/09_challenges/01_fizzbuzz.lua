-- this is one of many solutions to this puzzle

-- we create a for loop from 1 to 100
for i = 1, 100 do
    -- if i is divisible by 15 (3x5), print "FizzBuzz"
    if i % 15 == 0 then
        print("FizzBuzz")
    
    -- otherwise, if i is divisible by 3, print "Fizz"
    elseif i % 3 == 0 then
        print("Fizz")
    
    -- otherwise, if i is divisible by 5, print "Buzz"
    elseif i % 5 == 0 then
        print("Buzz")
    
    -- otherwise, just print i
    else
        print(i)
    end
end