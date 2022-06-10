package;

import flixel.FlxG;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileSquare;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import io.newgrounds.NG;

class InitState extends FlxTransitionableState
{
	override public function create():Void
	{
		super.create();
		// Transition stuff
		// FlxTransitionableState.defaultTransIn = new TransitionData(TILES, FlxColor.fromString("#10121c"), .5, FlxPoint.get(1, -1));
		// FlxTransitionableState.defaultTransOut = new TransitionData(TILES, FlxColor.fromString("#10121c"), .5, FlxPoint.get(1, -1));
		var diamond:FlxGraphic = FlxGraphic.fromClass(GraphicTransTileSquare);
		diamond.persist = true;
		diamond.destroyOnNoUse = false;
		// FlxTransitionableState.defaultTransIn.tileData = {asset: diamond, width: 32, height: 32};
		// FlxTransitionableState.defaultTransOut.tileData = {asset: diamond, width: 32, height: 32};

		// NG stuff
		NGio.noLogin(APIcodes.APPID);
		// var ng:NGio = new NGio(APIcodes.APPID, APIcodes.ENCRYPT);
		trace('NEWGROUNDS LOL');

		// Other stuff
		FlxG.autoPause = false;
	}

	override public function update(elapsed:Float):Void
	{
		FlxG.switchState(new MenuState());
	}
}
