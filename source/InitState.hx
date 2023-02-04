package;

import flixel.system.FlxSound;
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
	public static var mainTheme:FlxSound;

	override public function create():Void
	{
		if (FlxG.save.data.winRecord != null)
		{
			for (i in 0...4)
				ArtArrays.winRecord[i] = FlxG.save.data.winRecord[i];
		}
		mainTheme = new FlxSound();
		mainTheme.loadEmbedded(AssetPaths.Pico_Cross_Theme__mp3, true);
		if (!mainTheme.playing)
			mainTheme.play(false, ArtArrays.soundTime);
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
		var ng:NGio = new NGio(APIcodes.APPID, APIcodes.ENCRYPT);
		trace('NEWGROUNDS LOL');

		// Other stuff
		FlxG.autoPause = false;
	}

	override public function update(elapsed:Float):Void
	{
		FlxG.switchState(new MenuState());
	}
}
