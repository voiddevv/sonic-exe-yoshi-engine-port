//
var heatlhDrop:Float = 0.00001;
function create(){
    defaultCamZoom = 0.9;

                        boyfriend.x += 300;
                        boyfriend.y += 100;
                        gf.x += 430;
                        gf.y += 170;
                        trace(heatlhDrop);

                        var vgblack:FlxSprite; 
                        vgblack = new FlxSprite().loadGraphic(Paths.image('stages/exestage/black_vignette'));
			            var tentas:FlxSprite;
                        tentas = new FlxSprite().loadGraphic(Paths.image('stages/exestage/tentacles_black'));
			            tentas.alpha = 0;
			            vgblack.alpha = 0;
			            vgblack.cameras = [camHUD];
			            tentas.cameras = [camHUD];
			            add(vgblack);
			            add(tentas);
			            health = 2;
                        var sSKY:FlxSprite = new FlxSprite(-414, -240.8).loadGraphic(Paths.image('stages/exestage/sky'));
						sSKY.antialiasing = true;
						sSKY.scrollFactor.set(1, 1);
						sSKY.active = false;
						sSKY.scale.x = 1.2;
						sSKY.scale.y = 1.2;
						add(sSKY);

						var trees:FlxSprite = new FlxSprite(-290.55, -298.3).loadGraphic(Paths.image('stages/exestage/backtrees'));
						trees.antialiasing = true;
						trees.scrollFactor.set(1.1, 1);
						trees.active = false;
						trees.scale.x = 1.2;
						trees.scale.y = 1.2;
						add(trees);

						var bg2:FlxSprite = new FlxSprite(-306, -334.65).loadGraphic(Paths.image('stages/exestage/trees'));
						bg2.updateHitbox();
						bg2.antialiasing = true;
						bg2.scrollFactor.set(1.2, 1);
						bg2.active = false;
						bg2.scale.x = 1.2;
						bg2.scale.y = 1.2;
						add(bg2);

						var bg:FlxSprite = new FlxSprite(-309.95, -240.2).loadGraphic(Paths.image('stages/exestage/ground'));
						bg.antialiasing = true;
						bg.scrollFactor.set(1.3, 1);
						bg.active = false;
						bg.scale.x = 1.2;
						bg.scale.y = 1.2;
						add(bg);

						var treething:FlxSprite = new FlxSprite(-409.95, -340.2);
						treething.frames = Paths.getSparrowAtlas('stages/exestage/ExeAnimatedBG_Assets');
						treething.animation.addByPrefix('a', 'ExeBGAnim', 24, true);
						treething.antialiasing = true;
						treething.scrollFactor.set(1, 1);
						add(treething);

						var tails:FlxSprite = new FlxSprite(700, 500).loadGraphic(Paths.image('stages/exestage/TailsCorpse'));
						tails.antialiasing = true;
						tails.scrollFactor.set(1, 1);
						add(tails);

						note.enableRating = false;
						
						
							treething.animation.play('a', true);
						
}

var ccap;

function update(elapsed:Float){
	ccap = combo;
	if (combo > 40)
		ccap = 40;

	heatlhDrop = 0.0000001; // this is the default drain, imma just add a 0 to it :troll:.
	
	health -= heatlhDrop * (500 / ((ccap + 1) / 8) * ((misses +
		1) / 1.9)); // alright so this is the code for the healthdrain, also i did + 1 cus i you were to multiply with 0.... yea
    
}
function stepHit(curStep:Int) {
	trace(health);
	trace(heatlhDrop);
}
function onMiss(){
    health -= 0.04;
    health += 0.125;
	
}
function onPlayerHit(){
		health -= 0.020;
    trace('hp ' + health);
}