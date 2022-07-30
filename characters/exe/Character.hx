function create() {
	character.frames = Paths.getCharacter(character.curCharacter);
	character.loadJSON(false);
	animation.addByPrefix('idle', 'Exe Idle', 24);
	animation.addByPrefix('singUP', 'Exe Up', 24);
	animation.addByPrefix('singRIGHT', 'Exe Right', 24);
	animation.addByPrefix('singDOWN', 'Exe Down', 24);
	animation.addByPrefix('singLEFT', 'Exe left', 24);
	addOffset('idle', 0, 248);
	addOffset("singUP", 95, 290);
	addOffset("singRIGHT", 31, 217);
	addOffset("singLEFT", 236, 243);
	addOffset("singDOWN", 185, 44);
	FlxTween.tween(FlxG.camera, {zoom: 0.8}, 0.4, {ease: FlxEase.cubeOut});
	character.camOffset.y = -300;
	character.camOffset.x = -100;
	
}