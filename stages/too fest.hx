function create() {
	{
		defaultCamZoom = 0.9;

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('stages/too fas/sanicbg'));
		bg.setGraphicSize(Std.int(bg.width * 1.2));
		bg.antialiasing = true;
		bg.scrollFactor.set(.91, .91);
		bg.x -= 370;
		bg.y -= 130;
		bg.active = false;
		add(bg);
		dad.y -= 560;
		dad.x -= 1000;
		gf.visible = false;
	}
}
