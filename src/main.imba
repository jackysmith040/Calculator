global css body m:0 p:0 bgc:violet5 d@md:flex ja@md:center max-width:1200px m:0 auto

# Get the display element
let display = ''

# Define an event handler function for button clicks
def handleButtonClick event
	const button = event.target

	unless button.matches('button')
		return 
	
	# Get the clicked button's text
	const buttonText = button.textContent

	# Update the display based on the clicked button
	if buttonText === '='
		computeResult!
	elif buttonText === 'C'
		clearDisplay!
	elif buttonText === 'del'
		deleteLastCharacter!
	else
		appendToDisplay(buttonText)

def computeResult
	const expression = display

	try
		# Use the built-in eval() function to evaluate the expression
		const result = eval(expression)
		# Update the display with the calculated result
		display = result
	
	catch error
		display = 'Error'

def clearDisplay
	display = ''

def deleteLastCharacter
	const currentText = display
	display = currentText.slice(0, -1);

def appendToDisplay text
	display += text

tag keypad
	<self[d:flex ja:center]>
		css bgc:violet2 w:412px @md:0 h:639.8px @md:0 pos:absolute t:32% @md:70% m:auto
			button bgc:gray4 c:pink6 size:3.5rem @md:2.5rem fs:3xl @md:2xl rd:full bd:none bxs:xxl
			.equal bgc:rose3 c:white 
			
		<div>
			# Attach the event listener to the parent element
			<div @click=handleButtonClick>
				css p:1rem d:grid gtc:repeat(4,1fr) grid-gap:2rem ta:center bxs:xxl

				<button> "C"
				<button> "*-1"
				<button> "del"
				<button> "/"
				<button> "7"
				<button> "8"
				<button> "9"
				<button> "*"
				<button> "4"
				<button> "5"
				<button> "6"
				<button> "-"
				<button> "1"
				<button> "2"
				<button> "3"
				<button> "+"
				<button> "0"
				<button> "."
				<button.equal> "="
			

tag face
	<self>
		<div>
			css bgc:rose3 @md:rose2 bxs@md:xxl rd@md:full 30% h:274.2px  w:412px pos:absolute d:flex ja:end @md:center r@md:30%
			<p[m:0 py:0.5rem px:3rem fs:5xl c:white bxs:xxl]> display
		
	
tag calc
	<self>
		<face>
		<keypad>


imba.mount <calc>