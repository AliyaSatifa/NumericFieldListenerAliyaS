-----------------------------------------------------------------------------------------
---- Title: NumericTextFields
-- Name: Your Name
-- Course: ICS2O/3C
-- This program displays a match questioon and asks the user to answer in a numeric textfield.
-- terminnal
--
-----------------------------------------------------------------------------------------

-- hide the status 
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour 
display.setDefault("background", 124/255, 249/255, 199/255)

-------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-------------------------------------------------------------------------------------------

-- create Local Variables 
local questionObject
local correctObject
local NumericTextField
local randomNumber1
local randomNumber2
local userAnswer 
local correctAnswer 

------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
------------------------------------------------------------------------------------------

local function AskQuestion()
	-- genrate 2 random numbers between a max. and a min. number 
	randomNumber1 = math.random(0, 10)
    randomNumber2 = math.random(0,10)

    correctAnswer = randomNumber1 + randomNumber2

    -- create question in text object
    questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "


end 

local function HideCorrect()
     correctObject.isVisible = false 
     AskQuestion()
end  

local function NumericFieldListener( event ) 

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then 

		-- clear text field 
		event.target.text = ""

	elseif event.phase == "submitted" then 
		-- when the answer is sumbmitted (enter key is processed) set user input to users's answer 
		userAnswer = tonumber(event.target.text)


		-- if the users answer and the corrct answrer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(2000, HideCorrect)
		end 
	end 
end 

----------------------------------------------------------------------------------------
-- OBJECT CREATION
--------------------------------------------------------------------------------------------
-- displays a question and sets the color 
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(155/255, 42/255, 198/255)

-- create the correct text object and make it invisible
correctObject = display.newText ( "Correct!" , display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isVisible = false 

-- Create numeric field 
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )



numericField.inputType = "number"

-- add the event listener for the numeric field 
numericField:addEventListener( "userInput", NumericFieldListener )

----------------------------------------------------------------------------
