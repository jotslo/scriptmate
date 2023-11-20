local scriptEditorService = game:GetService("ScriptEditorService")
local httpService = game:GetService("HttpService")

local consts = require(script.Parent.Consts)

local module = {}
local macros = {}
local defaultMacros = {}

local events = {}

local ui
local plugin
local macroList
local searchBox

local activeMacro
local activeEditor

local function findMacro(macroList, macroName)
    for _, macro in macroList do
        if macro.Name == macroName then
            return macro
        end
    end
end

local function getMacro(line)
    for _, macro in macros do
        if macro.Removed then continue end

        if line:find(`;;{macro.Name}`, 1, true) then
            return macro
        end
    end
end

local function indentCode(code, line)
    local indentation = ""

    for i = 1, #line do
        if line:sub(i, i):match("%s") then
            indentation = line:sub(1, i)
        else
            break
        end
    end

    return code:gsub("\n", "\n" .. indentation)
end

local function editMode()
    activeEditor = Instance.new("Script")
    activeEditor.Name = "ScriptMate"
    activeEditor.Source = activeMacro.Code
    activeEditor.Parent = httpService

    plugin:OpenScript(activeEditor)
end

local function prepareUI()
    local canvasSize = 0
    macroList = ui.UserView.MainMenu.MacroList
    searchBox = ui.UserView.MainMenu.MacroSearch.SearchBox

    for _, frame in macroList:GetChildren() do
        if frame:IsA("Frame") and frame.Name ~= "_Template" and frame.Name ~= "Notif" then
            frame:Destroy()
        end
    end

    for _, event in events do
        event:Disconnect()
    end

    table.clear(events)

    for _, macro in macros do
        -- if default macro has been removed, ignore
        if macro.Removed then continue end

        -- if user is searching for something
        if #searchBox.Text > 0 then
            local macroContent = macro.Name .. macro.Description
            macroContent = macroContent:lower():gsub("%s", "")

            local searchContent = searchBox.Text:lower():gsub("%s", "")

            -- if macro does not meet requirements of search, skip it
            if not macroContent:find(searchContent, 1, true) then
                continue
            end
        end

        local macroFrame = macroList._Template:Clone()
        macroFrame.Name = macro.Name
        macroFrame.Title.Text = `;;{macro.Name}`
        macroFrame.Desc.Text = macro.Description
        macroFrame.Visible = true
        macroFrame.Parent = macroList

        events[#events + 1] = macroFrame.MouseEnter:Connect(function()
            if ui.NoticeView.Visible then return end
            macroFrame.DelButton.Visible = true
            macroFrame.EditButton.Visible = true
        end)

        events[#events + 1] = macroFrame.MouseLeave:Connect(function()
            macroFrame.DelButton.Visible = false
            macroFrame.EditButton.Visible = false
        end)

        events[#events + 1] = macroFrame.EditButton.MouseButton1Click:Connect(function()
            if ui.NoticeView.Visible then return end
            activeMacro = macro

            ui.NoticeView.Visible = true
            ui.NoticeView.EditMacro.Visible = true

            editMode()
        end)

        events[#events + 1] = macroFrame.DelButton.MouseButton1Click:Connect(function()
            if ui.NoticeView.Visible then return end
            activeMacro = macro

            ui.NoticeView.Visible = true
            ui.NoticeView.NoSolution.Visible = true
            --ui.NoticeView.DeleteMacro.Visible = true
        end)

        canvasSize += macroFrame.AbsoluteSize.Y
    end

    macroList.CanvasSize = UDim2.new(0, 0, 0, canvasSize)
end

local function prepareMacroData(macroData)
    local savedMacros = plugin:GetSetting(`{consts.DataId}Macros`) or {}

    for _, macro in macroData do
        local savedMacro = findMacro(savedMacros, macro.Name)

        -- new default macro. add it to saved list
        if not savedMacro then
            savedMacros[#savedMacros + 1] = macro
        end
    end

    plugin:SetSetting(`{consts.DataId}Macros`, savedMacros)
    macros = savedMacros
end

scriptEditorService.TextDocumentDidChange:Connect(function(doc, changes)
    local line = doc:GetLine()
    local macro = getMacro(line)

    if macro then
        local lastChar = changes[1]["range"]["end"]
        local lineNumber = lastChar["line"]
        local endChar = lastChar["character"] + 1
        local startChar = endChar - #macro.Name - 2

        local newCode = indentCode(macro.Code, line)

        pcall(doc.EditTextAsync, doc, newCode, lineNumber, startChar, lineNumber, endChar)
    end
end)

local function handleButtons()
    ui.NoticeView.DeleteMacro.DelButton.MouseButton1Click:Connect(function()
        if activeMacro then
            local savedMacros = plugin:GetSetting(`{consts.DataId}Macros`) or {}

            for i, macro in savedMacros do
                if macro.Name == activeMacro.Name then

                    -- if default
                    if findMacro(defaultMacros, macro.Name) then
                        macro.Removed = true
                    else
                        -- remove from list
                        table.remove(savedMacros, i)
                    end

                    break
                end
            end

            plugin:SetSetting(`{consts.DataId}Macros`, savedMacros)
            macros = savedMacros
            prepareUI()
        end

        ui.NoticeView.Visible = false
        ui.NoticeView.DeleteMacro.Visible = false
    end)

    ui.NoticeView.DeleteMacro.CancelButton.MouseButton1Click:Connect(function()
        ui.NoticeView.Visible = false
        ui.NoticeView.DeleteMacro.Visible = false
    end)

    ui.NoticeView.EditMacro.SaveButton.MouseButton1Click:Connect(function()
        if activeEditor then
            local newCode = activeEditor.Source
            local savedMacros = plugin:GetSetting(`{consts.DataId}Macros`) or {}

            for _, macro in savedMacros do
                if macro.Name == activeMacro.Name then
                    macro.Code = newCode
                    break
                end
            end

            plugin:SetSetting(`{consts.DataId}Macros`, savedMacros)
            macros = savedMacros
            prepareUI()
        end

        ui.NoticeView.Visible = false
        ui.NoticeView.EditMacro.Visible = false

        if activeEditor then
            activeEditor:Destroy()
            activeEditor = nil
        end
    end)

    ui.NoticeView.EditMacro.CancelButton.MouseButton1Click:Connect(function()
        ui.NoticeView.Visible = false
        ui.NoticeView.EditMacro.Visible = false

        if activeEditor then
            activeEditor:Destroy()
            activeEditor = nil
        end
    end)

    ui.NoticeView.CreateMacro.SaveButton.MouseButton1Click:Connect(function()
        local name = ui.NoticeView.CreateMacro.NameBox.Text
        local desc = ui.NoticeView.CreateMacro.DescBox.Text

        if name:gsub("%s", "") == "" or desc:gsub("%s", "") == "" then
            return
        end

        local savedMacros = plugin:GetSetting(`{consts.DataId}Macros`) or {}
        local foundMacro = findMacro(savedMacros, name)

        if foundMacro then
            -- if default macro was removed, delete it properly
            if foundMacro.Removed then
                for i, macro in savedMacros do
                    if macro.Name == name then
                        table.remove(savedMacros, i)
                        break
                    end
                end

            -- if macro exists, don't allow creation
            else
                return
            end
        end

        -- create new macro
        local newMacro = {
            Name = name,
            Description = desc,
            Code = "print('I am a macro!')"
        }

        savedMacros[#savedMacros + 1] = newMacro
        plugin:SetSetting(`{consts.DataId}Macros`, savedMacros)

        macros = savedMacros
        prepareUI()

        activeMacro = newMacro
        ui.NoticeView.EditMacro.Visible = true
        ui.NoticeView.CreateMacro.Visible = false

        editMode()
    end)

    ui.NoticeView.CreateMacro.CancelButton.MouseButton1Click:Connect(function()
        ui.NoticeView.Visible = false
        ui.NoticeView.CreateMacro.Visible = false
    end)

    ui.UserView.MainMenu.MacroAddButton.MouseButton1Click:Connect(function()
        if ui.NoticeView.Visible then return end

        ui.NoticeView.Visible = true
        ui.NoticeView.NoSolution.Visible = true

        --[[ui.NoticeView.CreateMacro.NameBox.Text = ""
        ui.NoticeView.CreateMacro.DescBox.Text = ""

        ui.NoticeView.Visible = true
        ui.NoticeView.CreateMacro.Visible = true]]
    end)

    ui.UserView.MainMenu.MacroSearch.SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        prepareUI()
    end)
end

function module.SetupMacros(localPlugin, macroData, uiRef)
    ui = uiRef
    plugin = localPlugin
    defaultMacros = macroData

    handleButtons()
    prepareMacroData(macroData)
    prepareUI()
end

return module