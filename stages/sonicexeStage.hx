//
var oldCharacter:Character = null;
var newCharacter:Character = null;
var dad3:Character = null;

//
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
			daStatic.alpha = FlxG.random.float(0.1, 0.5);
	} else
		daStatic.alpha = 0.6;

	daStatic.animation.play('static');

	daStatic.animation.finishCallback = function(pog:String) {
		trace('ended static');
		remove(daStatic);
	}
}

var stage:Stage = null;

function create() {
	// stage = loadStage(newCharacter.visible = false;llFactor.set(1.37, 1);
	boyfriend.scrollFactor.set(1.37, 1);
	gf.scrollFactor.set(1.37, 1);
	dad.scrollFactor.set(1.37, 1);
	gf.x = 635.5 - 50 - 100;
	gf.y = 265.1 - 250;

	var sSKY:FlxSprite = new FlxSprite(-414, -440.8).loadGraphic(Paths.image('stages/sonicstageexe/sky'));
	sSKY.antialiasing = true;
	sSKY.scrollFactor.set(1, 1);
	sSKY.active = false;
	sSKY.scale.x = 1.4;
	sSKY.scale.y = 1.4;
	add(sSKY);

	var trees:FlxSprite = new FlxSprite(-290.55, -298.3).loadGraphic(Paths.image('stages/sonicstageexe/backtrees'));
	trees.antialiasing = true;
	trees.scrollFactor.set(1.1, 1);
	trees.active = false;
	trees.scale.x = 1.2;
	trees.scale.y = 1.2;
	add(trees);

	var bg2:FlxSprite = new FlxSprite(-306, -334.65).loadGraphic(Paths.image('stages/sonicstageexe/trees'));
	bg2.updateHitbox();
	bg2.antialiasing = true;
	bg2.scrollFactor.set(1.2, 1);
	bg2.active = false;
	bg2.scale.x = 1.2;
	bg2.scale.y = 1.2;
	add(bg2);

	var bg:FlxSprite = new FlxSprite(-309.95, -240.2).loadGraphic(Paths.image('stages/sonicstageexe/ground'));
	bg.antialiasing = true;
	bg.scrollFactor.set(1.3, 1);
	bg.active = false;
	bg.scale.x = 1.2;
	bg.scale.y = 1.2;
	add(bg);

	bgspec = new FlxSprite(-428.5 + 50 + 700, -449.35 + 25 + 392 + 105 + 50).loadGraphic(Paths.image("stages/sonicstageexe/GreenHill"));
	bgspec.antialiasing = false;
	bgspec.scrollFactor.set(1, 1);
	bgspec.active = false;
	bgspec.visible = false;
	bgspec.scale.x = 8;
	bgspec.scale.y = 8;
	add(bgspec);
}

function stepHit(curStep:Int) {
	switch (curStep) // haha laugh funny
	{
		case 128, 328, 1288:
			dad.playAnim('laugh', true);
		case 130, 132, 134, 136, 138, 140, 330, 332, 334, 1290, 1292, 1294:
			dad.playAnim('laugh', true);
	}

	if (curStep == 528) // PIXEL MOMENT LAWLALWALAWL
	{
		doStaticSign(0, false);

		remove(gf);
		gf = new Character(460, 130, mod + ':gf2');
		add(gf);

		PlayState.remove(PlayState.boyfriend);
		PlayState.boyfriend.destroy();
		PlayState.boyfriends = [new Boyfriend(0, -190, mod + ':pixelbf2')];
		PlayState.add(PlayState.boyfriend);
		PlayState.iconP1.changeCharacter(mod + ':pixelbf2');

		PlayState.remove(PlayState.dad);
		newCharacter = new Character(100, 100 + -250 - 50, mod + ':pixelsonic');
		newCharacter.visible = false;
		PlayState.dads.push(newCharacter);
		PlayState.add(newCharacter);
		PlayState.iconP2.changeCharacter(mod + ':pixelsonic');
		newCharacter.visible = true;
		bgspec.visible = true;
	} else if (curStep == 784) // BACK TO NORMAL MF!!!
	{
		doStaticSign(0, false);

		remove(gf);
		gf = new Character(635.5 - 50 - 100, 265.1 - 250, 'gf');
		add(gf);

		PlayState.remove(PlayState.boyfriend);
		PlayState.boyfriend.destroy();
		PlayState.boyfriends = [new Boyfriend(1036 - 100, 0, 'bf')];
		PlayState.add(PlayState.boyfriend);
		PlayState.iconP1.changeCharacter('bf');

		PlayState.remove(PlayState.dad);
		dad3 = new Character(100, 100 + -100 - 50, mod + ':ycrsonic');
		newCharacter.visible = false;
		oldCharacter.visible = true;
		PlayState.dads.push(dad3);
		PlayState.add(dad3);
		PlayState.iconP2.changeCharacter(mod + ':ycrsonic');

		dad.scrollFactor.set(1.3, 1);
		boyfriend.scrollFactor.set(1.3, 1);
		gf.scrollFactor.set(1.25, 1);

		bgspec.visible = false;
	} else if (curStep == 521 && curStep == 1160) {
		camGame.shake(0.03, 1.5);
		camHUD.shake(0.05, 1);
	}
}
