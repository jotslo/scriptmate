local color = Enum.StudioStyleGuideColor

local ui = script.Parent.Parent:WaitForChild("UI")
local studio = settings().Studio

local userView = ui.UserView
local footer = ui.Footer

local scriptView = userView.ModScriptView
local httpView = userView.AccessHttpView
local menu = userView.MainMenu
local practiceView = userView.PracticeView

local exerciseView = practiceView.ExerciseView
local quizView = practiceView.QuizView
local progress = practiceView.Progress

local pages = progress.Pages

local questionView = quizView.QuestionView
local finalView = quizView.FinalView

local map = {
	BackgroundColor3 = {
		[ui] = color.MainBackground,

		--v1.2
		[menu.EpisodeSearch] = color.InputFieldBackground,
		[menu.MacroSearch] = color.InputFieldBackground,
		[menu.MacroAddButton] = color.InputFieldBackground

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

		--v1.2
		[menu.MacroList._Template.Title] = color.MainText,
		[menu.EpisodeSearch.SearchBox] = color.MainText,
		[menu.MacroSearch.SearchBox] = color.MainText,
		[menu.EpisodeGrid.Upcoming] = color.MainText,
		[menu.MacroAddButton] = color.MainText,
	},
	ImageColor3 = {
		--[practiceView.HomeButton] = color.MainText,
		[progress.LeftButton] = color.MainText,
		[progress.RightButton] = color.MainText,
		[pages._PageViewing] = color.MainText,
		[pages._Page] = color.MainText,
		[pages._PageDone] = color.MainText,
		[pages._PageViewingDone] = color.MainText,

		--v1.2
		[menu.MacroList._Template.DelButton] = color.MainText,
		[menu.MacroList._Template.EditButton] = color.MainText,
		[menu.EpisodeSearch.Icon] = color.MainText,
		[menu.MacroSearch.Icon] = color.MainText
	},
	PlaceholderColor3 = {
		[menu.EpisodeSearch.SearchBox] = color.DimmedText,
		[menu.MacroSearch.SearchBox] = color.DimmedText
	},
}

return map