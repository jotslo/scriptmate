-- first we grab the httpservice for reference
local httpService = game:GetService("HttpService")

-- then we use getasync to get the contents of the url
local response = httpService:GetAsync("https://JoshL.io/final")

-- finally, we print the response
print(response)