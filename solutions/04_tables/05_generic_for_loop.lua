-- declare a table named 'myTable' with >2 values
local myTable = {"a", "b", "c"}

-- iterate over the table using generic for loop
-- we then output the VALUE of each current index
for index, value in myTable do
    print(value)
end