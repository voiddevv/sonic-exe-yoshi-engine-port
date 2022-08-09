function create() {
	character.frames = Paths.getCharacter(character.curCharacter);
	animation.addByPrefix('idle', 'SSBF IDLE instance 1', 24);
	animation.addByPrefix('singUP', 'SSBF UP instance 1', 24);
	animation.addByPrefix('singLEFT', 'SSBF LEFT instance 1', 24);
	animation.addByPrefix('singRIGHT', 'SSBF RIGHT instance 1', 24);
	animation.addByPrefix('singDOWN', 'SSBF DOWN instance 1', 24);
	animation.addByPrefix('singUPmiss', 'SSBF UPmiss instance 1', 24);
	animation.addByPrefix('singLEFTmiss', 'SSBF LEFTmiss instance 1', 24);
	animation.addByPrefix('singRIGHTmiss', 'SSBF RIGHTmiss instance 1', 24);
	animation.addByPrefix('singDOWNmiss', 'SSBF DOWNmiss instance 1', 24);
	addOffset('idle', -5);
	addOffset("singUP", -5, 6);
	addOffset("singRIGHT", -12, -1);
	addOffset("singLEFT", 18, 12);
	addOffset("singDOWN", -2, -9);
	addOffset("singUPmiss", -11, 6);
	addOffset("singRIGHTmiss", 3, 11);
	addOffset("singLEFTmiss", 14, 0);
	addOffset("singDOWNmiss", 13, 17);
	playAnim('idle');
	flipX = true;
}
