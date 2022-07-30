function create() {
    note.frames = Paths.getSparrowAtlas("notes/Majin_Notes");
    switch(note.noteData % PlayState.song.keyNumber) {
        case 0:
            note.animation.addByPrefix('scroll', "left press");
        case 1:
            note.animation.addByPrefix('scroll', "down press");
        case 2:
            note.animation.addByPrefix('scroll', "up press");
        case 3:
            note.animation.addByPrefix('scroll', "right press");
    }
    note.animation.addByPrefix('holdpiece', "blue hold piece");
    note.animation.addByPrefix('holdend', "blue hold end");

    note.setGraphicSize(Std.int(note.width * 0.75));
    note.updateHitbox();
    note.antialiasing = true;
    note.splashColor = 0x000400E9;
    
    note.animation.play("scroll");
}