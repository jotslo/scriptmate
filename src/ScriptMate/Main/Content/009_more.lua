local module = {}

module.Metadata = {
    Title = "Episode 9",
    Subtitle = "Challenges",
    BackgroundImage = "http://www.roblox.com/asset/?id=10204201473",
    GridPlacement = "009",
    Template = "--> Watch the video tutorial before completing this challenge\n--> WATCH EPISODES HERE: https://devforum.roblox.com/t/video/1972156\n--> Recommended scripting chat server @ roblox.com/groups/3232454\n\n"
}


module.Content = {
    {
        Type = "Exercise",
        Title = "FizzBuzz",
        Description = "This challenge has been used in interviews for Google, and will test your problem solving skills.\n\nWrite a program that outputs each number from 1 to 100.\n\nFor multiples of three, output \"Fizz\" instead of the number.\n\nFor multiples of five, output \"Buzz\" instead of the number.\n\nFor multiples of both three and five, output \"FizzBuzz\" instead of the number.",
        Hint = "To check whether a number is a multiple of another number, use the <b>modulo</b> operator. For example, <b>10 % 5</b> returns a value of 0, which means that 10 is a multiple of 5.",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() for i = 1, 100 do local out = '' if i % 3 == 0 then out ..= 'Fizz' end if i % 5 == 0 then out ..= 'Buzz' end if #out == 0 then out = tostring(i) end if not log[(#log-100)+i].message:find(out) then return false end end return true",
        ScriptValidator = "return true",
        Solution = [[-- this is one of many solutions to this puzzle

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
end]]
    },
    {
        Type = "Exercise",
        Title = "Factorial",
        Description = "Write a program that outputs the <b>factorial</b> for each number from 1 to 10.\n\nThe factorial of a number is the product of all the numbers from 1 to that number.\n\nFor example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.",
        Hint = "You will need to embed for loops. An outer for loop to iterate from 1 to 10, and an inner for loop that takes the current number, determines the factorial and outputs it.",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() for i = 1, 10 do local t = 1 for x = 1, i do t*=x end if not log[(#log-10)+i].message:find(tostring(t)) then return false end end return true",
        ScriptValidator = "return true",
        Solution = [[-- declare function to get factorial of number
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
end]]
    },
    {
        Type = "Exercise",
        Title = "Prime Numbers",
        Description = "Write a program that outputs all prime numbers from 1 to 100.\n\nA prime number is a number that is only divisible by 1 and itself.\n\nFor example, the first 5 prime numbers are 2, 3, 5, 7, and 11.",
        Hint = "You will need to embed for loops. An outer for loop to iterate from 1 to 100, and an inner for loop that takes the current number, determines whether it's a prime number and outputs it, if it is.",
        Validator = "wait() local log = game:GetService('LogService'):GetLogHistory() local count = 0 local function prime(n) for i = 2, n^(1/2) do if n % i == 0 then return false end end return true end for i = 2, 100 do if prime(i) then count += 1 if not log[(#log-25)+count].message:find(tostring(i)) then return false end end end return true",
        ScriptValidator = "return true",
        Solution = [[-- declare function that checks if prime
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
end]]
    },
    {
        Type = "Exercise",
        Title = "HttpService",
        Description = "Using <b>HttpService</b>, write a program that outputs the contents of the any URL.\n\nYou <b>cannot</b> access roblox.com or any other Roblox domain.",
        Hint = "HttpService has a :GetAsync(url) method, which returns the contents of a webpage. After getting the contents, output the message.",
        Validator = "return true",--"wait() local log = game:GetService('LogService'):GetLogHistory() if not log[#log].message:find('Congratulations, you have finished the') then return false end return true",
        ScriptValidator = "if not userCode:find('HttpService') or not userCode:find('GetAsync') then return false end return true",
        Solution = [[-- first we grab the httpservice for reference
local httpService = game:GetService("HttpService")

-- then we use getasync to get the contents of the url
local response = httpService:GetAsync("https://JoshL.io/final")

-- finally, we print the response
print(response)]]
    },
    {
        Type = "Quiz",
        Questions = {
            {
                Question = "Have you subscribed to jotslo?",
                Answer = "Of course!",
                False1 = "No",
                False2 = "Nah.",
                False3 = "Who?"
            }
        }
    }
}

return module