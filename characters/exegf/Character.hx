function create() {
	character.frames = Paths.getCharacter(character.curCharacter);
	animation.addByIndices('sad', 'gf miss', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
	animation.addByIndices('danceLeft', 'gf dance', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
	animation.addByIndices('danceRight', 'gf dance', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
	addOffset('sad', -9, -20);
	addOffset('danceLeft', 0, -9);
	addOffset('danceRight', 0, -9);
	playAnim('danceRight');

}
danced = false;
function dance() {
    if (danced)
        playAnim("danceLeft");
    else
        playAnim("danceRight");
    danced = !danced;
}