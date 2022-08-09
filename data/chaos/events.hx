var dad2:Character = new Character(175, -25, mod + ':fleetway anims');
var bfsuper:Boyfriend = new Boyfriend(175, -25, mod + ':superbf');
bfsuper.alpha = 0.0001;


dad2.alpha = 0.0001;
function create() {
    PlayState.add(bfsuper);
    trace(boyfriend.x);
    trace(boyfriend.y);
	PlayState.add(dad2);
}

function stepHit(curStep:Int) {
    switch curStep {
		case 274, 398, 527, 656, 784, 1041, 1168, 1296, 1552, 1680, 1804:
            dad.visible = true;
            dad2.alpha = 0;
        case 9:
            FlxTween.tween(dad, {x: 61.15, y: -94.75}, 2, {ease: FlxEase.cubeOut});
            PlayState.dad.visible = true;
        case 15:
			dad.playAnim('fastanim', true);
            
		case 254:
			dad2.alpha = 1;
			dad2.playAnim('Laser Blast', true);
            dad.visible = false;
		case 384:
			dad2.alpha = 1;
			dad2.playAnim('StepItUp', true);
            dad.visible = false;
		case 512:
			dad2.alpha = 1;
			dad2.playAnim('Laugh', true);
            dad.visible = false;
		case 640:
			dad2.alpha = 1;
			dad2.playAnim('Too Slow', true);
            dad.visible = false;
		case 776:
			dad2.alpha = 1;
			dad2.playAnim('YoureFinished', true);
            dad.visible = false;
        
        case 1008:
            FlxG.sound.play(Paths.sound('SUPERBF'));
            PlayState.remove(PlayState.boyfriend);
    		PlayState.boyfriend.destroy();
    		PlayState.boyfriends = [new Boyfriend(2060, 350, mod + ':superbf')];
            PlayState.add(boyfriend);
            boyfriend.scrollFactor.set(1.1, 1);


        case 1036:
            dad2.alpha = 1;
            dad.visible = false;
            dad2.playAnim('WHAT?!', true);
        case 1157:
            dad2.alpha = 1;
            dad.visible = false;
            dad2.playAnim('Grrr', true);
        case 1260:
            dad2.alpha = 1;
            dad.visible = false;
            dad2.playAnim('Show You', true);
        case 1545:
            dad2.alpha = 1;
            dad.visible = false;
            dad2.playAnim('Scream', true);
        case 1673:
            dad2.alpha = 1;
            dad.visible = false;
            dad2.playAnim('Growl', true);
        case 1793:
            dad2.alpha = 1;
            dad.visible = false;
            dad2.playAnim('Shut Up', true);
        case 1936:
            dad2.alpha = 1;
            dad.visible = false;
            dad2.playAnim('singRIGHT-alt', true);

      }
}
