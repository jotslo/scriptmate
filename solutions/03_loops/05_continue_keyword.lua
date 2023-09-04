-- we use a for loop from 1 to 10
for i = 1, 10 do

    -- if i is 5, skip to the next loop
    -- this ignores the code beneath this point
    if i == 5 then
        continue
    end

    -- otherwise, output i
    print(i)
end