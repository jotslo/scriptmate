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

local macroHandler = require(script.Parent.MacroHandler)
local consts = require(script.Parent.Consts)
local defaultMacros = require(script.Parent.DefaultMacros)


local function openMainMenu()
	local testScript = Instance.new("Script")

	pcall(function()
		testScript.Source = "--"
		fixView.Visible = false
		scriptView.Visible = false
		mainMenu.Visible = true
	end)
	
	testScript:Destroy()
end

scriptView.AllowButton.MouseButton1Click:Connect(openMainMenu)
fixView.AllowButton.MouseButton1Click:Connect(openMainMenu)


return function(localPlugin)
	plugin = localPlugin

	if plugin:GetSetting(`{consts.DataId}Macros`) then
		fixView.Visible = false
		scriptView.Visible = false
		mainMenu.Visible = true
	end

	macroHandler.SetupMacros(plugin, defaultMacros, ui)
end