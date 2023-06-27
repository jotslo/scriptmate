-- for loop from 1 to 10
for i = 1, 10 do
    print(i)

    -- if i has reached 5 (after outputting)
    -- break out of loop, skipping remaining iterations
    if i == 5 then
        break
    end
end