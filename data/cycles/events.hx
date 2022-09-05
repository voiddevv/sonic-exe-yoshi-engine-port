import openfl.filters.ShaderFilter;

var _center = [416, 528, 640, 752];
var _left = [96, 208, 320, 432];
var _right = [736, 848, 960, 1072];
var _xCenter = (_center[1] + _center[2]) / 2;

// y pos for upscroll/downscroll
var _down = 570;
var _up = 50;
var _yCenter = (_down + _up) / 2;

// other shit
var blammed:CustomShader;
var angleOffset:Float = 0;

function createPost() {
	blammed = new CustomShader("Friday Night Funkin':blammed");

	PlayState.boyfriend.shader = blammed;
	PlayState.boyfriend.shader.shaderData.r.value = [49 / 255];
	PlayState.boyfriend.shader.shaderData.g.value = [176 / 255]; // nice
	PlayState.boyfriend.shader.shaderData.b.value = [209 / 255];
	PlayState.boyfriend.shader.shaderData.enabled.value = [true];

	PlayState.dad.shader = blammed;
	PlayState.dad.shader.shaderData.r.value = [49 / 255];
	PlayState.dad.shader.shaderData.g.value = [176 / 255]; // nice
	PlayState.dad.shader.shaderData.b.value = [209 / 255];
	// PlayState.dad.shader.shaderData.enabled.value = [true];
	PlayState.dad.shader.shaderData.enabled.value = [false];
}

function onGenerateStaticArrows() {
	for (i in PlayState.cpuStrums) {
		if (!PlayState.fromCharter) {
			i.visible = false;
		}
		i.y = i.y - (EngineSettings.downscroll ? -500 : 275);
	}

	for (i in PlayState.playerStrums) {
		if (!PlayState.fromCharter) {
			i.visible = false;
		}
		i.y = i.y - (EngineSettings.downscroll ? -500 : 275);
	}
}

function onCountdown(deez) {
	switch (deez) {
		case 3:
			for (i in PlayState.cpuStrums) {
				i.y = i.y - (EngineSettings.downscroll ? -500 : 275);
			}

			for (i in PlayState.playerStrums) {
				i.y = i.y - (EngineSettings.downscroll ? -500 : 275);
			}
	}
}

function stepHit(curStep:Int) {
	switch (curStep) {
		case 31:
			trace('strum go up/down woah');
			PlayState.cpuStrums.forEach(function(e:FlxSprite) {
				FlxTween.tween(e, {y: e.y + (EngineSettings.downscroll ? -500 : 275)}, (Conductor.crochet / 1000) * 8, {
					ease: FlxEase.circInOut
				});
			});
			PlayState.playerStrums.forEach(function(e:FlxSprite) {
				FlxTween.tween(e, {y: e.y + (EngineSettings.downscroll ? -500 : 275)}, (Conductor.crochet / 1000) * 8, {
					ease: FlxEase.circInOut
				});
			});

		case 256:
			trace('strum go out of screen lmao');
			PlayState.cpuStrums.forEach(function(e:FlxSprite) {
				FlxTween.tween(e, {y: e.y + (EngineSettings.downscroll ? 500 : -275)}, (Conductor.crochet / 1000) * 8, {
					ease: FlxEase.circInOut
				});
			});
			PlayState.playerStrums.forEach(function(e:FlxSprite) {
				FlxTween.tween(e, {y: e.y + (EngineSettings.downscroll ? 500 : -275)}, (Conductor.crochet / 1000) * 8, {
					ease: FlxEase.circInOut
				});
			});

		case 288:
			for (i in 0...PlayState.cpuStrums.length) {
				PlayState.cpuStrums.members[i].x = _center[i];
			}
			for (i in 0...PlayState.playerStrums.length) {
				PlayState.playerStrums.members[i].x = _center[i];
			}

			PlayState.cpuStrums.forEach(function(e:FlxSprite) {
				FlxTween.tween(e, {y: e.y + (EngineSettings.downscroll ? -500 : 275), alpha: 0.25}, (Conductor.crochet / 1000) * 8, {
					ease: FlxEase.circInOut
				});
			});
			PlayState.playerStrums.forEach(function(e:FlxSprite) {
				FlxTween.tween(e, {y: e.y + (EngineSettings.downscroll ? -500 : 275)}, (Conductor.crochet / 1000) * 8, {
					ease: FlxEase.circInOut
				});
			});

		case 320:
			PlayState.defaultCamZoom = 0.9;

		case 1103:
			PlayState.defaultCamZoom = 0.8;
	}
}
