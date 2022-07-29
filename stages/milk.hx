function create() {
    defaultCamZoom = 0.9;

						var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('stages/sunk/SunkBG'));
						bg.setGraphicSize(Std.int(bg.width * 0.8));
						bg.antialiasing = true;
						bg.scrollFactor.set(.91, .91);
						bg.x -= 670;
						bg.y -= 260;
						bg.active = false;
						add(bg);
                        boyfriend.x -= 100;
				        dad.x = -180;
				        dad.y = 200;
				        dad.scale.x = 1;
				        dad.scale.y = 1;
                        gf.visible = false;
}
function stepHit(curStep:Int) {
    if (curStep == 538 || curStep == 2273)
        {
            var sponge:FlxSprite = new FlxSprite(dad.getGraphicMidpoint().x - 200,
                dad.getGraphicMidpoint().y - 120).loadGraphic(Paths.image('stages/sunk/SpingeBinge'));

            add(sponge);

            dad.visible = false;

            new FlxTimer().start(0.7, function(tmr:FlxTimer)
            {
                remove(sponge);
                dad.visible = true;
            });
        }
        if (curStep == 69) // holy fuck niceeee
        {
            FlxTween.tween(FlxG.camera, {zoom: 2.2}, 4);
        }
        if (curStep == 96) // holy fuck niceeee
        {
            FlxTween.cancelTweensOf(FlxG.camera);
            FlxG.camera.zoom = defaultCamZoom;
        }
}