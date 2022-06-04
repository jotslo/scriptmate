local httpService = game:GetService("HttpService")

local ui = script.Parent.Parent:WaitForChild("UI")
local scriptView = ui.UserView.ModScriptView
local httpView = ui.UserView.AccessHttpView
local practiceView = ui.UserView.PracticeView
local mainMenu = ui.UserView.MainMenu

local exerciseView = practiceView.ExerciseView
local quizView = practiceView.QuizView
local progress = practiceView.Progress

local questionView = quizView.QuestionView
local finalView = quizView.FinalView

local generatePage = require(script.Parent.GeneratePage)
local scriptHandler = require(script.Parent.ScriptHandler)

local plugin
local data
local page

scriptView.AllowButton.MouseButton1Click:Connect(function()
	--if httpService:FindFirstChild("ScriptMateEnv") then
	--	httpService.ScriptMateEnv:Destroy()
	--end
	
	scriptHandler.GenerateScript(plugin)
	scriptView.Visible = false
	httpView.Visible = true
end)

httpView.AllowButton.MouseButton1Click:Connect(function()
	local success, response = pcall(function()
		return httpService:GetAsync("https://joshl.io/scriptmate/api/data.json")
	end)
	
	if success then
		data = httpService:JSONDecode(response)
		generatePage.SetupMenu(plugin, data)
		
		httpView.Visible = false
		mainMenu.Visible = true
	end
end)

mainMenu.EpisodeGrid.ChildAdded:Connect(function(episode)
	episode.MouseButton1Click:Connect(function()
		page = generatePage.SetupPage(plugin, episode.Name, scriptHandler)
		mainMenu.Visible = false
		practiceView.Visible = true
	end)
end)

exerciseView.HintButton.MouseButton1Click:Connect(function()
	if exerciseView.Description.Text:find("255,165,0") then
		return
	end
	
	exerciseView.Description.Text ..= "\n\n<b>Hint:</b> "
		.. "<font color='rgb(255,165,0)'>"
		.. page.Hint .. "</font>"
end)

exerciseView.TestButton.MouseButton1Click:Connect(function()
	local success = scriptHandler.TestCode(page)
	
	if success then
		page = generatePage.CompletedPage(page)
	else
		scriptHandler.SaveScript(true)
	end
end)

practiceView.HomeButton.MouseButton1Click:Connect(function()
	if page.Type == "Exercise" then
		scriptHandler.SaveScript(true)
	end
	
	practiceView.Visible = false
	mainMenu.Visible = true
	scriptHandler.HideScript()
end)

progress.LeftButton.MouseButton1Click:Connect(function()
	if page.Type == "Exercise" then
		scriptHandler.SaveScript(true)
	end
	
	page = generatePage.SwitchPage(page, -1)
end)

progress.RightButton.MouseButton1Click:Connect(function()
	if page.Type == "Exercise" then
		scriptHandler.SaveScript(true)
	end
	
	page = generatePage.SwitchPage(page, 1)
end)

finalView.MenuButton.MouseButton1Click:Connect(function()
	practiceView.Visible = false
	mainMenu.Visible = true
	scriptHandler.HideScript()
end)

finalView.RetryButton.MouseButton1Click:Connect(function()
	generatePage.DisplayQuestion(page, 1)
end)

for _, button in questionView:GetChildren() do
	if button:IsA("TextButton") then
		button.MouseButton1Click:Connect(function()
			local questionNumber = tonumber(
				questionView.QuestionNumber.Text:split(" ")[2])
			
			generatePage.NextQuestion(page, button, questionNumber)
		end)
	end
end

return function(localPlugin)
	plugin = localPlugin
end