function create() {
	character.frames = Paths.getCharacter(character.curCharacter);
	animation.addByPrefix('idle', 'TailsDoll IDLE instance', 24);
	animation.addByPrefix('singUP', 'TailsDoll UP instance', 24);
	animation.addByPrefix('singRIGHT', 'TailsDoll RIGHT instance', 24);
	animation.addByPrefix('singDOWN', 'TailsDoll DOWN instance', 24);
	animation.addByPrefix('singLEFT', 'TailsDoll LEFT instance', 24);
	character.camOffset.x = 130;
	character.camOffset.y = -200;
	addOffset('idle', -21, 189);
	addOffset("singUP", 0, 297);
	addOffset("singRIGHT", -164, 187);
	addOffset("singLEFT", 80, 156);
	addOffset("singDOWN", -34, 70);
	playAnim('idle');

}