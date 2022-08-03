//
var health:Int;     
var rings = 0;
function create() {
    note.frames = Paths.getSparrowAtlas("notes/NOTE_assets");
	
	note.enableRating = false;

	Note.Miss = false;

    switch(note.noteData % PlayState.song.keyNumber) {
        case 0:
            note.animation.addByPrefix('scroll', "gold0");
        case 1:
            note.animation.addByPrefix('scroll', "gold0");
        case 2:
            note.animation.addByPrefix('scroll', "gold0");
        case 3:
            note.animation.addByPrefix('scroll', "gold0");
        case 4:
            note.animation.addByPrefix('scroll', "gold0");
    }


    note.setGraphicSize(Std.int(note.width * 0.7));
    note.updateHitbox();
    note.antialiasing = true;
    note.splashColor = 0xFFF0EC00;

    note.animation.play("scroll");
}

function onMiss() {
	return false;
	
}
function onPlayerHit() {
    FlxG.sound.play(Paths.sound('ring'), 1);
	health += 0;
    rings += 1;
    trace(rings);
}