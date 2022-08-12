var _size = 0.35;
var title:AlphabetOptimized = new AlphabetOptimized(0, 0, "EXTRA DEBUG INFO", true, _size);
var curStepTxt:AlphabetOptimized = new AlphabetOptimized(0, 0, "", true, _size);
var curBeatTxt:AlphabetOptimized = new AlphabetOptimized(0, 0, "", true, _size);
var bpmTxt:AlphabetOptimized = new AlphabetOptimized(0, 0, "", true, _size);
var dadAnimTxt:AlphabetOptimized = new AlphabetOptimized(0, 0, "", true, _size);
var bfAnimText:AlphabetOptimized = new AlphabetOptimized(0, 0, "", true, _size);
var camZoomTxt:AlphabetOptimized = new AlphabetOptimized(0, 0, "", true, _size);
var comboTxt:AlphabetOptimized = new AlphabetOptimized(0, 0, "", true, _size);

// offset for each text lmaoo
var yOffset = 22.5;

var everything = [
	title,
	curStepTxt,
	curBeatTxt,
	bpmTxt,
	dadAnimTxt,
	bfAnimText,
	camZoomTxt,
	comboTxt
];

function create() {
	for (i in everything) {
		i.x = 20;
		i.cameras = [PlayState.camHUD];
		i.scrollFactor.set();
	}
	title.y = 200;
	curStepTxt.y = title.y + yOffset;
	curBeatTxt.y = curStepTxt.y + yOffset;
	bpmTxt.y = curBeatTxt.y + yOffset;
	dadAnimTxt.y = bpmTxt.y + yOffset;
	bfAnimText.y = dadAnimTxt.y + yOffset;
	camZoomTxt.y = bfAnimText.y + yOffset;
	comboTxt.y = camZoomTxt.y + yOffset;
}

function onGenerateStaticArrows() {
	for (thing in everything)
		add(thing);
}

var byebye:Bool;

function update(elapsed) {
	var controls = FlxControls.justPressed;

	if (controls.CONTROL) {
		for (i in everything) {
			i.visible = (byebye ? true : false);
		}
		byebye = !byebye;
	}

	curStepTxt.text = "curStep      " + PlayState.curStep;
	curBeatTxt.text = "curBeat      " + PlayState.curBeat;
	bpmTxt.text = "BPM          " + PlayState.song.bpm;

	dadAnimTxt.text = "dad curAnim  " + PlayState.dad.animation.curAnim.name;
	bfAnimText.text = "bf curAnim   " + PlayState.boyfriend.animation.curAnim.name;

	camZoomTxt.text = "camZoom      " + PlayState.defaultCamZoom;
	comboTxt.text = "combo/misses " + PlayState.combo + "/" + PlayState.misses;
}
