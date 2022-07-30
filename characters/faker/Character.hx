function create() {
	character.frames = Paths.getCharacter(character.curCharacter);
	character.loadJSON(true);
	animation.addByPrefix('idle', 'FAKER IDLE instance 1', 24);
	animation.addByPrefix('singUP', 'FAKER UP instance 1', 24);
	animation.addByPrefix('singRIGHT', 'FAKER RIGHT instance 1', 24);
	animation.addByPrefix('singDOWN', 'FAKER DOWN instance 1', 24);
	animation.addByPrefix('singLEFT', 'FAKER LEFT instance 1', 24);
	addOffset('idle');
	addOffset("singUP", 0, 67);
	addOffset("singRIGHT", 24, 32);
	addOffset("singLEFT", 177, 29);
	addOffset("singDOWN", -50, -36);
}