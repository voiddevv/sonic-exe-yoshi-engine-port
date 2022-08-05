import flixel.text.FlxTextBorderStyle;
import DiscordClient;
import PlayState;
import LoadingState;

var bg:FlxSprite;
var soundTestTxt:FlxText;
var pcm:FlxText = new FlxText(FlxG.width / 6, FlxG.height / 2, 0, 'PCM NO .', 23);
var da:FlxText = new FlxText(FlxG.width * .6, FlxG.height / 2, 0, 'DA NO .', 23);
var pcmNum:FlxText = new FlxText(FlxG.width / 6, FlxG.height / 2, 0, '0', 23);
var daNum:FlxText = new FlxText(FlxG.width / 6, FlxG.height / 2, 0, '0', 23);
var pcmValue:Int = 0;
var daValue:Int = 0;

/**
	The codes and their respective properties.. 'n shit.
	@param PCMvalue [Int]
	@param DAvalue [Int]
	@param isSong [Bool] If set to false, custom instructions will have to be put with an if statement.
	@param songName [String] (Depends on isSong being 'true')
	@param songDiff [String] (Depends on isSong being 'true')
**/
var values:Array<Array<Dynamic>> = [
	[12, 25, true, "endless", "Hard"],
	[7, 7, true, "cycles", "Hard"],
	[31, 13, false], // Faker/Black Sun (custom instruction for story mode type lmao)
	[66, 6, true, "sunshine", "Hard"],
	[8, 21, true, "chaos", "Hard"],
	[0, 0, true, "too-fest", "Hard"],
	[41, 1, false], // cameo - Razencro
	[1, 13, false], // cameo - the late Divide (r.i.p.)
];

// funny monke
var funnymonke:Bool = true;

function create() {
	DiscordClient.changePresence('In the Sound Test Menu', null); // yes this works btw lmao
	FlxG.sound.music.stop();

	bg = new FlxSprite(0, 0);
	bg.loadGraphic(Paths.image('sound test/background'));
	downscale(bg, true);
	add(bg);

	soundTestTxt = new FlxText(0, 0, 0, 'SOUND TEST', 25);
	soundTestTxt.screenCenter();
	soundTestTxt.x -= 33;
	soundTestTxt.y -= 180;
	soundTestTxt.setFormat(Paths.font('SonicCDMenu'), 25, 0xFF00A2FF);
	soundTestTxt.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF000000, 4, 1);
	add(soundTestTxt);

	pcm.setFormat(Paths.font('SonicCDMenu'), 23, 0xFFAEB3FB);
	pcm.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF6A6E9F, 4, 1);
	pcm.x += 100;
	pcm.y -= 70;

	da.setFormat(Paths.font('SonicCDMenu'), 23, 0xFFAEB3FB);
	da.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF6A6E9F, 4, 1);
	da.y -= 70;

	add(pcm);
	add(da);

	pcmNum.setFormat(Paths.font('SonicCDMenu'), 23, 0xFFAEB3FB);
	pcmNum.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF6A6E9F, 4, 1);
	pcmNum.y -= 70;
	pcmNum.x += 270;

	daNum.setFormat(Paths.font('SonicCDMenu'), 23, 0xFFAEB3FB);
	daNum.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF6A6E9F, 4, 1);
	daNum.y -= 70;
	daNum.x += da.x - 70;

	add(pcmNum);
	add(daNum);
}

function update(elapsed) {
	var controls = FlxControls.justPressed;
	var controlsHold = FlxControls.pressed;

	if (controls.RIGHT || controls.LEFT || controls.A || controls.D)
		funnymonke = !funnymonke;
	if (controls.BACKSPACE || controls.ESCAPE)
		FlxG.switchState(new MainMenuState());
	if (controls.ENTER)
		doFunny(pcmValue, daValue);
	if (controls.UP || controls.W)
		changeNumber(controlsHold.SHIFT ? -10 : -1);
	if (controls.DOWN || controls.S)
		changeNumber(controlsHold.SHIFT ? 10 : 1);

	if (funnymonke) {
		pcm.setFormat(Paths.font('SonicCDMenu'), 23, 0xFFfeae00);
		pcm.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFFfd2403, 4, 1);

		da.setFormat(Paths.font('SonicCDMenu'), 23, 0xFFaeb3fb);
		da.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF6a6e9f, 4, 1);
	} else {
		pcm.setFormat(Paths.font('SonicCDMenu'), 23, 0xFFaeb3fb);
		pcm.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF6a6e9f, 4, 1);

		da.setFormat(Paths.font('SonicCDMenu'), 23, 0xFFfeae00);
		da.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFFfd2403, 4, 1);
	}

	if (pcmValue < 10)
		pcmNum.text = "0" + Std.string(pcmValue);
	else
		pcmNum.text = Std.string(pcmValue);

	if (daValue < 10)
		daNum.text = "0" + Std.string(daValue);
	else
		daNum.text = Std.string(daValue);
}

/**
	Downscale images from 1080p to 720p.
	@param item [FlxSprite] Item to downscale to proper 720p scale.
	@param scrollFactorSet [Bool] Whether or not to set the scrollFactor to 0.
**/
function downscale(item:FlxSprite, scrollFactorSet:Bool) {
	item.scale.set(0.675, 0.675);
	item.updateHitbox();
	if (scrollFactorSet)
		item.scrollFactor.set();
}

function changeNumber(selection:Int) {
	if (funnymonke) {
		pcmValue += selection;
		if (pcmValue < 0)
			pcmValue = 69;
		if (pcmValue > 69)
			pcmValue = 0;
	} else {
		daValue += selection;
		if (daValue < 0)
			daValue = 37;
		if (daValue > 37)
			daValue = 0;
	}
}

var pcmValid:Bool = false;
var daValid:Bool = false;

// bruh
var traceEverything:Bool = false;

function doFunny(pcm:Int, da:Int) {
	var _pcm;
	var _da;
	var _isSong;
	var _songName;
	var _songDiff;
	for (i in 0...values.length) {
		// setting up actual values instead of using array nums, cuz its easier
		_pcm = values[i][0];
		_da = values[i][1];
		_isSong = values[i][2];
		if (_isSong) {
			_songName = values[i][3];
			_songDiff = values[i][4];
		}

		if (traceEverything) {
			trace('-----------');
			trace(_pcm);
			trace(_da);
			trace(_isSong);
			trace(_songName);
			trace(_songDiff);
		}

		if (validCheck(i, pcm, da, _pcm, _da)) {
			if (traceEverything)
				trace("valid");

			if (_isSong) {
				CoolUtil.loadSong(mod, _songName, _songDiff);
				LoadingState.loadAndSwitchState(new PlayState());
			} else {
				if (_pcm == 31 && _da == 13) { // faker/black sun loading
					var weekData = Json.parse('{
							"songs": [
								"Faker",
								"Black-Sun"
							]
						}');
					loadAndPlayStoryWeek(weekData);
				}
			}
		}
	}
}

function validCheck(i, currentPCM, currentDA, PCMcheck, DAcheck):Bool {
	var pcmGood:Bool = false;
	var daGood:Bool = false;

	if (currentPCM != PCMcheck) {
		if (traceEverything)
			trace('pcm no');
		pcmGood = false;
	} else {
		if (traceEverything)
			trace('pcm yes');
		pcmGood = true;
	}

	if (currentDA != DAcheck) {
		if (traceEverything)
			trace('da no');
		daGood = false;
	} else {
		if (traceEverything)
			trace('da yes');
		daGood = true;
	}

	if (pcmGood && daGood)
		return true;
	else
		return false;
}

function loadAndPlayStoryWeek(thing:Dynamic) { // CoolUtil.loadWeek is literally empty in source, so we gotta do it ourselves lmao
	trace('loading week thingy is happening');
	PlayState.actualModWeek = thing;
	PlayState.songMod = mod;
	PlayState.storyPlaylist = thing.songs;
	PlayState.startTime = 0;
	PlayState.storyDifficulty = "Hard";
	CoolUtil.loadSong(mod, thing.songs[0].toString(), "Hard");
	PlayState.storyWeek = 0;
	PlayState.campaignScore = 0;
	PlayState.isStoryMode = true;
	LoadingState.loadAndSwitchState(new PlayState());
}
