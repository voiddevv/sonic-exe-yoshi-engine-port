//
function create() {
	character.frames = Paths.getCharacter(character.curCharacter);
	character.loadJSON(true);
	character.animation.addByPrefix('idle', 'Idle_Flip', 24, false);
	character.animation.addByPrefix('singUP', 'Sing_Up_Flip', 24, false);
	character.animation.addByPrefix('singLEFT', 'Sing_Left_Flip', 24, false);
	character.animation.addByPrefix('singRIGHT', 'Sing_Right_Flip', 24, false);
	character.animation.addByPrefix('singDOWN', 'Sing_Down_Flip', 24, false);
	character.animation.addByPrefix('singUPmiss', 'Up_Miss_Flip', 24, false);
	character.animation.addByPrefix('singLEFTmiss', 'Left_Miss_Flip', 24, false);
	character.animation.addByPrefix('singRIGHTmiss', 'Right_Miss_Flip', 24, false);
	character.animation.addByPrefix('singDOWNmiss', 'Down_Miss_Flip', 24, false);
	addOffset('idle', 46, -12);
	addOffset("singUP", -22, 41);
	addOffset("singRIGHT", 29, 9);
	addOffset("singLEFT", 96, -12);
	addOffset("singDOWN", 74, -14);
	addOffset("singUPmiss", -22, 133);
	addOffset("singRIGHTmiss", 106, 75);
	addOffset("singLEFTmiss", 106, 75);
	addOffset("singDOWNmiss", 105, 1);
	playAnim('idle');
	character.flipX = true;
	character.camOffset.x = 300;
	character.camOffset.y = -250;
}