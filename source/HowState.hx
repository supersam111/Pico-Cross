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
class HowState extends FlxSubState
{
	var howText:FlxText;
	var backFrame:FlxSprite;
	var closeBtn:FlxButton;

	// just a helper flag, showing if this substate is persistent or not
	public var isPersistent:Bool = false;

	override public function create():Void
	{
		howText = new FlxText(50, 50, 650, "1. Tiles can be either filled in or empty (denoted by the X).
        \n2.The numbers on the left or top of the puzzle represent the number of filled tiles in a row without empty spaces in the order they appear from left to right or top to bottom. 
        \n\nExample: “1 5 2” to the left of a row means the row will have 1 filled, 1 empty, 5 filled, 1 empty, and 2 filled (assuming a puzzle width of 10). Of course most rows and columns will not be as simple as this, you will need to use logic and deduction to complete the entire puzzle
        \nEach filled tile will have a unique art piece, however the art in a row or column will not be revealed until that row or column is correctly filled in.
        \nOnly one puzzle needs to be completed to see all the art, however if you want a challenge there are four puzzles total to solve.
        \nGood luck, and have fun!");
		add(howText);
		howText.setFormat(AssetPaths.NewgroundsFont_Regular__otf, 24, FlxColor.fromString("#ffffff"));

		// back button
		backFrame = new FlxSprite(0, 0);
		backFrame.loadGraphic(AssetPaths.backThing__png);
		add(backFrame);

		closeBtn = new FlxButton(7, 7, "", onClick);
		closeBtn.loadGraphic(AssetPaths.backBtn__png, true, 30, 30);
		add(closeBtn);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	// This function will be called by substate right after substate will be closed
	public static function onSubstateClose():Void
	{
		// FlxG.fade(FlxG.BLACK, 1, true);
	}

	function onClick()
	{
		close();
	}
}
