local runService = game:GetService("RunService")
local httpService = game:GetService("HttpService")

-- only run plugin if studio is not in run mode
if runService:IsEdit() then
	local pluginTitle = "ScriptMate"

	local ui = script.Parent:WaitForChild("UI")
	local scriptView = ui.UserView.ModScriptView

	local studio = settings().Studio
	local themeMap = require(script.ThemeMap)

	local debugMode = false
	local windowState = false
	local handlingClose = false
	local mainWidget

	local toolbar = plugin:CreateToolbar(pluginTitle)
	local button = toolbar:CreateButton("ScriptMate",
		"Improve your scripting skills with a range of tutorials, challenges && more.",
		"rbxassetid://14605179846")
	
	button.ClickableWhenViewportHidden = true

	local function updateWindow()
		button:SetActive(mainWidget.Enabled)
		windowState = mainWidget.Enabled
	end

	local function updateTheme()
		for property, list in themeMap do
			for element, color in list do
				local newColor = studio.Theme:GetColor(color)

				-- if input field and light mode, make it slightly darker
				if color == Enum.StudioStyleGuideColor.InputFieldBackground then
					if newColor.R > 0.8 then
						element[property] = Color3.new(0.9, 0.9, 0.9)
						continue
					end
				end

				element[property] = newColor
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
			true, true, 0, 0, 320, 450)
		local widget = plugin:CreateDockWidgetPluginGui(
			httpService:GenerateGUID(), widgetInfo)

		widget.Title = pluginTitle
		ui.Parent = widget
		return widget
	end

	local function prepareDefault()
		--ui.UserView.MainMenu.Visible = false
		--ui.UserView.ModScriptView.Visible = true
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
	updateTheme()
	button:SetActive(windowState)
	require(script.ButtonHandler)(plugin)
	prepareDefault()
end