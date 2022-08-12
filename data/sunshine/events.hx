import flixel.util.FlxTimer;
import openfl.filters.ShaderFilter;

var dad2:Character;
var shitToHide:Array<Dynamic>;

// note stuff
var _center = [416, 528, 640, 752];
var _right = [736, 848, 960, 1072];

// ty WeldedFlap for the shader code !!
var shader:CustomShader;
var time:Int;
var res:Array<Int>;

function create() {
	defaultCamZoom = 0.9;
	dad2 = new Character(-150, 330, mod + ':tailssunshinealt');
	dad2.visible = false;
	add(dad2);

	shader = new CustomShader(mod + ":vcrDistortion");

	PlayState.camHUD.setFilters([new ShaderFilter(shader)]);
	PlayState.camHUD.filtersEnabled = true;

	PlayState.camGame.setFilters([new ShaderFilter(shader)]);
	PlayState.camGame.filtersEnabled = true;

	res = [FlxG.width, FlxG.height];
	time = 0;
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

function update(elapsed) {
	time += elapsed;

	shader.shaderData.iResolution.value = [res];
	shader.shaderData.iTime.value = [time];
	shader.shaderData.scanlinesOn.value = false;
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
