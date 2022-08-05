import flixel.util.FlxTimer;
import openfl.filters.ShaderFilter;

var dad2:Character;
var shitToHide:Array<Dynamic>;
var shader:CustomShader;

// note pos for l/r/center
var _center = [416, 528, 640, 752];
var _left = [96, 208, 320, 432];
var _right = [736, 848, 960, 1072];
var _xCenter = (_center[1] + _center[2]) / 2;

// y pos for upscroll/downscroll
var _down = 570;
var _up = 50;
var _yCenter = (_down + _up) / 2;

function create() {
	defaultCamZoom = 0.9;
	dad2 = new Character(-150, 330, mod + ':tailssunshinealt');
	dad2.visible = false;
	add(dad2);
}

function createPost() {
	shitToHide = [
		PlayState.healthBarBG,
		PlayState.healthBar,
		PlayState.iconP1,
		PlayState.iconP2,
		PlayState.scoreTxt,
		boyfriend
	];
}

function createInFront() {
	shader = new CustomShader(mod + ':VCR');
	PlayState.camGame.setFilters([new ShaderFilter(shader)]);
	PlayState.camGame.filtersEnabled = true;
}

function update(elapsed) {
	shader.setValue('iTime', Conductor.songPosition / 1000);
	shader.setValue('iResolution', 2000);
}

var funnyDark:Bool = false;

function stepHit(curStep:Int) {
	switch curStep {
		case 588:
			for (i in shitToHide)
				i.visible = false;
			remove(dad);
			dads.push(dad2);
			dad2.visible = true;
			funnyDark = true;

			for (i in PlayState.playerStrums)
				i.alpha = 0;
			for (i in PlayState.cpuStrums)
				i.alpha = 0;

			for (i in 0...PlayState.playerStrums.length) {
				PlayState.playerStrums.members[i].x = _center[i];
			}
		case 860:
			add(dad);
			boyfriend.visible = true;
			remove(dad2);

			funnyDark = false;
			for (i in shitToHide)
				i.visible = true;

			for (i in PlayState.playerStrums)
				i.alpha = 1;
			for (i in PlayState.cpuStrums)
				i.alpha = 1;

			for (i in 0...PlayState.playerStrums.length) {
				PlayState.playerStrums.members[i].x = _right[i];
			}
	}
}

function onDadHit(note) {
	if (funnyDark && !note.isSustainNote)
		playerStrums.forEach(function(spr:FlxSprite) {
			spr.alpha = 0.7;
			if (spr.alpha != 0) {
				new FlxTimer().start(0.01, function(trol:FlxTimer) {
					spr.alpha -= 0.03;
					if (spr.alpha != 0)
						trol.reset();
				});
			}
		});
}
