var bgspec:FlxSprite;

function create() {
	bgspec = new FlxSprite().loadGraphic(Paths.image('stages/TailsBG'));
	bgspec.setGraphicSize(Std.int(bgspec.width * 1.2));
	bgspec.antialiasing = true;
	bgspec.scrollFactor.set(.91, .91);
	bgspec.x -= 370;
	bgspec.y -= 130;
	bgspec.active = false;
	add(bgspec);
	dad.y += 230;
	dad.x -= 250;
	gf.visible = false;
	boyfriend.y += 300;
}

function stepHit(curStep) {
	if (PlayState.song.song == 'sunshine') {
		switch (curStep) {
			case 588:
				bgspec.visible = false;
			case 860:
				bgspec.visible = true;
		}
	}
}
