local httpService = game:GetService("HttpService")
local players = game:GetService("Players")

local ui = script.Parent.Parent:WaitForChild("UI")
local scriptView = ui.UserView.ModScriptView
local httpView = ui.UserView.AccessHttpView
local practiceView = ui.UserView.PracticeView
local mainMenu = ui.UserView.MainMenu
local fixView = ui.UserView.FixModView

local exerciseView = practiceView.ExerciseView
local quizView = practiceView.QuizView
local progress = practiceView.Progress

local questionView = quizView.QuestionView
local finalView = quizView.FinalView

local generatePage = require(script.Parent.GeneratePage)
local scriptHandler = require(script.Parent.ScriptHandler)
local macroHandler = require(script.Parent.MacroHandler)
local consts = require(script.Parent.Consts)

local content do
	if consts.IsTesting then
		local mod = workspace.Content.Pro.MainModule:Clone()
		content = require(mod)
		mod:Destroy()
	else
		content = require(14711202666)
	end
end

local requestAllowed = true
local debugMode = true

local plugin
local data
local page

local function openMainMenu()
	if not content then
		warn("ScriptMate - Failed. Try re-opening studio.")
		return
	end
	
	scriptHandler.GenerateScript(plugin)
	generatePage.SetupMenu(plugin, content)

	fixView.Visible = false
	scriptView.Visible = false
	mainMenu.Visible = true
end

scriptView.AllowButton.MouseButton1Click:Connect(openMainMenu)
fixView.AllowButton.MouseButton1Click:Connect(openMainMenu)

scriptView.ErrorButton.MouseButton1Click:Connect(function()
	scriptView.Visible = false
	fixView.Visible = true
end)

ui.NoticeView.NoTeamCreate.OkButton.MouseButton1Click:Connect(function()
	ui.NoticeView.Visible = false
end)

mainMenu.EpisodeGrid.ChildAdded:Connect(function(episode)
	episode.MouseButton1Click:Connect(function()
		if ui.NoticeView.Visible then return end

		local category = generatePage.GetCategory(episode.Name)

		if category.NoTC and #players:GetPlayers() > 0 then
			ui.NoticeView.Visible = true
			ui.NoticeView.UpgradeMsg.Visible = false
			ui.NoticeView.NoTeamCreate.Visible = true

			warn("ScriptMate - This chapter does not work in Team Create (Collaboration) mode.")
			return
		end

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

	exerciseView.HintButton.Visible = false
	exerciseView.SolButton.Visible = true
end)

exerciseView.SolButton.MouseButton1Click:Connect(function()
	if page and page.Solution then
		if page.ExtraCode then
			scriptHandler.RunScript(page.ExtraCode)
		end

		scriptHandler.ShowSolution(page.Solution)
	end
end)

--[[ui.NoticeView.NoSolution.OkButton.MouseButton1Click:Connect(function()
	ui.NoticeView.Visible = false
end)]]

local isTesting = false
exerciseView.TestButton.MouseButton1Click:Connect(function()
	if ui.NoticeView.Visible then return end
	if isTesting then return end

	isTesting = true

	if page.HideScript then
		scriptHandler.ToggleScript(false)
	end

	local success = scriptHandler.TestCode(page)

	if page.HideScript then
		scriptHandler.ToggleScript(true)
	end
	
	if success then
		page = generatePage.CompletedPage(page)
	else
		scriptHandler.SaveScript(true)
	end

	isTesting = false
end)

exerciseView.OkButton.MouseButton1Click:Connect(function()
	if isTesting then return end
	page = generatePage.CompletedPage(page, true)
	
	scriptHandler.HideScript()
end)

practiceView.HomeButton.MouseButton1Click:Connect(function()
	if ui.NoticeView.Visible then return end
	if isTesting then return end

	if page.Type == "Exercise" then
		scriptHandler.SaveScript(true)
	end
	
	practiceView.Visible = false
	mainMenu.Visible = true
	scriptHandler.HideScript()
end)

progress.LeftButton.MouseButton1Click:Connect(function()
	if ui.NoticeView.Visible then return end
	if isTesting then return end

	if page.Type == "Exercise" then
		scriptHandler.SaveScript(true)
	end
	
	page = generatePage.SwitchPage(page, -1)
end)

progress.RightButton.MouseButton1Click:Connect(function()
	if ui.NoticeView.Visible then return end
	if isTesting then return end

	if page.Type == "Exercise" then
		scriptHandler.SaveScript(true)
	end
	
	page = generatePage.SwitchPage(page, 1)
end)

finalView.MenuButton.MouseButton1Click:Connect(function()
	if ui.NoticeView.Visible then return end
	if isTesting then return end

	practiceView.Visible = false
	mainMenu.Visible = true
	scriptHandler.HideScript()
end)

finalView.RetryButton.MouseButton1Click:Connect(function()
	generatePage.DisplayQuestion(page, 1)
end)

mainMenu.Toggle.MacroButton.MouseButton1Click:Connect(function()
	mainMenu.Toggle.MacroButton.Visible = false
	mainMenu.Toggle.MacroOpened.Visible = true
	mainMenu.Toggle.EpisodeButton.Visible = true
	mainMenu.Toggle.EpisodeOpened.Visible = false

	mainMenu.EpisodeGrid.Visible = false
	mainMenu.EpisodeSearch.Visible = false

	mainMenu.MacroList.Visible = true
	mainMenu.MacroSearch.Visible = true
	mainMenu.MacroAddButton.Visible = true
end)

mainMenu.Toggle.EpisodeButton.MouseButton1Click:Connect(function()
	mainMenu.Toggle.MacroButton.Visible = true
	mainMenu.Toggle.MacroOpened.Visible = false
	mainMenu.Toggle.EpisodeButton.Visible = false
	mainMenu.Toggle.EpisodeOpened.Visible = true

	mainMenu.EpisodeGrid.Visible = true
	mainMenu.EpisodeSearch.Visible = true

	mainMenu.MacroList.Visible = false
	mainMenu.MacroSearch.Visible = false
	mainMenu.MacroAddButton.Visible = false
end)

mainMenu.EpisodeSearch.SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
	local text = mainMenu.EpisodeSearch.SearchBox.Text
	local searchContent = text:lower():gsub("%s", "")

	generatePage.SetupMenu(plugin, content, searchContent)
end)

ui.NoticeView.UpgradeMsg.OkButton.MouseButton1Click:Connect(function()
	ui.NoticeView.Visible = false
	ui.NoticeView.UpgradeMsg.Visible = false
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

	if plugin:GetSetting(`{consts.DataId}000`) then
		openMainMenu()
	end

	macroHandler.SetupMacros(plugin, content.Macros, ui)
end