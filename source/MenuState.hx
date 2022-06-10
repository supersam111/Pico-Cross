package;

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

	//

	override public function create():Void
	{
		// Other stuff
		FlxG.sound.playMusic(AssetPaths.Pico_Cross_Theme__mp3, ArtArrays.musicVol, true);
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

		title = new FlxSprite(96, 53);
		title.loadGraphic(AssetPaths.logo__png, true, 562, 131);
		title.animation.add("wave", [for (i in 0...12) i], 12, true);
		add(title);
		title.animation.play("wave");

		// Level Text
		selectText = new FlxText(380, 255, -1, "SELECT LEVEL");
		formatText(selectText);
		add(selectText);

		level1Text = new FlxText(282, 442, -1, "???");
		formatText(level1Text);
		add(level1Text);

		level2Text = new FlxText(471, 442, -1, "???");
		formatText(level2Text);
		add(level2Text);

		level3Text = new FlxText(282, 632, -1, "???");
		formatText(level3Text);
		add(level3Text);

		level4Text = new FlxText(471, 632, -1, "???");
		formatText(level4Text);
		add(level4Text);

		// Level buttons
		level1Btn = new FlxButton(230, 56 + 253, "", gameOne);
		level1Btn.makeGraphic(100, 100, FlxColor.fromString("#10121c"));
		add(level1Btn);
		level2Btn = new FlxButton(420, 56 + 253, "", gameTwo);
		level2Btn.makeGraphic(100, 100, FlxColor.fromString("#10121c"));
		add(level2Btn);
		level3Btn = new FlxButton(230, 246 + 253, "", gameThree);
		level3Btn.makeGraphic(100, 100, FlxColor.fromString("#10121c"));
		add(level3Btn);
		level4Btn = new FlxButton(420, 246 + 253, "", gameFour);
		level4Btn.makeGraphic(100, 100, FlxColor.fromString("#10121c"));
		add(level4Btn);

		// Bottom buttons
		musicBtn = new FlxButton(11, 459 + 253, "", onMute);
		musicBtn.loadGraphic(AssetPaths.sound1__png, true, 30, 30);
		add(musicBtn);
		fullBtn = new FlxButton(55, 459 + 253, "", onFull);
		fullBtn.loadGraphic(AssetPaths.fullscreen1__png, true, 30, 30);
		add(fullBtn);
		howBtn = new FlxButton(604, 712, "HOW TO PLAY", onHow);
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

		FlxG.sound.playMusic(AssetPaths.Pico_Cross_Theme__mp3, ArtArrays.musicVol, true);
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
		return 1;
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
		txt.x = txt.x - (txt.width * 0.5);
	}
}
