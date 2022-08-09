// fucking hell vscode
function stepHit(curStep:Int) {
	switch (curStep) {
		case 320:
			FlxTween.tween(FlxG.camera, {zoom: .9}, 2, {ease: FlxEase.cubeOut});
			defaultCamZoom = .9;
		case 1103:
			FlxTween.tween(FlxG.camera, {zoom: .8}, 2, {ease: FlxEase.cubeOut});
			defaultCamZoom = .8;
	}
}
