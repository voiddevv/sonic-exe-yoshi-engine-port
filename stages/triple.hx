//
function doP3JumpKNUCKLES()
	{
		trace('SIMPLE JUMPSCARE');

		var doP3JumpKNUCKLES:FlxSprite = new FlxSprite().loadGraphic(Paths.image('coolshit/Knuckles'));

		doP3JumpKNUCKLES.setGraphicSize(FlxG.width, FlxG.height);

		doP3JumpKNUCKLES.screenCenter();

		doP3JumpKNUCKLES.cameras = [camHUD];

		FlxG.camera.shake(0.0025, 0.50);

		add(doP3JumpKNUCKLES);

		FlxG.sound.play(Paths.sound('P3Jumps/KnucklesScreamLOL'), .1);

		new FlxTimer().start(0.2, function(tmr:FlxTimer)
		{
			trace('ended simple jump');
			remove(doP3JumpKNUCKLES);
		});

		
		FlxG.sound.play(Paths.sound('staticBUZZ'));
	}


function doP3JumpTAILS()
	{
		trace('SIMPLE JUMPSCARE');

		var doP3JumpTAILS:FlxSprite = new FlxSprite().loadGraphic(Paths.image('coolshit/Tails'));

		doP3JumpTAILS.setGraphicSize(FlxG.width, FlxG.height);

		doP3JumpTAILS.screenCenter();

		doP3JumpTAILS.cameras = [camHUD];

		FlxG.camera.shake(0.0025, 0.50);

		add(doP3JumpTAILS);

		FlxG.sound.play(Paths.sound('P3Jumps/TailsScreamLOL'), .1);

		new FlxTimer().start(0.2, function(tmr:FlxTimer)
		{
			trace('ended simple jump');
			remove(doP3JumpTAILS);
		});

		
		FlxG.sound.play(Paths.sound('staticBUZZ'));

		
	}



function doP3Static()
	{
		trace('p3static XDXDXD');
		var daP3Static = new FlxSprite(0,0);
		daP3Static.frames = Paths.getSparrowAtlas('coolshit/Phase3Static');
		daP3Static.animation.addByPrefix('P3Static', 'Phase3Static instance 1', 24, false);

		daP3Static.screenCenter();

		daP3Static.scale.x = 4;
		daP3Static.scale.y = 4;
		daP3Static.alpha = 0.5;

		daP3Static.cameras = [camHUD];

		add(daP3Static);

		daP3Static.animation.play('P3Static');

		daP3Static.animation.finishCallback = function(pog:String)
		{
			trace('ended p3static');
			daP3Static.alpha = 0;

			remove(daP3Static);
		}
	}

	//
var tails:Character;
var xeo:Character = new Character(20 - 200, -94.75 + 100, mod + ':xeo');
var xeoflip:Character;
var bf2flip:Character;
var bf2:Chrarcter;
var kun:Character;
var eggman:Character = new Character(20 - 200, 30 + 200, mod + ':eggman');
function create() {
						
						
						
						
						
						var sSKY:FlxSprite = new FlxSprite(-621.1, -395.65).loadGraphic(Paths.image('stages/triple/Glitch'));
						sSKY.antialiasing = true;
						sSKY.scrollFactor.set(0.9, 1);
						sSKY.active = false;
						sSKY.scale.x = 1.2;
						sSKY.scale.y = 1.2;
						add(sSKY);

						p3staticbg = new FlxSprite(0, 0);
						p3staticbg.frames = Paths.getSparrowAtlas('bganim');
						p3staticbg.animation.addByPrefix('P3Static', 'TitleMenuSSBG instance 1', 24, true);
						p3staticbg.animation.play('P3Static');
						p3staticbg.screenCenter();
						p3staticbg.scale.x = 4.5;
						p3staticbg.scale.y = 4.5;
						p3staticbg.visible = false;
						add(p3staticbg);

						var trees:FlxSprite = new FlxSprite(-607.35, -401.55).loadGraphic(Paths.image('stages/triple/trees'));
						trees.antialiasing = true;
						trees.scrollFactor.set(0.95, 1);
						trees.active = false;
						trees.scale.x = 1.2;
						trees.scale.y = 1.2;
						add(trees);

						var bg2:FlxSprite = new FlxSprite(-623.5, -410.4).loadGraphic(Paths.image('stages/triple/trees2'));
						bg2.updateHitbox();
						bg2.antialiasing = true;
						bg2.scrollFactor.set(1, 1);
						bg2.active = false;
						bg2.scale.x = 1.2;
						bg2.scale.y = 1.2;
						add(bg2);

						var bg:FlxSprite = new FlxSprite(-630.4, -266).loadGraphic(Paths.image('stages/triple/grass'));
						bg.antialiasing = true;
						bg.scrollFactor.set(1.1, 1);
						bg.active = false;
						bg.scale.x = 1.2;
						bg.scale.y = 1.2;
						add(bg);

						bgspec = new FlxSprite(-428.5 + 50, -449.35 + 25).makeGraphic(2199, 1203, FlxColor.BLACK);
						bgspec.antialiasing = true;
						bgspec.scrollFactor.set(1, 1);
						bgspec.active = false;
						bgspec.visible = false;

						bgspec.scale.x = 1.2;
						bgspec.scale.y = 1.2;
						add(bgspec);
}
function createPost() {
	cpuStrums.members[2].visible = false;
	cpuStrums.members[1].x += 50;
	cpuStrums.members[0].x += 50;
	cpuStrums.members[4].x -= 65;
	cpuStrums.members[3].x -= 65;
	camFollowLerp = 0.12;
	//cpuStrum.x -= 700;
	PlayState.gf.visible = false;
}
function stepHit(curStep:Int) {
	
	//getCamPos();
	switch curStep{
		case 1, 1024, 1088, 1216, 1280, 2305, 2810, 3199, 4096:
			doP3Static();
		case 144:
			doP3JumpTAILS();
			case 1040: // switch to sonic facing right
			FlxTween.tween(FlxG.camera, {zoom: 0.9}, 2, {ease: FlxEase.cubeOut});
			defaultCamZoom = 0.9;
			p3staticbg.visible = true;
			dad.destroy();
			remove(dad);
			dads.remove(dad);
    		//xeo = new Character(20 - 200, -94.75 + 100, mod + ':xeo');
			PlayState.dad = (xeo);
    		dads.push(xeo);
			xeo.visible = true;
    		PlayState.add(xeo);
    		PlayState.iconP2.changeCharacter(mod + ':xeo');


			PlayState.remove(PlayState.boyfriend);
    		PlayState.boyfriend.destroy();
    		PlayState.boyfriends = [new Boyfriend(502.45 + 200, 370.45, mod + ':bf2')];
    		PlayState.add(PlayState.boyfriend);
			
			case 1296: // switch to knuckles facing left facing right and bf facing right, and cool static
			
			FlxTween.tween(FlxG.camera, {zoom: 1.1}, 2, {ease: FlxEase.cubeOut});
			defaultCamZoom = 1.1;
			p3staticbg.visible = false;
			//xeo.destroy();
			remove(xeo);
			
			dad.x = 1000 + 100 - 206;
			dad.y = 340 + 44;
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

					p3staticbg.visible = true;
					

					PlayState.remove(PlayState.boyfriend);
    				PlayState.boyfriend.destroy();
    				PlayState.boyfriends = [new Boyfriend(702.45 - 350, 370.45, mod + ':bf2flip')];
    				PlayState.add(PlayState.boyfriend);
					//boyfriend.flipX = true;
					dad.x = 1200 - 250;
					dad.y = -94.75 + 225;
					dad.visible = false;
					xeoflip = new Character(750 - 250, -94.75 + 100, mod + ':xeoflip');
    				dads.push(xeoflip);
    				PlayState.add(xeoflip);
    				PlayState.iconP2.changeCharacter(mod + ':xeo');
					//xeoflip.flipX = true ;

					
					case 2823:
					//doP3JumpEGGMAN();

					remove(dad);
					//kun.destroy();
					//remove(kun);
					FlxTween.tween(FlxG.camera, {zoom: 1}, 2, {ease: FlxEase.cubeOut});
					defaultCamZoom = 1;
					PlayState.remove(PlayState.boyfriend);
    				PlayState.boyfriend.destroy();
    				PlayState.boyfriends = [new Boyfriend(466.1 + 200, 685.6 - 250, 'bf')];
					boyfriend.y -= 350;	
    				PlayState.add(PlayState.boyfriend);
					remove(kun);
					dad.x = -100;
					dad.y = 275;
					PlayState.add(eggman);
					dads.push(eggman);
    				PlayState.iconP2.changeCharacter(mod + ':eggman');
					/*puStrums.forEach(function(spr:FlxSprite)
					{
						if (!FlxG.save.data.midscroll)
							FlxTween.tween(spr, {x: spr.x -= 700, y: spr.y}, 5, {ease: FlxEase.quartOut});
						// spr.x -= 700;
					});
					playerStrums.forEach(function(spr:FlxSprite)
					{
						if (!FlxG.save.data.midscroll)
							FlxTween.tween(spr, {x: spr.x += 600, y: spr.y}, 5, {ease: FlxEase.quartOut});
						// spr.x += 600;
					});*/

					p3staticbg.visible = false;
					
					remove(xeoflip);

				case 2887, 3015, 4039:
					eggman.playAnim('laugh', true);

				case 4111:
				p3staticbg.visible = true;
				remove(eggman);
				xeo = new Character(20 - 200, -94.75 + 100, mod + ':xeo');
    			PlayState.add(xeo);
    			PlayState.iconP2.changeCharacter(mod + ':xeo');
				dads.push(xeo);
				PlayState.remove(PlayState.boyfriend);
    			PlayState.boyfriend.destroy();
				dad.x = 140 -350;
				dad.y = -115.75 + 225;
    			PlayState.boyfriends = [new Boyfriend(502.45 + 200, 370.45, mod + ':bf2')];
    			PlayState.add(PlayState.boyfriend);
	}

}