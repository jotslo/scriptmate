return {
    {
        Name = "if",
        Description = "Creates an if statement",
        Code = [[if 3 == 3 then
    print("This is true!")
elseif 4 ~= 3 then
    print("This never runs!")
else
    print("This doesn't run either!")
end]]
    },
    {
        Name = "while",
        Description = "Creates a while loop",
        Code = [[while x == 5 do
    print("This runs while x is 5!")
end]]
    }
}