//
var p3staticbg = new FlxSprite(0, 0);
function create() {
	var sSKY:FlxSprite = new FlxSprite(-621.1, -395.65).loadGraphic(Paths.image('stages/triple/Glitch'));
	sSKY.antialiasing = true;
	sSKY.scrollFactor.set(0.9, 1);
	sSKY.active = false;
	sSKY.scale.x = 1.2;
	sSKY.scale.y = 1.2;
	add(sSKY);

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
	// cpuStrum.x -= 700;
	PlayState.gf.visible = false;
}

function stepHit(curStep:Int) {
	// getCamPos();
	switch curStep {
		case 1040, 2320, 4111: // switch to sonic facing right
			p3staticbg.visible = true;

		case 1296, 2823: // switch to knuckles facing left facing right and bf facing right, and cool static
			p3staticbg.visible = false;
	}
}
