function create() {
	character.frames = Paths.getCharacter(character.curCharacter);
	character.loadJSON(true);
	animation.addByPrefix('idle', 'sunkyIDLE instance 1', 24);
				animation.addByPrefix('singUP', 'sunkyUP instance 1', 24);
				animation.addByPrefix('singRIGHT', 'sunkyRIGHT instance 1', 24);
				animation.addByPrefix('singDOWN', 'sunkyDOWN instance 1', 24);
				animation.addByPrefix('singLEFT', 'sunkyLEFT instance 1', 24);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");

				playAnim('idle');
}