var floaty:Float = 0.03;
function create() {
	character.frames = Paths.getCharacter(character.curCharacter);
	character.loadJSON(false);
	animation.addByPrefix('idle', 'Fleetway Idle', 24);
	animation.addByPrefix('singUP', 'Fleetway Up', 24);
	animation.addByPrefix('singRIGHT', 'Fleetway Right', 24);
	animation.addByPrefix('singDOWN', 'Fleetway Down', 24);
	animation.addByPrefix('singLEFT', 'Fleetway Left', 24);
	animation.addByPrefix('fastanim', 'Fleetway HowFast', 24, false);

	
	addOffset('idle', 0, 0);
	addOffset("singUP", 0, 36);
	addOffset("singRIGHT", -62, -64);
	addOffset("singLEFT", 221, -129);
	addOffset("singDOWN", 0, -168);
	addOffset("fastanim", 0, 0);
	character.y += Math.sin(floaty) * 1.3;
	character.x += Math.sin(floaty) * 1.3;
	updateHitbox();
}