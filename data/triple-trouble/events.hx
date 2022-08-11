var xeo:Character = new Character(-180, 5, mod + ':xeo');
var xeoflip:Character = new Character(750 - 250, -94.75 + 100, mod + ':xeoflip');
var bf2flip:Character = new Boyfriend(702.45 - 350, 370.45, mod + ':bf2flip');
var bf2:Chrarcter = new Boyfriend(502.45 + 200, 370.45, mod + ':bf2');
var kun:Character = new Character(1300 + 100 - 206, 260 + 44, mod + ':kun');
var eggman:Character = new Character(20 - 200, 30 + 200, mod + ':eggman');
var p3JumpKNUCKLES:FlxSprite = new FlxSprite().loadGraphic(Paths.image('coolshit/Knuckles'));
var p3JumpTAILS:FlxSprite = new FlxSprite().loadGraphic(Paths.image('coolshit/Tails'));
var daP3Static = new FlxSprite(0, 0);
var p3staticbg = new FlxSprite(0, 0);

bgvischangeArray = [1, 1024, 1088, 1216, 1280, 2305, 2810, 3199, 4096];
function create() {
	add(xeo);
	xeo.alpha = 0.0001;
	add(xeoflip);
	xeoflip.alpha = 0.001;
	add(eggman);
	eggman.alpha = 0.00001;
	add(kun);
	kun.alpha = 0.0001;
	add(bf2);
	bf2.alpha = 0.001;
	add(bf2flip);
	bf2flip.alpha = 0.001;
	dads.push(xeo);
	dads.push(eggman);
	dads.push(kun);
	dads.push(xeoflip);

}

function doP3Static() {
	trace('p3static XDXDXD');

	daP3Static.frames = Paths.getSparrowAtlas('coolshit/Phase3Static');
	daP3Static.animation.addByPrefix('P3Static', 'Phase3Static instance 1', 24, false);
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
	};
}

function doP3JumpTAILS() {
	trace('SIMPLE JUMPSCARE');

	p3JumpTAILS.setGraphicSize(FlxG.width, FlxG.height);
	p3JumpTAILS.screenCenter();
	p3JumpTAILS.cameras = [camHUD];
	add(p3JumpTAILS);
	

	FlxG.camera.shake(0.0025, 0.50);
	FlxG.sound.play(Paths.sound('P3Jumps/TailsScreamLOL'), .1);

	new FlxTimer().start(0.2, function(tmr:FlxTimer) {
		trace('ended simple jump');
		remove(p3JumpTAILS);
	});
}

function doP3JumpKNUCKLES() {
	trace('SIMPLE JUMPSCARE');

	p3JumpKNUCKLES.setGraphicSize(FlxG.width, FlxG.height);
	p3JumpKNUCKLES.screenCenter();
	p3JumpKNUCKLES.cameras = [camHUD];
	add(p3JumpKNUCKLES);

	FlxG.camera.shake(0.0025, 0.50);
	FlxG.sound.play(Paths.sound('P3Jumps/KnucklesScreamLOL'), .1);

	new FlxTimer().start(0.2, function(tmr:FlxTimer) {
		trace('ended simple jump');
		remove(p3JumpKNUCKLES);
	});

	FlxG.sound.play(Paths.sound('staticBUZZ'));
}

function stepHit(curStep:Int) {
	switch (curStep) {
		case 1, 1024, 1088, 1216, 1280, 2305, 2810, 3199, 4096:
			doP3Static();
		case 144:
			doP3JumpTAILS();
		case 1040:
			dad.x = 300;
			dad.y = 230;
			FlxTween.tween(FlxG.camera, {zoom: 0.9}, 0.95, {ease: FlxEase.cubeOut});
			defaultCamZoom = 0.9;
			PlayState.iconP2.changeCharacter(mod + ':xeo');
			xeo.alpha = 1;
			dad.visible = false;
			PlayState.remove(PlayState.boyfriend);
			PlayState.boyfriend.destroy();
			PlayState.boyfriends = [bf2];
			PlayState.add(PlayState.boyfriend);
			bf2.alpha = 1;
		case 1296: // switch to knuckles facing left facing right and bf facing right, and cool static

			FlxTween.tween(FlxG.camera, {zoom: 1.1}, 2, {ease: FlxEase.cubeOut});
			defaultCamZoom = 1.1;
			p3staticbg.visible = false;
			// xeo.destroy();
			xeo.alpha = 0.0001;
			dad.x = 1130;
			dad.y = 660;
			kun.alpha = 1;
			PlayState.iconP2.changeCharacter(mod + ':kun');
			kun.flipX = true;
			PlayState.dad = kun;
			PlayState.remove(PlayState.boyfriend);
			PlayState.boyfriend.destroy();
			PlayState.boyfriends = [new Boyfriend(466.1, 685.6 - 300, 'bf')];
			PlayState.add(PlayState.boyfriend);
			boyfriend.flipX = true;

		 doP3JumpKNUCKLES();
		case 2320:
			/*dads.remove(kun);
				kun.destroy(); */
			remove(kun);
			FlxTween.tween(FlxG.camera, {zoom: 0.9}, 2, {ease: FlxEase.cubeOut});
			defaultCamZoom = 0.3;

			PlayState.remove(PlayState.boyfriend);
			PlayState.boyfriend.destroy();
			PlayState.boyfriends = [bf2flip];
			bf2flip.alpha = 1;
			PlayState.add(PlayState.boyfriend);
			// boyfriend.flipX = true;
			dad.x = 1200 - 250;
			dad.y = -175 + 300;
			dad.visible = false;
			xeoflip.alpha = 1;
			PlayState.iconP2.changeCharacter(mod + ':xeo');
		// xeoflip.flipX = true ;
		case 2823:
			// doP3JumpEGGMAN();
			xeoflip.visible = false;
			// kun.destroy();
			// remove(kun);
			FlxTween.tween(FlxG.camera, {zoom: 1}, 2, {ease: FlxEase.cubeOut});
			defaultCamZoom = 1;
			PlayState.remove(PlayState.boyfriend);
			PlayState.boyfriend.destroy();
			PlayState.boyfriends = [new Boyfriend(466.1 + 200, 685.6 - 250, 'bf')];
			boyfriend.y -= 350;
			PlayState.add(PlayState.boyfriend);
			dad.x = -100;
			dad.y = 300;
			eggman.alpha = 1;
			PlayState.iconP2.changeCharacter(mod + ':eggman');

			p3staticbg.visible = false;

		case 2887, 3015, 4039:
			eggman.playAnim('laugh', true);
		case 4111:
			p3staticbg.visible = true;
			remove(eggman);
			xeo.alpha = 1;
			xeo.visible = true;
			PlayState.iconP2.changeCharacter(mod + ':xeo');
			PlayState.remove(PlayState.boyfriend);
			PlayState.boyfriend.destroy();
			PlayState.boyfriends = [new Boyfriend(502.45 + 200, 370.45, mod + ':bf2')];
			PlayState.add(PlayState.boyfriend);
	}
}
