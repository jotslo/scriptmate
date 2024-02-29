local module = {}

local httpService = game:GetService("HttpService")
local scriptEditor = game:GetService("ScriptEditorService")
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
	local fixedSource = sourceHeader .. "\n" .. scriptEnv.Source

	local test1 = runTest(preExecTest, page.ScriptValidator)
	if not test1 then return false end

	local test2 do
		if page.Threaded then
			test2 = runTest(execTest, `task.spawn(function() {fixedSource} end)\n{page.Validator}`)
		else
			test2 = runTest(execTest, fixedSource .. "\n" .. page.Validator)
		end
	end

	if not test2 then return false end

	print("ScriptMate - Code success!")
	return true
end

function module.RunScript(code)
	local newScript = Instance.new("ModuleScript")
	newScript.Source = `{code}\nreturn nil`
	require(newScript)
	newScript:Destroy()
end

function module.SetupEnv(source, newCatData, newPageNo, category)
	pageNumber = newPageNo
	categoryData = newCatData
	--scriptEnv.Source = source or ""
	plugin:OpenScript(scriptEnv, #scriptEnv.Source:split("\n"))

	scriptEditor:UpdateSourceAsync(scriptEnv, function(oldSource)
		return source or oldSource
	end)
end

function module.GenerateScript(localPlugin)
	if localPlugin then
		plugin = localPlugin
	end
	
	scriptEnv = Instance.new("Script")
	scriptEnv.Name = "ScriptMateEnv"
	scriptEnv.Source = "-- This script is used for ScriptMate exercises"

	if not httpService:FindFirstChild("SMPro") then
		local pro = Instance.new("Folder")
		pro.Name = "SMPro"
		pro.Parent = httpService
	end

	scriptEnv.Parent = httpService.SMPro
	
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

local originalCFrame = workspace.CurrentCamera.CFrame
local originalCamType = Enum.CameraType.Fixed
function module.ToggleScript(enabled)
	-- if we're enabling the script, open the script editor
	if enabled then
		if scriptEnv then
			scriptEditor:OpenScriptDocumentAsync(scriptEnv)
		end

		-- revert the camera to its original state
		workspace.CurrentCamera.CFrame = originalCFrame
		workspace.CurrentCamera.CameraType = originalCamType
		workspace.CurrentCamera.CameraSubject = nil
	
	-- if we're disabling, temporarily close the script.
	-- we don't delete it here because we want to keep the source.
	-- this plugin was also written before closing scripts was possible, so is a bit outdated.
	else
		local doc = scriptEditor:FindScriptDocument(scriptEnv)

		if doc then
			doc:CloseAsync()

			-- store camera details so we can revert after the upcoming test
			originalCFrame = workspace.CurrentCamera.CFrame
			originalCamType = workspace.CurrentCamera.CameraType
		end
	end
end

function module.ShowSolution(solution)
	if scriptEnv then
		--scriptEnv.Source = solution
		scriptEditor:UpdateSourceAsync(scriptEnv, function(oldSource)
			return solution or oldSource
		end)
	end
end

return module
