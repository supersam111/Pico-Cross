package;

import openfl.utils.AssetManifest;
import haxe.rtti.CType.Abstractdef;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.math.FlxPoint;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

// Thanks for the Substate code, Zaphod
class WinSubState extends FlxSubState
{
	var closeBtn:FlxButton;
	var menuBtn:FlxButton;
	var winText:FlxText;
	var imageOne:FlxSprite;
	var imageTwo:FlxSprite;
	var winFrame:FlxSprite;

	// just a helper flag, showing if this substate is persistent or not
	public var isPersistent:Bool = false;

	override public function create():Void
	{
		winFrame = new FlxSprite(150, 150);
		winFrame.loadGraphic(AssetPaths.winFrame__png);
		add(winFrame);

		closeBtn = new FlxButton(winFrame.x + 26, winFrame.y + 394, "BACK TO GAME", onClose);
		closeBtn.loadGraphic(AssetPaths.howToPlay__png, true, 135, 30);
		closeBtn.label.setFormat(AssetPaths.NewgroundsFont_Regular__otf);
		closeBtn.label.size = 16;
		add(closeBtn);

		menuBtn = new FlxButton(winFrame.x + 289, winFrame.y + 394, "MENU", onMenu);
		menuBtn.label.setFormat(AssetPaths.NewgroundsFont_Regular__otf);
		menuBtn.loadGraphic(AssetPaths.howToPlay__png, true, 135, 30);
		menuBtn.label.size = 16;
		add(menuBtn);

		imageOne = new FlxSprite(winFrame.x + 100, winFrame.y + 43);
		imageOne.loadGraphic(ArtArrays.boardSolImages[ArtArrays.level]);
		imageOne.scale.set(2.5, 2.5);
		imageOne.updateHitbox();
		add(imageOne);
		imageTwo = new FlxSprite(winFrame.x + 100, winFrame.y + 43);
		imageTwo.loadGraphic(ArtArrays.boardSolImagesCol[ArtArrays.level]);
		imageTwo.scale.set(2.5, 2.5);
		imageTwo.updateHitbox();
		add(imageTwo);
		imageTwo.alpha = 0;
		super.create();

		winText = new FlxText(0, FlxG.height * 0.67, -1, ArtArrays.boardNamed[ArtArrays.level]);
		winText.setFormat(AssetPaths.NewgroundsFont_Regular__otf);
		winText.size = 24;
		winText.x = Std.int(0.5 * (FlxG.width - winText.width));
		add(winText);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (imageTwo.alpha < 1)
			imageTwo.alpha += 0.01;
	}

	// This function will be called by substate right after substate will be closed
	public static function onSubstateClose():Void
	{
		// FlxG.fade(FlxG.BLACK, 1, true);
	}

	function onMenu()
	{
		FlxG.switchState(new MenuState());
	}

	function onClose()
	{
		close();
	}
}
