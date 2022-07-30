/*function create(){
    startSong();
}*/
function onCountdown(val:Int) {
    startingSong = true;
    switch(val) {
        case 3:
          return false;
        case 2:
            return false;
        case 1:
            return false;
        case 0:
            return false;
    }
}