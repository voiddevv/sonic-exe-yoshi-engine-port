var sunk:FlxSprite = new FlxSprite().loadGraphic(Paths.image('stages/sunk/SunkBG'));
function create() {
    defaultCamZoom = 0.9;

						
						sunk.setGraphicSize(Std.int(sunk.width * 0.8));
						sunk.antialiasing = true;
						sunk.scrollFactor.set(.91, .91);
						sunk.x -= 670;
						sunk.y -= 260;
						sunk.active = false;
						add(sunk);
                        boyfriend.x -= 100;
				        dad.x = -180;
				        dad.y = 200;
				        dad.scale.x = 1;
				        dad.scale.y = 1;
                        gf.visible = false;
}
function stepHit(curStep:Int) {
    switch (curStep){
        case 2286:
            camHUD.visible = false;
            boyfriend.visible = false;
            dad.visible = false;
            sunk.visible = false;
            var pat:FlxSprite = new FlxSprite().loadGraphic(Paths.image('coolshit/pat'));
            pat.x = 600;
            pat.y = 400;
            add (pat);
    }
    
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