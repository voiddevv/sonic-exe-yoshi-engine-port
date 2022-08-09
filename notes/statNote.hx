//

function create() {
	daNoteStatic = new FlxSprite(0, 0);
	daNoteStatic.frames = Paths.getSparrowAtlas('notes/hitStatic');
	daNoteStatic.animation.addByPrefix('static', 'staticANIMATION', 24, false);
	daNoteStatic.animation.play('static', true);
	daNoteStatic.alpha = 0.0000001;
	note.frames = Paths.getSparrowAtlas("notes/staticNotes");

	switch (note.noteData % PlayState.song.keyNumber) {
		case 0:
			note.animation.addByPrefix('scroll', "purple static");
		case 1:
			note.animation.addByPrefix('scroll', "blue static");
		case 2:
			note.animation.addByPrefix('scroll', "green static");
		case 3:
			note.animation.addByPrefix('scroll', "green static");
		case 4:
			note.animation.addByPrefix('scroll', "red static");
	}

	note.setGraphicSize(Std.int(note.width * 0.7));
	note.updateHitbox();
	note.antialiasing = true;
	note.splashColor = 0xFFFF0000;

	note.animation.play("scroll");
}

function onMiss() {
	trace('lol you missed the static note!');
	health -= 0.35;

	daNoteStatic.setGraphicSize(FlxG.width, FlxG.height);
	daNoteStatic.screenCenter();
	daNoteStatic.cameras = [camHUD];
	daNoteStatic.alpha = 1;
	daNoteStatic.animation.play('static', true);

	shakeCam2 = true;

	new FlxTimer().start(0.8, function(tmr:FlxTimer) {
		shakeCam2 = false;
	});

	FlxG.sound.play(Paths.sound("hitStatic1"));

	add(daNoteStatic);

	new FlxTimer().start(.38, function(trol:FlxTimer) // fixed lmao
	{
		daNoteStatic.alpha = 0;
		trace('ended HITSTATICLAWL');
		remove(daNoteStatic);
	});
}
