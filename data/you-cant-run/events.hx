
function stepHit(curStep:Int) {
	var vg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('coolshit/redVG'));
			vg.alpha = 0;
			vg.cameras = [camHUD];
			add(vg);

			var amongus:Bool = true;

			switch (curStep) // haha laugh funny
			{
				case 128, 328, 1288:
					dad.playAnim('laugh', true);
				case 130, 132, 134, 136, 138, 140, 330, 332, 334, 1290, 1292, 1294:
					dad.playAnim('laugh', true);
				}
		}