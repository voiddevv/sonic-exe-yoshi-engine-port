function create() {
    			frames = Paths.getcharacter(gf2);
				
				
				
				animation.addByIndices('sad', 'Pixel gf miss', [0, 1, 2, 3, 4], "", 24, false);
				animation.addByIndices('danceLeft', 'Pixel gf dance', [0, 1, 2, 3], "", 24, false);
				animation.addByIndices('danceRight', 'Pixel gf dance', [4, 5, 6, 7], "", 24, false);

				addOffset('sad', -9, -20);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * 10));
				updateHitbox();

				antialiasing = false;
}
