var video:Bool = false;

function create(name) {
	FlxG.sound.music.stop();

	if (name == "Razencro") {
		var thank = new FlxSprite().loadGraphic(Paths.image('cameos/Razencro'));
		thank.setGraphicSize(FlxG.width, FlxG.height);
		add(thank);

		
		FlxG.sound.playMusic(Paths.sound('cameostuff/Razencro'));
	}

	if (name == "Divide") { // may Divide rest in peace.
		var peace = new FlxSprite().loadGraphic(Paths.image('cameos/Divide'));
		peace.setGraphicSize(FlxG.width, FlxG.height);
		add(peace);
	}
}

function update(elapsed) {
	var controls = FlxControls.justPressed;

	if (!video)
		if (controls.ENTER)
			FlxG.switchState(new ModState("SoundTest", mod));
}
