package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class PlayState extends FlxTransitionableState
{
	// Some static constants for the size of the tilemap tiles
	static inline var TILE_WIDTH:Int = 54;
	static inline var TILE_HEIGHT:Int = 54;

	// The FlxTilemap we're using
	// var _collisionMap:FlxTilemap;
	var mousePixel:FlxSprite;

	// Highlights
	var _highlightBox:FlxSprite;
	var highlightRow:FlxSprite;
	var highlightCol:FlxSprite;
	var highlightBox:FlxSprite;
	var highlightNumCol:FlxSprite;
	var highlightNumRow:FlxSprite;

	var musicBtn:FlxButton;
	var fullBtn:FlxButton;

	// Background (very important)
	var background:Array<FlxSprite>;
	var gameFrame:FlxSprite;
	var gameNumbers:FlxSprite;

	// Images that pop up
	var artArray:Array<FlxSprite>; // Array to store all the lovely art!
	var artistArray:Array<String>; // Artist names / NG links?
	var artNameArray:Array<String>; // File names of all the art
	// Testing vars
	var winText:FlxText;
	var solutionText:FlxText;
	var currentText:FlxText;
	var winVar:Int;
	var notZoomed:Bool;
	var aM:Int; // Used to match artArray to board size (stands for array Match)
	var imageCheck:Int;
	var lineCounter:Int;
	var bA:Int; // stands for board Area
	var boardX:Int = 10;
	var boardY:Int = 10;

	// Upper right hand corner buttons
	var setBtn:FlxButton;
	var fillBtn:FlxButton;
	var xBtn:FlxButton;
	var eraseBtn:FlxButton;
	var dotBtn:FlxButton;
	var clickedAnim:Array<String>;
	var clickType:Int = 2;
	var resetBtn:FlxButton;

	// Tile Sprite Array
	var tileSprites:Array<FlxSprite>;
	var frameOffset:Int = 25;
	var tileOffset:Int = 132;

	var optionsFrame:FlxSprite;

	var boardState:Array<Int> = [
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	]; // Used to check each tile state

	var boardSolution:Array<Int>; // The board solution

	// Box in the upper left to show progress
	var previewBox:Array<FlxSprite>;
	var previewX:Int = 8;
	var previewY:Int = 8;

	// Image Zoom substate
	var persistentSubState:SubState;
	var zoomSubState:SubState;

	override public function create():Void
	{
		tileOffset += frameOffset;
		FlxG.sound.playMusic(AssetPaths.Pico_Cross_Theme__mp3);

		// Background
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

		// Frame of the game
		gameFrame = new FlxSprite(frameOffset, frameOffset);
		gameFrame.loadGraphic(AssetPaths.gameFrame__png);
		add(gameFrame);
		optionsFrame = new FlxSprite(0, FlxG.height - 42);
		optionsFrame.loadGraphic(AssetPaths.options__png);
		add(optionsFrame);

		previewBox = new Array<FlxSprite>();
		boardSolution = ArtArrays.boardSolutions[ArtArrays.level];
		// Board solution move
		for (i in 0...boardSolution.length)
		{
			boardSolution[i] += 1;
			boardState[i] += 1;
		}

		// Load art into correct squares
		artNameArray = new Array<String>();
		artNameArray = ArtArrays.artNames;
		aM = 0; // Indexer for Art arrays
		artArray = new Array<FlxSprite>();
		for (i in 0...boardY)
		{
			for (j in 0...boardX)
			{
				bA = i + (boardX * j);
				if (boardSolution[bA] == 2)
				{
					artArray[aM] = new FlxSprite(0, 0);
					artArray[aM].loadGraphic("assets/images/ArtSubs/" + artNameArray[aM] + ".png");
					artArray[aM].scale.set(TILE_WIDTH / artArray[aM].width, (TILE_HEIGHT / artArray[aM].height));
					artArray[aM].updateHitbox();
					artArray[aM].x = i * TILE_WIDTH + tileOffset;
					artArray[aM].y = j * TILE_WIDTH + tileOffset;
					add(artArray[aM]);
					artArray[aM].kill();
					aM += 1;
				}

				previewBox[bA] = new FlxSprite(10 + (i * previewX), 10 + (j * previewX));
				previewBox[bA].makeGraphic(previewX, previewY, FlxColor.fromString("#ffffff"));
				add(previewBox[bA]);
			}
		}

		// Tile Sprite Array initialization
		tileSprites = new Array<FlxSprite>();
		for (i in 0...boardX)
		{
			for (j in 0...boardX)
			{
				bA = i + (boardX * j);
				tileSprites[bA] = new FlxSprite(i * TILE_WIDTH + tileOffset, j * TILE_WIDTH + tileOffset);
				tileSprites[bA].loadGraphic(AssetPaths.tiles__png, true, TILE_WIDTH, TILE_HEIGHT);
				add(tileSprites[bA]);

				// animations?
				tileSprites[bA].animation.add("bTile", [0]);
				tileSprites[bA].animation.add("fTile", [1]);
				tileSprites[bA].animation.add("xTile", [2]);
				tileSprites[bA].animation.add("dTile", [3]);
				tileSprites[bA].animation.add("bTileC", [4]);
				tileSprites[bA].animation.add("fTileC", [5]);
				tileSprites[bA].animation.add("xTileC", [6]);
				tileSprites[bA].animation.add("dTileC", [7]);
				tileSprites[bA].animation.add("bTileH", [8]);
				tileSprites[bA].animation.add("fTileH", [9]);
				tileSprites[bA].animation.add("xTileH", [10]);
				tileSprites[bA].animation.add("dTileH", [11]);
				tileSprites[bA].animation.add("bTileCH", [12]);
				tileSprites[bA].animation.add("fTileCH", [13]);
				tileSprites[bA].animation.add("xTileCH", [14]);
				tileSprites[bA].animation.add("dTileCH", [15]);
			}
		}

		// Highlighted box for the mouse
		highlightCol = new FlxSprite(frameOffset + 131, frameOffset + 131);
		highlightCol.loadGraphic(AssetPaths.columnFrame__png);
		add(highlightCol);
		highlightRow = new FlxSprite(highlightCol.x, highlightCol.y);
		highlightRow.loadGraphic(AssetPaths.rowFrame__png);
		add(highlightRow);
		highlightBox = new FlxSprite(130 + frameOffset, 130 + frameOffset);
		highlightBox.loadGraphic(AssetPaths.singleFrame__png);
		add(highlightBox);
		highlightNumRow = new FlxSprite(55 + frameOffset, 115 + frameOffset);
		highlightNumRow.loadGraphic(AssetPaths.numberboxHighlight__png);
		highlightNumRow.angle = 90;
		highlightNumRow.updateHitbox();
		add(highlightNumRow);
		highlightNumCol = new FlxSprite(145 + frameOffset, 25 + frameOffset);
		highlightNumCol.loadGraphic(AssetPaths.numberboxHighlight__png);
		add(highlightNumCol);

		// Game number stuff
		gameNumbers = new FlxSprite(frameOffset, frameOffset);
		gameNumbers.loadGraphic(AssetPaths.gameNumbers__png);
		add(gameNumbers);

		// Buttons
		setBtn = new FlxButton(10 + frameOffset, 10 + frameOffset, "", setClick);
		setBtn.loadGraphic(AssetPaths.setBtn__png, true, 52, 52);
		// add(setBtn);
		fillBtn = new FlxButton(92 + frameOffset, 11 + frameOffset, "", fillClick);
		fillBtn.loadGraphic(AssetPaths.fillBtn__png, true, 30, 30);
		fillBtn.animation.add("clicked", [3], 1, true);
		add(fillBtn);
		eraseBtn = new FlxButton(92 + frameOffset, 54 + frameOffset, "", eraseClick);
		eraseBtn.loadGraphic(AssetPaths.eraseBtn__png, true, 30, 30);
		add(eraseBtn);
		xBtn = new FlxButton(11 + frameOffset, 92 + frameOffset, "", xClick);
		xBtn.loadGraphic(AssetPaths.xBtn__png, true, 30, 30);
		add(xBtn);
		dotBtn = new FlxButton(54 + frameOffset, 92 + frameOffset, "", dotClick);
		dotBtn.loadGraphic(AssetPaths.dotBtn__png, true, 30, 30);
		add(dotBtn);
		clickedAnim = new Array<String>();
		clickedAnim = ["pressed", "pressed", "highlight"];
		fillClick();

		// Bottom buttons
		musicBtn = new FlxButton(11, 459 + 253, "", onMute);
		musicBtn.loadGraphic(AssetPaths.sound1__png, true, 30, 30);
		add(musicBtn);
		fullBtn = new FlxButton(55, 459 + 253, "", onFull);
		fullBtn.loadGraphic(AssetPaths.fullscreen1__png, true, 30, 30);
		add(fullBtn);
		resetBtn = new FlxButton(350 + gameFrame.x, 685 + gameFrame.y, "Reset", resetBoard);
		resetBtn.loadGraphic(AssetPaths.reset__png, true, 104, 19);
		resetBtn.label.setFormat(AssetPaths.NewgroundsFont_Regular__otf);
		resetBtn.label.size = 16;
		add(resetBtn);

		// Text overlay?
		winText = new FlxText(300, 0, 0, "", 24);
		winText.color = FlxColor.WHITE;
		winText.setFormat(AssetPaths.NewgroundsFont_Regular__otf);
		winText.size = 24;
		add(winText);

		// Some debug text
		// solutionText = new FlxText(0, 20, 0, "Text loaded (sol)");
		// add(solutionText);
		// currentText = new FlxText(0, 40, 0, "Text loaded (cur)");
		// add(currentText);

		unHighlightTiles();
		rowCheck();
		colCheck();
		previewUpdate();
		highlightTiles();
	}

	override public function update(elapsed:Float):Void
	{
		buttonToKey();

		if (FlxG.keys.justPressed.R) // Get this to work
		{
			onMenu();
		}

		if (FlxG.mouse.justPressed)
		{
			// FlxG.sound.play(AssetPaths.button_push__mp3);
			unHighlightTiles();
			notZoomed = true;
			for (aM in 0...artArray.length) // Checks for zoom and zooms
			{
				if ((Math.floor((FlxG.mouse.x - tileOffset) / TILE_WIDTH) * TILE_WIDTH + tileOffset == artArray[aM].x)
					&& (Math.floor((FlxG.mouse.y - tileOffset) / TILE_HEIGHT) * TILE_HEIGHT + tileOffset == artArray[aM].y)
					&& (artArray[aM].alive))
				{
					notZoomed = false;
					ArtArrays.aM = aM;
					var zoomSubState:SubState = new SubState(0x99808080);
					openSubState(zoomSubState);
				}
			}
			if ((FlxG.mouse.x > tileOffset) && (FlxG.mouse.y > tileOffset) && notZoomed)
			{
				for (i in 0...boardX)
				{
					for (j in 0...boardX)
					{
						bA = i + (boardX * j);
						if ((Math.floor((FlxG.mouse.x - tileOffset) / TILE_WIDTH) * TILE_WIDTH + tileOffset == tileSprites[bA].x)
							&& (Math.floor((FlxG.mouse.y - tileOffset) / TILE_HEIGHT) * TILE_HEIGHT + tileOffset == tileSprites[bA].y))
						{
							if (boardState[bA] < 5)
							{
								if (boardState[bA] == clickType)
								{
									boardState[bA] = 1;
								}
								else
								{
									boardState[bA] = clickType;
								}
								trace("Tile set to: " + Std.string(clickType));
							}
							else
							{
								trace("Tile Complete");
							}
						}
					}
				}
			}
			rowCheck();
			colCheck();
			highlightControl();
			winCheck(); // Has to go before highlightTiles (like, this is necessary)
			previewUpdate();
			highlightTiles();
			tileSpriteUpdate();
		}

		super.update(elapsed);
	}

	function rowCheck()
	{
		lineCounter = 0;
		for (i in 0...boardX)
		{
			lineCounter = 0;
			for (j in 0...boardY)
			{
				bA = i + (boardX * j);
				switch (boardState[bA])
				{
					case 1: // board blank
						if (boardSolution[bA] == 2) // should be filled
							lineCounter += 1;
					case 2: // board filled
						if (boardSolution[bA] == 1) // should be blank
							lineCounter += 1;
					case 3: // board x'd
						if (boardSolution[bA] == 2) // should be filled
							lineCounter += 1;
					case 4: // board dotted
						if (boardSolution[bA] == 2) // should be filled
							lineCounter += 1;
				}
			}
			if (lineCounter == 0)
			{
				for (j in 0...boardY)
				{
					bA = i + (boardX * j);
					for (aM in 0...artArray.length)
					{
						if ((tileSprites[bA].x == artArray[aM].x) && (tileSprites[bA].y == artArray[aM].y))
						{
							artArray[aM].revive();
							boardState[bA] = 6;
						}
					}
					if ((boardState[bA] != 2) && (boardState[bA] < 5))
					{
						boardState[bA] = 7;
					}
				}
			}
		}
	}

	function colCheck()
	{
		lineCounter = 0;
		for (i in 0...boardY)
		{
			lineCounter = 0;
			for (j in 0...boardX)
			{
				bA = j + (boardX * i);
				switch (boardState[bA])
				{
					case 1: // board blank
						if (boardSolution[bA] == 2) // should be filled
							lineCounter += 1;
					case 2: // board filled
						if (boardSolution[bA] == 1) // should be blank
							lineCounter += 1;
					case 3: // board x'd
						if (boardSolution[bA] == 2) // should be filled
							lineCounter += 1;
					case 4: // board dotted
						if (boardSolution[bA] == 2) // should be filled
							lineCounter += 1;
				}
			}

			if (lineCounter == 0)
			{
				for (j in 0...boardX)
				{
					bA = j + (boardX * i);
					for (aM in 0...artArray.length)
					{
						if ((tileSprites[bA].x == artArray[aM].x) && (tileSprites[bA].y == artArray[aM].y))
						{
							artArray[aM].revive();
							boardState[bA] = 6;
						}
					}
					if ((boardState[bA] != 2) && (boardState[bA] < 5))
					{
						boardState[bA] = 7;
					}
				}
			}
		}
	}

	function fillClick()
	{
		clickType = 2;
		fillBtn.statusAnimations = clickedAnim;
		buttonNormal(eraseBtn);
		buttonNormal(xBtn);
		buttonNormal(dotBtn);
		fillBtn.animation.play("pressed");
	}

	function eraseClick()
	{
		clickType = 1;
		eraseBtn.statusAnimations = clickedAnim;
		buttonNormal(fillBtn);
		buttonNormal(xBtn);
		buttonNormal(dotBtn);
		eraseBtn.animation.play("pressed");
	}

	function xClick()
	{
		clickType = 3;
		xBtn.statusAnimations = clickedAnim;
		buttonNormal(fillBtn);
		buttonNormal(eraseBtn);
		buttonNormal(dotBtn);
		xBtn.animation.play("pressed");
	}

	function dotClick()
	{
		clickType = 4;
		dotBtn.statusAnimations = clickedAnim;
		buttonNormal(fillBtn);
		buttonNormal(eraseBtn);
		buttonNormal(xBtn);
		dotBtn.animation.play("pressed");
	}

	function setClick()
	{
		resetBoard();
	}

	function buttonNormal(butBtn:FlxButton)
	{
		butBtn.statusAnimations = ["normal", "highlight", "pressed"];
		butBtn.animation.play("normal");
	}

	function highlightControl()
	{
		if ((FlxG.mouse.x > tileOffset) && (FlxG.mouse.y > tileOffset))
		{
			if ((FlxG.mouse.x < tileOffset + TILE_WIDTH * boardX) && (FlxG.mouse.y < tileOffset + TILE_HEIGHT * boardY))
			{
				highlightBox.x = Math.floor((FlxG.mouse.x - tileOffset) / TILE_WIDTH) * TILE_WIDTH + tileOffset - 2;
				highlightBox.y = Math.floor((FlxG.mouse.y - tileOffset) / TILE_HEIGHT) * TILE_HEIGHT + tileOffset - 2;
				highlightCol.x = highlightBox.x + 1;
				highlightRow.y = highlightBox.y + 1;
				highlightNumCol.x = highlightBox.x + 14;
				highlightNumRow.y = highlightBox.y - 16;
			}
		}
	}

	function highlightTiles()
	{
		for (i in 0...boardY)
		{
			for (j in 0...boardX)
			{
				bA = j + (boardX * i);
				if ((tileSprites[bA].x == highlightCol.x + 1) && (boardState[bA] < 9))
				{
					boardState[bA] += 8;
				}
				if ((tileSprites[bA].y == highlightRow.y + 1) && (boardState[bA] < 9))
				{
					boardState[bA] += 8;
				}
			}
		}
	}

	function unHighlightTiles()
	{
		for (i in 0...boardY)
		{
			for (j in 0...boardX)
			{
				bA = i + (boardX * j);
				if (boardState[bA] > 8)
				{
					boardState[bA] -= 8;
				}
			}
		}
	}

	function tileSpriteUpdate()
	{
		for (i in 0...boardX)
		{
			for (j in 0...boardX)
			{
				bA = i + (boardX * j);
				switch (boardState[bA])
				{
					case 1:
						tileSprites[bA].animation.play("bTile");
					case 2:
						tileSprites[bA].animation.play("fTile");
					case 3:
						tileSprites[bA].animation.play("xTile");
					case 4:
						tileSprites[bA].animation.play("dTile");
					case 5:
						tileSprites[bA].animation.play("bTileC");
					case 6:
						tileSprites[bA].animation.play("fTileC");
					case 7:
						tileSprites[bA].animation.play("xTileC");
					case 8:
						tileSprites[bA].animation.play("dTileC");
					case 9:
						tileSprites[bA].animation.play("bTileH");
					case 10:
						tileSprites[bA].animation.play("fTileH");
					case 11:
						tileSprites[bA].animation.play("xTileH");
					case 12:
						tileSprites[bA].animation.play("dTileH");
					case 13:
						tileSprites[bA].animation.play("bTileCH");
					case 14:
						tileSprites[bA].animation.play("fTileCH");
					case 15:
						tileSprites[bA].animation.play("xTileCH");
					case 16:
						tileSprites[bA].animation.play("dTileCH");
				}
			}
		}
	}

	function resetBoard()
	{
		for (i in 0...boardState.length)
			boardState[i] = ArtArrays.blankBoard[i];
		tileSpriteUpdate();
		for (aM in 0...artArray.length)
		{
			artArray[aM].kill();
		}
		previewUpdate();
	}

	function buttonToKey()
	{
		if (FlxG.keys.justPressed.Z)
			fillClick();
		if (FlxG.keys.justPressed.X)
			eraseClick();
		if (FlxG.keys.justPressed.V)
			xClick();
		if (FlxG.keys.justPressed.C)
			dotClick();
	}

	function winCheck()
	{
		lineCounter = 0;
		for (i in 0...boardState.length)
		{
			if (boardState[i] < 5)
			{
				lineCounter += 1;
			}
		}
		if (lineCounter == 0)
		{
			winText.text = "You win!";
			NGio.unlockMedal(69157);
			ArtArrays.winRecord[ArtArrays.level] = 1;
		}
	}

	function previewUpdate()
	{
		for (i in 0...previewBox.length)
		{
			if ((previewBox[i].color == FlxColor.fromString("#ffffff")) && ((boardState[i] == 2) || (boardState[i] == 6)))
			{
				previewBox[i].color = FlxColor.fromString("#10121c");
			}
			else if (previewBox[i].color == FlxColor.fromString("#10121c"))
			{
				previewBox[i].color = FlxColor.fromString("#ffffff");
			}
		}
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

	function onMenu()
	{
		FlxG.switchState(new MenuState());
	}
}
