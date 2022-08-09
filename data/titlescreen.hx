//

var pressedEnter:Bool = FlxControls.justPressed.ENTER;
var Logo:FlxSprite;
var bg:FlxSprite;
var titleText:FlxSprite;

state.remove(FlxG.state.titleText);
FlxG.sound.play(Paths.sound('TitleLaugh'), 1);
function create() {
	bg = new FlxSprite(0, 0);
	bg.frames = Paths.getSparrowAtlas('titlescreen/NewTitleMenuBG');
	bg.antialiasing = true;
	bg.scale.x = 3;
	bg.scale.y = 3;
	bg.animation.addByPrefix('red-lines', 'TitleMenuSSBG instance 1', 24, true);
	bg.screenCenter();
	add(bg);
	bg.animation.play('red-lines');

	Logo = new FlxSprite(0, 0).loadGraphic(Paths.image('titlescreen/Logo'));
	Logo.screenCenter();
	Logo.scale.x = 0.5;
	Logo.scale.y = 0.5;
	add(Logo);

	titleText = new FlxSprite(0, 0);
	titleText.frames = Paths.getSparrowAtlas('titlescreen/titleEnterNEW');
	titleText.animation.addByPrefix('idle', "Press Enter to Begin instance 1", 24);
	titleText.animation.addByPrefix('press', "ENTER PRESSED instance 1", 24, false);
	titleText.antialiasing = true;
	titleText.animation.play('idle');
	titleText.updateHitbox();
	titleText.screenCenter();
	add(titleText);
}

function update() {
	if (FlxControls.justPressed.ENTER)
		titleText.animation.play('press');
}
