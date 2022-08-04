import flixel.FlxCamera;
import flixel.FlxBasic;

				
				
var daStatic:FlxSprite = new FlxSprite(0, 0);
var fakertransform:FlxSprite = new FlxSprite(100 - 10000, 100 - 10000);
fakertransform.frames = Paths.getSparrowAtlas('stages/faker/Faker_Transformation');
fakertransform.animation.addByPrefix('1', 'TransformationRIGHT instance 1');
fakertransform.animation.addByPrefix('2', 'TransformationLEFT instance 1');
fakertransform.animation.addByPrefix('3', 'TransformationUP instance 1');
fakertransform.animation.addByPrefix('4', 'TransformationDOWN instance 1');
fakertransform.alpha = 0;

function doStaticSign(lestatic:Int = 0, leopa:Bool = true)
	{	
		add(fakertransform);
		trace('static MOMENT HAHAHAH ' + lestatic);

		daStatic.frames = Paths.getSparrowAtlas('coolshit/daSTAT');

		daStatic.setGraphicSize(FlxG.width * 2, FlxG.height * 2);

		daStatic.screenCenter();

		daStatic.cameras = [camGame];

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
				daStatic.alpha = FlxG.random.float(0.1, 1);
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
function create(){
	
    gf.x += 200;
	gf.y += 100;
	dad.scrollFactor.set(1.25, 1);
    gf.scrollFactor.set(1.24, 1);
	boyfriend.scrollFactor.set(1.25, 1);
	boyfriend.x = 318.95 + 500;
	boyfriend.y = 494.2 - 150;
	dad.y += 14.3;
	dad.x += 59.85;
    defaultCamZoom = .95;

						var sky:FlxSprite = new FlxSprite(-631.8, -493.15).loadGraphic(Paths.image('stages/faker/sky'));
						sky.antialiasing = true;
						sky.scrollFactor.set(1, 1);
						sky.active = false;
						sky.scale.x = .9;
						sky.scale.y = .9;
						add(sky);

						var mountains:FlxSprite = new FlxSprite(-631.8, -475.5).loadGraphic(Paths.image('stages/faker/mountains'));
						mountains.antialiasing = true;
						mountains.scrollFactor.set(1.1, 1);
						mountains.active = false;
						mountains.scale.x = .9;
						mountains.scale.y = .9;
						add(mountains);

						var grass:FlxSprite = new FlxSprite(-631.8, -475.5).loadGraphic(Paths.image('stages/faker/grass'));
						grass.antialiasing = true;
						grass.scrollFactor.set(1.2, 1);
						grass.active = false;
						grass.scale.x = .9;
						grass.scale.y = .9;
						add(grass);

						var tree2:FlxSprite = new FlxSprite(-631.8, -475.5).loadGraphic(Paths.image('stages/faker/tree2'));
						tree2.antialiasing = true;
						tree2.scrollFactor.set(1.225, 1);
						tree2.active = false;
						tree2.scale.x = .9;
						tree2.scale.y = .9;
						add(tree2);

						var pillar2:FlxSprite = new FlxSprite(-631.8, -459.55).loadGraphic(Paths.image('stages/faker/pillar2'));
						pillar2.antialiasing = true;
						pillar2.scrollFactor.set(1.25, 1);
						pillar2.active = false;
						pillar2.scale.x = .9;
						pillar2.scale.y = .9;
						add(pillar2);

						var plant:FlxSprite = new FlxSprite(-631.8, -493.15).loadGraphic(Paths.image('stages/faker/plant'));
						plant.antialiasing = true;
						plant.scrollFactor.set(1.25, 1);
						plant.active = false;
						plant.scale.x = .9;
						plant.scale.y = .9;
						add(plant);

						var tree1:FlxSprite = new FlxSprite(-631.8, -493.15).loadGraphic(Paths.image('stages/faker/tree1'));
						tree1.antialiasing = true;
						tree1.scrollFactor.set(1.25, 1);
						tree1.active = false;
						tree1.scale.x = .9;
						tree1.scale.y = .9;
						add(tree1);

						var pillar1:FlxSprite = new FlxSprite(-631.8, -493.15).loadGraphic(Paths.image('stages/faker/pillar1'));
						pillar1.antialiasing = true;
						pillar1.scrollFactor.set(1.25, 1);
						pillar1.active = false;
						pillar1.scale.x = .9;
						pillar1.scale.y = .9;
						add(pillar1);

						var flower1:FlxSprite = new FlxSprite(-631.8, -493.15).loadGraphic(Paths.image('stages/faker/flower1'));
						flower1.antialiasing = true;
						flower1.scrollFactor.set(1.25, 1);
						flower1.active = false;
						flower1.scale.x = .9;
						flower1.scale.y = .9;
						add(flower1);

						var flower2:FlxSprite = new FlxSprite(-631.8, -493.15).loadGraphic(Paths.image('stages/faker/flower2'));
						flower2.antialiasing = true;
						flower2.scrollFactor.set(1.25, 1);
						flower2.active = false;
						flower2.scale.x = .9;
						flower2.scale.y = .9;
						add(flower2);
}


function stepHit(curStep:Int){
    switch (curStep)
			{
				case 787, 795, 902, 800, 811, 819, 823, 827, 832, 835, 839, 847, 847:
					doStaticSign(0, false);
					camX = -35;
				case 768:
					FlxTween.tween(camHUD, {alpha: 0}, 1);
				case 801: // 800
					
					fakertransform.setPosition(dad.getGraphicMidpoint().x - 460, dad.getGraphicMidpoint().y - 700);
					fakertransform.x += 20;
					fakertransform.y += 128;
					fakertransform.alpha = 1;
					dad.visible = false;
					fakertransform.animation.play('1');
				case 824: // 824
					fakertransform.setPosition(dad.x - 460, dad.getGraphicMidpoint().y - 700);
					fakertransform.x += -19;
					fakertransform.y += 138;
					fakertransform.animation.play('2');
				case 836: // 836
					fakertransform.setPosition(dad.getGraphicMidpoint().x - 460, dad.getGraphicMidpoint().y - 700);
					fakertransform.x += 76;
					fakertransform.y -= 110;
					fakertransform.animation.play('3');
				case 848: // 848
					fakertransform.setPosition(dad.getGraphicMidpoint().x - 460, dad.getGraphicMidpoint().y - 700);
					fakertransform.x += -110;
					fakertransform.y += 318;
					fakertransform.animation.play('4');
				case 884:
					add(blackFuck);
					blackFuck.alpha = 1;
					blackFuck.visible = true;
			}
			if (curStep > 858 && curStep < 884)
				doStaticSign(0, false); // Honestly quite incredible
}