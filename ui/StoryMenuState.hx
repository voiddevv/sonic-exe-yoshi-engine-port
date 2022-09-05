function createPost() {
	FlxG.sound.music.stop();
	FlxG.sound.playMusic(Paths.music('storymodemenumusic'));

	var fuckYou:FlxSprite = new FlxSprite();
	fuckYou.makeGraphic(FlxG.width, FlxG.height, 0xFF000000);
	add(fuckYou);

	FlxG.switchState(new ModState("Story", mod));
}
