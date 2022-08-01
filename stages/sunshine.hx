
//
var dad2:Character;
function create() {
    trace('song sunshine');
    defaultCamZoom = 0.9;
	bgspec = new FlxSprite().loadGraphic(Paths.image('stages/TailsBG'));
	bgspec.setGraphicSize(Std.int(bgspec.width * 1.2));
	bgspec.antialiasing = true;
	bgspec.scrollFactor.set(.91, .91);
	bgspec.x -= 370;
	bgspec.y -= 130;
	bgspec.active = false;
	add(bgspec);
    dad.y += 230;
	dad.x -= 250;
    gf.visible = false;
    boyfriend.y += 300;
    dad2 = new Character(-150, 330, mod + ':tailssunshinealt');
    add(dad2);
}
function stepHit(curStep:Int) {
    switch curStep{
        case 588:
        bgspec.visible = false;
        boyfriend.visible = false;
        remove(dad);
        dads.push(dad2);
		dad2.visible = true;
        case 860:
        add(dad);
        boyfriend.visible = true;
        remove(dad2);
        bgspec.visible = true;            
    }
    
}
