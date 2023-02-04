package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.math.FlxPoint;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

// Thanks for the Substate code, Zaphod
class SubState extends FlxSubState
{
	var closeBtn:FlxButton;
	var linkBtn:FlxButton;
	var SPEED:Int = 500;
	var vel:Int;
	var actualWidth:Float;
	var actualHeight:Float;
	var scaledWidth:Float;
	var scaledHeight:Float;
	var centerX:Float;
	var centerY:Float;
	var upKey:Bool;
	var downKey:Bool;
	var leftKey:Bool;
	var rightKey:Bool;
	var backFrame:FlxSprite;

	// just a helper flag, showing if this substate is persistent or not
	public var isPersistent:Bool = false;

	// Load zoomed image
	var zoomArt:FlxSprite;

	override public function create():Void
	{
		super.create();

		zoomArt = new FlxSprite(16, 16);
		zoomArt.loadGraphic("assets/images/ArtSubs/" + ArtArrays.imageNames[ArtArrays.aM] + ".png");
		actualWidth = zoomArt.width;
		actualHeight = zoomArt.height;
		zoomArt.scale.set(FlxG.width / zoomArt.width, FlxG.width / zoomArt.width);
		add(zoomArt);
		zoomArt.updateHitbox();
		zoomArt.x = 0.5 * (FlxG.width - zoomArt.width);
		zoomArt.y = 0.5 * (FlxG.height - zoomArt.height);

		backFrame = new FlxSprite(0, 0);
		backFrame.loadGraphic(AssetPaths.backThing__png);
		add(backFrame);

		closeBtn = new FlxButton(7, 7, "", onClick);
		closeBtn.loadGraphic(AssetPaths.backBtn__png, true, 30, 30);
		add(closeBtn);

		linkBtn = new FlxButton(FlxG.width * 0.5
			- 100, FlxG.height * 0.75,
			ArtArrays.characterNames[ArtArrays.aM]
			+ " by: "
			+ ArtArrays.artists[ArtArrays.aM]
			+ "\nClick here to visit their NG page!", linkClick);
		linkBtn.makeGraphic(300, 70, FlxColor.fromString("#12101c"));
		linkBtn.alpha = .8;
		add(linkBtn);
		linkBtn.label.color = FlxColor.WHITE;
		linkBtn.x = Math.round(0.5 * (FlxG.width - linkBtn.x));
		linkBtn.y = Math.round(FlxG.height * 0.9);
		linkBtn.label.setFormat(AssetPaths.NewgroundsFont_Regular__otf);
		linkBtn.label.size = 16;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.pressed.ESCAPE)
		{
			onClick();
		}

		if (!linkBtn.pressed && !closeBtn.pressed)
		{
			zoomies();
		}
		moveImage();
		stayOnScreen();
	}

	function onClick()
	{
		// if you will pass 'true' (which is by default) into close() method then this substate will be destroyed
		// but when you'll pass 'false' then you should destroy it manually
		close();
	}

	function linkClick()
	{
		FlxG.openURL(ArtArrays.linkNames[ArtArrays.aM]);
	}

	// This function will be called by substate right after substate will be closed
	public static function onSubstateClose():Void
	{
		// FlxG.fade(FlxG.BLACK, 1, true);
	}

	function moveImage()
	{
		rightKey = FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.D;
		leftKey = FlxG.keys.pressed.LEFT || FlxG.keys.pressed.A;
		upKey = FlxG.keys.pressed.UP || FlxG.keys.pressed.W;
		downKey = FlxG.keys.pressed.DOWN || FlxG.keys.pressed.S;

		zoomArt.velocity.set(0, 0);

		if (rightKey)
			zoomArt.velocity.add(SPEED, 0);
		if (leftKey)
			zoomArt.velocity.add(-1 * SPEED, 0);
		if (downKey)
		{
			zoomArt.velocity.add(0, SPEED);
			if (rightKey)
				zoomArt.velocity.set(SPEED / Math.sqrt(2), SPEED / Math.sqrt(2));
			if (leftKey)
				zoomArt.velocity.set(-1 * SPEED / Math.sqrt(2), SPEED / Math.sqrt(2));
		}
		if (upKey)
		{
			zoomArt.velocity.add(0, -1 * SPEED);
			if (rightKey)
				zoomArt.velocity.set(SPEED / Math.sqrt(2), -1 * SPEED / Math.sqrt(2));
			if (leftKey)
				zoomArt.velocity.set(-1 * SPEED / Math.sqrt(2), -1 * SPEED / Math.sqrt(2));
		}
	}

	function stayOnScreen()
	{
		if (zoomArt.x < -1 * zoomArt.width + 10)
			zoomArt.x = -1 * zoomArt.width + 10;

		if (zoomArt.y < -1 * zoomArt.height + 10)
			zoomArt.y = -1 * zoomArt.height + 10;

		if (zoomArt.x > zoomArt.width - 10)
			zoomArt.x = zoomArt.width - 10;

		if (zoomArt.y > zoomArt.height - 10)
			zoomArt.y = zoomArt.height - 10;
	}

	function zoomies()
	{
		if (FlxG.mouse.justPressed)
		{
			centerX = zoomArt.x + (0.5 * zoomArt.width);
			centerY = zoomArt.y + (0.5 * zoomArt.height);
			trace(Math.floor(zoomArt.width));
			if (Math.floor(zoomArt.width) == FlxG.width)
			{
				zoomArt.scale.set(FlxG.width / zoomArt.width, FlxG.width / zoomArt.width);
			}
			else
			{
				zoomArt.scale.set(FlxG.width / actualWidth, FlxG.height / actualHeight);
			}
			zoomArt.updateHitbox();
			zoomArt.setPosition(centerX - (0.5 * zoomArt.width), centerY - (0.5 * zoomArt.height));
			zoomArt.updateHitbox();
		}
	}
}
