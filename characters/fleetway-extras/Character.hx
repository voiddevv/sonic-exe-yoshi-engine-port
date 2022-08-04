function create() {
	character.frames = Paths.getCharacter(character.curCharacter);
	animation.addByPrefix('a', 'Fleetway Show You', 24, false);
				animation.addByPrefix('b', 'Fleetway Scream', 24, false);
				animation.addByPrefix('c', 'Fleetway Growl', 24, false);
				animation.addByPrefix('d', 'Fleetway Shut Up', 24, false);
				animation.addByPrefix('e', 'Fleetway Right Alt', 24, true);

				addOffset('a', 0, 0);
				addOffset("b", 0, 0);
				addOffset("c", 0, 0);
				addOffset("d", 0, 0);
				addOffset("e", 0, 0);

				updateHitbox();

				playAnim('a', true);
				playAnim('b', true);
				playAnim('c', true);
				playAnim('d', true);
				playAnim('e', true);
}