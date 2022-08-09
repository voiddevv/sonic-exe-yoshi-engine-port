var lmao:Bool = false;
var rot:Int = 20;
var time = (Conductor.crochet / 1000) * 0.9;

var twnParams = {
	ease: FlxEase.circOut
};

function beatHit(curBeat) {
	PlayState.cpuStrums.forEach(function(e:FlxSprite) {
		// e.notes_angle = (lmao ? -rot : rot);
		// FlxTween.tween(e, {notes_angle: 0}, time, twnParams);

		// e.angle = (lmao ? -rot / 4 : rot / 4);
		// FlxTween.tween(e, {angle: 0}, time, twnParams);

		e.scrollSpeed = 1;
		FlxTween.tween(e, {scrollSpeed: 2.7}, time, twnParams);
	});

	PlayState.playerStrums.forEach(function(e:FlxSprite) {
		// e.notes_angle = (lmao ? -rot : rot);
		// FlxTween.tween(e, {notes_angle: 0}, time, twnParams);

		// e.angle = (lmao ? -rot / 4 : rot / 4);
		// FlxTween.tween(e, {angle: 0}, time, twnParams);

		e.scrollSpeed = 1;
		FlxTween.tween(e, {scrollSpeed: 2.7}, time, twnParams);
	});

	lmao = !lmao;
}
