package;

import flixel.FlxG;
import flixel.FlxSprite;

class ArtArrays extends FlxSprite
{
	public static var soundTime:Float = 0;
	// We're doing this again! Thanks Trailer Trouble
	static public var imageNames:Array<String> = [
		'B0RIGAMI', 'BingoWaders', 'KayEf', 'KayEf_2', 'BingoWaders_2', 'Blounty', 'Bro-son', 'CayFettArt', 'CheddarExuberant_2', 'CheddarExuberant',
		'ConnorGrail', 'DoodleYellow', 'EalainEP', 'EddyPaintings', 'EddyPaintings_2', 'Emmazapan_2', 'Emmazapan', 'EpithetSoup', 'GallowJolt',
		'Healmore6969', 'homunc', 'jazzhat', 'Karlestonchew', 'Kasekit_2', 'Kasekit', 'KayEf_3', 'KingCrowned', 'Lolofyr', 'MrShmoods', 'MrShmoods_2',
		'Neentandoo', 'Neentandoo_2', 'Nellyfluff_2', 'Nellyfluff_3', 'Nellyfluff', 'PaleFreak', 'Phaox05', 'ProsciuttoMan', 'RedAndrew', 'ryve',
		'saintsugoi', 'Sevi', 'Slowsolid', 'TheADHX', 'TingSing', 'Trannenspiel', 'Trannenspiel_2', 'wowperfect', 'zebragamer880', 'zebragamer880_2'
	];
	static public var linkNames:Array<String> = [
		'https://b0rigami.newgrounds.com/',
		'https://bingowaders.newgrounds.com/',
		'https://kayef.newgrounds.com',
		'https://kayef.newgrounds.com',
		'https://bingowaders.newgrounds.com/',
		'https://blounty.newgrounds.com/',
		'https://bro-son.newgrounds.com/',
		'https://cayfettart.newgrounds.com/',
		'https://cheddarexuberant.newgrounds.com/',
		'https://cheddarexuberant.newgrounds.com/',
		'https://connorgrail.newgrounds.com/',
		'https://doodleyellow.newgrounds.com/',
		'https://ealainep.newgrounds.com/',
		'https://eddypaintings.newgrounds.com',
		'https://eddypaintings.newgrounds.com',
		'https://emmazapan.newgrounds.com',
		'https://emmazapan.newgrounds.com',
		'https://epithetsoup.newgrounds.com/',
		'https://gallowjolt.newgrounds.com/',
		'https://healmore6969.newgrounds.com/',
		'https://homunc.newgrounds.com/',
		'https://jazzhat.newgrounds.com/',
		'https://karlestonchew.newgrounds.com/',
		'https://kasekit.newgrounds.com/',
		'https://kasekit.newgrounds.com/',
		'https://kayef.newgrounds.com',
		'https://kingcrowned.newgrounds.com/',
		'https://lolofyr.newgrounds.com/',
		'https://mrshmoods.newgrounds.com/',
		'https://mrshmoods.newgrounds.com/',
		'https://neentandoo.newgrounds.com',
		'https://neentandoo.newgrounds.com',
		'https://nellyfluff.newgrounds.com/',
		'https://nellyfluff.newgrounds.com/',
		'https://nellyfluff.newgrounds.com/',
		'https://palefreak.newgrounds.com/',
		'https://phaox05.newgrounds.com',
		'https://prosciuttoman.newgrounds.com',
		'https://redandrew.newgrounds.com/',
		'https://ryve.newgrounds.com',
		'https://saintsugoi.newgrounds.com',
		'https://sevi.newgrounds.com/',
		'https://slowsolid.newgrounds.com/',
		'https://theadhx.newgrounds.com/',
		'https://tingsing.newgrounds.com/',
		'https://trannenspiel.newgrounds.com/',
		'https://trannenspiel.newgrounds.com/',
		'https://wowperfect.newgrounds.com/',
		'https://zebragamer880.newgrounds.com/',
		'https://zebragamer880.newgrounds.com/'
	];

	static public var artists:Array<String> = [
		'B0RIGAMI', 'BingoWaders', 'KayEf', 'KayEf', 'BingoWaders', 'Blounty', 'Bro-son', 'CayFettArt', 'CheddarExuberant', 'CheddarExuberant', 'ConnorGrail',
		'DoodleYellow', 'EalainEP', 'EddyPaintings', 'EddyPaintings', 'Emmazapan', 'Emmazapan', 'EpithetSoup', 'GallowJolt', 'Healmore6969', 'homunc',
		'jazzhat', 'Karlestonchew', 'Kasekit', 'Kasekit', 'KayEf', 'KingCrowned', 'Lolofyr', 'MrShmoods', 'MrShmoods', 'Neentandoo', 'Neentandoo',
		'Nellyfluff', 'Nellyfluff', 'Nellyfluff', 'PaleFreak', 'Phaox05', 'ProsciuttoMan', 'RedAndrew', 'ryve', 'saintsugoi', 'Sevi', 'Slowsolid', 'TheADHX',
		'TingSing', 'Trannenspiel', 'Trannenspiel', 'wowperfect', 'zebragamer880', 'zebragamer880'
	];

	static public var characterNames:Array<String> = [
		'Pump and Skid', 'Nene', 'Captain', 'Steve', 'Smash Girl', 'Red Knight', 'Dad ‘n Me', 'Jase and Jade', 'Jason', 'Sublo and Tangy Mustard', 'ZONE-tan',
		'Mom', 'Bitey', 'Starbarians', 'Pink Knight', 'Boyfriend', 'Pico', 'Alloy', 'Hartrup and Oatly', 'Newgrounds Server Chan', 'Interactive Buddy',
		'Girlfriend', 'Hellbenders', 'Daddy Dearest', 'Lucky', 'Darnell', 'Henry Stickman', 'P-Bot', 'Cassette Girl', 'Bucket', 'Piconjo', 'Strawberry Clock',
		'Duncan and Jones', 'Margo', 'Stan', 'Ritz', 'Green Knight', 'Kenstar', 'Jebus', 'Alien Hominid', 'Chris', 'Orla and her Ear Worm', 'Ena',
		'Salad Fingers', 'Hank', 'Monster', 'Moony', 'Fancy Pants', 'Meat Boy', 'Orange Knight'
	];

	static public var aM:Int = 0;

	static public var musicVol:Int = 1;
	static public var fullScreen:Int = 1;

	static public var level:Int = 0;

	static public var boardSolutions:Array<Array<Int>> = [
		[
			2, 1, 2, 2, 2, 2, 2, 2, 1, 2,
			1, 2, 1, 1, 1, 1, 1, 1, 2, 1,
			2, 1, 2, 1, 1, 1, 1, 2, 1, 2,
			2, 1, 1, 2, 1, 1, 2, 1, 1, 2,
			2, 1, 2, 1, 2, 2, 1, 2, 1, 2,
			2, 1, 2, 2, 1, 1, 2, 2, 1, 2,
			2, 1, 1, 1, 2, 2, 1, 1, 1, 2,
			2, 1, 2, 2, 1, 1, 2, 2, 1, 2,
			1, 2, 2, 1, 1, 1, 1, 2, 2, 1,
			1, 1, 2, 2, 2, 2, 2, 2, 1, 1
		], // Level 1 ^ (AngryFaic)
		[
			1, 1, 2, 2, 2, 2, 2, 1, 1, 1,
			1, 2, 2, 2, 2, 2, 2, 2, 1, 1,
			2, 2, 2, 2, 2, 2, 2, 2, 2, 1,
			1, 1, 1, 1, 1, 1, 1, 2, 2, 1,
			1, 1, 1, 1, 1, 1, 1, 2, 2, 2,
			1, 1, 2, 2, 1, 1, 1, 2, 2, 2,
			2, 2, 1, 1, 2, 2, 2, 2, 2, 1,
			2, 1, 1, 1, 1, 2, 2, 2, 1, 1,
			1, 2, 1, 1, 1, 2, 1, 2, 1, 1,
			2, 1, 2, 2, 2, 1, 1, 1, 2, 1
		], // Level 2 ^ (Captain)
		[
			2, 2, 2, 2, 1, 2, 2, 2, 2, 1,
			2, 2, 2, 1, 2, 1, 1, 1, 1, 2,
			2, 2, 2, 2, 2, 1, 2, 1, 2, 2,
			2, 2, 2, 1, 2, 1, 1, 1, 1, 2,
			2, 2, 2, 1, 2, 2, 1, 1, 1, 2,
			1, 1, 2, 2, 1, 2, 2, 1, 2, 1,
			1, 1, 1, 2, 1, 1, 1, 2, 1, 1,
			1, 2, 2, 2, 2, 1, 1, 1, 1, 1,
			2, 1, 1, 1, 2, 1, 1, 2, 1, 1,
			1, 2, 1, 2, 2, 1, 1, 2, 1, 1
		], // Level 3 ^ Dad
		[
			2, 2, 1, 1, 2, 2, 1, 2, 2, 2,
			2, 1, 1, 1, 1, 2, 2, 1, 2, 2,
			1, 1, 1, 2, 1, 1, 2, 1, 1, 2,
			2, 1, 1, 2, 2, 1, 1, 1, 2, 2,
			2, 1, 2, 1, 2, 2, 1, 2, 1, 2,
			2, 2, 2, 1, 1, 1, 2, 1, 1, 2,
			1, 2, 1, 1, 2, 2, 1, 2, 2, 2,
			2, 1, 2, 1, 2, 1, 1, 2, 1, 1,
			2, 2, 1, 1, 1, 1, 1, 1, 1, 1,
			2, 2, 2, 1, 2, 2, 2, 1, 1, 2
		] // Level 4 ^ Pico
	]; // The board solution

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

	static public var boardNamed:Array<String> = ["ANGRY FAIC", "CAPTAIN", "DAD 'N ME", "PICO"];
	static public var boardSolImages:Array<String> = [
		"assets/images/angryFaic.png",
		"assets/images/captain.png",
		"assets/images/dadNMe.png",
		"assets/images/pico.png"
	];
	static public var boardSolImagesCol:Array<String> = [
		"assets/images/angryFaicColor.png",
		"assets/images/captainColor.png",
		"assets/images/dadNMeColor.png",
		"assets/images/picoColor.png"
	];

	static public var gameNumbersLeft:Array<Array<Int>> = [
		[
			0, 0, 1, 6, 1,
			0, 0, 0, 1, 1,
			0, 1, 1, 1, 1,
			0, 1, 1, 1, 1,
			1, 1, 2, 1, 1,
			0, 1, 2, 2, 1,
			0, 0, 1, 2, 1,
			0, 1, 2, 2, 1,
			0, 0, 0, 2, 2,
			0, 0, 0, 0, 6
		], // 1^
		[
			0, 0, 0, 0, 5,
			0, 0, 0, 0, 7,
			0, 0, 0, 0, 9,
			0, 0, 0, 0, 2,
			0, 0, 0, 0, 3,
			0, 0, 0, 2, 3,
			0, 0, 0, 2, 5,
			0, 0, 0, 1, 3,
			0, 0, 1, 1, 1,
			0, 0, 1, 3, 1
		], // 2^
		[
			0, 0, 0, 4, 4,
			0, 0, 3, 1, 1,
			0, 0, 5, 1, 2,
			0, 0, 3, 1, 1,
			0, 0, 3, 2, 1,
			0, 0, 2, 2, 1,
			0, 0, 0, 1, 1,
			0, 0, 0, 0, 4,
			0, 0, 1, 1, 1,
			0, 0, 1, 2, 1
		], // 3^
		[
			0, 0, 2, 2, 3,
			0, 0, 1, 2, 2,
			0, 0, 1, 1, 1,
			0, 0, 1, 2, 2,
			1, 1, 2, 1, 1,
			0, 0, 3, 1, 1,
			0, 0, 1, 2, 3,
			0, 1, 1, 1, 1,
			0, 0, 0, 0, 2,
			0, 0, 3, 3, 1
		] // 4^
	];
	static public var gameNumbersTop:Array<Array<Int>> = [
		[
			0, 0, 0, 1, 0, 0, 1, 0, 0, 0,
			0, 0, 1, 1, 1, 1, 1, 1, 0, 0,
			0, 0, 1, 1, 1, 1, 1, 1, 0, 0,
			1, 1, 2, 1, 1, 1, 1, 2, 1, 1,
			6, 1, 3, 1, 1, 1, 1, 3, 1, 6
		], // 1^
		[
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			1, 2, 3, 3, 3, 0, 0, 0, 0, 0,
			2, 1, 1, 1, 1, 3, 3, 0, 5, 0,
			1, 1, 1, 1, 1, 3, 2, 8, 1, 2
		], // 2^
		[
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
			0, 5, 0, 1, 0, 0, 1, 1, 1, 0,
			5, 1, 6, 3, 4, 1, 1, 1, 1, 0,
			1, 1, 1, 1, 3, 2, 1, 2, 1, 4
		], // 3^
		[
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			0, 0, 0, 0, 1, 2, 0, 0, 0, 0,
			2, 1, 2, 0, 2, 1, 2, 1, 2, 0,
			3, 2, 1, 0, 2, 1, 1, 1, 1, 7,
			3, 2, 1, 2, 1, 1, 1, 2, 1, 1
		] // 4^
	];
}
