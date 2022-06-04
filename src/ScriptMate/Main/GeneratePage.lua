local module = {}

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

local function getCategory(identifier)
	for _, category in data.Categories do
		if category.GridPlacement == identifier then
			return category
		end
	end
end

local function getFirstPage(category, categoryData)
	for index, score in categoryData.Scores do
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
		button.Completed.Visible = categoryData.Completed
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
		
		if categoryData.Scores[index] == 100 then
			completeCount += 1
			pageRef ..= "Done"
		end
		
		local icon = progress.Pages[pageRef]:Clone()
		
		icon.Name = index - 1
		icon.Visible = true
		icon.Parent = progress.Pages
	end
	
	if completeCount == #categoryData.Scores then
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
		Sources = table.create(#category.Content, category.Template)
	}
	
	plugin:SetSetting(setting, newSettings)
	return newSettings
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
	local score = categoryData.Scores[pageNumber]

	scriptHandler.HideScript()
	practiceView.Completed.Visible = score == 100

	if score > 0 then
		generateFinalScore(page, score)
	else
		quizScore = 0
		module.DisplayQuestion(page, 1)
	end

	exerciseView.Visible = false
	quizView.Visible = true
end

local function generateExercise(page)
	local pageNumber = getPageNumber(page)
	local score = categoryData.Scores[pageNumber]
	
	practiceView.Completed.Visible = score == 100
	exerciseView.TitleLabel.Text = page.Title
	exerciseView.Description.Text = page.Description
	scriptHandler.SetupEnv(categoryData.Sources[pageNumber],
		categoryData, pageNumber, category)
	
	quizView.Visible = false
	exerciseView.Visible = true
end

function module.SetupMenu(localPlugin, newData)
	plugin = localPlugin
	data = newData
	
	for _, category in data.Categories do
		local setting = "scriptmate" .. category.GridPlacement
		
		categoryData = plugin:GetSetting(setting)
			or generateSettings(setting, category)
		
		local episode = episodeGrid._Template:Clone()
		episode.Title.Text = category.Title
		episode.Subtitle.Text = category.Subtitle
		episode.Image = category.BackgroundImage
		episode.Name = category.GridPlacement
		episode.Visible = true
		episode.Completed.Visible = categoryData.Completed
		episode.Parent = episodeGrid
	end
end

local function updatePage(page)
	updateProgress(page, category, categoryData)

	if page.Type == "Exercise" then
		generateExercise(page)
	elseif page.Type == "Quiz" then
		generateQuiz(page)
	end
end

function module.SetupPage(localPlugin, identifier, handler)
	local setting = "scriptmate" .. identifier
	
	plugin = localPlugin
	scriptHandler = handler
	category = getCategory(identifier)
	
	categoryData = plugin:GetSetting(setting)
		or generateSettings(setting, category)
	
	local page = getFirstPage(category, categoryData)
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

function module.CompletedPage(page)
	local pageNumber = getPageNumber(page)
	
	if categoryData.Scores[pageNumber] ~= 100 then
		categoryData.Scores[pageNumber] = 100
		plugin:SetSetting(categoryData.Setting, categoryData)
		scriptHandler.SaveScript(true, categoryData)
		
		local newPage = module.SwitchPage(page, 1)
		
		if newPage == page then
			practiceView.Visible = false
			mainMenu.Visible = true
		end
		
		return newPage
	end
	
	scriptHandler.SaveScript(true)
	return page
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
	categoryData = newCatData
	plugin:SetSetting(categoryData.Setting, categoryData)
end)

return module