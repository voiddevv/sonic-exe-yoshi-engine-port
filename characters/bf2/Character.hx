//
function create() {
	character.frames = Paths.getCharacter(character.curCharacter);
	character.loadJSON(true); // Setting to true will override getColors() and dance().

	animation.addByPrefix('idle', 'Idle', 24, false);
				animation.addByPrefix('singUP', 'Sing_Up', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing_Left', 24, false);
				animation.addByPrefix('singLEFT', 'Sing_Right', 24, false);
				animation.addByPrefix('singDOWN', 'Sing_Down', 24, false);
				animation.addByPrefix('singUPmiss', 'Up_Miss', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Left_Miss', 24, false);
				animation.addByPrefix('singLEFTmiss', 'Miss_Right', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Down_Miss', 24, false);

				addOffset('idle', 5, 4);
				addOffset("singUP", 23, 63);
				addOffset("singLEFT", 31, 9);
				addOffset("singRIGHT", -75, -15);
				addOffset("singDOWN", -51, -1);
				addOffset("singUPmiss", 20, 135);
				addOffset("singLEFTmiss", 10, 92);
				addOffset("singRIGHTmiss", -70, 85);
				addOffset("singDOWNmiss", -53, 10);

				playAnim('idle');

}