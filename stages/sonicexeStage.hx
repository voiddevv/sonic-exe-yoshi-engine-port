//
var newCharacter:Character = null;
var bg:FlxSprite = new FlxSprite(-309.95, -240.2).loadGraphic(Paths.image('stages/sonicstageexe/ground'));
var trees:FlxSprite = new FlxSprite(-290.55, -298.3).loadGraphic(Paths.image('stages/sonicstageexe/backtrees'));
var bg2:FlxSprite = new FlxSprite(-306, -334.65).loadGraphic(Paths.image('stages/sonicstageexe/trees'));
var sSKY:FlxSprite = new FlxSprite(-414, -440.8).loadGraphic(Paths.image('stages/sonicstageexe/sky'));
var bgspec:FlxSprite = new FlxSprite(-428.5 + 50 + 700, -449.35 + 25 + 392 + 105 + 50).loadGraphic(Paths.image("stages/sonicstageexe/GreenHill"));

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
			daStatic.alpha = FlxG.random.float(0.1, 1);
	} else
		daStatic.alpha = 1;

	daStatic.animation.play('static');

	daStatic.animation.finishCallback = function(pog:String) {
		trace('ended static');
		remove(daStatic);
	}
}

var stage:Stage = null;

function create() {
	boyfriend.scrollFactor.set(1.37, 1);
	gf.scrollFactor.set(1.37, 1);
	dad.scrollFactor.set(1.37, 1);
	gf.x = 635.5 - 50 - 100;
	gf.y = 265.1 - 250;
	dad.y -= 160;
	dad.x += 125;
	boyfriend.y -= 145;

	sSKY.antialiasing = true;
	sSKY.scrollFactor.set(1, 1);
	sSKY.active = false;
	sSKY.scale.x = 1.4;
	sSKY.scale.y = 1.4;
	add(sSKY);

	trees.antialiasing = true;
	trees.scrollFactor.set(1.1, 1);
	trees.active = false;
	trees.scale.x = 1.2;
	trees.scale.y = 1.2;
	add(trees);

	bg2.updateHitbox();
	bg2.antialiasing = true;
	bg2.scrollFactor.set(1.2, 1);
	bg2.active = false;
	bg2.scale.x = 1.2;
	bg2.scale.y = 1.2;
	add(bg2);

	
	bg.antialiasing = true;
	bg.scrollFactor.set(1.3, 1);
	bg.active = false;
	bg.scale.x = 1.2;
	bg.scale.y = 1.2;
	add(bg);

	bgspec.antialiasing = false;
	bgspec.scrollFactor.set(1, 1);
	bgspec.active = false;
	bgspec.visible = false;
	bgspec.scale.x = 8;
	bgspec.scale.y = 8;
	add(bgspec);
}

function stepHit(curStep:Int) {

	if (curStep == 528) // cum sonic
	{
		doStaticSign(0, false);
		bgspec.visible = true;
	} else if (curStep == 784) // not cuming sonic
	{
		
		bgspec.visible = false;
	} else if (curStep == 521 && curStep == 1160) {
		camGame.shake(0.03, 1.5);
		camHUD.shake(0.05, 1);
	}
}
