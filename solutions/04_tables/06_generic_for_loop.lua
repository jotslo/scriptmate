-- assign myTable to a dictionary table
local myTable = {
    ["idx1"] = 3,
    idx2 = "yep"
}

-- iterate through each index and value in myTable
for index, value in myTable do
    -- output the index and value of current iteration
    print(index .. value)
end