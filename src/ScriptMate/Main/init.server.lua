local pluginTitle = "ScriptMate"

local httpService = game:GetService("HttpService")
local toolbar = plugin:CreateToolbar(pluginTitle)
local button = toolbar:CreateButton(pluginTitle,
	"Practice skills you've learned from jotslo's tutorial series with a range of challenges and exercises.",
	"rbxassetid://9739366336")

local ui = script.Parent:WaitForChild("UI")
local scriptView = ui.UserView.ModScriptView

local studio = settings().Studio
local themeMap = require(script.ThemeMap)

local debugMode = false
local windowState = false
local handlingClose = false
local mainWidget

local function updateWindow()
	button:SetActive(mainWidget.Enabled)
	windowState = mainWidget.Enabled
end

local function updateTheme()
	for property, list in themeMap do
		for element, color in list do
			element[property] = studio.Theme:GetColor(color)
		end
	end
end

local function modifyExistingSidebar(enabled)
	for _, widget in game.PluginGuiService:GetChildren() do
		if widget:IsA("DockWidgetPluginGui") then
			if widget.Title == pluginTitle then
				widget.Enabled = enabled
				return widget
			end
		end
	end
end

local function showSidebar()
	local widget = modifyExistingSidebar(true)

	if widget then
		return widget
	end

	local widgetInfo = DockWidgetPluginGuiInfo.new(
		Enum.InitialDockState.Left,
		true, true, 0, 0, 320, 600)
	local widget = plugin:CreateDockWidgetPluginGui(
		httpService:GenerateGUID(), widgetInfo)

	widget.Title = pluginTitle
	ui.Parent = widget
	return widget
end

button.Click:Connect(function()
	windowState = not windowState
	button:SetActive(windowState)

	if windowState then
		mainWidget = showSidebar()
	else
		mainWidget = modifyExistingSidebar(false)
	end
	
	if not handlingClose then
		handlingClose = true
		mainWidget:GetPropertyChangedSignal("Enabled")
			:Connect(updateWindow)
	end
end)

if debugMode then
	plugin:SetSetting("scriptmate001", nil)
end

studio.ThemeChanged:Connect(updateTheme)
button:SetActive(windowState)
require(script.ButtonHandler)(plugin)
updateTheme()