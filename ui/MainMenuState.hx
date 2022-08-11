// vs code complain termination lmaoo

var spikeUp:FlxSprite = new FlxSprite(0, -65);
var spikeDown:FlxSprite = new FlxSprite(-60, 630);
var arrows:FlxSprite = new FlxSprite(92, 182);

// funny
var curSelecte:Int = 0;
var menuI:FlxTypedGroup<FlxSprite>;
var selectedSomethin:Bool = false;
var enableControls:Bool = false;

function create() {
	var everything = ["story mode", "freeplay", "mods", "donate", "toolbox", "credits", "options"];
	for (i in everything)
		state.optionShit.remove(i);

	state.defaultBehaviour = false;
	state.autoCamPos = false;
	state.mouseControls = false; // woohoo fuck the mouse (not literally)

	menuI = new FlxTypedGroup();
}

function createPost() {
	remove(state.versionShit);

	spikeUp.loadGraphic(Paths.image('mainmenu/spikeUp'));
	spikeUp.scrollFactor.set();
	spikeUp.antialiasing = EngineSettings.antialiasing;
	add(spikeUp);

	spikeDown.loadGraphic(Paths.image('mainmenu/spikeDown'));
	spikeDown.scrollFactor.set();
	spikeDown.antialiasing = EngineSettings.antialiasing;
	add(spikeDown);

	arrows.loadGraphic(Paths.image('mainmenu/funniArrows'));
	arrows.scrollFactor.set();
	arrows.antialiasing = EngineSettings.antialiasing;
	add(arrows);
	arrowTween();

	state.fallBackBG.destroy();
	state.magenta.destroy();

	state.bg.scrollFactor.set();
	state.bg.screenCenter();

	add(menuI);

	var xval:Int = 100;
	var shit:Array<String> = ["story mode", "freeplay", "options", "sound test"];

	for (i in 0...shit.length) {
		var menuItem:MainMenuItem = new MainMenuItem(xval, 40 + (i * 140));
		// menuItem.autoPos = false;
		if (i % 2 == 0)
			menuItem.x -= 600 + i * 400;
		else
			menuItem.x += 600 + i * 400;

		menuItem.frames = Paths.getSparrowAtlas('mainmenu/FNF_main_menu_assets');
		menuItem.animation.addByPrefix('idle', shit[i] + ' basic', 1);
		menuItem.animation.addByPrefix('selected', shit[i] + ' white', 1);
		menuItem.animation.play('idle');
		menuItem.updateHitbox();
		menuItem.ID = i;
		menuItem.scrollFactor.set();
		menuItem.antialiasing = true;
		FlxTween.tween(menuItem, {x: xval}, 1 + (i * 0.25), {
			ease: FlxEase.expoInOut,
			onComplete: function() {
				if (menuItem.ID == 3) {
					changeItem(0);
					enableControls = true;
				}
			}
		});

		menuI.add(menuItem);

		xval = xval + 220;
	}

	add(state.versionShit);
}

function arrowTween() {
	FlxTween.tween(arrows, {y: arrows.y - 50}, 1, {
		ease: FlxEase.quadInOut,
		onComplete: function() {
			FlxTween.tween(arrows, {y: arrows.y + 50}, 1, {
				ease: FlxEase.quadInOut,
				onComplete: function() {
					arrowTween();
				}
			});
		}
	});
}

var canTween:Bool = true;

function update(elapsed) {
	var controls = FlxControls.justPressed;

	if (controls.ESCAPE || controls.BACKSPACE)
		FlxG.switchState(new TitleState());
	if (controls.UP && enableControls)
		changeItem(-1);
	if (controls.DOWN && enableControls)
		changeItem(1);
	
		
	if (controls.ENTER && enableControls) {
		switch (menuI.members[curSelected].ID) {
			case 0: // story mode
				FlxG.switchState(new StoryMenuState());
			case 1: // freeplay
				FlxG.switchState(new FreeplayState());
			case 2: // options
				FlxG.switchState(new options.screens.OptionMain());
			case 3:
				FlxG.switchState(new ModState("SoundTest", mod));
			default:
				trace('what the fuck how');
		}
	}

	if (canTween) {
		canTween = false;
		FlxTween.tween(spikeUp, {x: spikeUp.x - 61}, 1, {
			onComplete: function(twn:FlxTween) {
				spikeUp.x = 0;
				canTween = true;
			}
		});
		FlxTween.tween(spikeDown, {x: spikeDown.x + 61}, 1, {
			onComplete: function(twn:FlxTween) {
				spikeDown.x = -60;
			}
		});
	}
}

function changeItem(huh:Int = 0) {
	curSelected += huh;

	if (curSelected >= menuI.length)
		curSelected = 0;
	if (curSelected < 0)
		curSelected = menuI.length - 1;

	menuI.forEach(function(spr:FlxSprite) {
		spr.animation.play('idle');
		spr.offset.set(0, 0);

		if (spr.ID == curSelected) {
			spr.animation.play('selected');
		}

		spr.updateHitbox();
	});
}
