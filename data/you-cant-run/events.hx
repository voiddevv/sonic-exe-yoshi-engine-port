var newCharacter:Charcter;
var vg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('coolshit/redVG'));
var bgspec:FlxSprite = new FlxSprite(-428.5 + 50 + 700, -449.35 + 25 + 392 + 105 + 50).loadGraphic(Paths.image("stages/sonicstageexe/GreenHill"));

function create() {
	bgspec.antialiasing = false;
	bgspec.scrollFactor.set(1, 1);
	bgspec.active = false;
	bgspec.visible = false;
	bgspec.scale.x = 8;
	bgspec.scale.y = 8;
	add(bgspec);
	if (curBeat % 2 == 0)
		{
			FlxTween.tween(vg,{ alpha: 0}, .9);
			FlxTween.tween(vg,{ alpha: 1}, .9, {type: FlxTween.PINGPONG,startDelay: .9});
		}	
}
function createPost() {
	vg.alpha = 1;
	vg.cameras = [camHUD];
	add(vg);
}

function doStaticSign(lestatic:Int = 0, leopa:Bool = true) {
	trace('static MOMENT HAHAHAH ' + lestatic);
	var daStatic:FlxSprite = new FlxSprite(0, 0);

	daStatic.frames = Paths.getSparrowAtlas('coolshit/daSTAT');

	daStatic.setGraphicSize(FlxG.width, FlxG.height);

	daStatic.screenCenter();

	daStatic.cameras = [camHUD];

	switch (lestatic) {
		case 0:
			daStatic.animation.addByPrefix('static', 'staticFLASH', 24, false);
	}
	add(daStatic);

	FlxG.sound.play(Paths.sound('staticBUZZ'));

	if (leopa) {
		if (daStatic.alpha != 0)
			daStatic.alpha = FlxG.random.float(0.6, 1);
	} else
		daStatic.alpha = 1;
	function doStaticSign(lestatic:Int = 0, leopa:Bool = true) {
		trace('static MOMENT HAHAHAH ' + lestatic);
		var daStatic:FlxSprite = new FlxSprite(0, 0);

		daStatic.frames = Paths.getSparrowAtlas('coolshit/daSTAT');

		daStatic.setGraphicSize(FlxG.width, FlxG.height);

		daStatic.screenCenter();

		daStatic.cameras = [camHUD];

		switch (lestatic) {
			case 0:
				daStatic.animation.addByPrefix('static', 'staticFLASH', 24, false);
		}
		add(daStatic);

		FlxG.sound.play(Paths.sound('staticBUZZ'));

		if (leopa) {
			if (daStatic.alpha != 0)
				daStatic.alpha = FlxG.random.float(0.1, 1);
		} else
			daStatic.alpha = 1;

		daStatic.animation.play('static');

		daStatic.animation.finishCallback = function(pog:String) {
			trace('ended static');
			remove(daStatic);
		}
	}

	daStatic.animation.play('static');

	daStatic.animation.finishCallback = function(pog:String) {
		trace('ended static');
		remove(daStatic);
	}
}

function stepHit(curStep:Int) {
	switch curStep { // bad game devs are runing

		case 128, 130, 132, 134, 136, 138, 140, 330, 332, 334, 328, 1288, 1290, 1292, 1294:
			dad.playAnim('laugh', true);
		case 528:
			remove(gf);
			gf = new Character(460, 130, mod + ':gf2');
			add(gf);

			PlayState.remove(PlayState.boyfriend);
			PlayState.boyfriend.destroy();
			PlayState.boyfriends = [new Boyfriend(0, -190, mod + ':pixelbf2')];
			PlayState.add(PlayState.boyfriend);
			PlayState.iconP1.changeCharacter(mod + ':pixelbf2');

			dad.visible = false;
			newCharacter = new Character(100, 100 + -250 - 50, mod + ':pixelsonic');
			PlayState.dads.push(newCharacter);
			PlayState.add(newCharacter);
			PlayState.iconP2.changeCharacter(mod + ':pixelsonic');
			vg.visible = false;
			newCharacter.visible = true;
		case 784:
			doStaticSign(0, false);
			vg.visible = true;
			remove(gf);
			gf = new Character(635.5 - 50 - 100, 265.1 - 250, 'gf');
			add(gf);

			PlayState.remove(PlayState.boyfriend);
			PlayState.boyfriend.destroy();
			PlayState.boyfriends = [new Boyfriend(1036 - 100, 0, 'bf')];
			PlayState.add(PlayState.boyfriend);
			PlayState.iconP1.changeCharacter('bf');

			PlayState.remove(newCharacter);
			dad.visible = true;
			PlayState.iconP2.changeCharacter(mod + ':ycrsonic');

			dad.scrollFactor.set(1.3, 1);
			boyfriend.scrollFactor.set(1.3, 1);
			gf.scrollFactor.set(1.25, 1);
	}
}
function restart() {
	FlxTween.tween(vg,{ alpha: 1}, 0.5, {onComplete: restart });
}