local module = {}

local httpService = game:GetService("HttpService")
local sourceHeader = require(script.SourceHeader)

local execTest = script.ExecTest
local preExecTest = script.PreExecTest
local updateData = script.Parent.UpdateData

local categoryData
local lastSource
local pageNumber
local scriptEnv
local unloaded
local plugin

local autoSaveSeconds = 2
local lastSave = 0

local function removeScript()
	unloaded = true
	scriptEnv:Destroy()
end

local function repositionScript(child)
	wait()
	if child.Parent then
		child.Parent = httpService
		scriptEnv = child
	elseif not unloaded then
		module.GenerateScript()
	end
end

local function runTest(testScript, newSource)
	local testSuccess = true
	local newTest = testScript:Clone()

	newTest.Name = "ScriptMateEnv"
	newTest.Source ..= newSource .. "\nend"

	local success, response = pcall(function()
		if not require(newTest)(scriptEnv.Source) then
			testSuccess = false
			warn("ScriptMate - Exercise failed.")
		end
	end)

	if not success then
		testSuccess = false
		warn("ScriptMate - Exercise failed.\n" .. response)
	end

	newTest:Destroy()
	return testSuccess
end

function module.TestCode(page)
	-- fixes annoying behaviour causing by modulescript caching
	local fixedSource = sourceHeader .. " " .. scriptEnv.Source

	if not runTest(preExecTest, page.ScriptValidator) then
		return false
	end

	if not runTest(execTest, fixedSource .. " " .. page.Validator) then
		return false
	end

	print("ScriptMate - Code success!")
	return true
end

function module.SetupEnv(source, newCatData, newPageNo, category)
	pageNumber = newPageNo
	categoryData = newCatData
	scriptEnv.Source = source or ""
	plugin:OpenScript(scriptEnv, #scriptEnv.Source:split("\n"))
end

function module.GenerateScript(localPlugin)
	if localPlugin then
		plugin = localPlugin
	end
	
	scriptEnv = Instance.new("Script")
	scriptEnv.Name = "ScriptMateEnv"
	scriptEnv.Source = "-- This script is used for ScriptMate exercises"
	scriptEnv.Parent = httpService
	
	for _, child in httpService:GetChildren() do
		if child.Name == "ScriptMateEnv" and child ~= scriptEnv then
			child:Destroy()
		end
	end
		
	scriptEnv.AncestryChanged:Connect(repositionScript)
	scriptEnv:GetPropertyChangedSignal("Source"):Connect(module.SaveScript)
	plugin.Unloading:Connect(removeScript)
	
	return scriptEnv
end

function module.SaveScript(isForced, newCatData)
	local currentTime = tick()
	categoryData = newCatData or categoryData
	
	if currentTime - lastSave >= autoSaveSeconds or isForced then
		lastSave = currentTime
		
		if lastSource ~= scriptEnv.Source then
			lastSource = scriptEnv.Source
			categoryData.Sources[pageNumber] = lastSource
			updateData:Fire(categoryData)
		end
	end
end

function module.HideScript()
	if scriptEnv.Parent then
		scriptEnv:Destroy()
	end
end

return module
