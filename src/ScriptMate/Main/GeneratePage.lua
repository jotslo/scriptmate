local module = {}
local consts = require(script.Parent.Consts)

local scriptHandler
local categoryData
local quizScore
local category
local plugin
local data

local ui = script.Parent.Parent.UI
local updateData = script.Parent.UpdateData

local episodeGrid = ui.UserView.MainMenu.EpisodeGrid
local practiceView = ui.UserView.PracticeView
local mainMenu = ui.UserView.MainMenu

local exerciseView = practiceView.ExerciseView
local quizView = practiceView.QuizView
local progress = practiceView.Progress

local questionView = quizView.QuestionView
local finalView = quizView.FinalView

local function shuffleAnswers(answers)
	local newIndex, temp
	for oldIndex = #answers, 1, -1 do
		newIndex = math.random(oldIndex)
		temp = answers[oldIndex]
		answers[oldIndex] = answers[newIndex]
		answers[newIndex] = temp
	end
	
	return answers
end

function module.GetCategory(identifier)
	for _, category in data.Categories do
		if category.GridPlacement == identifier then
			return category
		end
	end
end

local function getFirstPage(category, categoryData)
	for index, score in categoryData.Scores or {} do
		if score < 100 then
			return category.Content[index]
		end
	end
	
	return category.Content[1]
end

local function getPageNumber(currentPage)
	for index, page in category.Content do
		if page == currentPage then
			return index
		end
	end
end

local function getScoreColor(score)
	if score == 100 then
		return Color3.new(0, 1, 0)
	elseif score >= 50 then
		return Color3.new(1, 1, 0)
	end

	return Color3.new(1, 0, 0)
end

local function updateMenuTick(category, categoryData)
	local button = episodeGrid:FindFirstChild(category.GridPlacement)
	
	if button then
		button.Completed.Visible = categoryData.Completed or false
	end
end

local function updateProgress(currentPage, category, categoryData)
	local completeCount = 0
	
	for _, pageIcon in progress.Pages:GetChildren() do
		if pageIcon:IsA("ImageLabel") and pageIcon.Visible then
			pageIcon:Destroy()
		end
	end
	
	for index, page in category.Content do
		local pageRef = "_Page"
		
		if page == currentPage then
			pageRef ..= "Viewing"
		end
		
		if categoryData.Scores and categoryData.Scores[index] == 100 then
			completeCount += 1
			pageRef ..= "Done"
		end
		
		local icon = progress.Pages[pageRef]:Clone()
		
		icon.Name = index - 1
		icon.Visible = true
		icon.Parent = progress.Pages
	end
	
	if completeCount == #(categoryData.Scores) then
		categoryData.Completed = true
		plugin:SetSetting(categoryData.Setting, categoryData)
	end
	
	updateMenuTick(category, categoryData)
end

local function generateSettings(setting, category)
	local newSettings = {
		Completed = false,
		Setting = setting,
		Scores = table.create(#category.Content, 0),
		Sources = table.create(#category.Content, category.Template),
		Version = consts.Version
	}
	
	plugin:SetSetting(setting, newSettings)
	return newSettings
end

local function getData(setting, category)
	local data = plugin:GetSetting(setting)

	if data then
		-- if the data is outdated, backup in-case of corruption
		if not data.Version or data.Version ~= consts.Version then
			local backupKey = `bkpv{data.Version or "1.1"}`
			plugin:SetSetting(backupKey .. setting, data)

			-- update the version and save
			data.Version = consts.Version
			plugin:SetSetting(setting, data)
		end

		return data
	end

	-- data doesn't exist. let's just generate it
	return generateSettings(setting, category)
end

local function generateFinalScore(page, score)
	finalView.ScoreLabel.Text = score .. "%"
	finalView.ScoreLabel.TextColor3 = getScoreColor(score)

	finalView.FailLabel.Visible = score < 100
	finalView.PassLabel.Visible = score == 100
	
	if score == 100 then
		practiceView.Completed.Visible = true
	end
	
	if categoryData.Scores[#categoryData.Scores] < 100 then
		categoryData.Scores[#categoryData.Scores] = score
		plugin:SetSetting(categoryData.Setting, categoryData)
	end
	
	updateProgress(page, category, categoryData)
	
	questionView.Visible = false
	finalView.Visible = true
end

local function generateQuiz(page)
	local pageNumber = getPageNumber(page)
	local score = categoryData.Scores[pageNumber] or 0

	scriptHandler.HideScript()
	practiceView.Completed.Visible = score == 100
	quizScore = 0

	if score > 0 then
		generateFinalScore(page, score)
	else
		module.DisplayQuestion(page, 1)
	end

	exerciseView.Visible = false
	quizView.Visible = true
end

local function generateExercise(page)
	local pageNumber = getPageNumber(page)
	local score = categoryData.Scores[pageNumber] or 0
	local isStatement = page.Title == "Welcome!"
	local isAd = page.Title == "Hello!"
	
	practiceView.Completed.Visible = score == 100
	exerciseView.TitleLabel.Text = page.Title
	exerciseView.Description.Text = page.Description

	exerciseView.OkButton.Visible = isStatement and not isAd
	exerciseView.TestButton.Visible = not isStatement and not isAd
	exerciseView.HintButton.Visible = not isStatement and not isAd
	practiceView.Progress.Visible = not isStatement and not isAd

	scriptHandler.SetupEnv(categoryData.Sources[pageNumber],
		categoryData, pageNumber, category)
	
	quizView.Visible = false
	exerciseView.Visible = true
end

function module.SetupMenu(localPlugin, newData, searchContent)
	plugin = localPlugin
	data = newData

	local sizeLimit = 0

	-- remove existing episodes
	for _, episode in episodeGrid:GetChildren() do
		if episode:IsA("ImageButton") and episode.Name ~= "_Template" then
			episode:Destroy()
		end
	end
	
	for _, category in data.Categories do
		local setting = consts.DataId .. category.GridPlacement
		
		categoryData = getData(setting, category)

		-- if this is a search, check whether the episode matches
		if searchContent then
			local episodeContent = category.Title .. category.Subtitle
			episodeContent = episodeContent:lower():gsub("%s", "")

			if not episodeContent:find(searchContent, 1, true) then
				continue
			end
		end
		
		local episode = episodeGrid._Template:Clone()
		episode.Title.Text = category.Title
		episode.Subtitle.Text = category.Subtitle
		episode.Image = category.BackgroundImage
		episode.Name = category.GridPlacement
		episode.Visible = true
		episode.Completed.Visible = categoryData.Completed
		episode.Parent = episodeGrid

		sizeLimit += episode.AbsoluteSize.Y + 10
	end

	-- adapt canvas size to fit all episodes.
	-- there is a grid, so an odd number of episodes 
	sizeLimit = sizeLimit % 2 == 0 and sizeLimit or sizeLimit + 1
	sizeLimit = math.ceil(sizeLimit / 2)

	episodeGrid.CanvasSize = UDim2.new(0, 0, 0, sizeLimit)
end

local function updatePage(page)
	updateProgress(page, category, categoryData)
	exerciseView.HintButton.Visible = true
	exerciseView.SolButton.Visible = false
	
	if page.Type == "Exercise" then
		generateExercise(page)
	elseif page.Type == "Quiz" then
		generateQuiz(page)
	end
end

function module.SetupPage(localPlugin, identifier, handler)
	local setting = consts.DataId .. identifier -- //////////// "scriptmate" .. identifier
	
	plugin = localPlugin
	scriptHandler = handler

	category = module.GetCategory(identifier)
	categoryData = getData(setting, category)
	
	-- if categories are missing from database,
	-- add the missing values. prevents corruption
	if #categoryData.Sources < #category.Content then
		for i = 1, #category.Content - #categoryData.Sources do
			categoryData.Sources[#categoryData.Sources + 1] = category.Template
			categoryData.Scores[#categoryData.Scores + 1] = 0
		end

		categoryData.Setting = setting
	end
	
	practiceView.MainLabel.Text = category.Subtitle
	
	local page = getFirstPage(category, categoryData)

	-- if page could not be found, go to page 1
	if not page then
		page = category.Content[1]
	end

	updatePage(page)
	
	return page
end

function module.SwitchPage(page, direction)
	local pageNumber = getPageNumber(page) + direction
	
	if pageNumber > #category.Content or pageNumber < 1 then
		return page
	end
	
	local page = category.Content[pageNumber]
	updatePage(page)
	
	return page
end

function module.CompletedPage(page, isStatement)
	local pageNumber = getPageNumber(page)
	
	if categoryData.Scores[pageNumber] ~= 100 then
		categoryData.Scores[pageNumber] = 100

		if isStatement then
			categoryData.Completed = true
		end

		plugin:SetSetting(categoryData.Setting, categoryData)
		scriptHandler.SaveScript(true, categoryData)
		
		local newPage = module.SwitchPage(page, 1)

		if isStatement then
			updateMenuTick(category, categoryData)
		end
		
		if newPage == page or isStatement then
			practiceView.Visible = false
			mainMenu.Visible = true
		end
		
		return newPage
	end
	
	scriptHandler.SaveScript(true)

	return page
end

function module.GetSolution()
	print(categoryData, category, data)
end

function module.DisplayQuestion(page, questionNumber)
	local question = page.Questions[questionNumber]
	local answers = shuffleAnswers({question.Answer,
		question.False1, question.False2, question.False3})

	questionView.Question.Text = question.Question
	questionView.QuestionNumber.Text = "Question "
		.. questionNumber .. " of " .. #page.Questions

	questionView.Answer1.Text = answers[1]
	questionView.Answer2.Text = answers[2]
	questionView.Answer3.Text = answers[3]
	questionView.Answer4.Text = answers[4]

	questionView.Visible = true
	finalView.Visible = false
end

function module.NextQuestion(page, button, questionNumber)
	local question = page.Questions[questionNumber]
	
	if button.Text == question.Answer then
		quizScore += 1
	end
	
	if questionNumber < #page.Questions then
		module.DisplayQuestion(page, questionNumber + 1)
	else
		generateFinalScore(page, math.floor((quizScore / #page.Questions) * 100))
		quizScore = 0
	end
end

updateData.Event:Connect(function(newCatData)
	if newCatData and newCatData.Setting then
		categoryData = newCatData
		plugin:SetSetting(categoryData.Setting, categoryData)
	end
end)

return module