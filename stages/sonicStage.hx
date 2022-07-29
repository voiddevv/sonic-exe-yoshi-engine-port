//
var daStatic:FlxSprite = new FlxSprite(0, 0);
var daJumpscare:FlxSprite = new FlxSprite(0, 0);
var simplejump:FlxSprite = new FlxSprite().loadGraphic(Paths.image('coolshit/simplejump'));

var stage:Stage = null;

function doJumpscare()
	{
		trace('JUMPSCARE aaaa');
		
		daJumpscare.frames = Paths.getSparrowAtlas('coolshit/sonicJUMPSCARE');
		daJumpscare.animation.addByPrefix('jump', 'sonicSPOOK', 24, false);

		daJumpscare.screenCenter();

		daJumpscare.scale.x = 1.1;
		daJumpscare.scale.y = 1.1;

		daJumpscare.y += 370;
		daJumpscare.visible = true;

		daJumpscare.cameras = [camHUD];

		FlxG.sound.play(Paths.sound('jumpscare'), 1);
		FlxG.sound.play(Paths.sound('datOneSound'), 1);

		add(daJumpscare);

		daJumpscare.animation.play('jump');

		daJumpscare.animation.finishCallback = function(pog:String)
		{
			trace('ended jump');
			remove(daJumpscare);
		}
	}

function doSimpleJump()
	{
		trace('SIMPLE JUMPSCARE');


		simplejump.setGraphicSize(FlxG.width, FlxG.height);

		simplejump.screenCenter();

		simplejump.cameras = [camHUD];

		FlxG.camera.shake(0.0025, 0.50);

		add(simplejump);

		FlxG.sound.play(Paths.sound('sppok'), 1);

		new FlxTimer().start(0.2, function(tmr:FlxTimer)
		{
			trace('ended simple jump');
			remove(simplejump);
		});

		// now for static

		

		daStatic.frames = Paths.getSparrowAtlas('coolshit/daSTAT');

		daStatic.setGraphicSize(FlxG.width, FlxG.height);

		daStatic.screenCenter();

		daStatic.cameras = [camHUD];

		daStatic.animation.addByPrefix('static', 'staticFLASH', 24, false);

		add(daStatic);

		FlxG.sound.play(Paths.sound('staticBUZZ'));

		if (daStatic.alpha != 0)
			daStatic.alpha = FlxG.random.float(0.1, 0.5);

		daStatic.animation.play('static');

		daStatic.animation.finishCallback = function(pog:String)
		{
			trace('ended static');
			remove(daStatic);
		}
	}

function doStaticSign(lestatic:Int = 0, leopa:Bool = true)
	{
		trace('static MOMENT HAHAHAH ' + lestatic);

		daStatic.frames = Paths.getSparrowAtlas('coolshit/daSTAT');

		daStatic.setGraphicSize(FlxG.width, FlxG.height);

		daStatic.screenCenter();

		daStatic.cameras = [camHUD];

		switch (lestatic)
		{
			case 0:
				daStatic.animation.addByPrefix('static', 'staticFLASH', 24, false);
		}
		add(daStatic);

		FlxG.sound.play(Paths.sound('staticBUZZ'));

		if (leopa)
		{
			if (daStatic.alpha != 0)
				daStatic.alpha = FlxG.random.float(0.1, 0.5);
		}
		else
			daStatic.alpha = 0.6;

		daStatic.animation.play('static');

		daStatic.animation.finishCallback = function(pog:String)
		{
			trace('ended static');
			remove(daStatic);
		}
	}
function create() {
	add(daJumpscare);
	daJumpscare.visible = false;
	
	PlayState.boyfriend.y += 25;
	PlayState.dad.scale.x = 1.1;
	PlayState.dad.scale.y = 1.1;
	PlayState.dad.scrollFactor.set(1.37, 1);
	PlayState.gf.scrollFactor.set(1.37, 1);
	PlayState.boyfriend.scrollFactor.set(1.37, 1);
	var sSKY:FlxSprite = new FlxSprite(-222, -16 + 150).loadGraphic(Paths.image('stages/sonicStage/SKY'));
						sSKY.antialiasing = true;
						sSKY.scrollFactor.set(1, 1);
						sSKY.active = false;
						add(sSKY);

						var hills:FlxSprite = new FlxSprite(-264, -156 + 150).loadGraphic(Paths.image('stages/sonicStage/HILLS'));
						hills.antialiasing = true;
						hills.scrollFactor.set(1.1, 1);
						hills.active = false;

						var bg2:FlxSprite = new FlxSprite(-345, -289 + 170).loadGraphic(Paths.image('stages/sonicStage/FLOOR2'));
						bg2.updateHitbox();
						bg2.antialiasing = true;
						bg2.scrollFactor.set(1.2, 1);
						bg2.active = false;

						var bg:FlxSprite = new FlxSprite(-297, -246 + 150).loadGraphic(Paths.image('stages/sonicStage/FLOOR1'));
						bg.antialiasing = true;
						bg.scrollFactor.set(1.3, 1);
						bg.active = false;
						add(bg);

						var eggman:FlxSprite = new FlxSprite(-218, -219 + 150).loadGraphic(Paths.image('stages/sonicStage/EGGMAN'));
						eggman.updateHitbox();
						eggman.antialiasing = true;
						eggman.scrollFactor.set(1.32, 1);
						eggman.active = false;

						add(eggman);

						var tail:FlxSprite = new FlxSprite(-199 - 150, -259 + 150).loadGraphic(Paths.image('stages/sonicStage/TAIL'));
						tail.updateHitbox();
						tail.antialiasing = true;
						tail.scrollFactor.set(1.34, 1);
						tail.active = false;

						add(tail);

						var knuckle:FlxSprite = new FlxSprite(185 + 100, -350 + 150).loadGraphic(Paths.image('stages/sonicStage/KNUCKLE'));
						knuckle.updateHitbox();
						knuckle.antialiasing = true;
						knuckle.scrollFactor.set(1.36, 1);
						knuckle.active = false;

						add(knuckle);

						var sticklol:FlxSprite = new FlxSprite(-100, 50);
						sticklol.frames = Paths.getSparrowAtlas('stages/sonicStage/TailsSpikeAnimated');
						sticklol.animation.addByPrefix('a', 'Tails Spike Animated instance 1', 4, true);
						sticklol.setGraphicSize(Std.int(sticklol.width * 1.2));
						sticklol.updateHitbox();
						sticklol.antialiasing = true;
						sticklol.scrollFactor.set(1.37, 1);

						add(sticklol);
}
function createpost() {
	add(daJumpscare);
	daJumpscare.visible = false;
}

function stepHit(curStep:Int) {
	switch (curStep)
					{
						case 27,130,265,450,645,855,889,938,981,1030,1065,1105,1123,1245,1345,1432,1454,1495,1521,1558,1578,1599,1618,1647,1657,1692,1713,1738,1747,1761,1785,1806,1816,1832,1849,1868,1887,1909:
							doStaticSign(0);
						case 921,1178,1337:
							doSimpleJump();
						case 1723:
							doJumpscare();
						case 1305:
							dad.playAnim('immagetya');
					}
}