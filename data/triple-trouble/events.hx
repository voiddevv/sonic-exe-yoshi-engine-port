var xeo:Character = new Character(-180, 5, mod + ':xeo');
var xeoflip:Character;
var bf2flip:Character;
var bf2:Chrarcter;
var kun:Character;
var eggman:Character = new Character(20 - 200, 30 + 200, mod + ':eggman');
var p3staticbg = new FlxSprite(0, 0);
var daP3Static = new FlxSprite(0, 0);

function create() {
	PlayState.add(xeo);
	add(kun);
	add(eggman);
	xeo.alpha = 0.001;
	kun.alpha = 0.0001
	eggman.alpha = 0.001
	p3staticbg.frames = Paths.getSparrowAtlas('bganim');
	p3staticbg.animation.addByPrefix('P3Static', 'TitleMenuSSBG instance 1', 24, true);
	p3staticbg.animation.play('P3Static');
	p3staticbg.screenCenter();
	p3staticbg.scale.x = 4.5;
	p3staticbg.scale.y = 4.5;
	p3staticbg.visible = false;
	daP3Static.frames = Paths.getSparrowAtlas('coolshit/Phase3Static');
	daP3Static.animation.addByPrefix('P3Static', 'Phase3Static instance 1', 24, false);
	add(p3staticbg);
}

function doP3Static() {
	trace('p3static XDXDXD');

	daP3Static.screenCenter();

	daP3Static.scale.x = 4;
	daP3Static.scale.y = 4;
	daP3Static.alpha = 0.5;

	daP3Static.cameras = [camHUD];

	add(daP3Static);

	daP3Static.animation.play('P3Static');

	daP3Static.animation.finishCallback = function(pog:String) {
		trace('ended p3static');
		daP3Static.alpha = 0;

		remove(daP3Static);
	}
}

/*function doP3JumpTAILS() {
	trace('SIMPLE JUMPSCARE');
	var doP3JumpTAILS:FlxSprite = new FlxSprite().loadGraphic(Paths.image('coolshit/Tails'));

	doP3JumpTAILS.setGraphicSize(FlxG.width, FlxG.height);

	doP3JumpTAILS.screenCenter();

	doP3JumpTAILS.cameras = [camHUD];

	FlxG.camera.shake(0.0025, 0.50);

	add(doP3JumpTAILS);

	FlxG.sound.play(Paths.sound('P3Jumps/TailsScreamLOL'), .1);

	new FlxTimer().start(0.2, function(tmr:FlxTimer) {
		trace('ended simple jump');
		remove(doP3JumpTAILS);
	});

	FlxG.sound.play(Paths.sound('staticBUZZ'));
}

function doP3JumpKNUCKLES() {
	trace('SIMPLE JUMPSCARE');
	var doP3JumpKNUCKLES:FlxSprite = new FlxSprite().loadGraphic(Paths.image('coolshit/Knuckles'));

	doP3JumpKNUCKLES.setGraphicSize(FlxG.width, FlxG.height);

	doP3JumpKNUCKLES.screenCenter();

	doP3JumpKNUCKLES.cameras = [camHUD];

	FlxG.camera.shake(0.0025, 0.50);

	add(doP3JumpKNUCKLES);

	FlxG.sound.play(Paths.sound('P3Jumps/KnucklesScreamLOL'), .1);

	new FlxTimer().start(0.2, function(tmr:FlxTimer) {
		trace('ended simple jump');
		remove(doP3JumpKNUCKLES);
	});

	FlxG.sound.play(Paths.sound('staticBUZZ'));
}*/

/*function stepHit(curStep:Int) {
	switch curStep {
		case 1, 1024, 1088, 1216, 1280, 2305, 2810, 3199, 4096:
			doP3Static();
		case 144:
			doP3JumpTAILS();
		case 1040: // switch to sonic facing right
			FlxTween.tween(FlxG.camera, {zoom: 0.9}, 0.5, {ease: FlxEase.cubeOut});
			defaultCamZoom = 0.9;

		case 1296: // switch to knuckles facing left facing right and bf facing right, and cool static

			FlxTween.tween(FlxG.camera, {zoom: 1.1}, 2, {ease: FlxEase.cubeOut});
			defaultCamZoom = 1.1;
			// p3staticbg.visible = false;
			// xeo.destroy();
			xeo.visible = false;
			dad.visible = false;
			dad.x = 1000 + 100 - 206;
			dad.y = 464;
			kun = new Character(1300 + 100 - 206, 260 + 44, mod + ':kun');
			dads.push(kun);
			PlayState.add(kun);
			PlayState.iconP2.changeCharacter(mod + ':kun');
			kun.flipX = true;
			PlayState.remove(PlayState.boyfriend);
			PlayState.boyfriend.destroy();
			PlayState.boyfriends = [new Boyfriend(466.1, 685.6 - 300, 'bf')];
			PlayState.add(PlayState.boyfriend);
			boyfriend.flipX = true;

			doP3JumpKNUCKLES();
		case 2320:
			remove(kun);

			FlxTween.tween(FlxG.camera, {zoom: 0.9}, 2, {ease: FlxEase.cubeOut});
			defaultCamZoom = 0.9;

			// p3staticbg.visible = true;

			PlayState.remove(PlayState.boyfriend);
			PlayState.boyfriend.destroy();
			PlayState.boyfriends = [new Boyfriend(702.45 - 350, 370.45, mod + ':bf2flip')];
			PlayState.add(PlayState.boyfriend);
			// boyfriend.flipX = true;
			dad.x = 1200 - 250;
			dad.y = -94.75 + 300;
			dad.visible = false;
			xeoflip = new Character(750 - 250, -94.75 + 100, mod + ':xeoflip');
			dads.push(xeoflip);
			PlayState.add(xeoflip);
			PlayState.iconP2.changeCharacter(mod + ':xeo');
		// xeoflip.flipX = true ;

		case 2823:
			// doP3JumpEGGMAN();

			remove(dad);
			// kun.destroy();
			// remove(kun);
			FlxTween.tween(FlxG.camera, {zoom: 1}, 2, {ease: FlxEase.cubeOut});
			defaultCamZoom = 1;
			PlayState.remove(PlayState.boyfriend);
			PlayState.boyfriend.destroy();
			PlayState.boyfriends = [new Boyfriend(466.1 + 200, 685.6 - 250, 'bf')];
			boyfriend.y -= 350;
			PlayState.add(boyfriend);
			remove(kun);
			dad.x = -100;
			dad.y = -25;
			PlayState.add(eggman);
			dads.push(eggman);
			PlayState.iconP2.changeCharacter(mod + ':eggman');

			// p3staticbg.visible = false;

			remove(xeoflip);

		case 2887, 3015, 4039:
			eggman.playAnim('laugh', true);

		case 4111:
			// p3staticbg.visible = true;
			remove(eggman);
			xeo = new Character(20 - 200, -94.75 + 100, mod + ':xeo');
			PlayState.add(xeo);
			PlayState.iconP2.changeCharacter(mod + ':xeo');
			dads.push(xeo);
			PlayState.remove(PlayState.boyfriend);
			PlayState.boyfriend.destroy();
			dad.x = 450 - 350;
			dad.y = -100.75 + 225;
			PlayState.boyfriends = [new Boyfriend(502.45 + 200, 370.45, mod + ':bf2')];
			PlayState.add(PlayState.boyfriend);
	}
}*/