var hDrain:Float = 0.00001;
health = 2;
var ccap:Int; // ???
// e
// note pos for l/r/center
var _center = [416, 528, 640, 752];
var _left = [96, 208, 320, 432];
var _right = [736, 848, 960, 1072];
var _xCenter = (_center[1] + _center[2]) / 2;

// y pos for upscroll/downscroll
var _down = 570;
var _up = 50;
var _yCenter = (_down + _up) / 2;

function onGenerateStaticArrows() {
	cpuStrums.forEach(function(e:FlxSprite) {
		e.visible = false;
		e.alpha = 0.025;
		e.scrollSpeed = -0.2;
		// e.notes_angle = 180;
		e.x = _right[e.ID];
	});
}

function update(elapsed:Float) {
	ccap = combo;
	if (combo > 40)
		ccap = 40;

	hDrain = 0.0000001;

	health -= hDrain * (500 / ((ccap + 1) / 8) * ((misses + 1) / 1.9));
}

function onMiss() {
	health -= 0.04;
	health += 0.125;
}

function onPlayerHit() {
	health -= 0.018;
}