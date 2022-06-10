package;

import flixel.FlxG;
import flixel.FlxSprite;

class ArtArrays extends FlxSprite
{
	// We're doing this again! Thanks Trailer Trouble
	static public var artNames:Array<String> = [
		"B0RIGAMI", "BingoWaders", "CheddarExuberant", "DoodleYellow", "EalainEP", "EddyPaintings", "Emmazapan", "Emmazapan_2", "GallowJolt", "Healmore6969",
		"homunc", "KayEf", "KayEf_2", "KingCrowned", "ProsciuttoMan", "saintsugoi", "Trannenspiel"
	];

	static public var artists:Array<String> = [
		"B0RIGAMI", "Bingowaders", "CheddarExuberant", "DoodleYellow", "EalainEP", "EddyPaintings", "Emmazapan", "Emmazapan", "GallowJolt", "Healmore6969",
		"homunc", "KayEf", "KayEf", "KingCrowned", "ProsciuttoMan", "SaintSugoi", "Trannenspiel"
	];

	static public var aM:Int = 0;

	static public var musicVol:Int = 1;
	static public var fullScreen:Int = 1;

	static public var level:Int = 0;
	static public var boardSolutions:Array<Array<Int>> = [
		[
			1, 0, 1, 1, 1, 1, 1, 1, 0, 1,
			0, 1, 0, 0, 0, 0, 0, 0, 1, 0,
			1, 0, 1, 0, 0, 0, 0, 1, 0, 1,
			1, 0, 0, 1, 0, 0, 1, 0, 0, 1,
			1, 0, 1, 0, 1, 1, 0, 1, 0, 1,
			1, 0, 1, 1, 0, 0, 1, 1, 0, 1,
			1, 0, 0, 0, 1, 1, 0, 0, 0, 1,
			1, 0, 1, 1, 0, 0, 1, 1, 0, 1,
			0, 1, 0, 0, 0, 0, 0, 0, 1, 0,
			0, 0, 1, 1, 1, 1, 1, 1, 0, 0
		], // Level 1 ^
		[
			1, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0
		], // Level 2 ^
		[
			0, 1, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0
		], // Level 3 ^
		[
			0, 0, 1, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 0, 0, 0, 0, 0
		] // Level 4 ^
	]; // The board solution

	static public var savedBoards:Array<Array<Int>> = [
		[
			1, 0, 1, 1, 1, 1, 1, 1, 0, 1,
			0, 1, 0, 0, 0, 0, 0, 0, 1, 0,
			1, 0, 1, 0, 0, 0, 0, 1, 0, 1,
			1, 0, 0, 1, 0, 0, 1, 0, 0, 1,
			1, 0, 1, 0, 1, 1, 0, 1, 0, 1,
			1, 0, 1, 1, 0, 0, 1, 1, 0, 1,
			1, 0, 0, 0, 1, 1, 0, 0, 0, 1,
			1, 0, 1, 1, 0, 0, 1, 1, 0, 1,
			0, 1, 0, 0, 0, 0, 0, 0, 1, 0,
			0, 0, 1, 1, 1, 1, 1, 1, 0, 0
		], // Level 1 ^
		[
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
		], // Level 2 ^
		[
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
		], // Level 3 ^
		[
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
		] // Level 4 ^
	];

	static public var blankBoard:Array<Int> = [
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1
	]; // Use to reset board

	static public var winRecord:Array<Int> = [0, 0, 0, 0];
}