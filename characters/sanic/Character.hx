function create() {
	character.frames = Paths.getCharacter(character.curCharacter);
	character.loadJSON(true);
	animation.addByPrefix('idle', 'sanic idle', 24);
				animation.addByPrefix('singUP', 'sanic up', 24);
				animation.addByPrefix('singRIGHT', 'sanic right', 24);
				animation.addByPrefix('singDOWN', 'sanic down', 24);
				animation.addByPrefix('singLEFT', 'sanic left', 24);

				addOffset('idle', 0, 0);
				addOffset("singUP", 0, 0);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 0, 0);
				addOffset("singDOWN", 0, 0);

				setGraphicSize(Std.int(width * 0.3));
				updateHitbox();
}