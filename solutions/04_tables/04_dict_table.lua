-- declare dict-style table named 'ages'
-- the table stores the ages of people
local ages = {
    John = 27, -- we can use strings as indexes
    ["Jane"] = 25, -- this can also look like this
    ['Bob'] = 32 -- or this
}

-- let's then output john's age
print(ages.John) -- 3