function create() {
	character.frames = Paths.getCharacter(character.curCharacter);
	//character.loadJSON(true);
	animation.addByPrefix('idle', 'Eggman_Idle', 24);
	animation.addByPrefix('singUP', 'Eggman_Up', 24);
	animation.addByPrefix('singRIGHT', 'Eggman_Right', 24);
	animation.addByPrefix('singDOWN', 'Eggman_Down', 24);
	animation.addByPrefix('singLEFT', 'Eggman_Left', 24);
	animation.addByPrefix('laugh', 'Eggman_Laugh', 35, false);
	addOffset('idle', -5, 5);
	addOffset("singUP", 110, 231);
	addOffset("singRIGHT", 40, 174);
	addOffset("singLEFT", 237, 97);
	addOffset("singDOWN", 49, -95);
	addOffset('laugh', -10, 210);
	character.camOffset.x = 100 ;
	character.camOffset.y = - 50 ;
	updateHitbox();

}