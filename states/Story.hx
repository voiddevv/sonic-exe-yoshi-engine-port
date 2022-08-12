import flixel.text.FlxTextBorderStyle;
import flixel.FlxBasic;
import Medals;

var bg:FlxSprite;
var grey:FlxSprite;
var red:FlxSprite;
var yellow:FlxSprite;
var bfwoah:FlxSprite;
var options:FlxSprite;
var diff:FlxSprite;
var staticThing:FlxSprite;

// songs 'n' selection shit
var songs = ['too slow', 'you can\'t run', 'trible-trouble'];
var curDiff:Int = 2;
var curAct:Int = 0;
var actSelec:Bool = false;
var oneclickpls:Bool = true;

// debugging stuff
var actOrSmthTxt:FlxText;

function create() {
	FlxG.sound.music.stop();
	FlxG.sound.playMusic(Paths.music('storymodemenumusic'));

	bg = new FlxSprite();
	bg.frames = Paths.getSparrowAtlas('story/SMMStatic');
	bg.animation.addByPrefix('bruh', "damfstatic", 24, true);
	bg.animation.play('bruh');
	add(bg);

	grey = new FlxSprite();
	grey.loadGraphic(Paths.image('story/greybox'));
	grey.setGraphicSize(FlxG.width, FlxG.height);
	grey.updateHitbox();
	add(grey);

	red = new FlxSprite();
	red.loadGraphic(Paths.image('story/redbox'));
	red.setGraphicSize(FlxG.width, FlxG.height);
	red.updateHitbox();
	add(red);

	// placing the thing here cuz haha fuck you
	options = new FlxSprite();
	options.frames = Paths.getSparrowAtlas('story/options');
	options.setGraphicSize(FlxG.width / 3.6, FlxG.height / 3.6);
	options.animation.addByPrefix('0', "too slow", 1, false);
	options.animation.addByPrefix('1', "you can't run", 1, false);
	options.animation.addByPrefix('2', "triple trouble", 1, false);
	options.animation.play('0');
	options.updateHitbox();
	options.screenCenter();
	options.x -= 5;
	options.y -= (FlxG.height / 4) + 3;
	add(options);

	staticThing = new FlxSprite();
	staticThing.frames = Paths.getSparrowAtlas('story/screenstatic');
	staticThing.animation.addByPrefix('sex', "screenSTATIC", 24, true);
	staticThing.animation.play('sex');
	staticThing.setGraphicSize(FlxG.width / 3.6, FlxG.height / 3.6);
	staticThing.updateHitbox();
	staticThing.x = options.x;
	staticThing.y = options.y;
	staticThing.alpha = 0.3;
	add(staticThing);

	yellow = new FlxSprite();
	yellow.loadGraphic(Paths.image('story/yellowbox'));
	yellow.setGraphicSize(FlxG.width, FlxG.height);
	yellow.updateHitbox();
	add(yellow);

	bfwoah = new FlxSprite();
	bfwoah.frames = Paths.getSparrowAtlas("story/story bf");
	bfwoah.animation.addByPrefix('idle', "BF idle dance", 24, true);
	bfwoah.animation.play('idle');
	bfwoah.scale.set(0.4, 0.4);
	bfwoah.updateHitbox();
	bfwoah.screenCenter();
	bfwoah.y += 50;
	add(bfwoah);

	diff = new FlxSprite(550, 600);
	diff.frames = Paths.getSparrowAtlas('story/bruh');
	diff.animation.addByPrefix('easy', "EASY");
	diff.animation.addByPrefix('normal', "NORMAL");
	diff.animation.addByPrefix('hard', "HARD");
	diff.animation.play('normal');
	diff.updateHitbox();
	diff.screenCenter(FlxAxes.X);
	add(diff);

	var _ = new FlxText(0, 0, 0, "THIS MENU IS UNFINISHED, don't expect everything to work!", 22);
	_.setFormat(Paths.font('SonicCDMenu'), 22, 0xFF00A2FF);
	_.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF444444, 4, 1);
	_.screenCenter();
	_.y = FlxG.height - _.height - 5;
	add(_);

	var sex = new FlxSprite();
	sex.loadGraphic(Paths.image('story/ref'));
	sex.alpha = 0.5;
	// add(sex);

	// debug stuff
	actOrSmthTxt = new FlxText(0, 0, 0, "Currently selected: your mom", 22);
	actOrSmthTxt.setFormat(Paths.font('SonicCDMenu'), 22, 0xFF00A2FF);
	actOrSmthTxt.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF000000, 4, 1);
	actOrSmthTxt.y = 5;
	actOrSmthTxt.x = FlxG.width - actOrSmthTxt.width - 5;
	add(actOrSmthTxt);
}

function update(elapsed) {
	var controls = FlxControls.justPressed;

	if (controls.ESCAPE || controls.BACKSPACE)
		FlxG.switchState(new MainMenuState());

	if ((controls.LEFT || controls.A) && oneclickpls) {
		// leftArrow.animation.play('press');
		if (actSelec)
			changeAct(-1);
		else
			changeDiff(-1);
		// } else {
		// leftArrow.animation.play('idle');
	}

	if ((controls.RIGHT || controls.D) && oneclickpls) {
		// rightArrow.animation.play('press');
		if (actSelec)
			changeAct(1);
		else
			changeDiff(1);
		// } else {
		// rightArrow.animation.play('idle');
	}

	if ((controls.UP || controls.DOWN || controls.W || controls.S) && oneclickpls) {
		CoolUtil.playMenuSFX();
		actSelec = !actSelec;
	}

	actOrSmthTxt.text = "SELECTED: "
		+ (actSelec ? "act" : "diff")
		+ "\nDIFF: "
		+ curDiff
		+ "\nACT: "
		+ curAct
		+ "\n";
	actOrSmthTxt.x = FlxG.width - actOrSmthTxt.width - 5;

	red.alpha = (actSelec ? 1 : 0.4);
	diff.alpha = (!actSelec ? 1 : 0.4);
}

function changeAct(diff:Int = 1) {
	CoolUtil.playMenuSFX();

	curAct += diff;
	if (curAct < 0)
		curAct = songs.length - 1;
	else if (curAct > songs.length - 1)
		curAct = 0;

	options.animation.play(Std.string(curAct));

	FlxTween.cancelTweensOf(staticThing);
	staticThing.alpha = 1;
	FlxTween.tween(staticThing, {alpha: 0.3}, 1);
}

function changeDiff(e:Int = 1) {
	CoolUtil.playMenuSFX();

	curDiff += e;

	if (curDiff == 0)
		curDiff = 3;
	if (curDiff == 4)
		curDiff = 1;

	switch (Std.int(curDiff)) {
		case 1:
			diff.animation.play('easy');
		case 2:
			diff.animation.play('normal');
		case 3:
			diff.animation.play('hard');
	}

	diff.updateHitbox();
	diff.screenCenter(FlxAxes.X);
	diff.y = 620; // 600 + 20
	diff.alpha = 0.3;
	FlxTween.tween(diff, {y: 600, alpha: 1}, 0.07); // whats the point of this if it goes for 7/100th of a second - wtf sonic.exe s.c.
}
