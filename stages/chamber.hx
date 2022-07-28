//
function create() {
    defaultCamZoom = .7;

    wall = new FlxSprite(-2379.05, -1211.1);
    wall.frames = Paths.getSparrowAtlas('Chamber/Wall');
    wall.animation.addByPrefix('a', 'Wall instance 1');
    wall.animation.play('a');
    wall.antialiasing = true;
    wall.scrollFactor.set(1.1, 1.1);
    add(wall);
    
    floor = new FlxSprite(-2349, 921.25);
    floor.antialiasing = true;
    add(floor);
    floor.frames = Paths.getSparrowAtlas('Chamber/Floor');
    floor.animation.addByPrefix('a', 'floor blue');
    floor.animation.addByPrefix('b', 'floor yellow');
    floor.animation.play('b', true);
    floor.animation.play('a', true); // whenever song starts make sure this is playing
    floor.scrollFactor.set(1.1, 1);
    floor.antialiasing = true;
    
    fleetwaybgshit = new FlxSprite(-2629.05, -1344.05);
    add(fleetwaybgshit);
    fleetwaybgshit.frames = Paths.getSparrowAtlas('Chamber/FleetwayBGshit');
    fleetwaybgshit.animation.addByPrefix('a', 'BGblue');
    fleetwaybgshit.animation.addByPrefix('b', 'BGyellow');
    fleetwaybgshit.animation.play('b', true);
    fleetwaybgshit.animation.play('a', true);
    fleetwaybgshit.antialiasing = true;
    fleetwaybgshit.scrollFactor.set(1.1, 1);
    
    emeraldbeam = new FlxSprite(0, -1376.95 - 200);
    emeraldbeam.antialiasing = true;
    emeraldbeam.frames = Paths.getSparrowAtlas('Chamber/Emerald Beam');
    emeraldbeam.animation.addByPrefix('a', 'Emerald Beam instance 1', 24, true);
    emeraldbeam.animation.play('a');
    emeraldbeam.scrollFactor.set(1.1, 1);
    emeraldbeam.visible = true; // this starts true, then when sonic falls in and screen goes white, this turns into flase
    add(emeraldbeam);
    
    emeraldbeamyellow = new FlxSprite(-300, -1376.95 - 200);
    emeraldbeamyellow.antialiasing = true;
    emeraldbeamyellow.frames = Paths.getSparrowAtlas('Chamber/Emerald Beam Charged');
    emeraldbeamyellow.animation.addByPrefix('a', 'Emerald Beam Charged instance 1', 24, true);
    emeraldbeamyellow.animation.play('a');
    emeraldbeamyellow.scrollFactor.set(1.1, 1);
    emeraldbeamyellow.visible = false; // this starts off on false and whenever emeraldbeam dissapears, this turns true so its visible once song starts
    add(emeraldbeamyellow);
    
    var emeralds:FlxSprite = new FlxSprite(326.6, -191.75);
    emeralds.antialiasing = true;
    emeralds.frames = Paths.getSparrowAtlas('Chamber/Emeralds', 'exe');
    emeralds.animation.addByPrefix('a', 'TheEmeralds instance 1', 24, true);
    emeralds.animation.play('a');
    emeralds.scrollFactor.set(1.1, 1);
    emeralds.antialiasing = true;
    add(emeralds);
    
    thechamber = new FlxSprite(-225.05, 463.9);
    thechamber.frames = Paths.getSparrowAtlas('Chamber/The Chamber');
    thechamber.animation.addByPrefix('a', 'Chamber Sonic Fall', 24, false);
    thechamber.scrollFactor.set(1.1, 1);
    thechamber.antialiasing = true;
    
    pebles = new FlxSprite(-562.15 + 100, 1043.3);
    add(pebles);
    pebles.frames = Paths.getSparrowAtlas('Chamber/pebles');
    pebles.animation.addByPrefix('a', 'pebles instance 1');
    pebles.animation.addByPrefix('b', 'pebles instance 2');
    pebles.animation.play('b', true);
    pebles.animation.play('a',
        true); // during cutscene this is gonna play first and then whenever the yellow beam appears, make it play "a"
    pebles.scrollFactor.set(1.1, 1);
    pebles.antialiasing = true;
    
    porker = new FlxSprite(2880.15, -762.8);
    porker.frames = Paths.getSparrowAtlas('Chamber/Porker Lewis');
    porker.animation.addByPrefix('porkerbop', 'Porker FG');
    
    porker.scrollFactor.set(1.4, 1);
    porker.antialiasing = true;
      
}