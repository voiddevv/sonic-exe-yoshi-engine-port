 //
 var coolshit:FlxSprite = new FlxSprite(0, 0);

 function create() { 
	state.optionShit.remove("mods");
  state.optionShit.remove("donate");
  state.optionShit.remove("toolbox");
  state.optionShit.remove("credits");
  state.add(coolshit);
 }
/*function createPost() {
  coolshit.frames = Paths.getSparrowAtlas('titlescreen/NewTitleMenuBG');
	coolshit.antialiasing = true;
	coolshit.scale.x = 3;
	coolshit.scale.y = 3;
	coolshit.animation.addByPrefix('red-lines', 'TitleMenuSSBG instance 1', 24, true);
	coolshit.screenCenter();
  state.add(coolshit);
	coolshit.animation.play('red-lines');
  coolshit.animation.play('red-lines');
  trace('kjsd');
}*/