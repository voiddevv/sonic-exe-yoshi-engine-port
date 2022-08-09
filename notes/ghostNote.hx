//
var heatlhDrop:Float = 0;

function create() {
	note.frames = Paths.getSparrowAtlas("notes/PhantomNote");
	note.enableRating = false;

	switch (note.noteData % PlayState.song.keyNumber) {
		case 0:
			note.animation.addByPrefix('scroll', "purple withered");
		case 1:
			note.animation.addByPrefix('scroll', "blue withered");
		case 2:
			note.animation.addByPrefix('scroll', "green withered");
		case 3:
			note.animation.addByPrefix('scroll', "red withered");
	}

	note.setGraphicSize(Std.int(note.width * 0.7));
	note.updateHitbox();
	note.x += 10;
	note.antialiasing = true;
	note.splashColor = 0xFFE90000;

	note.animation.play("scroll");
}

function onMiss() {
	return false;
}

function onPlayerHit() {
	health -= .6;

	var health:Int;
}
