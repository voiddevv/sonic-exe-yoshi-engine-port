//
var spinArray = [
	272, 276, 336, 340, 400, 404, 464, 468, 528, 532, 592, 596, 656, 660, 720, 724, 784, 788, 848, 852, 912, 916, 976, 980, 1040, 1044, 1104, 1108, 1424,
	1428, 1488, 1492, 1552, 1556, 1616, 1620
];

function create() {
	PlayState.autoCamZooming = false;
}

var offset = 0;

function beatHit(curBeat) { // fixing the offset cam zoom thing
	// NOTE: this method will break (but not cause any errors) if the song isn't starting from the very beginning (example: using [Play Here] from charter)
	if (curBeat == (2 + (4 * offset))) {
		camGame.zoom += 0.025;
		camHUD.zoom += 0.02;
		offset++;
	}
}

var spinTime = (Conductor.stepCrochet / 1000) * 3;
var twnParam = {ease: FlxEase.circOut};

function stepHit(curStep) {
	for (i in spinArray)
		if (curStep == i) {
			PlayState.strumLineNotes.forEach(function(tospin:FlxSprite) {
				FlxTween.angle(tospin, 0, 360, spinTime, twnParam);
			});

			FlxTween.angle(iconP1, 0, 360, spinTime, twnParam);
			FlxTween.angle(iconP2, 0, 360, spinTime, twnParam);

			camHUD.zoom += 0.035;
		}
}

function update(elapsed) {
	// keep the actual notes steady since rotating the strums causes the notes to spin with it lmao
	var shitMan = [PlayState.cpuStrums, PlayState.playerStrums];
	for (i in shitMan)
		i.forEach(function(e:FlxSprite) {
			e.notes_angle = 0;
		});

	PlayState.notes.forEach(function(e:FlxSprite) {
		e.angle = 0;
	});
}
