package;

import flixel.system.FlxSound;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileCircle;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileSquare;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class MenuState extends FlxTransitionableState
{
	var startBtn:FlxButton;
	var title:FlxSprite;
	var menuFrame:FlxSprite;

	// Level buttons
	var level1Btn:FlxButton;
	var level2Btn:FlxButton;
	var level3Btn:FlxButton;

	// other buttons
	var musicBtn:FlxButton;
	var fullBtn:FlxButton;
	var howBtn:FlxButton;
	var level4Btn:FlxButton;

	var background:Array<FlxSprite>;

	// Level texts
	var selectText:FlxText;
	var level1Text:FlxText;
	var level2Text:FlxText;
	var level3Text:FlxText;
	var level4Text:FlxText;

	// Preview for game states
	var level1Preview:Array<FlxSprite>;
	var level2Preview:Array<FlxSprite>;
	var level3Preview:Array<FlxSprite>;
	var level4Preview:Array<FlxSprite>;
	var qMark:Array<Int>;
	var bA:Int;

	var medalTrack:Int;

	override public function create():Void
	{
		FlxG.save.data.winRecord = ArtArrays.winRecord;
		// Other stuff
		medalTrack = 0;
		background = new Array<FlxSprite>();
		for (i in 0...5)
		{
			for (k in 0...5)
			{
				background[i] = new FlxSprite((i - 1) * 256, (k - 1) * 256);
				background[i].loadGraphic("assets/images/BackgroundReal.png", true, 256, 256);
				background[i].animation.add("bg", [
					for (j in 0...65)
						j
				], 30, true);
				add(background[i]);
				background[i].animation.play("bg");
			}
		}

		menuFrame = new FlxSprite(0, 253);
		menuFrame.loadGraphic(AssetPaths.mainMenu__png);
		add(menuFrame);

		title = new FlxSprite(101, 53);
		title.loadGraphic(AssetPaths.logo__png, true, 562, 131);
		title.animation.add("wave", [for (i in 0...12) i], 9, true);
		add(title);
		title.animation.play("wave");

		// Level Text
		selectText = new FlxText(385, 255, -1, "SELECT LEVEL");
		formatText(selectText);
		add(selectText);

		level1Text = new FlxText(287, 442, -1, "???");
		formatText(level1Text);
		add(level1Text);

		level2Text = new FlxText(476, 442, -1, "???");
		formatText(level2Text);
		add(level2Text);

		level3Text = new FlxText(287, 632, -1, "???");
		formatText(level3Text);
		add(level3Text);

		level4Text = new FlxText(476, 632, -1, "???");
		formatText(level4Text);
		add(level4Text);

		swapText();

		// Level buttons
		level1Btn = new FlxButton(235, 56 + 253, "", gameOne);
		level1Btn.loadGraphic(AssetPaths.questionMark__png);
		add(level1Btn);
		if (ArtArrays.winRecord[0] == 1)
		{
			level1Btn.loadGraphic(ArtArrays.boardSolImagesCol[0]);
			medalTrack += 1;
		}

		level2Btn = new FlxButton(425, 56 + 253, "", gameTwo);
		level2Btn.loadGraphic(AssetPaths.questionMark__png);
		add(level2Btn);
		if (ArtArrays.winRecord[1] == 1)
		{
			level2Btn.loadGraphic(ArtArrays.boardSolImagesCol[1]);
			medalTrack += 1;
		}

		level3Btn = new FlxButton(235, 246 + 253, "", gameThree);
		level3Btn.loadGraphic(AssetPaths.questionMark__png);
		add(level3Btn);
		if (ArtArrays.winRecord[2] == 1)
		{
			level3Btn.loadGraphic(ArtArrays.boardSolImagesCol[2]);
			medalTrack += 1;
		}

		level4Btn = new FlxButton(425, 246 + 253, "", gameFour);
		level4Btn.loadGraphic(AssetPaths.questionMark__png);
		add(level4Btn);
		if (ArtArrays.winRecord[3] == 1)
		{
			level4Btn.loadGraphic(ArtArrays.boardSolImagesCol[3]);
			medalTrack += 1;
		}

		if (medalTrack == 4)
		{
			NGio.unlockMedal(69248);
		}

		// Bottom buttons
		musicBtn = new FlxButton(11, 469 + 253, "", onMute);
		if (ArtArrays.musicVol == 1)
			musicBtn.loadGraphic(AssetPaths.sound1__png, true, 30, 30);
		else
			musicBtn.loadGraphic(AssetPaths.sound2__png, true, 30, 30);
		add(musicBtn);
		fullBtn = new FlxButton(55, 469 + 253, "", onFull);
		if (!FlxG.fullscreen)
			fullBtn.loadGraphic(AssetPaths.fullscreen1__png, true, 30, 30);
		else
			fullBtn.loadGraphic(AssetPaths.fullscreen2__png, true, 30, 30);
		add(fullBtn);
		howBtn = new FlxButton(614, 722, "HOW TO PLAY", onHow);
		howBtn.loadGraphic(AssetPaths.howToPlay__png, true, 135, 30);
		buttonTextMaker(howBtn, 16);
		howBtn.label.y += 10;
		add(howBtn);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	function buttonTextMaker(button:FlxButton, textSize:Int)
	{
		button.label.setFormat(AssetPaths.NewgroundsFont_Regular__otf);
		button.label.size = textSize;
	}

	function onMute()
	{
		if (ArtArrays.musicVol == 1)
		{
			ArtArrays.musicVol = 0;
			musicBtn.loadGraphic(AssetPaths.sound2__png, true, 30, 30);
		}
		else
		{
			ArtArrays.musicVol = 1;
			musicBtn.loadGraphic(AssetPaths.sound1__png, true, 30, 30);
		}

		InitState.mainTheme.volume = ArtArrays.musicVol;
	}

	function onFull()
	{
		if (FlxG.fullscreen)
		{
			fullBtn.loadGraphic(AssetPaths.fullscreen1__png, true, 30, 30);
			FlxG.fullscreen = false;
		}
		else
		{
			fullBtn.loadGraphic(AssetPaths.fullscreen2__png, true, 30, 30);
			FlxG.fullscreen = true;
		}
	}

	function onHow()
	{
		var howState:HowState = new HowState(0x99808080);
		openSubState(howState);
	}

	function gameOne()
	{
		ArtArrays.level = 0;
		FlxG.switchState(new PlayState());
	}

	function gameTwo()
	{
		ArtArrays.level = 1;
		FlxG.switchState(new PlayState());
	}

	function gameThree()
	{
		ArtArrays.level = 2;
		FlxG.switchState(new PlayState());
	}

	function gameFour()
	{
		ArtArrays.level = 3;
		FlxG.switchState(new PlayState());
	}

	function formatText(txt:FlxText)
	{
		txt.setFormat(AssetPaths.NewgroundsFont_Regular__otf);
		txt.size = 16;
		txt.x = Std.int(txt.x - (txt.width * 0.5));
	}

	function swapText()
	{
		if (ArtArrays.winRecord[0] == 1)
		{
			level1Text.x = level1Text.x + (0.5 * level1Text.width);
			level1Text.text = "ANGRY FAIC";
			level1Text.x = Std.int(level1Text.x - (0.5 * level1Text.width));
		}
		if (ArtArrays.winRecord[1] == 1)
		{
			level2Text.x = level2Text.x + (0.5 * level2Text.width);
			level2Text.text = "CAPTAIN";
			level2Text.x = Std.int(level2Text.x - (0.5 * level2Text.width));
		}
		if (ArtArrays.winRecord[2] == 1)
		{
			level3Text.x = level3Text.x + (0.5 * level3Text.width);
			level3Text.text = "DAD 'N ME";
			level3Text.x = Std.int(level3Text.x - (0.5 * level3Text.width));
		}
		if (ArtArrays.winRecord[3] == 1)
		{
			level4Text.x = level4Text.x + (0.5 * level4Text.width);
			level4Text.text = "PICO";
			level4Text.x = Std.int(level4Text.x - (0.5 * level4Text.width));
		}
	}
}
