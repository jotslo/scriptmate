-- (C) 2023 jotslo. All rights reserved.
-- Redistribution of ScriptMate and/or its contents is forbidden.

local function grabContent()
    local episodes = {}

    for _, episode in script:GetChildren() do
        if not episode:IsA("LuaSourceContainer") then
            continue
        end

        local module = require(episode)

        episodes[#episodes + 1] = {
            Title = module.Metadata.Title,
            Subtitle = module.Metadata.Subtitle,
            BackgroundImage = module.Metadata.BackgroundImage,
            GridPlacement = module.Metadata.GridPlacement,
            Template = module.Metadata.Template,
            Content = module.Content,
            NoTC = module.Metadata.NoTC
        }
    end

    return episodes
end

return {Categories = grabContent()}