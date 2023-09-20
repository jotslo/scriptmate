local color = Enum.StudioStyleGuideColor

local ui = script.Parent.Parent:WaitForChild("UI")

local userView = ui.UserView
local footer = ui.Footer

local scriptView = userView.ModScriptView
local httpView = userView.AccessHttpView
local menu = userView.MainMenu
local practiceView = userView.PracticeView
local fixView = userView.FixModView

local exerciseView = practiceView.ExerciseView
local quizView = practiceView.QuizView
local progress = practiceView.Progress

local pages = progress.Pages

local questionView = quizView.QuestionView
local finalView = quizView.FinalView

local map = {
	BackgroundColor3 = {
		[ui] = color.MainBackground
	},
	TextColor3 = {
		[scriptView.MainLabel] = color.MainText,
		[scriptView.Description] = color.MainText,
		[httpView.MainLabel] = color.MainText,
		[httpView.Description] = color.MainText,
		--[menu.MainLabel] = color.MainText,
		--[practiceView.MainLabel] = color.MainText,
		[exerciseView.TitleLabel] = color.MainText,
		[exerciseView.Description] = color.MainText,
		[questionView.Question] = color.MainText,
		[questionView.QuestionNumber] = color.MainText,
		[finalView.FailLabel] = color.MainText,
		[finalView.PassLabel] = color.MainText,
		[finalView.Title] = color.MainText,
		[footer.Title] = color.MainText,

		[fixView.MainLabel] = color.MainText,
		[fixView.s1txt] = color.MainText,
		[fixView.s2txt] = color.MainText,
		[fixView.s3txt] = color.MainText,
		[fixView.s4txt] = color.MainText
	},
	ImageColor3 = {
		--[practiceView.HomeButton] = color.MainText,
		[progress.LeftButton] = color.MainText,
		[progress.RightButton] = color.MainText,
		[pages._PageViewing] = color.MainText,
		[pages._Page] = color.MainText,
		[pages._PageDone] = color.MainText,
		[pages._PageViewingDone] = color.MainText
	}
}

return map