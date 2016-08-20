//
//  NKFColor+WikipediaColors.m
//  Alphabetical List Utility
//
//  Created by HAI on 7/22/15.
//  Copyright (c) 2015 HAI. All rights reserved.
//

#import "NKFColor+WikipediaColors.h"

@implementation NKFColor (WikipediaColors)

#pragma mark - sets of colors

+ (NSDictionary *)whiteShades {
	return @{@"white" : [NKFColor white],
			 @"antiFlashWhite" : [NKFColor antiFlashWhite],
			 @"antiqueWhite" : [NKFColor antiqueWhite],
			 @"beige" : [NKFColor beige],
			 @"blond" : [NKFColor blond],
			 @"cornsilk" : [NKFColor cornsilk],
			 @"cosmicLatte" : [NKFColor cosmicLatte],
			 @"cream" : [NKFColor cream],
			 @"eggshell" : [NKFColor eggshell],
			 @"floralWhite" : [NKFColor floralWhite],
			 @"ghostWhite" : [NKFColor ghostWhite],
			 @"honeydew" : [NKFColor honeydew],
			 @"isabelline" : [NKFColor isabelline],
			 @"ivory" : [NKFColor ivory],
			 @"lavenderBlush" : [NKFColor lavenderBlush],
			 @"lemonChiffon" : [NKFColor lemonChiffon],
			 @"linen" : [NKFColor linen],
			 @"magnolia" : [NKFColor magnolia],
			 @"mintCream" : [NKFColor mintCream],
			 @"navajoWhite" : [NKFColor navajoWhite],
			 @"oldLace" : [NKFColor oldLace],
			 @"papayaWhip" : [NKFColor papayaWhip],
			 @"pearl" : [NKFColor pearl],
			 @"seashell" : [NKFColor seashell],
			 @"snow" : [NKFColor snow],
			 @"vanilla" : [NKFColor vanilla],
			 @"white" : [NKFColor white],
			 @"whiteSmoke" : [NKFColor whiteSmoke]};
}

+ (NSDictionary *)grayShades {
	return @{@"gray" : [NKFColor gray],
			 @"ashGrey" : [NKFColor ashGrey],
			 @"battleshipGrey" : [NKFColor battleshipGrey],
			 @"black" : [NKFColor black],
			 @"blueGray" : [NKFColor blueGray],
			 @"cadetGrey" : [NKFColor cadetGrey],
			 @"charcoal" : [NKFColor charcoal],
			 @"coolGrey" : [NKFColor coolGrey],
			 @"davysGrey" : [NKFColor davysGrey],
			 @"paynesGrey" : [NKFColor paynesGrey],
			 @"silver" : [NKFColor silver],
			 @"slateGray" : [NKFColor slateGray],
			 @"taupe" : [NKFColor taupe],
			 @"purpleTaupe" : [NKFColor purpleTaupe],
			 @"mediumTaupe" : [NKFColor mediumTaupe],
			 @"roseQuartz" : [NKFColor roseQuartz],
			 @"taupeGray" : [NKFColor taupeGray],
			 @"timberwolf" : [NKFColor timberwolf]};
}

+ (NSDictionary *)greyShades {
	return [NKFColor grayShades];
}

+ (NSDictionary *)pinkShades {
	return @{@"pink" : [NKFColor pink],
			 @"amaranth" : [NKFColor amaranth],
			 @"amaranthPink" : [NKFColor amaranthPink],
			 @"bakerMillerPink" : [NKFColor bakerMillerPink],
			 @"brinkPink" : [NKFColor brinkPink],
			 @"carmine" : [NKFColor carmine],
			 @"carnationPink" : [NKFColor carnationPink],
			 @"cerise" : [NKFColor cerise],
			 @"coralPink" : [NKFColor coralPink],
			 @"deepCarmine" : [NKFColor deepCarmine],
			 @"deepPink" : [NKFColor deepPink],
			 @"fandangoPink" : [NKFColor fandangoPink],
			 @"frenchRose" : [NKFColor frenchRose],
			 @"fuchsia" : [NKFColor fuchsia],
			 @"hollywoodCerise" : [NKFColor hollywoodCerise],
			 @"hotMagenta" : [NKFColor hotMagenta],
			 @"hotPink" : [NKFColor hotPink],
			 @"lavenderPink" : [NKFColor lavenderPink],
			 @"magenta" : [NKFColor magenta],
			 @"mauve" : [NKFColor mauve],
			 @"mexicanPink" : [NKFColor mexicanPink],
			 @"persianRose" : [NKFColor persianRose],
			 @"pink" : [NKFColor pink],
			 @"puce" : [NKFColor puce],
			 @"rose" : [NKFColor rose],
			 @"rosePink" : [NKFColor rosePink],
			 @"ruby" : [NKFColor ruby],
			 @"salmonPink" : [NKFColor salmonPink],
			 @"shockingPink" : [NKFColor shockingPink],
			 @"thulianPink" : [NKFColor thulianPink],
			 @"shockingPinkCrayola" : [NKFColor shockingPinkCrayola],
			 @"ultraPink" : [NKFColor ultraPink]};
}

+ (NSDictionary *)redShades {
	return @{@"red" : [NKFColor red],
			 @"alizarinCrimson" : [NKFColor alizarinCrimson],
			 @"amaranth" : [NKFColor amaranth],
			 @"americanRose" : [NKFColor americanRose],
			 @"auburn" : [NKFColor auburn],
			 @"burgundy" : [NKFColor burgundy],
			 @"cardinal" : [NKFColor cardinal],
			 @"cranberry" : [NKFColor cranberry],
			 @"carmine" : [NKFColor carmine],
			 @"cerise" : [NKFColor cerise],
			 @"chestnut" : [NKFColor chestnut],
			 @"crimson" : [NKFColor crimson],
			 @"darkRed" : [NKFColor darkRed],
			 @"electricCrimson" : [NKFColor electricCrimson],
			 @"firebrick" : [NKFColor firebrick],
			 @"flame" : [NKFColor flame],
			 @"folly" : [NKFColor folly],
			 @"lava" : [NKFColor lava],
			 @"lust" : [NKFColor lust],
			 @"maroonX11" : [NKFColor maroonX11],
			 @"pink" : [NKFColor pink],
			 @"raspberry" : [NKFColor raspberry],
			 @"red" : [NKFColor red],
			 @"redViolet" : [NKFColor redViolet],
			 @"redwood" : [NKFColor redwood],
			 @"rose" : [NKFColor rose],
			 @"rossoCorsa" : [NKFColor rossoCorsa],
			 @"ruby" : [NKFColor ruby],
			 @"rust" : [NKFColor rust],
			 @"rustyRed" : [NKFColor rustyRed],
			 @"scarlet" : [NKFColor scarlet],
			 @"terraCotta" : [NKFColor terraCotta],
			 @"tuscanRed" : [NKFColor tuscanRed],
			 @"tyrianPurple" : [NKFColor tyrianPurple],
			 @"venetianRed" : [NKFColor venetianRed],
			 @"vermilion" : [NKFColor vermilion]};
}

+ (NSDictionary *)brownShades {
	return @{@"brownColor" : [NKFColor brownColor],
			 @"auburn" : [NKFColor auburn],
			 @"beaver" : [NKFColor beaver],
			 @"beige" : [NKFColor beige],
			 @"bistreBrown" : [NKFColor bistreBrown],
			 @"bole" : [NKFColor bole],
			 @"bronze" : [NKFColor bronze],
			 @"brownColor" : [NKFColor brownColor],
			 @"buff" : [NKFColor buff],
			 @"burgundy" : [NKFColor burgundy],
			 @"burntSienna" : [NKFColor burntSienna],
			 @"burntUmber" : [NKFColor burntUmber],
			 @"camel" : [NKFColor camel],
			 @"chamoisee" : [NKFColor chamoisee],
			 @"chestnut" : [NKFColor chestnut],
			 @"chocolateTraditional" : [NKFColor chocolateTraditional],
			 @"coffee" : [NKFColor coffee],
			 @"copper" : [NKFColor copper],
			 @"cordovan" : [NKFColor cordovan],
			 @"coyoteBrown" : [NKFColor coyoteBrown],
			 @"earthYellow" : [NKFColor earthYellow],
			 @"ecru" : [NKFColor ecru],
			 @"fallow" : [NKFColor fallow],
			 @"fawn" : [NKFColor fawn],
			 @"fieldDrab" : [NKFColor fieldDrab],
			 @"fulvous" : [NKFColor fulvous],
			 @"khakiX11LightKhaki" : [NKFColor khakiX11LightKhaki],
			 @"lion" : [NKFColor lion],
			 @"liver" : [NKFColor liver],
			 @"mahogany" : [NKFColor mahogany],
			 @"maroonX11" : [NKFColor maroonX11],
			 @"ochre" : [NKFColor ochre],
			 @"rawUmber" : [NKFColor rawUmber],
			 @"redwood" : [NKFColor redwood],
			 @"rufous" : [NKFColor rufous],
			 @"russet" : [NKFColor russet],
			 @"rust" : [NKFColor rust],
			 @"sand" : [NKFColor sand],
			 @"sandyBrown" : [NKFColor sandyBrown],
			 @"sealBrown" : [NKFColor sealBrown],
			 @"sepia" : [NKFColor sepia],
			 @"sienna" : [NKFColor sienna],
			 @"sinopia" : [NKFColor sinopia],
			 @"tan" : [NKFColor tan],
			 @"taupe" : [NKFColor taupe],
			 @"umber" : [NKFColor umber],
			 @"wenge" : [NKFColor wenge],
			 @"wheat" : [NKFColor wheat]};
}

+ (NSDictionary *)orangeShades {
	return @{@"orangeColor" : [NKFColor orangeColor],
			 @"amber" : [NKFColor amber],
			 @"apricot" : [NKFColor apricot],
			 @"atomicTangerine" : [NKFColor atomicTangerine],
			 @"bittersweet" : [NKFColor bittersweet],
			 @"burntOrange" : [NKFColor burntOrange],
			 @"carrotOrange" : [NKFColor carrotOrange],
			 @"coral" : [NKFColor coral],
			 @"darkSalmon" : [NKFColor darkSalmon],
			 @"deepCarrotOrange" : [NKFColor deepCarrotOrange],
			 @"amberSAEECE" : [NKFColor amberSAEECE],
			 @"flame" : [NKFColor flame],
			 @"gamboge" : [NKFColor gamboge],
			 @"internationalOrangeEngineering" : [NKFColor internationalOrangeEngineering],
			 @"marigold" : [NKFColor marigold],
			 @"oldGold" : [NKFColor oldGold],
			 @"orangeColor" : [NKFColor orangeColor],
			 @"orangeColorWheel" : [NKFColor orangeColorWheel],
			 @"orangeCrayola" : [NKFColor orangeCrayola],
			 @"orangePantone" : [NKFColor orangePantone],
			 @"orangePeel" : [NKFColor orangePeel],
			 @"orangeRed" : [NKFColor orangeRed],
			 @"orangeRYB" : [NKFColor orangeRYB],
			 @"orangeWeb" : [NKFColor orangeWeb],
			 @"peachOrange" : [NKFColor peachOrange],
			 @"persianOrange" : [NKFColor persianOrange],
			 @"persimmon" : [NKFColor persimmon],
			 @"portlandOrange" : [NKFColor portlandOrange],
			 @"princetonOrange" : [NKFColor princetonOrange],
			 @"pumpkin" : [NKFColor pumpkin],
			 @"rust" : [NKFColor rust],
			 @"safetyOrange" : [NKFColor safetyOrange],
			 @"safetyOrangeBlazeOrange" : [NKFColor safetyOrangeBlazeOrange],
			 @"salmon" : [NKFColor salmon],
			 @"tangelo" : [NKFColor tangelo],
			 @"tangerine" : [NKFColor tangerine],
			 @"tenne" : [NKFColor tenne]};
}

+ (NSDictionary *)yellowShades {
	return @{@"yellow" : [NKFColor yellow],
			 @"amber" : [NKFColor amber],
			 @"amberSAEECE" : [NKFColor amberSAEECE],
			 @"arylideYellow" : [NKFColor arylideYellow],
			 @"aureolin" : [NKFColor aureolin],
			 @"buff" : [NKFColor buff],
			 @"chartreuseTraditional" : [NKFColor chartreuseTraditional],
			 @"citrine" : [NKFColor citrine],
			 @"cream" : [NKFColor cream],
			 @"darkGoldenrod" : [NKFColor darkGoldenrod],
			 @"ecru" : [NKFColor ecru],
			 @"goldWebGolden" : [NKFColor goldWebGolden],
			 @"goldMetallic" : [NKFColor goldMetallic],
			 @"goldenrod" : [NKFColor goldenrod],
			 @"jasmine" : [NKFColor jasmine],
			 @"jonquil" : [NKFColor jonquil],
			 @"lemon" : [NKFColor lemon],
			 @"lemonChiffon" : [NKFColor lemonChiffon],
			 @"lemonMeringue" : [NKFColor lemonMeringue],
			 @"lemonYellow" : [NKFColor lemonYellow],
			 @"lion" : [NKFColor lion],
			 @"maize" : [NKFColor maize],
			 @"mikadoYellow" : [NKFColor mikadoYellow],
			 @"mustard" : [NKFColor mustard],
			 @"naplesYellow" : [NKFColor naplesYellow],
			 @"navajoWhite" : [NKFColor navajoWhite],
			 @"oldGold" : [NKFColor oldGold],
			 @"papayaWhip" : [NKFColor papayaWhip],
			 @"saffron" : [NKFColor saffron],
			 @"schoolBusYellow" : [NKFColor schoolBusYellow],
			 @"selectiveYellow" : [NKFColor selectiveYellow],
			 @"stilDeGrainYellow" : [NKFColor stilDeGrainYellow],
			 @"straw" : [NKFColor straw],
			 @"sunglow" : [NKFColor sunglow],
			 @"yellow" : [NKFColor yellow],
			 @"yellowColor" : [NKFColor yellowColor],
			 @"yellowCrayola" : [NKFColor yellowCrayola],
			 @"yellowMunsell" : [NKFColor yellowMunsell],
			 @"yellowNCS" : [NKFColor yellowNCS],
			 @"yellowPantone" : [NKFColor yellowPantone],
			 @"yellowProcess" : [NKFColor yellowProcess],
			 @"yellowRose" : [NKFColor yellowRose],
			 @"yellowRYB" : [NKFColor yellowRYB]};
}

+ (NSDictionary *)greenShades {
	return @{@"greenColor" : [NKFColor greenColor],
			 @"appleGreen" : [NKFColor appleGreen],
			 @"artichoke" : [NKFColor artichoke],
			 @"asparagus" : [NKFColor asparagus],
			 @"avocado" : [NKFColor avocado],
			 @"brightGreen" : [NKFColor brightGreen],
			 @"calPolyGreen" : [NKFColor calPolyGreen],
			 @"chartreuseTraditional" : [NKFColor chartreuseTraditional],
			 @"chartreuseWeb" : [NKFColor chartreuseWeb],
			 @"darkGreen" : [NKFColor darkGreen],
			 @"darkGreenX11" : [NKFColor darkGreenX11],
			 @"darkOliveGreen" : [NKFColor darkOliveGreen],
			 @"darkSpringGreen" : [NKFColor darkSpringGreen],
			 @"dartmouthGreen" : [NKFColor dartmouthGreen],
			 @"fernGreen" : [NKFColor fernGreen],
			 @"forestGreenTraditional" : [NKFColor forestGreenTraditional],
			 @"forestGreenWeb" : [NKFColor forestGreenWeb],
			 @"greenColor" : [NKFColor greenColor],
			 @"greenColorWheelX11Green" : [NKFColor greenColorWheelX11Green],
			 @"greenCrayola" : [NKFColor greenCrayola],
			 @"greenCyan" : [NKFColor greenCyan],
			 @"greenHTMLCSSColor" : [NKFColor greenHTMLCSSColor],
			 @"greenMunsell" : [NKFColor greenMunsell],
			 @"greenNCS" : [NKFColor greenNCS],
			 @"greenPantone" : [NKFColor greenPantone],
			 @"greenPigment" : [NKFColor greenPigment],
			 @"greenRYB" : [NKFColor greenRYB],
			 @"greenYellow" : [NKFColor greenYellow],
			 @"harlequin" : [NKFColor harlequin],
			 @"harlequinGreen" : [NKFColor harlequinGreen],
			 @"honeydew" : [NKFColor honeydew],
			 @"hunterGreen" : [NKFColor hunterGreen],
			 @"indiaGreen" : [NKFColor indiaGreen],
			 @"islamicGreen" : [NKFColor islamicGreen],
			 @"jungleGreen" : [NKFColor jungleGreen],
			 @"lawnGreen" : [NKFColor lawnGreen],
			 @"limeColorWheel" : [NKFColor limeColorWheel],
			 @"limeGreen" : [NKFColor limeGreen],
			 @"limeWebX11Green" : [NKFColor limeWebX11Green],
			 @"mantis" : [NKFColor mantis],
			 @"mint" : [NKFColor mint],
			 @"mintCream" : [NKFColor mintCream],
			 @"mintGreen" : [NKFColor mintGreen],
			 @"officeGreen" : [NKFColor officeGreen],
			 @"olive" : [NKFColor olive],
			 @"oliveDrab3" : [NKFColor oliveDrab3],
			 @"oliveDrab7" : [NKFColor oliveDrab7],
			 @"pakistanGreen" : [NKFColor pakistanGreen],
			 @"parisGreen" : [NKFColor parisGreen],
			 @"persianGreen" : [NKFColor persianGreen],
			 @"phthaloGreen" : [NKFColor phthaloGreen],
			 @"pineGreen" : [NKFColor pineGreen],
			 @"pistachio" : [NKFColor pistachio],
			 @"seaGreen" : [NKFColor seaGreen],
			 @"shamrockGreen" : [NKFColor shamrockGreen],
			 @"springBud" : [NKFColor springBud],
			 @"springGreen" : [NKFColor springGreen],
			 @"teal" : [NKFColor teal],
			 @"viridian" : [NKFColor viridian],
			 @"viridianGreen" : [NKFColor viridianGreen],
			 @"yellowGreen" : [NKFColor yellowGreen]};
}

+ (NSDictionary *)cyanShades {
	return @{@"cyanColor" : [NKFColor cyanColor],
			 @"aliceBlue" : [NKFColor aliceBlue],
			 @"aqua" : [NKFColor aqua],
			 @"aquamarine" : [NKFColor aquamarine],
			 @"azureMist" : [NKFColor azureMist],
			 @"azureWebColor" : [NKFColor azureWebColor],
			 @"celeste" : [NKFColor celeste],
			 @"cerulean" : [NKFColor cerulean],
			 @"cyan" : [NKFColor cyan],
			 @"cyanAzure" : [NKFColor cyanAzure],
			 @"cyanBlueAzure" : [NKFColor cyanBlueAzure],
			 @"cyanCobaltBlue" : [NKFColor cyanCobaltBlue],
			 @"cyanColor" : [NKFColor cyanColor],
			 @"cyanCornflowerBlue" : [NKFColor cyanCornflowerBlue],
			 @"cyanProcess" : [NKFColor cyanProcess],
			 @"electricBlue" : [NKFColor electricBlue],
			 @"jungleGreen" : [NKFColor jungleGreen],
			 @"magicMint" : [NKFColor magicMint],
			 @"mint" : [NKFColor mint],
			 @"persianGreen" : [NKFColor persianGreen],
			 @"pineGreen" : [NKFColor pineGreen],
			 @"robinEggBlue" : [NKFColor robinEggBlue],
			 @"seaGreen" : [NKFColor seaGreen],
			 @"skobeloff" : [NKFColor skobeloff],
			 @"skyBlue" : [NKFColor skyBlue],
			 @"tiffanyBlue" : [NKFColor tiffanyBlue],
			 @"teal" : [NKFColor teal],
			 @"turquoise" : [NKFColor turquoise]};
}

+ (NSDictionary *)blueShades {
	return @{@"blueColor" : [NKFColor blueColor],
			 @"airForceBlueRAF" : [NKFColor airForceBlueRAF],
			 @"airForceBlueUSAF" : [NKFColor airForceBlueUSAF],
			 @"airSuperiorityBlue" : [NKFColor airSuperiorityBlue],
			 @"aliceBlue" : [NKFColor aliceBlue],
			 @"azure" : [NKFColor azure],
			 @"babyBlue" : [NKFColor babyBlue],
			 @"bleuDeFrance" : [NKFColor bleuDeFrance],
			 @"blue" : [NKFColor blue],
			 @"blueBell" : [NKFColor blueBell],
			 @"blueberry" : [NKFColor blueberry],
			 @"bluebonnet" : [NKFColor bluebonnet],
			 @"blueColor" : [NKFColor blueColor],
			 @"blueCrayola" : [NKFColor blueCrayola],
			 @"blueLagoon" : [NKFColor blueLagoon],
			 @"blueMunsell" : [NKFColor blueMunsell],
			 @"blueNCS" : [NKFColor blueNCS],
			 @"bluePantone" : [NKFColor bluePantone],
			 @"bluePigment" : [NKFColor bluePigment],
			 @"blueRYB" : [NKFColor blueRYB],
			 @"bondiBlue" : [NKFColor bondiBlue],
			 @"blueGray" : [NKFColor blueGray],
			 @"brandeisBlue" : [NKFColor brandeisBlue],
			 @"cambridgeBlue" : [NKFColor cambridgeBlue],
			 @"carolinaBlue" : [NKFColor carolinaBlue],
			 @"celeste" : [NKFColor celeste],
			 @"cerulean" : [NKFColor cerulean],
			 @"ceruleanBlue" : [NKFColor ceruleanBlue],
			 @"cobaltBlue" : [NKFColor cobaltBlue],
			 @"columbiaBlue" : [NKFColor columbiaBlue],
			 @"cornflowerBlue" : [NKFColor cornflowerBlue],
			 @"cyan" : [NKFColor cyan],
			 @"darkBlue" : [NKFColor darkBlue],
			 @"darkBlueGray" : [NKFColor darkBlueGray],
			 @"deepSkyBlue" : [NKFColor deepSkyBlue],
			 @"denim" : [NKFColor denim],
			 @"dodgerBlue" : [NKFColor dodgerBlue],
			 @"dukeBlue" : [NKFColor dukeBlue],
			 @"egyptianBlue" : [NKFColor egyptianBlue],
			 @"electricBlue" : [NKFColor electricBlue],
			 @"etonBlue" : [NKFColor etonBlue],
			 @"glaucous" : [NKFColor glaucous],
			 @"electricIndigo" : [NKFColor electricIndigo],
			 @"indigo" : [NKFColor indigo],
			 @"internationalKleinBlue" : [NKFColor internationalKleinBlue],
			 @"iris" : [NKFColor iris],
			 @"lightBlue" : [NKFColor lightBlue],
			 @"majorelleBlue" : [NKFColor majorelleBlue],
			 @"mayaBlue" : [NKFColor mayaBlue],
			 @"mediumBlue" : [NKFColor mediumBlue],
			 @"midnightBlue" : [NKFColor midnightBlue],
			 @"navy" : [NKFColor navy],
			 @"nonPhotoBlue" : [NKFColor nonPhotoBlue],
			 @"oxfordBlue" : [NKFColor oxfordBlue],
			 @"palatinateBlue" : [NKFColor palatinateBlue],
			 @"periwinkle" : [NKFColor periwinkle],
			 @"persianBlue" : [NKFColor persianBlue],
			 @"phthaloBlue" : [NKFColor phthaloBlue],
			 @"powderBlue" : [NKFColor powderBlue],
			 @"prussianBlue" : [NKFColor prussianBlue],
			 @"royalBlue" : [NKFColor royalBlue],
			 @"sapphire" : [NKFColor sapphire],
			 @"sapphireBlue" : [NKFColor sapphireBlue],
			 @"skyBlue" : [NKFColor skyBlue],
			 @"steelBlue" : [NKFColor steelBlue],
			 @"teal" : [NKFColor teal],
			 @"tealBlue" : [NKFColor tealBlue],
			 @"tiffanyBlue" : [NKFColor tiffanyBlue],
			 @"trueBlue" : [NKFColor trueBlue],
			 @"tuftsBlue" : [NKFColor tuftsBlue],
			 @"turquoise" : [NKFColor turquoise],
			 @"turquoiseBlue" : [NKFColor turquoiseBlue],
			 @"uCLABlue" : [NKFColor uCLABlue],
			 @"ultramarine" : [NKFColor ultramarine],
			 @"ultramarineBlue" : [NKFColor ultramarineBlue],
			 @"violetBlue" : [NKFColor violetBlue],
			 @"viridian" : [NKFColor viridian],
			 @"yaleBlue" : [NKFColor yaleBlue],
			 @"yankeesBlue" : [NKFColor yankeesBlue],
			 @"zaffre" : [NKFColor zaffre]};
}

+ (NSDictionary *)violetShades {
	return @{@"violet" : [NKFColor violet],
			 @"amethyst" : [NKFColor amethyst],
			 @"byzantium" : [NKFColor byzantium],
			 @"cerise" : [NKFColor cerise],
			 @"darkPurple" : [NKFColor darkPurple],
			 @"eggplant" : [NKFColor eggplant],
			 @"fandango" : [NKFColor fandango],
			 @"fuchsiaPurple" : [NKFColor fuchsiaPurple],
			 @"heliotrope" : [NKFColor heliotrope],
			 @"indigo" : [NKFColor indigo],
			 @"lavenderBlush" : [NKFColor lavenderBlush],
			 @"lavenderFloral" : [NKFColor lavenderFloral],
			 @"lavenderGray" : [NKFColor lavenderGray],
			 @"lavenderIndigo" : [NKFColor lavenderIndigo],
			 @"lavenderMagenta" : [NKFColor lavenderMagenta],
			 @"lavenderMist" : [NKFColor lavenderMist],
			 @"lavenderPurple" : [NKFColor lavenderPurple],
			 @"lavenderRose" : [NKFColor lavenderRose],
			 @"lavenderWeb" : [NKFColor lavenderWeb],
			 @"magenta" : [NKFColor magenta],
			 @"mauve" : [NKFColor mauve],
			 @"orchid" : [NKFColor orchid],
			 @"plum" : [NKFColor plum],
			 @"plumWeb" : [NKFColor plumWeb],
			 @"purpleColor" : [NKFColor purpleColor],
			 @"purpleHeart" : [NKFColor purpleHeart],
			 @"purpleHTML" : [NKFColor purpleHTML],
			 @"purpleMountainMajesty" : [NKFColor purpleMountainMajesty],
			 @"purpleMunsell" : [NKFColor purpleMunsell],
			 @"purpleNavy" : [NKFColor purpleNavy],
			 @"purplePizzazz" : [NKFColor purplePizzazz],
			 @"purpleTaupe" : [NKFColor purpleTaupe],
			 @"purpleX11" : [NKFColor purpleX11],
			 @"purpureus" : [NKFColor purpureus],
			 @"redViolet" : [NKFColor redViolet],
			 @"rose" : [NKFColor rose],
			 @"thistle" : [NKFColor thistle],
			 @"tyrianPurple" : [NKFColor tyrianPurple],
			 @"mulberry" : [NKFColor mulberry],
			 @"violet" : [NKFColor violet],
			 @"violetBlue" : [NKFColor violetBlue],
			 @"violetRYB" : [NKFColor violetRYB],
			 @"violetWeb" : [NKFColor violetWeb],
			 @"wisteria" : [NKFColor wisteria]};
}


#pragma mark - Colors that should have been there from the beginning

+ (NKFColor *)colorWithName:(NSString *)name {
	NSDictionary *colorNameDictionary = [NKFColor allColorsDictionary];
	
	NSArray *partsOfName = [name componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"( )[]"]];
	NSMutableString *formattedName = [[NSMutableString alloc] init];
	for (int i = 0; i < partsOfName.count; i++) {
		NSString *string = [partsOfName objectAtIndex:i];
		if (i == 0) {
			string = [string lowercaseString];
		}
		
		[formattedName appendString:string];
	}
	
	if ([colorNameDictionary objectForKey:[formattedName lowercaseString]]) {
		return [colorNameDictionary objectForKey:[formattedName lowercaseString]];
	}
	
	NSLog(@"Color not found: %@\t\t%@", name, formattedName);
	
	return nil;
}

+ (NSArray *)allColorsArray {
	return @[[NKFColor acidGreen],
			 [NKFColor aero],
			 [NKFColor aeroBlue],
			 [NKFColor africanViolet],
			 [NKFColor airForceBlueRAF],
			 [NKFColor airForceBlueUSAF],
			 [NKFColor airSuperiorityBlue],
			 [NKFColor alabamaCrimson],
			 [NKFColor aliceBlue],
			 [NKFColor alizarinCrimson],
			 [NKFColor alloyOrange],
			 [NKFColor almond],
			 [NKFColor amaranth],
			 [NKFColor amaranthDeepPurple],
			 [NKFColor amaranthPink],
			 [NKFColor amaranthPurple],
			 [NKFColor amaranthRed],
			 [NKFColor amazonGreen],
			 [NKFColor amber],
			 [NKFColor amberSAEECE],
			 [NKFColor americanRose],
			 [NKFColor amethyst],
			 [NKFColor androidGreen],
			 [NKFColor antiFlashWhite],
			 [NKFColor antiqueBrass],
			 [NKFColor antiqueBronze],
			 [NKFColor antiqueFuchsia],
			 [NKFColor antiqueRuby],
			 [NKFColor antiqueWhite],
			 [NKFColor aoEnglish],
			 [NKFColor appleGreen],
			 [NKFColor apricot],
			 [NKFColor aqua],
			 [NKFColor aquamarine],
			 [NKFColor armyGreen],
			 [NKFColor arsenic],
			 [NKFColor artichoke],
			 [NKFColor arylideYellow],
			 [NKFColor ashGrey],
			 [NKFColor asparagus],
			 [NKFColor atomicTangerine],
			 [NKFColor auburn],
			 [NKFColor aureolin],
			 [NKFColor auroMetalSaurus],
			 [NKFColor avocado],
			 [NKFColor azure],
			 [NKFColor azureWebColor],
			 [NKFColor azureMist],
			 [NKFColor azureishWhite],
			 [NKFColor babyBlue],
			 [NKFColor babyBlueEyes],
			 [NKFColor babyPink],
			 [NKFColor babyPowder],
			 [NKFColor bakerMillerPink],
			 [NKFColor ballBlue],
			 [NKFColor bananaMania],
			 [NKFColor bananaYellow],
			 [NKFColor bangladeshGreen],
			 [NKFColor barbiePink],
			 [NKFColor barnRed],
			 [NKFColor battleshipGrey],
			 [NKFColor bazaar],
			 [NKFColor beauBlue],
			 [NKFColor beaver],
			 [NKFColor beige],
			 [NKFColor bdazzledBlue],
			 [NKFColor bigDipOruby],
			 [NKFColor bisque],
			 [NKFColor bistre],
			 [NKFColor bistreBrown],
			 [NKFColor bitterLemon],
			 [NKFColor bitterLime],
			 [NKFColor bittersweet],
			 [NKFColor bittersweetShimmer],
			 [NKFColor black],
			 [NKFColor blackBean],
			 [NKFColor blackLeatherJacket],
			 [NKFColor blackOlive],
			 [NKFColor blanchedAlmond],
			 [NKFColor blastOffBronze],
			 [NKFColor bleuDeFrance],
			 [NKFColor blizzardBlue],
			 [NKFColor blond],
			 [NKFColor blue],
			 [NKFColor blueCrayola],
			 [NKFColor blueMunsell],
			 [NKFColor blueNCS],
			 [NKFColor bluePantone],
			 [NKFColor bluePigment],
			 [NKFColor blueRYB],
			 [NKFColor blueBell],
			 [NKFColor blueGray],
			 [NKFColor blueGreen],
			 [NKFColor blueLagoon],
			 [NKFColor blueMagentaViolet],
			 [NKFColor blueSapphire],
			 [NKFColor blueViolet],
			 [NKFColor blueYonder],
			 [NKFColor blueberry],
			 [NKFColor bluebonnet],
			 [NKFColor blush],
			 [NKFColor bole],
			 [NKFColor bondiBlue],
			 [NKFColor bone],
			 [NKFColor bostonUniversityRed],
			 [NKFColor bottleGreen],
			 [NKFColor boysenberry],
			 [NKFColor brandeisBlue],
			 [NKFColor brass],
			 [NKFColor brickRed],
			 [NKFColor brightCerulean],
			 [NKFColor brightGreen],
			 [NKFColor brightLavender],
			 [NKFColor brightLilac],
			 [NKFColor brightMaroon],
			 [NKFColor brightNavyBlue],
			 [NKFColor brightPink],
			 [NKFColor brightTurquoise],
			 [NKFColor brightUbe],
			 [NKFColor brilliantAzure],
			 [NKFColor brilliantLavender],
			 [NKFColor brilliantRose],
			 [NKFColor brinkPink],
			 [NKFColor britishRacingGreen],
			 [NKFColor bronze],
			 [NKFColor bronzeYellow],
			 [NKFColor brownTraditional],
			 [NKFColor brownWeb],
			 [NKFColor brownNose],
			 [NKFColor brownYellow],
			 [NKFColor brunswickGreen],
			 [NKFColor bubbleGum],
			 [NKFColor bubbles],
			 [NKFColor buff],
			 [NKFColor budGreen],
			 [NKFColor bulgarianRose],
			 [NKFColor burgundy],
			 [NKFColor burlywood],
			 [NKFColor burntOrange],
			 [NKFColor burntSienna],
			 [NKFColor burntUmber],
			 [NKFColor byzantine],
			 [NKFColor byzantium],
			 [NKFColor cadet],
			 [NKFColor cadetBlue],
			 [NKFColor cadetGrey],
			 [NKFColor cadmiumGreen],
			 [NKFColor cadmiumOrange],
			 [NKFColor cadmiumRed],
			 [NKFColor cadmiumYellow],
			 [NKFColor caféAuLait],
			 [NKFColor caféNoir],
			 [NKFColor calPolyGreen],
			 [NKFColor cambridgeBlue],
			 [NKFColor camel],
			 [NKFColor cameoPink],
			 [NKFColor camouflageGreen],
			 [NKFColor canaryYellow],
			 [NKFColor candyAppleRed],
			 [NKFColor candyPink],
			 [NKFColor capri],
			 [NKFColor caputMortuum],
			 [NKFColor cardinal],
			 [NKFColor caribbeanGreen],
			 [NKFColor carmine],
			 [NKFColor carmineMP],
			 [NKFColor carminePink],
			 [NKFColor carmineRed],
			 [NKFColor carnationPink],
			 [NKFColor carnelian],
			 [NKFColor carolinaBlue],
			 [NKFColor carrotOrange],
			 [NKFColor castletonGreen],
			 [NKFColor catalinaBlue],
			 [NKFColor catawba],
			 [NKFColor cedarChest],
			 [NKFColor ceil],
			 [NKFColor celadon],
			 [NKFColor celadonBlue],
			 [NKFColor celadonGreen],
			 [NKFColor celeste],
			 [NKFColor celestialBlue],
			 [NKFColor cerise],
			 [NKFColor cerisePink],
			 [NKFColor cerulean],
			 [NKFColor ceruleanBlue],
			 [NKFColor ceruleanFrost],
			 [NKFColor cGBlue],
			 [NKFColor cGRed],
			 [NKFColor chamoisee],
			 [NKFColor champagne],
			 [NKFColor charcoal],
			 [NKFColor charlestonGreen],
			 [NKFColor charmPink],
			 [NKFColor chartreuseTraditional],
			 [NKFColor chartreuseWeb],
			 [NKFColor cherry],
			 [NKFColor cherryBlossomPink],
			 [NKFColor chestnut],
			 [NKFColor chinaPink],
			 [NKFColor chinaRose],
			 [NKFColor chineseRed],
			 [NKFColor chineseViolet],
			 [NKFColor chocolateTraditional],
			 [NKFColor chocolateWeb],
			 [NKFColor chromeYellow],
			 [NKFColor cinereous],
			 [NKFColor cinnabar],
			 [NKFColor cinnamonCitationNeeded],
			 [NKFColor citrine],
			 [NKFColor citron],
			 [NKFColor claret],
			 [NKFColor classicRose],
			 [NKFColor cobaltBlue],
			 [NKFColor cocoaBrown],
			 [NKFColor coconut],
			 [NKFColor coffee],
			 [NKFColor columbiaBlue],
			 [NKFColor congoPink],
			 [NKFColor coolBlack],
			 [NKFColor coolGrey],
			 [NKFColor copper],
			 [NKFColor copperCrayola],
			 [NKFColor copperPenny],
			 [NKFColor copperRed],
			 [NKFColor copperRose],
			 [NKFColor coquelicot],
			 [NKFColor coral],
			 [NKFColor coralPink],
			 [NKFColor coralRed],
			 [NKFColor cordovan],
			 [NKFColor corn],
			 [NKFColor cornellRed],
			 [NKFColor cornflowerBlue],
			 [NKFColor cornsilk],
			 [NKFColor cosmicLatte],
			 [NKFColor coyoteBrown],
			 [NKFColor cottonCandy],
			 [NKFColor cranberry],
			 [NKFColor cream],
			 [NKFColor crimson],
			 [NKFColor crimsonGlory],
			 [NKFColor crimsonRed],
			 [NKFColor cyan],
			 [NKFColor cyanAzure],
			 [NKFColor cyanBlueAzure],
			 [NKFColor cyanCobaltBlue],
			 [NKFColor cyanCornflowerBlue],
			 [NKFColor cyanProcess],
			 [NKFColor cyberGrape],
			 [NKFColor cyberYellow],
			 [NKFColor daffodil],
			 [NKFColor dandelion],
			 [NKFColor darkBlue],
			 [NKFColor darkBlueGray],
			 [NKFColor darkBrown],
			 [NKFColor darkBrownTangelo],
			 [NKFColor darkByzantium],
			 [NKFColor darkCandyAppleRed],
			 [NKFColor darkCerulean],
			 [NKFColor darkChestnut],
			 [NKFColor darkCoral],
			 [NKFColor darkCyan],
			 [NKFColor darkElectricBlue],
			 [NKFColor darkGoldenrod],
			 [NKFColor darkGrayX11],
			 [NKFColor darkGreen],
			 [NKFColor darkGreenX11],
			 [NKFColor darkImperialBlue],
			 [NKFColor darkImperialBlue],
			 [NKFColor darkJungleGreen],
			 [NKFColor darkKhaki],
			 [NKFColor darkLava],
			 [NKFColor darkLavender],
			 [NKFColor darkLiver],
			 [NKFColor darkLiverHorses],
			 [NKFColor darkMagenta],
			 [NKFColor darkMediumGray],
			 [NKFColor darkMidnightBlue],
			 [NKFColor darkMossGreen],
			 [NKFColor darkOliveGreen],
			 [NKFColor darkOrange],
			 [NKFColor darkOrchid],
			 [NKFColor darkPastelBlue],
			 [NKFColor darkPastelGreen],
			 [NKFColor darkPastelPurple],
			 [NKFColor darkPastelRed],
			 [NKFColor darkPink],
			 [NKFColor darkPowderBlue],
			 [NKFColor darkPuce],
			 [NKFColor darkPurple],
			 [NKFColor darkRaspberry],
			 [NKFColor darkRed],
			 [NKFColor darkSalmon],
			 [NKFColor darkScarlet],
			 [NKFColor darkSeaGreen],
			 [NKFColor darkSienna],
			 [NKFColor darkSkyBlue],
			 [NKFColor darkSlateBlue],
			 [NKFColor darkSlateGray],
			 [NKFColor darkSpringGreen],
			 [NKFColor darkTan],
			 [NKFColor darkTangerine],
			 [NKFColor darkTaupe],
			 [NKFColor darkTerraCotta],
			 [NKFColor darkTurquoise],
			 [NKFColor darkVanilla],
			 [NKFColor darkViolet],
			 [NKFColor darkYellow],
			 [NKFColor dartmouthGreen],
			 [NKFColor davysGrey],
			 [NKFColor debianRed],
			 [NKFColor deepAquamarine],
			 [NKFColor deepCarmine],
			 [NKFColor deepCarminePink],
			 [NKFColor deepCarrotOrange],
			 [NKFColor deepCerise],
			 [NKFColor deepChampagne],
			 [NKFColor deepChestnut],
			 [NKFColor deepCoffee],
			 [NKFColor deepFuchsia],
			 [NKFColor deepGreen],
			 [NKFColor deepGreenCyanTurquoise],
			 [NKFColor deepJungleGreen],
			 [NKFColor deepKoamaru],
			 [NKFColor deepLemon],
			 [NKFColor deepLilac],
			 [NKFColor deepMagenta],
			 [NKFColor deepMaroon],
			 [NKFColor deepMauve],
			 [NKFColor deepMossGreen],
			 [NKFColor deepPeach],
			 [NKFColor deepPink],
			 [NKFColor deepPuce],
			 [NKFColor deepRed],
			 [NKFColor deepRuby],
			 [NKFColor deepSaffron],
			 [NKFColor deepSkyBlue],
			 [NKFColor deepSpaceSparkle],
			 [NKFColor deepSpringBud],
			 [NKFColor deepTaupe],
			 [NKFColor deepTuscanRed],
			 [NKFColor deepViolet],
			 [NKFColor deer],
			 [NKFColor denim],
			 [NKFColor desaturatedCyan],
			 [NKFColor desert],
			 [NKFColor desertSand],
			 [NKFColor desire],
			 [NKFColor diamond],
			 [NKFColor dimGray],
			 [NKFColor dirt],
			 [NKFColor dodgerBlue],
			 [NKFColor dogwoodRose],
			 [NKFColor dollarBill],
			 [NKFColor donkeyBrown],
			 [NKFColor drab],
			 [NKFColor dukeBlue],
			 [NKFColor dustStorm],
			 [NKFColor dutchWhite],
			 [NKFColor earthYellow],
			 [NKFColor ebony],
			 [NKFColor ecru],
			 [NKFColor eerieBlack],
			 [NKFColor eggplant],
			 [NKFColor eggshell],
			 [NKFColor egyptianBlue],
			 [NKFColor electricBlue],
			 [NKFColor electricCrimson],
			 [NKFColor electricCyan],
			 [NKFColor electricGreen],
			 [NKFColor electricIndigo],
			 [NKFColor electricLavender],
			 [NKFColor electricLime],
			 [NKFColor electricPurple],
			 [NKFColor electricUltramarine],
			 [NKFColor electricViolet],
			 [NKFColor electricYellow],
			 [NKFColor emerald],
			 [NKFColor eminence],
			 [NKFColor englishGreen],
			 [NKFColor englishLavender],
			 [NKFColor englishRed],
			 [NKFColor englishViolet],
			 [NKFColor etonBlue],
			 [NKFColor eucalyptus],
			 [NKFColor fallow],
			 [NKFColor faluRed],
			 [NKFColor fandango],
			 [NKFColor fandangoPink],
			 [NKFColor fashionFuchsia],
			 [NKFColor fawn],
			 [NKFColor feldgrau],
			 [NKFColor feldspar],
			 [NKFColor fernGreen],
			 [NKFColor ferrariRed],
			 [NKFColor fieldDrab],
			 [NKFColor firebrick],
			 [NKFColor fireEngineRed],
			 [NKFColor flame],
			 [NKFColor flamingoPink],
			 [NKFColor flattery],
			 [NKFColor flavescent],
			 [NKFColor flax],
			 [NKFColor flirt],
			 [NKFColor floralWhite],
			 [NKFColor fluorescentOrange],
			 [NKFColor fluorescentPink],
			 [NKFColor fluorescentYellow],
			 [NKFColor folly],
			 [NKFColor forestGreenTraditional],
			 [NKFColor forestGreenWeb],
			 [NKFColor frenchBeige],
			 [NKFColor frenchBistre],
			 [NKFColor frenchBlue],
			 [NKFColor frenchFuchsia],
			 [NKFColor frenchLilac],
			 [NKFColor frenchLime],
			 [NKFColor frenchMauve],
			 [NKFColor frenchPink],
			 [NKFColor frenchPlum],
			 [NKFColor frenchPuce],
			 [NKFColor frenchRaspberry],
			 [NKFColor frenchRose],
			 [NKFColor frenchSkyBlue],
			 [NKFColor frenchViolet],
			 [NKFColor frenchWine],
			 [NKFColor freshAir],
			 [NKFColor fuchsia],
			 [NKFColor fuchsiaCrayola],
			 [NKFColor fuchsiaPink],
			 [NKFColor fuchsiaPurple],
			 [NKFColor fuchsiaRose],
			 [NKFColor fulvous],
			 [NKFColor fuzzyWuzzy],
			 [NKFColor gamboge],
			 [NKFColor gambogeOrangeBrown],
			 [NKFColor genericViridian],
			 [NKFColor ghostWhite],
			 [NKFColor giantsOrange],
			 [NKFColor grussrel],
			 [NKFColor glaucous],
			 [NKFColor glitter],
			 [NKFColor gOGreen],
			 [NKFColor goldMetallic],
			 [NKFColor goldWebGolden],
			 [NKFColor goldFusion],
			 [NKFColor goldenBrown],
			 [NKFColor goldenPoppy],
			 [NKFColor goldenYellow],
			 [NKFColor goldenrod],
			 [NKFColor grannySmithApple],
			 [NKFColor grape],
			 [NKFColor gray],
			 [NKFColor grayHTMLCSSGray],
			 [NKFColor grayX11Gray],
			 [NKFColor grayAsparagus],
			 [NKFColor grayBlue],
			 [NKFColor greenColorWheelX11Green],
			 [NKFColor greenCrayola],
			 [NKFColor greenHTMLCSSColor],
			 [NKFColor greenMunsell],
			 [NKFColor greenNCS],
			 [NKFColor greenPantone],
			 [NKFColor greenPigment],
			 [NKFColor greenRYB],
			 [NKFColor greenBlue],
			 [NKFColor greenCyan],
			 [NKFColor greenYellow],
			 [NKFColor grizzly],
			 [NKFColor grullo],
			 [NKFColor guppieGreen],
			 [NKFColor halayàÚbe],
			 [NKFColor hanBlue],
			 [NKFColor hanPurple],
			 [NKFColor hansaYellow],
			 [NKFColor harlequin],
			 [NKFColor harlequinGreen],
			 [NKFColor harvardCrimson],
			 [NKFColor harvestGold],
			 [NKFColor heartGold],
			 [NKFColor heliotrope],
			 [NKFColor heliotropeGray],
			 [NKFColor heliotropeMagenta],
			 [NKFColor hollywoodCerise],
			 [NKFColor honeydew],
			 [NKFColor honoluluBlue],
			 [NKFColor hookersGreen],
			 [NKFColor hotMagenta],
			 [NKFColor hotPink],
			 [NKFColor hunterGreen],
			 [NKFColor iceberg],
			 [NKFColor icterine],
			 [NKFColor illuminatingEmerald],
			 [NKFColor imperial],
			 [NKFColor imperialBlue],
			 [NKFColor imperialPurple],
			 [NKFColor imperialRed],
			 [NKFColor inchworm],
			 [NKFColor independence],
			 [NKFColor indiaGreen],
			 [NKFColor indianRed],
			 [NKFColor indianYellow],
			 [NKFColor indigo],
			 [NKFColor indigoDye],
			 [NKFColor indigoWeb],
			 [NKFColor internationalKleinBlue],
			 [NKFColor internationalOrangeAerospace],
			 [NKFColor internationalOrangeEngineering],
			 [NKFColor internationalOrangeGoldenGateBridge],
			 [NKFColor iris],
			 [NKFColor irresistible],
			 [NKFColor isabelline],
			 [NKFColor islamicGreen],
			 [NKFColor italianSkyBlue],
			 [NKFColor ivory],
			 [NKFColor jade],
			 [NKFColor japaneseCarmine],
			 [NKFColor japaneseIndigo],
			 [NKFColor japaneseViolet],
			 [NKFColor jasmine],
			 [NKFColor jasper],
			 [NKFColor jazzberryJam],
			 [NKFColor jellyBean],
			 [NKFColor jet],
			 [NKFColor jonquil],
			 [NKFColor jordyBlue],
			 [NKFColor juneBud],
			 [NKFColor jungleGreen],
			 [NKFColor kellyGreen],
			 [NKFColor kenyanCopper],
			 [NKFColor keppel],
			 [NKFColor jawadChickenColorHTMLCSSKhaki],
			 [NKFColor khakiX11LightKhaki],
			 [NKFColor kobe],
			 [NKFColor kobi],
			 [NKFColor kombuGreen],
			 [NKFColor kUCrimson],
			 [NKFColor laSalleGreen],
			 [NKFColor languidLavender],
			 [NKFColor lapisLazuli],
			 [NKFColor laserLemon],
			 [NKFColor laurelGreen],
			 [NKFColor lava],
			 [NKFColor lavenderFloral],
			 [NKFColor lavenderWeb],
			 [NKFColor lavenderBlue],
			 [NKFColor lavenderBlush],
			 [NKFColor lavenderGray],
			 [NKFColor lavenderIndigo],
			 [NKFColor lavenderMagenta],
			 [NKFColor lavenderMist],
			 [NKFColor lavenderPink],
			 [NKFColor lavenderPurple],
			 [NKFColor lavenderRose],
			 [NKFColor lawnGreen],
			 [NKFColor lemon],
			 [NKFColor lemonChiffon],
			 [NKFColor lemonCurry],
			 [NKFColor lemonGlacier],
			 [NKFColor lemonLime],
			 [NKFColor lemonMeringue],
			 [NKFColor lemonYellow],
			 [NKFColor lenurple],
			 [NKFColor licorice],
			 [NKFColor liberty],
			 [NKFColor lightApricot],
			 [NKFColor lightBlue],
			 [NKFColor lightBrilliantRed],
			 [NKFColor lightBrown],
			 [NKFColor lightCarminePink],
			 [NKFColor lightCobaltBlue],
			 [NKFColor lightCoral],
			 [NKFColor lightCornflowerBlue],
			 [NKFColor lightCrimson],
			 [NKFColor lightCyan],
			 [NKFColor lightDeepPink],
			 [NKFColor lightFrenchBeige],
			 [NKFColor lightFuchsiaPink],
			 [NKFColor lightGoldenrodYellow],
			 [NKFColor lightGray],
			 [NKFColor lightGrayishMagenta],
			 [NKFColor lightGreen],
			 [NKFColor lightHotPink],
			 [NKFColor lightKhaki],
			 [NKFColor lightMediumOrchid],
			 [NKFColor lightMossGreen],
			 [NKFColor lightOrchid],
			 [NKFColor lightPastelPurple],
			 [NKFColor lightPink],
			 [NKFColor lightRedOchre],
			 [NKFColor lightSalmon],
			 [NKFColor lightSalmonPink],
			 [NKFColor lightSeaGreen],
			 [NKFColor lightSkyBlue],
			 [NKFColor lightSlateGray],
			 [NKFColor lightSteelBlue],
			 [NKFColor lightTaupe],
			 [NKFColor lightThulianPink],
			 [NKFColor lightYellow],
			 [NKFColor lilac],
			 [NKFColor limeColorWheel],
			 [NKFColor limeWebX11Green],
			 [NKFColor limeGreen],
			 [NKFColor limerick],
			 [NKFColor lincolnGreen],
			 [NKFColor linen],
			 [NKFColor lion],
			 [NKFColor liseranPurple],
			 [NKFColor littleBoyBlue],
			 [NKFColor liver],
			 [NKFColor liverDogs],
			 [NKFColor liverOrgan],
			 [NKFColor liverChestnut],
			 [NKFColor livid],
			 [NKFColor lumber],
			 [NKFColor lust],
			 [NKFColor magenta],
			 [NKFColor magentaCrayola],
			 [NKFColor magentaDye],
			 [NKFColor magentaPantone],
			 [NKFColor magentaProcess],
			 [NKFColor magentaHaze],
			 [NKFColor magentaPink],
			 [NKFColor magicMint],
			 [NKFColor magnolia],
			 [NKFColor mahogany],
			 [NKFColor maize],
			 [NKFColor majorelleBlue],
			 [NKFColor malachite],
			 [NKFColor manatee],
			 [NKFColor mangoTango],
			 [NKFColor mantis],
			 [NKFColor mardiGras],
			 [NKFColor marigold],
			 [NKFColor maroonCrayola],
			 [NKFColor maroonHTMLCSS],
			 [NKFColor maroonX11],
			 [NKFColor mauve],
			 [NKFColor mauveTaupe],
			 [NKFColor mauvelous],
			 [NKFColor mayGreen],
			 [NKFColor mayaBlue],
			 [NKFColor meatBrown],
			 [NKFColor mediumAquamarine],
			 [NKFColor mediumBlue],
			 [NKFColor mediumCandyAppleRed],
			 [NKFColor mediumCarmine],
			 [NKFColor mediumChampagne],
			 [NKFColor mediumElectricBlue],
			 [NKFColor mediumJungleGreen],
			 [NKFColor mediumLavenderMagenta],
			 [NKFColor mediumOrchid],
			 [NKFColor mediumPersianBlue],
			 [NKFColor mediumPurple],
			 [NKFColor mediumRedViolet],
			 [NKFColor mediumRuby],
			 [NKFColor mediumSeaGreen],
			 [NKFColor mediumSkyBlue],
			 [NKFColor mediumSlateBlue],
			 [NKFColor mediumSpringBud],
			 [NKFColor mediumSpringGreen],
			 [NKFColor mediumTaupe],
			 [NKFColor mediumTurquoise],
			 [NKFColor mediumTuscanRed],
			 [NKFColor mediumVermilion],
			 [NKFColor mediumVioletRed],
			 [NKFColor mellowApricot],
			 [NKFColor mellowYellow],
			 [NKFColor melon],
			 [NKFColor metallicSeaweed],
			 [NKFColor metallicSunburst],
			 [NKFColor mexicanPink],
			 [NKFColor midnightBlue],
			 [NKFColor midnightGreenEagleGreen],
			 [NKFColor mikadoYellow],
			 [NKFColor mindaro],
			 [NKFColor ming],
			 [NKFColor mint],
			 [NKFColor mintCream],
			 [NKFColor mintGreen],
			 [NKFColor mistyRose],
			 [NKFColor moccasin],
			 [NKFColor modeBeige],
			 [NKFColor moonstoneBlue],
			 [NKFColor mordantRed19],
			 [NKFColor mossGreen],
			 [NKFColor mountainMeadow],
			 [NKFColor mountbattenPink],
			 [NKFColor mSUGreen],
			 [NKFColor mughalGreen],
			 [NKFColor mulberry],
			 [NKFColor mustard],
			 [NKFColor myrtleGreen],
			 [NKFColor nadeshikoPink],
			 [NKFColor napierGreen],
			 [NKFColor naplesYellow],
			 [NKFColor navajoWhite],
			 [NKFColor navy],
			 [NKFColor navyPurple],
			 [NKFColor neonCarrot],
			 [NKFColor neonFuchsia],
			 [NKFColor neonGreen],
			 [NKFColor car],
			 [NKFColor yorkPink],
			 [NKFColor nonPhotoBlue],
			 [NKFColor northTexasGreen],
			 [NKFColor nyanza],
			 [NKFColor oceanBoatBlue],
			 [NKFColor ochre],
			 [NKFColor officeGreen],
			 [NKFColor oldBurgundy],
			 [NKFColor oldGold],
			 [NKFColor oldHeliotrope],
			 [NKFColor oldLace],
			 [NKFColor oldLavender],
			 [NKFColor oldMauve],
			 [NKFColor oldMossGreen],
			 [NKFColor oldRose],
			 [NKFColor oldSilver],
			 [NKFColor olive],
			 [NKFColor oliveDrab3],
			 [NKFColor oliveDrab7],
			 [NKFColor olivine],
			 [NKFColor onyx],
			 [NKFColor operaMauve],
			 [NKFColor orangeColorWheel],
			 [NKFColor orangeCrayola],
			 [NKFColor orangePantone],
			 [NKFColor orangeRYB],
			 [NKFColor orangeWeb],
			 [NKFColor orangePeel],
			 [NKFColor orangeRed],
			 [NKFColor orangeYellow],
			 [NKFColor orchid],
			 [NKFColor orchidPink],
			 [NKFColor oriolesOrange],
			 [NKFColor otterBrown],
			 [NKFColor outerSpace],
			 [NKFColor outrageousOrange],
			 [NKFColor oxfordBlue],
			 [NKFColor oUCrimsonRed],
			 [NKFColor pakistanGreen],
			 [NKFColor palatinateBlue],
			 [NKFColor palatinatePurple],
			 [NKFColor paleAqua],
			 [NKFColor paleBlue],
			 [NKFColor paleBrown],
			 [NKFColor paleCarmine],
			 [NKFColor paleCerulean],
			 [NKFColor paleChestnut],
			 [NKFColor paleCopper],
			 [NKFColor paleCornflowerBlue],
			 [NKFColor paleCyan],
			 [NKFColor paleGold],
			 [NKFColor paleGoldenrod],
			 [NKFColor paleGreen],
			 [NKFColor paleLavender],
			 [NKFColor paleMagenta],
			 [NKFColor paleMagentaPink],
			 [NKFColor palePink],
			 [NKFColor palePlum],
			 [NKFColor paleRedViolet],
			 [NKFColor paleRobinEggBlue],
			 [NKFColor paleSilver],
			 [NKFColor paleSpringBud],
			 [NKFColor paleTaupe],
			 [NKFColor paleTurquoise],
			 [NKFColor paleViolet],
			 [NKFColor paleVioletRed],
			 [NKFColor pansyPurple],
			 [NKFColor paoloVeroneseGreen],
			 [NKFColor papayaWhip],
			 [NKFColor paradisePink],
			 [NKFColor parisGreen],
			 [NKFColor pastelBlue],
			 [NKFColor pastelBrown],
			 [NKFColor pastelGray],
			 [NKFColor pastelGreen],
			 [NKFColor pastelMagenta],
			 [NKFColor pastelOrange],
			 [NKFColor pastelPink],
			 [NKFColor pastelPurple],
			 [NKFColor pastelRed],
			 [NKFColor pastelViolet],
			 [NKFColor pastelYellow],
			 [NKFColor patriarch],
			 [NKFColor paynesGrey],
			 [NKFColor peach],
			 [NKFColor peach2],
			 [NKFColor peachOrange],
			 [NKFColor peachPuff],
			 [NKFColor peachYellow],
			 [NKFColor pear],
			 [NKFColor pearl],
			 [NKFColor pearlAqua],
			 [NKFColor pearlyPurple],
			 [NKFColor peridot],
			 [NKFColor periwinkle],
			 [NKFColor persianBlue],
			 [NKFColor persianGreen],
			 [NKFColor persianIndigo],
			 [NKFColor persianOrange],
			 [NKFColor persianPink],
			 [NKFColor persianPlum],
			 [NKFColor persianRed],
			 [NKFColor persianRose],
			 [NKFColor persimmon],
			 [NKFColor peru],
			 [NKFColor phlox],
			 [NKFColor phthaloBlue],
			 [NKFColor phthaloGreen],
			 [NKFColor pictonBlue],
			 [NKFColor pictorialCarmine],
			 [NKFColor piggyPink],
			 [NKFColor pineGreen],
			 [NKFColor pineapple],
			 [NKFColor pink],
			 [NKFColor pinkPantone],
			 [NKFColor pinkLace],
			 [NKFColor pinkLavender],
			 [NKFColor pinkOrange],
			 [NKFColor pinkPearl],
			 [NKFColor pinkRaspberry],
			 [NKFColor pinkSherbet],
			 [NKFColor pistachio],
			 [NKFColor platinum],
			 [NKFColor plum],
			 [NKFColor plumWeb],
			 [NKFColor pompAndPower],
			 [NKFColor popstar],
			 [NKFColor portlandOrange],
			 [NKFColor powderBlue],
			 [NKFColor princetonOrange],
			 [NKFColor prune],
			 [NKFColor prussianBlue],
			 [NKFColor psychedelicPurple],
			 [NKFColor puce],
			 [NKFColor puceRed],
			 [NKFColor pullmanBrownUPSBrown],
			 [NKFColor pullmanGreen],
			 [NKFColor pumpkin],
			 [NKFColor purpleHTML],
			 [NKFColor purpleMunsell],
			 [NKFColor purpleX11],
			 [NKFColor purpleHeart],
			 [NKFColor purpleMountainMajesty],
			 [NKFColor purpleNavy],
			 [NKFColor purplePizzazz],
			 [NKFColor purpleTaupe],
			 [NKFColor purpureus],
			 [NKFColor quartz],
			 [NKFColor queenBlue],
			 [NKFColor queenPink],
			 [NKFColor quinacridoneMagenta],
			 [NKFColor rackley],
			 [NKFColor radicalRed],
			 [NKFColor rajah],
			 [NKFColor raspberry],
			 [NKFColor raspberryGlace],
			 [NKFColor raspberryPink],
			 [NKFColor raspberryRose],
			 [NKFColor rawUmber],
			 [NKFColor razzleDazzleRose],
			 [NKFColor razzmatazz],
			 [NKFColor razzmicBerry],
			 [NKFColor rebeccaPurple],
			 [NKFColor red],
			 [NKFColor redCrayola],
			 [NKFColor redMunsell],
			 [NKFColor redNCS],
			 [NKFColor redPantone],
			 [NKFColor redPigment],
			 [NKFColor redRYB],
			 [NKFColor redBrown],
			 [NKFColor redDevil],
			 [NKFColor redOrange],
			 [NKFColor redPurple],
			 [NKFColor redViolet],
			 [NKFColor redwood],
			 [NKFColor regalia],
			 [NKFColor registrationBlack],
			 [NKFColor resolutionBlue],
			 [NKFColor rhythm],
			 [NKFColor richBlack],
			 [NKFColor richBlackFOGRA29],
			 [NKFColor richBlackFOGRA39],
			 [NKFColor richBrilliantLavender],
			 [NKFColor richCarmine],
			 [NKFColor richElectricBlue],
			 [NKFColor richLavender],
			 [NKFColor richLilac],
			 [NKFColor richMaroon],
			 [NKFColor rifleGreen],
			 [NKFColor roastCoffee],
			 [NKFColor robinEggBlue],
			 [NKFColor rocketMetallic],
			 [NKFColor romanSilver],
			 [NKFColor rose],
			 [NKFColor roseBonbon],
			 [NKFColor roseEbony],
			 [NKFColor roseGold],
			 [NKFColor roseMadder],
			 [NKFColor rosePink],
			 [NKFColor roseQuartz],
			 [NKFColor roseRed],
			 [NKFColor roseTaupe],
			 [NKFColor roseVale],
			 [NKFColor rosewood],
			 [NKFColor rossoCorsa],
			 [NKFColor rosyBrown],
			 [NKFColor royalAzure],
			 [NKFColor royalBlue],
			 [NKFColor royalBlue],
			 [NKFColor royalFuchsia],
			 [NKFColor royalPurple],
			 [NKFColor royalYellow],
			 [NKFColor ruber],
			 [NKFColor rubineRed],
			 [NKFColor ruby],
			 [NKFColor rubyRed],
			 [NKFColor ruddy],
			 [NKFColor ruddyBrown],
			 [NKFColor ruddyPink],
			 [NKFColor rufous],
			 [NKFColor russet],
			 [NKFColor russianGreen],
			 [NKFColor russianViolet],
			 [NKFColor rust],
			 [NKFColor rustyRed],
			 [NKFColor sacramentoStateGreen],
			 [NKFColor saddleBrown],
			 [NKFColor safetyOrange],
			 [NKFColor safetyOrangeBlazeOrange],
			 [NKFColor safetyYellow],
			 [NKFColor saffron],
			 [NKFColor sage],
			 [NKFColor stPatricksBlue],
			 [NKFColor salmon],
			 [NKFColor salmonPink],
			 [NKFColor sand],
			 [NKFColor sandDune],
			 [NKFColor sandstorm],
			 [NKFColor sandyBrown],
			 [NKFColor sandyTaupe],
			 [NKFColor sangria],
			 [NKFColor sapGreen],
			 [NKFColor sapphire],
			 [NKFColor sapphireBlue],
			 [NKFColor satinSheenGold],
			 [NKFColor scarlet],
			 [NKFColor scarlet2],
			 [NKFColor schaussPink],
			 [NKFColor schoolBusYellow],
			 [NKFColor screaminGreen],
			 [NKFColor seaBlue],
			 [NKFColor seaGreen],
			 [NKFColor sealBrown],
			 [NKFColor seashell],
			 [NKFColor selectiveYellow],
			 [NKFColor sepia],
			 [NKFColor shadow],
			 [NKFColor shadowBlue],
			 [NKFColor shampoo],
			 [NKFColor shamrockGreen],
			 [NKFColor sheenGreen],
			 [NKFColor shimmeringBlush],
			 [NKFColor shockingPink],
			 [NKFColor shockingPinkCrayola],
			 [NKFColor sienna],
			 [NKFColor silver],
			 [NKFColor silverChalice],
			 [NKFColor silverLakeBlue],
			 [NKFColor silverPink],
			 [NKFColor silverSand],
			 [NKFColor sinopia],
			 [NKFColor skobeloff],
			 [NKFColor skyBlue],
			 [NKFColor skyMagenta],
			 [NKFColor slateBlue],
			 [NKFColor slateGray],
			 [NKFColor smaltDarkPowderBlue],
			 [NKFColor smitten],
			 [NKFColor smoke],
			 [NKFColor smokyBlack],
			 [NKFColor smokyTopaz],
			 [NKFColor snow],
			 [NKFColor soap],
			 [NKFColor solidPink],
			 [NKFColor sonicSilver],
			 [NKFColor spartanCrimson],
			 [NKFColor spaceCadet],
			 [NKFColor spanishBistre],
			 [NKFColor spanishBlue],
			 [NKFColor spanishCarmine],
			 [NKFColor spanishCrimson],
			 [NKFColor spanishGray],
			 [NKFColor spanishGreen],
			 [NKFColor spanishOrange],
			 [NKFColor spanishPink],
			 [NKFColor spanishRed],
			 [NKFColor spanishSkyBlue],
			 [NKFColor spanishViolet],
			 [NKFColor spanishViridian],
			 [NKFColor spicyMix],
			 [NKFColor spiroDiscoBall],
			 [NKFColor springBud],
			 [NKFColor springGreen],
			 [NKFColor starCommandBlue],
			 [NKFColor steelBlue],
			 [NKFColor steelPink],
			 [NKFColor stilDeGrainYellow],
			 [NKFColor stizza],
			 [NKFColor stormcloud],
			 [NKFColor straw],
			 [NKFColor strawberry],
			 [NKFColor sunglow],
			 [NKFColor sunray],
			 [NKFColor sunset],
			 [NKFColor sunsetOrange],
			 [NKFColor superPink],
			 [NKFColor tan],
			 [NKFColor tangelo],
			 [NKFColor tangerine],
			 [NKFColor tangerineYellow],
			 [NKFColor tangoPink],
			 [NKFColor taupe],
			 [NKFColor taupeGray],
			 [NKFColor teaGreen],
			 [NKFColor teaRose],
			 [NKFColor teaRose],
			 [NKFColor teal],
			 [NKFColor tealBlue],
			 [NKFColor tealDeer],
			 [NKFColor tealGreen],
			 [NKFColor telemagenta],
			 [NKFColor tenne],
			 [NKFColor terraCotta],
			 [NKFColor thistle],
			 [NKFColor thulianPink],
			 [NKFColor tickleMePink],
			 [NKFColor tiffanyBlue],
			 [NKFColor tigersEye],
			 [NKFColor timberwolf],
			 [NKFColor titaniumYellow],
			 [NKFColor tomato],
			 [NKFColor toolbox],
			 [NKFColor topaz],
			 [NKFColor tractorRed],
			 [NKFColor trolleyGrey],
			 [NKFColor tropicalRainForest],
			 [NKFColor trueBlue],
			 [NKFColor tuftsBlue],
			 [NKFColor tulip],
			 [NKFColor tumbleweed],
			 [NKFColor turkishRose],
			 [NKFColor turquoise],
			 [NKFColor turquoiseBlue],
			 [NKFColor turquoiseGreen],
			 [NKFColor tuscan],
			 [NKFColor tuscanBrown],
			 [NKFColor tuscanRed],
			 [NKFColor tuscanTan],
			 [NKFColor tuscany],
			 [NKFColor twilightLavender],
			 [NKFColor tyrianPurple],
			 [NKFColor uABlue],
			 [NKFColor uARed],
			 [NKFColor ube],
			 [NKFColor uCLABlue],
			 [NKFColor uCLAGold],
			 [NKFColor uFOGreen],
			 [NKFColor ultramarine],
			 [NKFColor ultramarineBlue],
			 [NKFColor ultraPink],
			 [NKFColor ultraRed],
			 [NKFColor umber],
			 [NKFColor unbleachedSilk],
			 [NKFColor unitedNationsBlue],
			 [NKFColor universityOfCaliforniaGold],
			 [NKFColor unmellowYellow],
			 [NKFColor uPForestGreen],
			 [NKFColor uPMaroon],
			 [NKFColor upsdellRed],
			 [NKFColor urobilin],
			 [NKFColor uSAFABlue],
			 [NKFColor uSCCardinal],
			 [NKFColor uSCGold],
			 [NKFColor universityOfTennesseeOrange],
			 [NKFColor utahCrimson],
			 [NKFColor vanilla],
			 [NKFColor vanillaIce],
			 [NKFColor vegasGold],
			 [NKFColor venetianRed],
			 [NKFColor verdigris],
			 [NKFColor vermilion],
			 [NKFColor vermilion2],
			 [NKFColor veronica],
			 [NKFColor veryLightAzure],
			 [NKFColor veryLightBlue],
			 [NKFColor veryLightMalachiteGreen],
			 [NKFColor veryLightTangelo],
			 [NKFColor veryPaleOrange],
			 [NKFColor veryPaleYellow],
			 [NKFColor violet],
			 [NKFColor violetColorWheel],
			 [NKFColor violetRYB],
			 [NKFColor violetWeb],
			 [NKFColor violetBlue],
			 [NKFColor violetRed],
			 [NKFColor viridian],
			 [NKFColor viridianGreen],
			 [NKFColor vistaBlue],
			 [NKFColor vividAmber],
			 [NKFColor vividAuburn],
			 [NKFColor vividBurgundy],
			 [NKFColor vividCerise],
			 [NKFColor vividCerulean],
			 [NKFColor vividCrimson],
			 [NKFColor vividGamboge],
			 [NKFColor vividLimeGreen],
			 [NKFColor vividMalachite],
			 [NKFColor vividMulberry],
			 [NKFColor vividOrange],
			 [NKFColor vividOrangePeel],
			 [NKFColor vividOrchid],
			 [NKFColor vividRaspberry],
			 [NKFColor vividRed],
			 [NKFColor vividRedTangelo],
			 [NKFColor vividSkyBlue],
			 [NKFColor vividTangelo],
			 [NKFColor vividTangerine],
			 [NKFColor vividVermilion],
			 [NKFColor vividViolet],
			 [NKFColor vividYellow],
			 [NKFColor warmBlack],
			 [NKFColor waterspout],
			 [NKFColor wenge],
			 [NKFColor wheat],
			 [NKFColor white],
			 [NKFColor whiteSmoke],
			 [NKFColor wildBlueYonder],
			 [NKFColor wildOrchid],
			 [NKFColor wildStrawberry],
			 [NKFColor wildWatermelon],
			 [NKFColor willpowerOrange],
			 [NKFColor windsorTan],
			 [NKFColor wine],
			 [NKFColor wineDregs],
			 [NKFColor wisteria],
			 [NKFColor woodBrown],
			 [NKFColor xanadu],
			 [NKFColor yaleBlue],
			 [NKFColor yankeesBlue],
			 [NKFColor yellow],
			 [NKFColor yellowCrayola],
			 [NKFColor yellowMunsell],
			 [NKFColor yellowNCS],
			 [NKFColor yellowPantone],
			 [NKFColor yellowProcess],
			 [NKFColor yellowRYB],
			 [NKFColor yellowGreen],
			 [NKFColor yellowOrange],
			 [NKFColor yellowRose],
			 [NKFColor zaffre],
			 [NKFColor zinnwalditeBrown],
			 [NKFColor zomp],
			 [NKFColor blackColor],
			 [NKFColor darkGrayColor],
			 [NKFColor lightGrayColor],
			 [NKFColor lightGrayColor],
			 [NKFColor whiteColor],
			 [NKFColor grayColor],
			 [NKFColor redColor],
			 [NKFColor greenColor],
			 [NKFColor blueColor],
			 [NKFColor cyanColor],
			 [NKFColor yellowColor],
			 [NKFColor magentaColor],
			 [NKFColor orangeColor],
			 [NKFColor purpleColor],
			 [NKFColor brownColor],
			 [NKFColor clearColor]];
}

+ (NSDictionary *)allColorsDictionary {
	return @{@"acidgreen" : [NKFColor acidGreen],
			 @"aero" : [NKFColor aero],
			 @"aeroblue" : [NKFColor aeroBlue],
			 @"africanviolet" : [NKFColor africanViolet],
			 @"airforceblueraf" : [NKFColor airForceBlueRAF],
			 @"airforceblueusaf" : [NKFColor airForceBlueUSAF],
			 @"airsuperiorityblue" : [NKFColor airSuperiorityBlue],
			 @"alabamacrimson" : [NKFColor alabamaCrimson],
			 @"aliceblue" : [NKFColor aliceBlue],
			 @"alizarincrimson" : [NKFColor alizarinCrimson],
			 @"alloyorange" : [NKFColor alloyOrange],
			 @"almond" : [NKFColor almond],
			 @"amaranth" : [NKFColor amaranth],
			 @"amaranthdeeppurple" : [NKFColor amaranthDeepPurple],
			 @"amaranthpink" : [NKFColor amaranthPink],
			 @"amaranthpurple" : [NKFColor amaranthPurple],
			 @"amaranthred" : [NKFColor amaranthRed],
			 @"amazonGreen" : [NKFColor amazonGreen],
			 @"amber" : [NKFColor amber],
			 @"ambersaeece" : [NKFColor amberSAEECE],
			 @"americanrose" : [NKFColor americanRose],
			 @"amethyst" : [NKFColor amethyst],
			 @"androidgreen" : [NKFColor androidGreen],
			 @"antiflashwhite" : [NKFColor antiFlashWhite],
			 @"antiquebrass" : [NKFColor antiqueBrass],
			 @"antiquebronze" : [NKFColor antiqueBronze],
			 @"antiquefuchsia" : [NKFColor antiqueFuchsia],
			 @"antiqueruby" : [NKFColor antiqueRuby],
			 @"antiquewhite" : [NKFColor antiqueWhite],
			 @"aoenglish" : [NKFColor aoEnglish],
			 @"applegreen" : [NKFColor appleGreen],
			 @"apricot" : [NKFColor apricot],
			 @"aqua" : [NKFColor aqua],
			 @"aquamarine" : [NKFColor aquamarine],
			 @"armygreen" : [NKFColor armyGreen],
			 @"arsenic" : [NKFColor arsenic],
			 @"artichoke" : [NKFColor artichoke],
			 @"arylideyellow" : [NKFColor arylideYellow],
			 @"ashgrey" : [NKFColor ashGrey],
			 @"asparagus" : [NKFColor asparagus],
			 @"atomictangerine" : [NKFColor atomicTangerine],
			 @"auburn" : [NKFColor auburn],
			 @"aureolin" : [NKFColor aureolin],
			 @"aurometalsaurus" : [NKFColor auroMetalSaurus],
			 @"avocado" : [NKFColor avocado],
			 @"azure" : [NKFColor azure],
			 @"azurewebcolor" : [NKFColor azureWebColor],
			 @"azuremist" : [NKFColor azureMist],
			 @"azureishwhite" : [NKFColor azureishWhite],
			 @"babyblue" : [NKFColor babyBlue],
			 @"babyblueeyes" : [NKFColor babyBlueEyes],
			 @"babypink" : [NKFColor babyPink],
			 @"babypowder" : [NKFColor babyPowder],
			 @"bakermillerpink" : [NKFColor bakerMillerPink],
			 @"ballblue" : [NKFColor ballBlue],
			 @"bananamania" : [NKFColor bananaMania],
			 @"bananayellow" : [NKFColor bananaYellow],
			 @"bangladeshgreen" : [NKFColor bangladeshGreen],
			 @"barbiepink" : [NKFColor barbiePink],
			 @"barnred" : [NKFColor barnRed],
			 @"battleshipgrey" : [NKFColor battleshipGrey],
			 @"bazaar" : [NKFColor bazaar],
			 @"beaublue" : [NKFColor beauBlue],
			 @"beaver" : [NKFColor beaver],
			 @"beige" : [NKFColor beige],
			 @"bdazzledblue" : [NKFColor bdazzledBlue],
			 @"bigdiporuby" : [NKFColor bigDipOruby],
			 @"bisque" : [NKFColor bisque],
			 @"bistre" : [NKFColor bistre],
			 @"bistrebrown" : [NKFColor bistreBrown],
			 @"bitterlemon" : [NKFColor bitterLemon],
			 @"bitterlime" : [NKFColor bitterLime],
			 @"bittersweet" : [NKFColor bittersweet],
			 @"bittersweetshimmer" : [NKFColor bittersweetShimmer],
			 @"black" : [NKFColor black],
			 @"blackbean" : [NKFColor blackBean],
			 @"blackleatherjacket" : [NKFColor blackLeatherJacket],
			 @"blackolive" : [NKFColor blackOlive],
			 @"blanchedalmond" : [NKFColor blanchedAlmond],
			 @"blastoffbronze" : [NKFColor blastOffBronze],
			 @"bleudefrance" : [NKFColor bleuDeFrance],
			 @"blizzardblue" : [NKFColor blizzardBlue],
			 @"blond" : [NKFColor blond],
			 @"blue" : [NKFColor blue],
			 @"bluecrayola" : [NKFColor blueCrayola],
			 @"bluemunsell" : [NKFColor blueMunsell],
			 @"bluencs" : [NKFColor blueNCS],
			 @"bluepantone" : [NKFColor bluePantone],
			 @"bluepigment" : [NKFColor bluePigment],
			 @"blueryb" : [NKFColor blueRYB],
			 @"bluebell" : [NKFColor blueBell],
			 @"bluegray" : [NKFColor blueGray],
			 @"bluegreen" : [NKFColor blueGreen],
			 @"bluelagoon" : [NKFColor blueLagoon],
			 @"bluemagentaviolet" : [NKFColor blueMagentaViolet],
			 @"bluesapphire" : [NKFColor blueSapphire],
			 @"blueviolet" : [NKFColor blueViolet],
			 @"blueyonder" : [NKFColor blueYonder],
			 @"blueberry" : [NKFColor blueberry],
			 @"bluebonnet" : [NKFColor bluebonnet],
			 @"blush" : [NKFColor blush],
			 @"bole" : [NKFColor bole],
			 @"bondiblue" : [NKFColor bondiBlue],
			 @"bone" : [NKFColor bone],
			 @"bostonuniversityred" : [NKFColor bostonUniversityRed],
			 @"bottlegreen" : [NKFColor bottleGreen],
			 @"boysenberry" : [NKFColor boysenberry],
			 @"brandeisblue" : [NKFColor brandeisBlue],
			 @"brass" : [NKFColor brass],
			 @"brickred" : [NKFColor brickRed],
			 @"brightcerulean" : [NKFColor brightCerulean],
			 @"brightgreen" : [NKFColor brightGreen],
			 @"brightlavender" : [NKFColor brightLavender],
			 @"brightlilac" : [NKFColor brightLilac],
			 @"brightmaroon" : [NKFColor brightMaroon],
			 @"brightnavyblue" : [NKFColor brightNavyBlue],
			 @"brightpink" : [NKFColor brightPink],
			 @"brightturquoise" : [NKFColor brightTurquoise],
			 @"brightube" : [NKFColor brightUbe],
			 @"brilliantazure" : [NKFColor brilliantAzure],
			 @"brilliantlavender" : [NKFColor brilliantLavender],
			 @"brilliantrose" : [NKFColor brilliantRose],
			 @"brinkpink" : [NKFColor brinkPink],
			 @"britishracinggreen" : [NKFColor britishRacingGreen],
			 @"bronze" : [NKFColor bronze],
			 @"bronzeyellow" : [NKFColor bronzeYellow],
			 @"browntraditional" : [NKFColor brownTraditional],
			 @"brownweb" : [NKFColor brownWeb],
			 @"brownnose" : [NKFColor brownNose],
			 @"brownyellow" : [NKFColor brownYellow],
			 @"brunswickgreen" : [NKFColor brunswickGreen],
			 @"bubblegum" : [NKFColor bubbleGum],
			 @"bubbles" : [NKFColor bubbles],
			 @"buff" : [NKFColor buff],
			 @"budgreen" : [NKFColor budGreen],
			 @"bulgarianrose" : [NKFColor bulgarianRose],
			 @"burgundy" : [NKFColor burgundy],
			 @"burlywood" : [NKFColor burlywood],
			 @"burntorange" : [NKFColor burntOrange],
			 @"burntsienna" : [NKFColor burntSienna],
			 @"burntumber" : [NKFColor burntUmber],
			 @"byzantine" : [NKFColor byzantine],
			 @"byzantium" : [NKFColor byzantium],
			 @"cadet" : [NKFColor cadet],
			 @"cadetblue" : [NKFColor cadetBlue],
			 @"cadetgrey" : [NKFColor cadetGrey],
			 @"cadmiumgreen" : [NKFColor cadmiumGreen],
			 @"cadmiumorange" : [NKFColor cadmiumOrange],
			 @"cadmiumred" : [NKFColor cadmiumRed],
			 @"cadmiumyellow" : [NKFColor cadmiumYellow],
			 @"caféaulait" : [NKFColor caféAuLait],
			 @"cafénoir" : [NKFColor caféNoir],
			 @"calpolygreen" : [NKFColor calPolyGreen],
			 @"cambridgeblue" : [NKFColor cambridgeBlue],
			 @"camel" : [NKFColor camel],
			 @"cameopink" : [NKFColor cameoPink],
			 @"camouflagegreen" : [NKFColor camouflageGreen],
			 @"canaryyellow" : [NKFColor canaryYellow],
			 @"candyapplered" : [NKFColor candyAppleRed],
			 @"candypink" : [NKFColor candyPink],
			 @"capri" : [NKFColor capri],
			 @"caputmortuum" : [NKFColor caputMortuum],
			 @"cardinal" : [NKFColor cardinal],
			 @"caribbeangreen" : [NKFColor caribbeanGreen],
			 @"carmine" : [NKFColor carmine],
			 @"carminemp" : [NKFColor carmineMP],
			 @"carminepink" : [NKFColor carminePink],
			 @"carminered" : [NKFColor carmineRed],
			 @"carnationpink" : [NKFColor carnationPink],
			 @"carnelian" : [NKFColor carnelian],
			 @"carolinablue" : [NKFColor carolinaBlue],
			 @"carrotorange" : [NKFColor carrotOrange],
			 @"castletongreen" : [NKFColor castletonGreen],
			 @"catalinablue" : [NKFColor catalinaBlue],
			 @"catawba" : [NKFColor catawba],
			 @"cedarchest" : [NKFColor cedarChest],
			 @"ceil" : [NKFColor ceil],
			 @"celadon" : [NKFColor celadon],
			 @"celadonblue" : [NKFColor celadonBlue],
			 @"celadongreen" : [NKFColor celadonGreen],
			 @"celeste" : [NKFColor celeste],
			 @"celestialblue" : [NKFColor celestialBlue],
			 @"cerise" : [NKFColor cerise],
			 @"cerisepink" : [NKFColor cerisePink],
			 @"cerulean" : [NKFColor cerulean],
			 @"ceruleanblue" : [NKFColor ceruleanBlue],
			 @"ceruleanfrost" : [NKFColor ceruleanFrost],
			 @"cgblue" : [NKFColor cGBlue],
			 @"cgred" : [NKFColor cGRed],
			 @"chamoisee" : [NKFColor chamoisee],
			 @"champagne" : [NKFColor champagne],
			 @"charcoal" : [NKFColor charcoal],
			 @"charlestongreen" : [NKFColor charlestonGreen],
			 @"charmpink" : [NKFColor charmPink],
			 @"chartreusetraditional" : [NKFColor chartreuseTraditional],
			 @"chartreuseweb" : [NKFColor chartreuseWeb],
			 @"cherry" : [NKFColor cherry],
			 @"cherryblossompink" : [NKFColor cherryBlossomPink],
			 @"chestnut" : [NKFColor chestnut],
			 @"chinapink" : [NKFColor chinaPink],
			 @"chinarose" : [NKFColor chinaRose],
			 @"chinesered" : [NKFColor chineseRed],
			 @"chineseviolet" : [NKFColor chineseViolet],
			 @"chocolatetraditional" : [NKFColor chocolateTraditional],
			 @"chocolateweb" : [NKFColor chocolateWeb],
			 @"chromeyellow" : [NKFColor chromeYellow],
			 @"cinereous" : [NKFColor cinereous],
			 @"cinnabar" : [NKFColor cinnabar],
			 @"cinnamoncitationneeded" : [NKFColor cinnamonCitationNeeded],
			 @"citrine" : [NKFColor citrine],
			 @"citron" : [NKFColor citron],
			 @"claret" : [NKFColor claret],
			 @"classicrose" : [NKFColor classicRose],
			 @"cobaltblue" : [NKFColor cobaltBlue],
			 @"cocoabrown" : [NKFColor cocoaBrown],
			 @"coconut" : [NKFColor coconut],
			 @"coffee" : [NKFColor coffee],
			 @"columbiablue" : [NKFColor columbiaBlue],
			 @"congopink" : [NKFColor congoPink],
			 @"coolblack" : [NKFColor coolBlack],
			 @"coolgrey" : [NKFColor coolGrey],
			 @"copper" : [NKFColor copper],
			 @"coppercrayola" : [NKFColor copperCrayola],
			 @"copperpenny" : [NKFColor copperPenny],
			 @"copperred" : [NKFColor copperRed],
			 @"copperrose" : [NKFColor copperRose],
			 @"coquelicot" : [NKFColor coquelicot],
			 @"coral" : [NKFColor coral],
			 @"coralpink" : [NKFColor coralPink],
			 @"coralred" : [NKFColor coralRed],
			 @"cordovan" : [NKFColor cordovan],
			 @"corn" : [NKFColor corn],
			 @"cornellred" : [NKFColor cornellRed],
			 @"cornflowerblue" : [NKFColor cornflowerBlue],
			 @"cornsilk" : [NKFColor cornsilk],
			 @"cosmiclatte" : [NKFColor cosmicLatte],
			 @"coyotebrown" : [NKFColor coyoteBrown],
			 @"cottoncandy" : [NKFColor cottonCandy],
			 @"cranberry" : [NKFColor cranberry],
			 @"cream" : [NKFColor cream],
			 @"crimson" : [NKFColor crimson],
			 @"crimsonglory" : [NKFColor crimsonGlory],
			 @"crimsonred" : [NKFColor crimsonRed],
			 @"cyan" : [NKFColor cyan],
			 @"cyanazure" : [NKFColor cyanAzure],
			 @"cyanblueazure" : [NKFColor cyanBlueAzure],
			 @"cyancobaltblue" : [NKFColor cyanCobaltBlue],
			 @"cyancornflowerblue" : [NKFColor cyanCornflowerBlue],
			 @"cyanprocess" : [NKFColor cyanProcess],
			 @"cybergrape" : [NKFColor cyberGrape],
			 @"cyberyellow" : [NKFColor cyberYellow],
			 @"daffodil" : [NKFColor daffodil],
			 @"dandelion" : [NKFColor dandelion],
			 @"darkblue" : [NKFColor darkBlue],
			 @"darkbluegray" : [NKFColor darkBlueGray],
			 @"darkbrown" : [NKFColor darkBrown],
			 @"darkbrowntangelo" : [NKFColor darkBrownTangelo],
			 @"darkbyzantium" : [NKFColor darkByzantium],
			 @"darkcandyapplered" : [NKFColor darkCandyAppleRed],
			 @"darkcerulean" : [NKFColor darkCerulean],
			 @"darkchestnut" : [NKFColor darkChestnut],
			 @"darkcoral" : [NKFColor darkCoral],
			 @"darkcyan" : [NKFColor darkCyan],
			 @"darkelectricblue" : [NKFColor darkElectricBlue],
			 @"darkgoldenrod" : [NKFColor darkGoldenrod],
			 @"darkgrayx11" : [NKFColor darkGrayX11],
			 @"darkgreen" : [NKFColor darkGreen],
			 @"darkgreenx11" : [NKFColor darkGreenX11],
			 @"darkimperialblue" : [NKFColor darkImperialBlue],
			 @"darkimperialblue2" : [NKFColor darkImperialBlue2],
			 @"darkjunglegreen" : [NKFColor darkJungleGreen],
			 @"darkkhaki" : [NKFColor darkKhaki],
			 @"darklava" : [NKFColor darkLava],
			 @"darklavender" : [NKFColor darkLavender],
			 @"darkliver" : [NKFColor darkLiver],
			 @"darkliverhorses" : [NKFColor darkLiverHorses],
			 @"darkmagenta" : [NKFColor darkMagenta],
			 @"darkmediumgray" : [NKFColor darkMediumGray],
			 @"darkmidnightblue" : [NKFColor darkMidnightBlue],
			 @"darkmossgreen" : [NKFColor darkMossGreen],
			 @"darkolivegreen" : [NKFColor darkOliveGreen],
			 @"darkorange" : [NKFColor darkOrange],
			 @"darkorchid" : [NKFColor darkOrchid],
			 @"darkpastelblue" : [NKFColor darkPastelBlue],
			 @"darkpastelgreen" : [NKFColor darkPastelGreen],
			 @"darkpastelpurple" : [NKFColor darkPastelPurple],
			 @"darkpastelred" : [NKFColor darkPastelRed],
			 @"darkpink" : [NKFColor darkPink],
			 @"darkpowderblue" : [NKFColor darkPowderBlue],
			 @"darkpuce" : [NKFColor darkPuce],
			 @"darkpurple" : [NKFColor darkPurple],
			 @"darkraspberry" : [NKFColor darkRaspberry],
			 @"darkred" : [NKFColor darkRed],
			 @"darksalmon" : [NKFColor darkSalmon],
			 @"darkscarlet" : [NKFColor darkScarlet],
			 @"darkseagreen" : [NKFColor darkSeaGreen],
			 @"darksienna" : [NKFColor darkSienna],
			 @"darkskyblue" : [NKFColor darkSkyBlue],
			 @"darkslateblue" : [NKFColor darkSlateBlue],
			 @"darkslategray" : [NKFColor darkSlateGray],
			 @"darkspringgreen" : [NKFColor darkSpringGreen],
			 @"darktan" : [NKFColor darkTan],
			 @"darktangerine" : [NKFColor darkTangerine],
			 @"darktaupe" : [NKFColor darkTaupe],
			 @"darkterracotta" : [NKFColor darkTerraCotta],
			 @"darkturquoise" : [NKFColor darkTurquoise],
			 @"darkvanilla" : [NKFColor darkVanilla],
			 @"darkviolet" : [NKFColor darkViolet],
			 @"darkyellow" : [NKFColor darkYellow],
			 @"dartmouthgreen" : [NKFColor dartmouthGreen],
			 @"davysgrey" : [NKFColor davysGrey],
			 @"debianred" : [NKFColor debianRed],
			 @"deepaquamarine" : [NKFColor deepAquamarine],
			 @"deepcarmine" : [NKFColor deepCarmine],
			 @"deepcarminepink" : [NKFColor deepCarminePink],
			 @"deepcarrotorange" : [NKFColor deepCarrotOrange],
			 @"deepcerise" : [NKFColor deepCerise],
			 @"deepchampagne" : [NKFColor deepChampagne],
			 @"deepchestnut" : [NKFColor deepChestnut],
			 @"deepcoffee" : [NKFColor deepCoffee],
			 @"deepfuchsia" : [NKFColor deepFuchsia],
			 @"deepgreen" : [NKFColor deepGreen],
			 @"deepgreencyanturquoise" : [NKFColor deepGreenCyanTurquoise],
			 @"deepjunglegreen" : [NKFColor deepJungleGreen],
			 @"deepkoamaru" : [NKFColor deepKoamaru],
			 @"deeplemon" : [NKFColor deepLemon],
			 @"deeplilac" : [NKFColor deepLilac],
			 @"deepmagenta" : [NKFColor deepMagenta],
			 @"deepmaroon" : [NKFColor deepMaroon],
			 @"deepmauve" : [NKFColor deepMauve],
			 @"deepmossgreen" : [NKFColor deepMossGreen],
			 @"deeppeach" : [NKFColor deepPeach],
			 @"deeppink" : [NKFColor deepPink],
			 @"deeppuce" : [NKFColor deepPuce],
			 @"deepred" : [NKFColor deepRed],
			 @"deepruby" : [NKFColor deepRuby],
			 @"deepsaffron" : [NKFColor deepSaffron],
			 @"deepskyblue" : [NKFColor deepSkyBlue],
			 @"deepspacesparkle" : [NKFColor deepSpaceSparkle],
			 @"deepspringbud" : [NKFColor deepSpringBud],
			 @"deeptaupe" : [NKFColor deepTaupe],
			 @"deeptuscanred" : [NKFColor deepTuscanRed],
			 @"deepviolet" : [NKFColor deepViolet],
			 @"deer" : [NKFColor deer],
			 @"denim" : [NKFColor denim],
			 @"desaturatedcyan" : [NKFColor desaturatedCyan],
			 @"desert" : [NKFColor desert],
			 @"desertsand" : [NKFColor desertSand],
			 @"desire" : [NKFColor desire],
			 @"diamond" : [NKFColor diamond],
			 @"dimgray" : [NKFColor dimGray],
			 @"dirt" : [NKFColor dirt],
			 @"dodgerblue" : [NKFColor dodgerBlue],
			 @"dogwoodrose" : [NKFColor dogwoodRose],
			 @"dollarbill" : [NKFColor dollarBill],
			 @"donkeybrown" : [NKFColor donkeyBrown],
			 @"drab" : [NKFColor drab],
			 @"dukeblue" : [NKFColor dukeBlue],
			 @"duststorm" : [NKFColor dustStorm],
			 @"dutchwhite" : [NKFColor dutchWhite],
			 @"earthyellow" : [NKFColor earthYellow],
			 @"ebony" : [NKFColor ebony],
			 @"ecru" : [NKFColor ecru],
			 @"eerieblack" : [NKFColor eerieBlack],
			 @"eggplant" : [NKFColor eggplant],
			 @"eggshell" : [NKFColor eggshell],
			 @"egyptianblue" : [NKFColor egyptianBlue],
			 @"electricblue" : [NKFColor electricBlue],
			 @"electriccrimson" : [NKFColor electricCrimson],
			 @"electriccyan" : [NKFColor electricCyan],
			 @"electricgreen" : [NKFColor electricGreen],
			 @"electricindigo" : [NKFColor electricIndigo],
			 @"electriclavender" : [NKFColor electricLavender],
			 @"electriclime" : [NKFColor electricLime],
			 @"electricpurple" : [NKFColor electricPurple],
			 @"electricultramarine" : [NKFColor electricUltramarine],
			 @"electricviolet" : [NKFColor electricViolet],
			 @"electricyellow" : [NKFColor electricYellow],
			 @"emerald" : [NKFColor emerald],
			 @"eminence" : [NKFColor eminence],
			 @"englishgreen" : [NKFColor englishGreen],
			 @"englishlavender" : [NKFColor englishLavender],
			 @"englishred" : [NKFColor englishRed],
			 @"englishviolet" : [NKFColor englishViolet],
			 @"etonblue" : [NKFColor etonBlue],
			 @"eucalyptus" : [NKFColor eucalyptus],
			 @"fallow" : [NKFColor fallow],
			 @"falured" : [NKFColor faluRed],
			 @"fandango" : [NKFColor fandango],
			 @"fandangopink" : [NKFColor fandangoPink],
			 @"fashionfuchsia" : [NKFColor fashionFuchsia],
			 @"fawn" : [NKFColor fawn],
			 @"federalblue" : [NKFColor federalBlue],
			 @"feldgrau" : [NKFColor feldgrau],
			 @"feldspar" : [NKFColor feldspar],
			 @"ferngreen" : [NKFColor fernGreen],
			 @"ferrarired" : [NKFColor ferrariRed],
			 @"fielddrab" : [NKFColor fieldDrab],
			 @"firebrick" : [NKFColor firebrick],
			 @"fireenginered" : [NKFColor fireEngineRed],
			 @"flame" : [NKFColor flame],
			 @"flamingopink" : [NKFColor flamingoPink],
			 @"flattery" : [NKFColor flattery],
			 @"flavescent" : [NKFColor flavescent],
			 @"flax" : [NKFColor flax],
			 @"flirt" : [NKFColor flirt],
			 @"floralwhite" : [NKFColor floralWhite],
			 @"fluorescentorange" : [NKFColor fluorescentOrange],
			 @"fluorescentpink" : [NKFColor fluorescentPink],
			 @"fluorescentyellow" : [NKFColor fluorescentYellow],
			 @"folly" : [NKFColor folly],
			 @"forestgreentraditional" : [NKFColor forestGreenTraditional],
			 @"forestgreenweb" : [NKFColor forestGreenWeb],
			 @"frenchbeige" : [NKFColor frenchBeige],
			 @"frenchbistre" : [NKFColor frenchBistre],
			 @"frenchblue" : [NKFColor frenchBlue],
			 @"frenchfuchsia" : [NKFColor frenchFuchsia],
			 @"frenchlilac" : [NKFColor frenchLilac],
			 @"frenchlime" : [NKFColor frenchLime],
			 @"frenchmauve" : [NKFColor frenchMauve],
			 @"frenchpink" : [NKFColor frenchPink],
			 @"frenchplum" : [NKFColor frenchPlum],
			 @"frenchpuce" : [NKFColor frenchPuce],
			 @"frenchraspberry" : [NKFColor frenchRaspberry],
			 @"frenchrose" : [NKFColor frenchRose],
			 @"frenchskyblue" : [NKFColor frenchSkyBlue],
			 @"frenchviolet" : [NKFColor frenchViolet],
			 @"frenchwine" : [NKFColor frenchWine],
			 @"freshair" : [NKFColor freshAir],
			 @"fuchsia" : [NKFColor fuchsia],
			 @"fuchsiacrayola" : [NKFColor fuchsiaCrayola],
			 @"fuchsiapink" : [NKFColor fuchsiaPink],
			 @"fuchsiapurple" : [NKFColor fuchsiaPurple],
			 @"fuchsiarose" : [NKFColor fuchsiaRose],
			 @"fulvous" : [NKFColor fulvous],
			 @"fuzzywuzzy" : [NKFColor fuzzyWuzzy],
			 @"gamboge" : [NKFColor gamboge],
			 @"gambogeorangebrown" : [NKFColor gambogeOrangeBrown],
			 @"genericviridian" : [NKFColor genericViridian],
			 @"ghostwhite" : [NKFColor ghostWhite],
			 @"giantsorange" : [NKFColor giantsOrange],
			 @"grussrel" : [NKFColor grussrel],
			 @"glaucous" : [NKFColor glaucous],
			 @"glitter" : [NKFColor glitter],
			 @"gogreen" : [NKFColor gOGreen],
			 @"goldmetallic" : [NKFColor goldMetallic],
			 @"goldwebgolden" : [NKFColor goldWebGolden],
			 @"goldfusion" : [NKFColor goldFusion],
			 @"goldenbrown" : [NKFColor goldenBrown],
			 @"goldenpoppy" : [NKFColor goldenPoppy],
			 @"goldenyellow" : [NKFColor goldenYellow],
			 @"goldenrod" : [NKFColor goldenrod],
			 @"grannysmithapple" : [NKFColor grannySmithApple],
			 @"grape" : [NKFColor grape],
			 @"gray" : [NKFColor gray],
			 @"grayhtmlcssgray" : [NKFColor grayHTMLCSSGray],
			 @"grayx11gray" : [NKFColor grayX11Gray],
			 @"grayasparagus" : [NKFColor grayAsparagus],
			 @"grayblue" : [NKFColor grayBlue],
			 @"greencolorwheelx11green" : [NKFColor greenColorWheelX11Green],
			 @"greencrayola" : [NKFColor greenCrayola],
			 @"greenhtmlcsscolor" : [NKFColor greenHTMLCSSColor],
			 @"greenmunsell" : [NKFColor greenMunsell],
			 @"greenncs" : [NKFColor greenNCS],
			 @"greenpantone" : [NKFColor greenPantone],
			 @"greenpigment" : [NKFColor greenPigment],
			 @"greenryb" : [NKFColor greenRYB],
			 @"greenblue" : [NKFColor greenBlue],
			 @"greencyan" : [NKFColor greenCyan],
			 @"greenyellow" : [NKFColor greenYellow],
			 @"grizzly" : [NKFColor grizzly],
			 @"grullo" : [NKFColor grullo],
			 @"guppiegreen" : [NKFColor guppieGreen],
			 @"halayàúbe" : [NKFColor halayàÚbe],
			 @"hanblue" : [NKFColor hanBlue],
			 @"hanpurple" : [NKFColor hanPurple],
			 @"hansayellow" : [NKFColor hansaYellow],
			 @"harlequin" : [NKFColor harlequin],
			 @"harlequingreen" : [NKFColor harlequinGreen],
			 @"harvardcrimson" : [NKFColor harvardCrimson],
			 @"harvestgold" : [NKFColor harvestGold],
			 @"heartgold" : [NKFColor heartGold],
			 @"heliotrope" : [NKFColor heliotrope],
			 @"heliotropegray" : [NKFColor heliotropeGray],
			 @"heliotropemagenta" : [NKFColor heliotropeMagenta],
			 @"hollywoodcerise" : [NKFColor hollywoodCerise],
			 @"honeydew" : [NKFColor honeydew],
			 @"honolulublue" : [NKFColor honoluluBlue],
			 @"hookersgreen" : [NKFColor hookersGreen],
			 @"hotmagenta" : [NKFColor hotMagenta],
			 @"hotpink" : [NKFColor hotPink],
			 @"huntergreen" : [NKFColor hunterGreen],
			 @"iceberg" : [NKFColor iceberg],
			 @"icterine" : [NKFColor icterine],
			 @"illuminatingemerald" : [NKFColor illuminatingEmerald],
			 @"imperial" : [NKFColor imperial],
			 @"imperialblue" : [NKFColor imperialBlue],
			 @"imperialpurple" : [NKFColor imperialPurple],
			 @"imperialred" : [NKFColor imperialRed],
			 @"inchworm" : [NKFColor inchworm],
			 @"independence" : [NKFColor independence],
			 @"indiagreen" : [NKFColor indiaGreen],
			 @"indianred" : [NKFColor indianRed],
			 @"indianyellow" : [NKFColor indianYellow],
			 @"indigo" : [NKFColor indigo],
			 @"indigodye" : [NKFColor indigoDye],
			 @"indigoweb" : [NKFColor indigoWeb],
			 @"internationalkleinblue" : [NKFColor internationalKleinBlue],
			 @"internationalorangeaerospace" : [NKFColor internationalOrangeAerospace],
			 @"internationalorangeengineering" : [NKFColor internationalOrangeEngineering],
			 @"internationalorangegoldengatebridge" : [NKFColor internationalOrangeGoldenGateBridge],
			 @"iris" : [NKFColor iris],
			 @"irresistible" : [NKFColor irresistible],
			 @"isabelline" : [NKFColor isabelline],
			 @"islamicgreen" : [NKFColor islamicGreen],
			 @"italianskyblue" : [NKFColor italianSkyBlue],
			 @"ivory" : [NKFColor ivory],
			 @"jade" : [NKFColor jade],
			 @"japanesecarmine" : [NKFColor japaneseCarmine],
			 @"japaneseindigo" : [NKFColor japaneseIndigo],
			 @"japaneseviolet" : [NKFColor japaneseViolet],
			 @"jasmine" : [NKFColor jasmine],
			 @"jasper" : [NKFColor jasper],
			 @"jazzberryjam" : [NKFColor jazzberryJam],
			 @"jellybean" : [NKFColor jellyBean],
			 @"jet" : [NKFColor jet],
			 @"jonquil" : [NKFColor jonquil],
			 @"jordyblue" : [NKFColor jordyBlue],
			 @"junebud" : [NKFColor juneBud],
			 @"junglegreen" : [NKFColor jungleGreen],
			 @"kellygreen" : [NKFColor kellyGreen],
			 @"kenyancopper" : [NKFColor kenyanCopper],
			 @"keppel" : [NKFColor keppel],
			 @"jawadchickencolorhtmlcsskhaki" : [NKFColor jawadChickenColorHTMLCSSKhaki],
			 @"khakix11lightkhaki" : [NKFColor khakiX11LightKhaki],
			 @"kobe" : [NKFColor kobe],
			 @"kobi" : [NKFColor kobi],
			 @"kombugreen" : [NKFColor kombuGreen],
			 @"kucrimson" : [NKFColor kUCrimson],
			 @"lasallegreen" : [NKFColor laSalleGreen],
			 @"languidlavender" : [NKFColor languidLavender],
			 @"lapislazuli" : [NKFColor lapisLazuli],
			 @"laserlemon" : [NKFColor laserLemon],
			 @"laurelgreen" : [NKFColor laurelGreen],
			 @"lava" : [NKFColor lava],
			 @"lavenderfloral" : [NKFColor lavenderFloral],
			 @"lavenderweb" : [NKFColor lavenderWeb],
			 @"lavenderblue" : [NKFColor lavenderBlue],
			 @"lavenderblush" : [NKFColor lavenderBlush],
			 @"lavendergray" : [NKFColor lavenderGray],
			 @"lavenderindigo" : [NKFColor lavenderIndigo],
			 @"lavendermagenta" : [NKFColor lavenderMagenta],
			 @"lavendermist" : [NKFColor lavenderMist],
			 @"lavenderpink" : [NKFColor lavenderPink],
			 @"lavenderpurple" : [NKFColor lavenderPurple],
			 @"lavenderrose" : [NKFColor lavenderRose],
			 @"lawngreen" : [NKFColor lawnGreen],
			 @"lemon" : [NKFColor lemon],
			 @"lemonchiffon" : [NKFColor lemonChiffon],
			 @"lemoncurry" : [NKFColor lemonCurry],
			 @"lemonglacier" : [NKFColor lemonGlacier],
			 @"lemonlime" : [NKFColor lemonLime],
			 @"lemonmeringue" : [NKFColor lemonMeringue],
			 @"lemonyellow" : [NKFColor lemonYellow],
			 @"lenurple" : [NKFColor lenurple],
			 @"licorice" : [NKFColor licorice],
			 @"liberty" : [NKFColor liberty],
			 @"lightapricot" : [NKFColor lightApricot],
			 @"lightblue" : [NKFColor lightBlue],
			 @"lightbrilliantred" : [NKFColor lightBrilliantRed],
			 @"lightbrown" : [NKFColor lightBrown],
			 @"lightcarminepink" : [NKFColor lightCarminePink],
			 @"lightcobaltblue" : [NKFColor lightCobaltBlue],
			 @"lightcoral" : [NKFColor lightCoral],
			 @"lightcornflowerblue" : [NKFColor lightCornflowerBlue],
			 @"lightcrimson" : [NKFColor lightCrimson],
			 @"lightcyan" : [NKFColor lightCyan],
			 @"lightdeeppink" : [NKFColor lightDeepPink],
			 @"lightfrenchbeige" : [NKFColor lightFrenchBeige],
			 @"lightfuchsiapink" : [NKFColor lightFuchsiaPink],
			 @"lightgoldenrodyellow" : [NKFColor lightGoldenrodYellow],
			 @"lightgray" : [NKFColor lightGray],
			 @"lightgrayishmagenta" : [NKFColor lightGrayishMagenta],
			 @"lightgreen" : [NKFColor lightGreen],
			 @"lighthotpink" : [NKFColor lightHotPink],
			 @"lightkhaki" : [NKFColor lightKhaki],
			 @"lightmediumorchid" : [NKFColor lightMediumOrchid],
			 @"lightmossgreen" : [NKFColor lightMossGreen],
			 @"lightorchid" : [NKFColor lightOrchid],
			 @"lightpastelpurple" : [NKFColor lightPastelPurple],
			 @"lightpink" : [NKFColor lightPink],
			 @"lightredochre" : [NKFColor lightRedOchre],
			 @"lightsalmon" : [NKFColor lightSalmon],
			 @"lightsalmonpink" : [NKFColor lightSalmonPink],
			 @"lightseagreen" : [NKFColor lightSeaGreen],
			 @"lightskyblue" : [NKFColor lightSkyBlue],
			 @"lightslategray" : [NKFColor lightSlateGray],
			 @"lightsteelblue" : [NKFColor lightSteelBlue],
			 @"lighttaupe" : [NKFColor lightTaupe],
			 @"lightthulianpink" : [NKFColor lightThulianPink],
			 @"lightyellow" : [NKFColor lightYellow],
			 @"lilac" : [NKFColor lilac],
			 @"limecolorwheel" : [NKFColor limeColorWheel],
			 @"limewebx11green" : [NKFColor limeWebX11Green],
			 @"limegreen" : [NKFColor limeGreen],
			 @"limerick" : [NKFColor limerick],
			 @"lincolngreen" : [NKFColor lincolnGreen],
			 @"linen" : [NKFColor linen],
			 @"lion" : [NKFColor lion],
			 @"liseranpurple" : [NKFColor liseranPurple],
			 @"littleboyblue" : [NKFColor littleBoyBlue],
			 @"liver" : [NKFColor liver],
			 @"liverdogs" : [NKFColor liverDogs],
			 @"liverorgan" : [NKFColor liverOrgan],
			 @"liverchestnut" : [NKFColor liverChestnut],
			 @"livid" : [NKFColor livid],
			 @"lumber" : [NKFColor lumber],
			 @"lust" : [NKFColor lust],
			 @"magenta" : [NKFColor magenta],
			 @"magentacrayola" : [NKFColor magentaCrayola],
			 @"magentadye" : [NKFColor magentaDye],
			 @"magentapantone" : [NKFColor magentaPantone],
			 @"magentaprocess" : [NKFColor magentaProcess],
			 @"magentahaze" : [NKFColor magentaHaze],
			 @"magentapink" : [NKFColor magentaPink],
			 @"magicmint" : [NKFColor magicMint],
			 @"magnolia" : [NKFColor magnolia],
			 @"mahogany" : [NKFColor mahogany],
			 @"maize" : [NKFColor maize],
			 @"majorelleblue" : [NKFColor majorelleBlue],
			 @"malachite" : [NKFColor malachite],
			 @"manatee" : [NKFColor manatee],
			 @"mangotango" : [NKFColor mangoTango],
			 @"mantis" : [NKFColor mantis],
			 @"mardigras" : [NKFColor mardiGras],
			 @"marigold" : [NKFColor marigold],
			 @"marooncrayola" : [NKFColor maroonCrayola],
			 @"maroonhtmlcss" : [NKFColor maroonHTMLCSS],
			 @"maroonx11" : [NKFColor maroonX11],
			 @"mauve" : [NKFColor mauve],
			 @"mauvetaupe" : [NKFColor mauveTaupe],
			 @"mauvelous" : [NKFColor mauvelous],
			 @"maygreen" : [NKFColor mayGreen],
			 @"mayablue" : [NKFColor mayaBlue],
			 @"meatbrown" : [NKFColor meatBrown],
			 @"mediumaquamarine" : [NKFColor mediumAquamarine],
			 @"mediumblue" : [NKFColor mediumBlue],
			 @"mediumcandyapplered" : [NKFColor mediumCandyAppleRed],
			 @"mediumcarmine" : [NKFColor mediumCarmine],
			 @"mediumchampagne" : [NKFColor mediumChampagne],
			 @"mediumelectricblue" : [NKFColor mediumElectricBlue],
			 @"mediumjunglegreen" : [NKFColor mediumJungleGreen],
			 @"mediumlavendermagenta" : [NKFColor mediumLavenderMagenta],
			 @"mediumorchid" : [NKFColor mediumOrchid],
			 @"mediumpersianblue" : [NKFColor mediumPersianBlue],
			 @"mediumpurple" : [NKFColor mediumPurple],
			 @"mediumredviolet" : [NKFColor mediumRedViolet],
			 @"mediumruby" : [NKFColor mediumRuby],
			 @"mediumseagreen" : [NKFColor mediumSeaGreen],
			 @"mediumskyblue" : [NKFColor mediumSkyBlue],
			 @"mediumslateblue" : [NKFColor mediumSlateBlue],
			 @"mediumspringbud" : [NKFColor mediumSpringBud],
			 @"mediumspringgreen" : [NKFColor mediumSpringGreen],
			 @"mediumtaupe" : [NKFColor mediumTaupe],
			 @"mediumturquoise" : [NKFColor mediumTurquoise],
			 @"mediumtuscanred" : [NKFColor mediumTuscanRed],
			 @"mediumvermilion" : [NKFColor mediumVermilion],
			 @"mediumvioletred" : [NKFColor mediumVioletRed],
			 @"mellowapricot" : [NKFColor mellowApricot],
			 @"mellowyellow" : [NKFColor mellowYellow],
			 @"melon" : [NKFColor melon],
			 @"metallicseaweed" : [NKFColor metallicSeaweed],
			 @"metallicsunburst" : [NKFColor metallicSunburst],
			 @"mexicanpink" : [NKFColor mexicanPink],
			 @"midnightblue" : [NKFColor midnightBlue],
			 @"midnightgreeneaglegreen" : [NKFColor midnightGreenEagleGreen],
			 @"mikadoyellow" : [NKFColor mikadoYellow],
			 @"mindaro" : [NKFColor mindaro],
			 @"ming" : [NKFColor ming],
			 @"mint" : [NKFColor mint],
			 @"mintcream" : [NKFColor mintCream],
			 @"mintgreen" : [NKFColor mintGreen],
			 @"mistyrose" : [NKFColor mistyRose],
			 @"moccasin" : [NKFColor moccasin],
			 @"modebeige" : [NKFColor modeBeige],
			 @"moonstoneblue" : [NKFColor moonstoneBlue],
			 @"mordantred19" : [NKFColor mordantRed19],
			 @"mossgreen" : [NKFColor mossGreen],
			 @"mountainmeadow" : [NKFColor mountainMeadow],
			 @"mountbattenpink" : [NKFColor mountbattenPink],
			 @"msugreen" : [NKFColor mSUGreen],
			 @"mughalgreen" : [NKFColor mughalGreen],
			 @"mulberry" : [NKFColor mulberry],
			 @"mustard" : [NKFColor mustard],
			 @"myrtlegreen" : [NKFColor myrtleGreen],
			 @"nadeshikopink" : [NKFColor nadeshikoPink],
			 @"napiergreen" : [NKFColor napierGreen],
			 @"naplesyellow" : [NKFColor naplesYellow],
			 @"navajowhite" : [NKFColor navajoWhite],
			 @"navy" : [NKFColor navy],
			 @"navypurple" : [NKFColor navyPurple],
			 @"neoncarrot" : [NKFColor neonCarrot],
			 @"neonfuchsia" : [NKFColor neonFuchsia],
			 @"neongreen" : [NKFColor neonGreen],
			 @"car" : [NKFColor car],
			 @"yorkPink" : [NKFColor yorkPink],
			 @"nonphotoblue" : [NKFColor nonPhotoBlue],
			 @"northtexasgreen" : [NKFColor northTexasGreen],
			 @"nyanza" : [NKFColor nyanza],
			 @"oceanboatblue" : [NKFColor oceanBoatBlue],
			 @"ochre" : [NKFColor ochre],
			 @"officegreen" : [NKFColor officeGreen],
			 @"oldburgundy" : [NKFColor oldBurgundy],
			 @"oldgold" : [NKFColor oldGold],
			 @"oldheliotrope" : [NKFColor oldHeliotrope],
			 @"oldlace" : [NKFColor oldLace],
			 @"oldlavender" : [NKFColor oldLavender],
			 @"oldmauve" : [NKFColor oldMauve],
			 @"oldmossgreen" : [NKFColor oldMossGreen],
			 @"oldrose" : [NKFColor oldRose],
			 @"oldsilver" : [NKFColor oldSilver],
			 @"olive" : [NKFColor olive],
			 @"olivedrab3" : [NKFColor oliveDrab3],
			 @"olivedrab7" : [NKFColor oliveDrab7],
			 @"olivine" : [NKFColor olivine],
			 @"onyx" : [NKFColor onyx],
			 @"operamauve" : [NKFColor operaMauve],
			 @"orangecolorwheel" : [NKFColor orangeColorWheel],
			 @"orangecrayola" : [NKFColor orangeCrayola],
			 @"orangepantone" : [NKFColor orangePantone],
			 @"orangeryb" : [NKFColor orangeRYB],
			 @"orangeweb" : [NKFColor orangeWeb],
			 @"orangepeel" : [NKFColor orangePeel],
			 @"orangered" : [NKFColor orangeRed],
			 @"orangeyellow" : [NKFColor orangeYellow],
			 @"orchid" : [NKFColor orchid],
			 @"orchidpink" : [NKFColor orchidPink],
			 @"oriolesorange" : [NKFColor oriolesOrange],
			 @"otterbrown" : [NKFColor otterBrown],
			 @"outerspace" : [NKFColor outerSpace],
			 @"outrageousorange" : [NKFColor outrageousOrange],
			 @"oxfordblue" : [NKFColor oxfordBlue],
			 @"oucrimsonred" : [NKFColor oUCrimsonRed],
			 @"pakistangreen" : [NKFColor pakistanGreen],
			 @"palatinateblue" : [NKFColor palatinateBlue],
			 @"palatinatepurple" : [NKFColor palatinatePurple],
			 @"paleaqua" : [NKFColor paleAqua],
			 @"paleblue" : [NKFColor paleBlue],
			 @"palebrown" : [NKFColor paleBrown],
			 @"palecarmine" : [NKFColor paleCarmine],
			 @"palecerulean" : [NKFColor paleCerulean],
			 @"palechestnut" : [NKFColor paleChestnut],
			 @"palecopper" : [NKFColor paleCopper],
			 @"palecornflowerblue" : [NKFColor paleCornflowerBlue],
			 @"palecyan" : [NKFColor paleCyan],
			 @"palegold" : [NKFColor paleGold],
			 @"palegoldenrod" : [NKFColor paleGoldenrod],
			 @"palegreen" : [NKFColor paleGreen],
			 @"palelavender" : [NKFColor paleLavender],
			 @"palemagenta" : [NKFColor paleMagenta],
			 @"palemagentapink" : [NKFColor paleMagentaPink],
			 @"palepink" : [NKFColor palePink],
			 @"paleplum" : [NKFColor palePlum],
			 @"paleredviolet" : [NKFColor paleRedViolet],
			 @"palerobineggblue" : [NKFColor paleRobinEggBlue],
			 @"palesilver" : [NKFColor paleSilver],
			 @"palespringbud" : [NKFColor paleSpringBud],
			 @"paletaupe" : [NKFColor paleTaupe],
			 @"paleturquoise" : [NKFColor paleTurquoise],
			 @"paleviolet" : [NKFColor paleViolet],
			 @"palevioletred" : [NKFColor paleVioletRed],
			 @"pansypurple" : [NKFColor pansyPurple],
			 @"paoloveronesegreen" : [NKFColor paoloVeroneseGreen],
			 @"papayawhip" : [NKFColor papayaWhip],
			 @"paradisepink" : [NKFColor paradisePink],
			 @"parisgreen" : [NKFColor parisGreen],
			 @"pastelblue" : [NKFColor pastelBlue],
			 @"pastelbrown" : [NKFColor pastelBrown],
			 @"pastelgray" : [NKFColor pastelGray],
			 @"pastelgreen" : [NKFColor pastelGreen],
			 @"pastelmagenta" : [NKFColor pastelMagenta],
			 @"pastelorange" : [NKFColor pastelOrange],
			 @"pastelpink" : [NKFColor pastelPink],
			 @"pastelpurple" : [NKFColor pastelPurple],
			 @"pastelred" : [NKFColor pastelRed],
			 @"pastelviolet" : [NKFColor pastelViolet],
			 @"pastelyellow" : [NKFColor pastelYellow],
			 @"patriarch" : [NKFColor patriarch],
			 @"paynesgrey" : [NKFColor paynesGrey],
			 @"peach" : [NKFColor peach],
			 @"peach2" : [NKFColor peach2],
			 @"peachorange" : [NKFColor peachOrange],
			 @"peachpuff" : [NKFColor peachPuff],
			 @"peachyellow" : [NKFColor peachYellow],
			 @"pear" : [NKFColor pear],
			 @"pearl" : [NKFColor pearl],
			 @"pearlaqua" : [NKFColor pearlAqua],
			 @"pearlypurple" : [NKFColor pearlyPurple],
			 @"peridot" : [NKFColor peridot],
			 @"periwinkle" : [NKFColor periwinkle],
			 @"persianblue" : [NKFColor persianBlue],
			 @"persiangreen" : [NKFColor persianGreen],
			 @"persianindigo" : [NKFColor persianIndigo],
			 @"persianorange" : [NKFColor persianOrange],
			 @"persianpink" : [NKFColor persianPink],
			 @"persianplum" : [NKFColor persianPlum],
			 @"persianred" : [NKFColor persianRed],
			 @"persianrose" : [NKFColor persianRose],
			 @"persimmon" : [NKFColor persimmon],
			 @"peru" : [NKFColor peru],
			 @"phlox" : [NKFColor phlox],
			 @"phthaloblue" : [NKFColor phthaloBlue],
			 @"phthalogreen" : [NKFColor phthaloGreen],
			 @"pictonblue" : [NKFColor pictonBlue],
			 @"pictorialcarmine" : [NKFColor pictorialCarmine],
			 @"piggypink" : [NKFColor piggyPink],
			 @"pinegreen" : [NKFColor pineGreen],
			 @"pineapple" : [NKFColor pineapple],
			 @"pink" : [NKFColor pink],
			 @"pinkpantone" : [NKFColor pinkPantone],
			 @"pinklace" : [NKFColor pinkLace],
			 @"pinklavender" : [NKFColor pinkLavender],
			 @"pinkorange" : [NKFColor pinkOrange],
			 @"pinkpearl" : [NKFColor pinkPearl],
			 @"pinkraspberry" : [NKFColor pinkRaspberry],
			 @"pinksherbet" : [NKFColor pinkSherbet],
			 @"pistachio" : [NKFColor pistachio],
			 @"platinum" : [NKFColor platinum],
			 @"plum" : [NKFColor plum],
			 @"plumweb" : [NKFColor plumWeb],
			 @"pompandpower" : [NKFColor pompAndPower],
			 @"popstar" : [NKFColor popstar],
			 @"portlandorange" : [NKFColor portlandOrange],
			 @"powderblue" : [NKFColor powderBlue],
			 @"princetonorange" : [NKFColor princetonOrange],
			 @"prune" : [NKFColor prune],
			 @"prussianblue" : [NKFColor prussianBlue],
			 @"psychedelicpurple" : [NKFColor psychedelicPurple],
			 @"puce" : [NKFColor puce],
			 @"pucered" : [NKFColor puceRed],
			 @"pullmanbrownupsbrown" : [NKFColor pullmanBrownUPSBrown],
			 @"pullmangreen" : [NKFColor pullmanGreen],
			 @"pumpkin" : [NKFColor pumpkin],
			 @"purplehtml" : [NKFColor purpleHTML],
			 @"purplemunsell" : [NKFColor purpleMunsell],
			 @"purplex11" : [NKFColor purpleX11],
			 @"purpleheart" : [NKFColor purpleHeart],
			 @"purplemountainmajesty" : [NKFColor purpleMountainMajesty],
			 @"purplenavy" : [NKFColor purpleNavy],
			 @"purplepizzazz" : [NKFColor purplePizzazz],
			 @"purpletaupe" : [NKFColor purpleTaupe],
			 @"purpureus" : [NKFColor purpureus],
			 @"quartz" : [NKFColor quartz],
			 @"queenblue" : [NKFColor queenBlue],
			 @"queenpink" : [NKFColor queenPink],
			 @"quinacridonemagenta" : [NKFColor quinacridoneMagenta],
			 @"rackley" : [NKFColor rackley],
			 @"radicalred" : [NKFColor radicalRed],
			 @"rajah" : [NKFColor rajah],
			 @"raspberry" : [NKFColor raspberry],
			 @"raspberryglace" : [NKFColor raspberryGlace],
			 @"raspberrypink" : [NKFColor raspberryPink],
			 @"raspberryrose" : [NKFColor raspberryRose],
			 @"rawumber" : [NKFColor rawUmber],
			 @"razzledazzlerose" : [NKFColor razzleDazzleRose],
			 @"razzmatazz" : [NKFColor razzmatazz],
			 @"razzmicberry" : [NKFColor razzmicBerry],
			 @"rebeccapurple" : [NKFColor rebeccaPurple],
			 @"red" : [NKFColor red],
			 @"redcrayola" : [NKFColor redCrayola],
			 @"redmunsell" : [NKFColor redMunsell],
			 @"redncs" : [NKFColor redNCS],
			 @"redpantone" : [NKFColor redPantone],
			 @"redpigment" : [NKFColor redPigment],
			 @"redryb" : [NKFColor redRYB],
			 @"redbrown" : [NKFColor redBrown],
			 @"reddevil" : [NKFColor redDevil],
			 @"redorange" : [NKFColor redOrange],
			 @"redpurple" : [NKFColor redPurple],
			 @"redviolet" : [NKFColor redViolet],
			 @"redwood" : [NKFColor redwood],
			 @"regalia" : [NKFColor regalia],
			 @"registrationblack" : [NKFColor registrationBlack],
			 @"resolutionblue" : [NKFColor resolutionBlue],
			 @"rhythm" : [NKFColor rhythm],
			 @"richblack" : [NKFColor richBlack],
			 @"richblackfogra29" : [NKFColor richBlackFOGRA29],
			 @"richblackfogra39" : [NKFColor richBlackFOGRA39],
			 @"richbrilliantlavender" : [NKFColor richBrilliantLavender],
			 @"richcarmine" : [NKFColor richCarmine],
			 @"richelectricblue" : [NKFColor richElectricBlue],
			 @"richlavender" : [NKFColor richLavender],
			 @"richlilac" : [NKFColor richLilac],
			 @"richmaroon" : [NKFColor richMaroon],
			 @"riflegreen" : [NKFColor rifleGreen],
			 @"roastcoffee" : [NKFColor roastCoffee],
			 @"robineggblue" : [NKFColor robinEggBlue],
			 @"rocketmetallic" : [NKFColor rocketMetallic],
			 @"romansilver" : [NKFColor romanSilver],
			 @"rose" : [NKFColor rose],
			 @"rosebonbon" : [NKFColor roseBonbon],
			 @"roseebony" : [NKFColor roseEbony],
			 @"rosegold" : [NKFColor roseGold],
			 @"rosemadder" : [NKFColor roseMadder],
			 @"rosepink" : [NKFColor rosePink],
			 @"rosequartz" : [NKFColor roseQuartz],
			 @"rosered" : [NKFColor roseRed],
			 @"rosetaupe" : [NKFColor roseTaupe],
			 @"rosevale" : [NKFColor roseVale],
			 @"rosewood" : [NKFColor rosewood],
			 @"rossocorsa" : [NKFColor rossoCorsa],
			 @"rosybrown" : [NKFColor rosyBrown],
			 @"royalazure" : [NKFColor royalAzure],
			 @"royalblue" : [NKFColor royalBlue],
			 @"royalblue2" : [NKFColor royalBlue2],
			 @"royalfuchsia" : [NKFColor royalFuchsia],
			 @"royalpurple" : [NKFColor royalPurple],
			 @"royalyellow" : [NKFColor royalYellow],
			 @"ruber" : [NKFColor ruber],
			 @"rubinered" : [NKFColor rubineRed],
			 @"ruby" : [NKFColor ruby],
			 @"rubyred" : [NKFColor rubyRed],
			 @"ruddy" : [NKFColor ruddy],
			 @"ruddybrown" : [NKFColor ruddyBrown],
			 @"ruddypink" : [NKFColor ruddyPink],
			 @"rufous" : [NKFColor rufous],
			 @"russet" : [NKFColor russet],
			 @"russiangreen" : [NKFColor russianGreen],
			 @"russianviolet" : [NKFColor russianViolet],
			 @"rust" : [NKFColor rust],
			 @"rustyred" : [NKFColor rustyRed],
			 @"sacramentostategreen" : [NKFColor sacramentoStateGreen],
			 @"saddlebrown" : [NKFColor saddleBrown],
			 @"safetyorange" : [NKFColor safetyOrange],
			 @"safetyorangeblazeorange" : [NKFColor safetyOrangeBlazeOrange],
			 @"safetyyellow" : [NKFColor safetyYellow],
			 @"saffron" : [NKFColor saffron],
			 @"sage" : [NKFColor sage],
			 @"stpatricksblue" : [NKFColor stPatricksBlue],
			 @"salmon" : [NKFColor salmon],
			 @"salmonpink" : [NKFColor salmonPink],
			 @"sand" : [NKFColor sand],
			 @"sanddune" : [NKFColor sandDune],
			 @"sandstorm" : [NKFColor sandstorm],
			 @"sandybrown" : [NKFColor sandyBrown],
			 @"sandytaupe" : [NKFColor sandyTaupe],
			 @"sangria" : [NKFColor sangria],
			 @"sapgreen" : [NKFColor sapGreen],
			 @"sapphire" : [NKFColor sapphire],
			 @"sapphireblue" : [NKFColor sapphireBlue],
			 @"satinsheengold" : [NKFColor satinSheenGold],
			 @"scarlet" : [NKFColor scarlet],
			 @"scarlet2" : [NKFColor scarlet2],
			 @"schausspink" : [NKFColor schaussPink],
			 @"schoolbusyellow" : [NKFColor schoolBusYellow],
			 @"screamingreen" : [NKFColor screaminGreen],
			 @"seablue" : [NKFColor seaBlue],
			 @"seagreen" : [NKFColor seaGreen],
			 @"sealbrown" : [NKFColor sealBrown],
			 @"seashell" : [NKFColor seashell],
			 @"selectiveyellow" : [NKFColor selectiveYellow],
			 @"sepia" : [NKFColor sepia],
			 @"shadow" : [NKFColor shadow],
			 @"shadowblue" : [NKFColor shadowBlue],
			 @"shampoo" : [NKFColor shampoo],
			 @"shamrockgreen" : [NKFColor shamrockGreen],
			 @"sheengreen" : [NKFColor sheenGreen],
			 @"shimmeringblush" : [NKFColor shimmeringBlush],
			 @"shockingpink" : [NKFColor shockingPink],
			 @"shockingpinkcrayola" : [NKFColor shockingPinkCrayola],
			 @"sienna" : [NKFColor sienna],
			 @"silver" : [NKFColor silver],
			 @"silverchalice" : [NKFColor silverChalice],
			 @"silverlakeblue" : [NKFColor silverLakeBlue],
			 @"silverpink" : [NKFColor silverPink],
			 @"silversand" : [NKFColor silverSand],
			 @"sinopia" : [NKFColor sinopia],
			 @"skobeloff" : [NKFColor skobeloff],
			 @"skyblue" : [NKFColor skyBlue],
			 @"skymagenta" : [NKFColor skyMagenta],
			 @"slateblue" : [NKFColor slateBlue],
			 @"slategray" : [NKFColor slateGray],
			 @"smaltdarkpowderblue" : [NKFColor smaltDarkPowderBlue],
			 @"smitten" : [NKFColor smitten],
			 @"smoke" : [NKFColor smoke],
			 @"smokyblack" : [NKFColor smokyBlack],
			 @"smokytopaz" : [NKFColor smokyTopaz],
			 @"snow" : [NKFColor snow],
			 @"soap" : [NKFColor soap],
			 @"solidpink" : [NKFColor solidPink],
			 @"sonicsilver" : [NKFColor sonicSilver],
			 @"spartancrimson" : [NKFColor spartanCrimson],
			 @"spacecadet" : [NKFColor spaceCadet],
			 @"spanishbistre" : [NKFColor spanishBistre],
			 @"spanishblue" : [NKFColor spanishBlue],
			 @"spanishcarmine" : [NKFColor spanishCarmine],
			 @"spanishcrimson" : [NKFColor spanishCrimson],
			 @"spanishgray" : [NKFColor spanishGray],
			 @"spanishgreen" : [NKFColor spanishGreen],
			 @"spanishorange" : [NKFColor spanishOrange],
			 @"spanishpink" : [NKFColor spanishPink],
			 @"spanishred" : [NKFColor spanishRed],
			 @"spanishskyblue" : [NKFColor spanishSkyBlue],
			 @"spanishviolet" : [NKFColor spanishViolet],
			 @"spanishviridian" : [NKFColor spanishViridian],
			 @"spicymix" : [NKFColor spicyMix],
			 @"spirodiscoball" : [NKFColor spiroDiscoBall],
			 @"springbud" : [NKFColor springBud],
			 @"springgreen" : [NKFColor springGreen],
			 @"starcommandblue" : [NKFColor starCommandBlue],
			 @"steelblue" : [NKFColor steelBlue],
			 @"steelpink" : [NKFColor steelPink],
			 @"stildegrainyellow" : [NKFColor stilDeGrainYellow],
			 @"stizza" : [NKFColor stizza],
			 @"stormcloud" : [NKFColor stormcloud],
			 @"straw" : [NKFColor straw],
			 @"strawberry" : [NKFColor strawberry],
			 @"sunglow" : [NKFColor sunglow],
			 @"sunray" : [NKFColor sunray],
			 @"sunset" : [NKFColor sunset],
			 @"sunsetorange" : [NKFColor sunsetOrange],
			 @"superpink" : [NKFColor superPink],
			 @"tan" : [NKFColor tan],
			 @"tangelo" : [NKFColor tangelo],
			 @"tangerine" : [NKFColor tangerine],
			 @"tangerineyellow" : [NKFColor tangerineYellow],
			 @"tangopink" : [NKFColor tangoPink],
			 @"taupe" : [NKFColor taupe],
			 @"taupegray" : [NKFColor taupeGray],
			 @"teagreen" : [NKFColor teaGreen],
			 @"tearose" : [NKFColor teaRose],
			 @"tearose2" : [NKFColor teaRose2],
			 @"teal" : [NKFColor teal],
			 @"tealblue" : [NKFColor tealBlue],
			 @"tealdeer" : [NKFColor tealDeer],
			 @"tealgreen" : [NKFColor tealGreen],
			 @"telemagenta" : [NKFColor telemagenta],
			 @"tenne" : [NKFColor tenne],
			 @"terracotta" : [NKFColor terraCotta],
			 @"thistle" : [NKFColor thistle],
			 @"thulianpink" : [NKFColor thulianPink],
			 @"ticklemepink" : [NKFColor tickleMePink],
			 @"tiffanyblue" : [NKFColor tiffanyBlue],
			 @"tigerseye" : [NKFColor tigersEye],
			 @"timberwolf" : [NKFColor timberwolf],
			 @"titaniumyellow" : [NKFColor titaniumYellow],
			 @"tomato" : [NKFColor tomato],
			 @"toolbox" : [NKFColor toolbox],
			 @"topaz" : [NKFColor topaz],
			 @"tractorred" : [NKFColor tractorRed],
			 @"trolleygrey" : [NKFColor trolleyGrey],
			 @"tropicalrainforest" : [NKFColor tropicalRainForest],
			 @"trueblue" : [NKFColor trueBlue],
			 @"tuftsblue" : [NKFColor tuftsBlue],
			 @"tulip" : [NKFColor tulip],
			 @"tumbleweed" : [NKFColor tumbleweed],
			 @"turkishrose" : [NKFColor turkishRose],
			 @"turquoise" : [NKFColor turquoise],
			 @"turquoiseblue" : [NKFColor turquoiseBlue],
			 @"turquoisegreen" : [NKFColor turquoiseGreen],
			 @"tuscan" : [NKFColor tuscan],
			 @"tuscanbrown" : [NKFColor tuscanBrown],
			 @"tuscanred" : [NKFColor tuscanRed],
			 @"tuscantan" : [NKFColor tuscanTan],
			 @"tuscany" : [NKFColor tuscany],
			 @"twilightlavender" : [NKFColor twilightLavender],
			 @"tyrianpurple" : [NKFColor tyrianPurple],
			 @"uablue" : [NKFColor uABlue],
			 @"uared" : [NKFColor uARed],
			 @"ube" : [NKFColor ube],
			 @"uclablue" : [NKFColor uCLABlue],
			 @"uclagold" : [NKFColor uCLAGold],
			 @"ufogreen" : [NKFColor uFOGreen],
			 @"ultramarine" : [NKFColor ultramarine],
			 @"ultramarineblue" : [NKFColor ultramarineBlue],
			 @"ultrapink" : [NKFColor ultraPink],
			 @"ultrared" : [NKFColor ultraRed],
			 @"umber" : [NKFColor umber],
			 @"unbleachedsilk" : [NKFColor unbleachedSilk],
			 @"unitednationsblue" : [NKFColor unitedNationsBlue],
			 @"universityofcaliforniagold" : [NKFColor universityOfCaliforniaGold],
			 @"unmellowyellow" : [NKFColor unmellowYellow],
			 @"upforestgreen" : [NKFColor uPForestGreen],
			 @"upmaroon" : [NKFColor uPMaroon],
			 @"upsdellred" : [NKFColor upsdellRed],
			 @"urobilin" : [NKFColor urobilin],
			 @"usafablue" : [NKFColor uSAFABlue],
			 @"usccardinal" : [NKFColor uSCCardinal],
			 @"uscgold" : [NKFColor uSCGold],
			 @"universityoftennesseeorange" : [NKFColor universityOfTennesseeOrange],
			 @"utahcrimson" : [NKFColor utahCrimson],
			 @"vanilla" : [NKFColor vanilla],
			 @"vanillaice" : [NKFColor vanillaIce],
			 @"vegasgold" : [NKFColor vegasGold],
			 @"venetianred" : [NKFColor venetianRed],
			 @"verdigris" : [NKFColor verdigris],
			 @"vermilion" : [NKFColor vermilion],
			 @"vermilion2" : [NKFColor vermilion2],
			 @"veronica" : [NKFColor veronica],
			 @"verylightazure" : [NKFColor veryLightAzure],
			 @"verylightblue" : [NKFColor veryLightBlue],
			 @"verylightmalachitegreen" : [NKFColor veryLightMalachiteGreen],
			 @"verylighttangelo" : [NKFColor veryLightTangelo],
			 @"verypaleorange" : [NKFColor veryPaleOrange],
			 @"verypaleyellow" : [NKFColor veryPaleYellow],
			 @"violet" : [NKFColor violet],
			 @"violetcolorwheel" : [NKFColor violetColorWheel],
			 @"violetryb" : [NKFColor violetRYB],
			 @"violetweb" : [NKFColor violetWeb],
			 @"violetblue" : [NKFColor violetBlue],
			 @"violetred" : [NKFColor violetRed],
			 @"viridian" : [NKFColor viridian],
			 @"viridiangreen" : [NKFColor viridianGreen],
			 @"vistablue" : [NKFColor vistaBlue],
			 @"vividamber" : [NKFColor vividAmber],
			 @"vividauburn" : [NKFColor vividAuburn],
			 @"vividburgundy" : [NKFColor vividBurgundy],
			 @"vividcerise" : [NKFColor vividCerise],
			 @"vividcerulean" : [NKFColor vividCerulean],
			 @"vividcrimson" : [NKFColor vividCrimson],
			 @"vividgamboge" : [NKFColor vividGamboge],
			 @"vividlimegreen" : [NKFColor vividLimeGreen],
			 @"vividmalachite" : [NKFColor vividMalachite],
			 @"vividmulberry" : [NKFColor vividMulberry],
			 @"vividorange" : [NKFColor vividOrange],
			 @"vividorangepeel" : [NKFColor vividOrangePeel],
			 @"vividorchid" : [NKFColor vividOrchid],
			 @"vividraspberry" : [NKFColor vividRaspberry],
			 @"vividred" : [NKFColor vividRed],
			 @"vividredtangelo" : [NKFColor vividRedTangelo],
			 @"vividskyblue" : [NKFColor vividSkyBlue],
			 @"vividtangelo" : [NKFColor vividTangelo],
			 @"vividtangerine" : [NKFColor vividTangerine],
			 @"vividvermilion" : [NKFColor vividVermilion],
			 @"vividviolet" : [NKFColor vividViolet],
			 @"vividyellow" : [NKFColor vividYellow],
			 @"warmblack" : [NKFColor warmBlack],
			 @"waterspout" : [NKFColor waterspout],
			 @"wenge" : [NKFColor wenge],
			 @"wheat" : [NKFColor wheat],
			 @"white" : [NKFColor white],
			 @"whitesmoke" : [NKFColor whiteSmoke],
			 @"wildblueyonder" : [NKFColor wildBlueYonder],
			 @"wildorchid" : [NKFColor wildOrchid],
			 @"wildstrawberry" : [NKFColor wildStrawberry],
			 @"wildwatermelon" : [NKFColor wildWatermelon],
			 @"willpowerorange" : [NKFColor willpowerOrange],
			 @"windsortan" : [NKFColor windsorTan],
			 @"wine" : [NKFColor wine],
			 @"winedregs" : [NKFColor wineDregs],
			 @"wisteria" : [NKFColor wisteria],
			 @"woodbrown" : [NKFColor woodBrown],
			 @"xanadu" : [NKFColor xanadu],
			 @"yaleblue" : [NKFColor yaleBlue],
			 @"yankeesblue" : [NKFColor yankeesBlue],
			 @"yellow" : [NKFColor yellow],
			 @"yellowcrayola" : [NKFColor yellowCrayola],
			 @"yellowmunsell" : [NKFColor yellowMunsell],
			 @"yellowncs" : [NKFColor yellowNCS],
			 @"yellowpantone" : [NKFColor yellowPantone],
			 @"yellowprocess" : [NKFColor yellowProcess],
			 @"yellowryb" : [NKFColor yellowRYB],
			 @"yellowgreen" : [NKFColor yellowGreen],
			 @"yelloworange" : [NKFColor yellowOrange],
			 @"yellowrose" : [NKFColor yellowRose],
			 @"zaffre" : [NKFColor zaffre],
			 @"zinnwalditebrown" : [NKFColor zinnwalditeBrown],
			 @"zomp" : [NKFColor zomp],
			 @"blackcolor" : [NKFColor blackColor],
			 @"darkgraycolor" : [NKFColor darkGrayColor],
			 @"lightgraycolor" : [NKFColor lightGrayColor],
			 @"lightgraycolor" : [NKFColor lightGrayColor],
			 @"whitecolor" : [NKFColor whiteColor],
			 @"graycolor" : [NKFColor grayColor],
			 @"redcolor" : [NKFColor redColor],
			 @"greencolor" : [NKFColor greenColor],
			 @"bluecolor" : [NKFColor blueColor],
			 @"cyancolor" : [NKFColor cyanColor],
			 @"yellowcolor" : [NKFColor yellowColor],
			 @"magentacolor" : [NKFColor magentaColor],
			 @"orangecolor" : [NKFColor orangeColor],
			 @"purplecolor" : [NKFColor purpleColor],
			 @"browncolor" : [NKFColor brownColor],
			 @"clearcolor" : [NKFColor clearColor]};
}

+ (NSDictionary *)allColorsProperNamesDictionary {
	return @{@"acidGreen" : @"Acid Green",
			 @"acidgreen" : @"Acid Green",
			 @"aero" : @"Aero",
			 @"aero" : @"Aero",
			 @"aeroBlue" : @"Aero Blue",
			 @"aeroblue" : @"Aero Blue",
			 @"africanViolet" : @"African Violet",
			 @"africanviolet" : @"African Violet",
			 @"airForceBlueRAF" : @"Air Force Blue (RAF)",
			 @"airforceblueraf" : @"Air Force Blue (RAF)",
			 @"airForceBlueUSAF" : @"Air Force Blue (USAF)",
			 @"airforceblueusaf" : @"Air Force Blue (USAF)",
			 @"airSuperiorityBlue" : @"Air Superiority Blue",
			 @"airsuperiorityblue" : @"Air Superiority Blue",
			 @"alabamaCrimson" : @"Alabama Crimson",
			 @"alabamacrimson" : @"Alabama Crimson",
			 @"aliceBlue" : @"Alice Blue",
			 @"aliceblue" : @"Alice Blue",
			 @"alizarinCrimson" : @"Alizarin Crimson",
			 @"alizarincrimson" : @"Alizarin Crimson",
			 @"alloyOrange" : @"Alloy Orange",
			 @"alloyorange" : @"Alloy Orange",
			 @"almond" : @"Almond",
			 @"almond" : @"Almond",
			 @"amaranth" : @"Amaranth",
			 @"amaranth" : @"Amaranth",
			 @"amaranthDeepPurple" : @"Amaranth Deep Purple",
			 @"amaranthdeeppurple" : @"Amaranth Deep Purple",
			 @"amaranthPink" : @"Amaranth Pink",
			 @"amaranthpink" : @"Amaranth Pink",
			 @"amaranthPurple" : @"Amaranth Purple",
			 @"amaranthpurple" : @"Amaranth Purple",
			 @"amaranthRed" : @"Amaranth Red",
			 @"amaranthred" : @"Amaranth Red",
			 @"amazonGreen" : @"Amazon Green",
			 @"amazongreen" : @"Amazon Green",
			 @"amber" : @"Amber",
			 @"amber" : @"Amber",
			 @"amberSAEECE" : @"Amber (SAE/ECE)",
			 @"ambersaeece" : @"Amber (SAE/ECE)",
			 @"americanRose" : @"American Rose",
			 @"americanrose" : @"American Rose",
			 @"amethyst" : @"Amethyst",
			 @"amethyst" : @"Amethyst",
			 @"androidGreen" : @"Android Green",
			 @"androidgreen" : @"Android Green",
			 @"antiFlashWhite" : @"Anti-Flash White",
			 @"antiflashwhite" : @"Anti-Flash White",
			 @"antiqueBrass" : @"Antique Brass",
			 @"antiquebrass" : @"Antique Brass",
			 @"antiqueBronze" : @"Antique Bronze",
			 @"antiquebronze" : @"Antique Bronze",
			 @"antiqueFuchsia" : @"Antique Fuchsia",
			 @"antiquefuchsia" : @"Antique Fuchsia",
			 @"antiqueRuby" : @"Antique Ruby",
			 @"antiqueruby" : @"Antique Ruby",
			 @"antiqueWhite" : @"Antique White",
			 @"antiquewhite" : @"Antique White",
			 @"aoEnglish" : @"Ao (English)",
			 @"aoenglish" : @"Ao (English)",
			 @"appleGreen" : @"Apple Green",
			 @"applegreen" : @"Apple Green",
			 @"apricot" : @"Apricot",
			 @"apricot" : @"Apricot",
			 @"aqua" : @"Aqua",
			 @"aqua" : @"Aqua",
			 @"aquamarine" : @"Aquamarine",
			 @"aquamarine" : @"Aquamarine",
			 @"armyGreen" : @"Army Green",
			 @"armygreen" : @"Army Green",
			 @"arsenic" : @"Arsenic",
			 @"arsenic" : @"Arsenic",
			 @"artichoke" : @"Artichoke",
			 @"artichoke" : @"Artichoke",
			 @"arylideYellow" : @"Arylide Yellow",
			 @"arylideyellow" : @"Arylide Yellow",
			 @"ashGrey" : @"Ash Grey",
			 @"ashgrey" : @"Ash Grey",
			 @"asparagus" : @"Asparagus",
			 @"asparagus" : @"Asparagus",
			 @"atomicTangerine" : @"Atomic Tangerine",
			 @"atomictangerine" : @"Atomic Tangerine",
			 @"auburn" : @"Auburn",
			 @"auburn" : @"Auburn",
			 @"aureolin" : @"Aureolin",
			 @"aureolin" : @"Aureolin",
			 @"auroMetalSaurus" : @"AuroMetalSaurus",
			 @"aurometalsaurus" : @"AuroMetalSaurus",
			 @"avocado" : @"Avocado",
			 @"avocado" : @"Avocado",
			 @"azure" : @"Azure",
			 @"azure" : @"Azure",
			 @"azureWebColor" : @"Azure (Web Color)",
			 @"azurewebcolor" : @"Azure (Web Color)",
			 @"azureMist" : @"Azure Mist",
			 @"azuremist" : @"Azure Mist",
			 @"azureishWhite" : @"Azureish White",
			 @"azureishwhite" : @"Azureish White",
			 @"babyBlue" : @"Baby Blue",
			 @"babyblue" : @"Baby Blue",
			 @"babyBlueEyes" : @"Baby Blue Eyes",
			 @"babyblueeyes" : @"Baby Blue Eyes",
			 @"babyPink" : @"Baby Pink",
			 @"babypink" : @"Baby Pink",
			 @"babyPowder" : @"Baby Powder",
			 @"babypowder" : @"Baby Powder",
			 @"bakerMillerPink" : @"Baker-Miller Pink",
			 @"bakermillerpink" : @"Baker-Miller Pink",
			 @"ballBlue" : @"Ball Blue",
			 @"ballblue" : @"Ball Blue",
			 @"bananaMania" : @"Banana Mania",
			 @"bananamania" : @"Banana Mania",
			 @"bananaYellow" : @"Banana Yellow",
			 @"bananayellow" : @"Banana Yellow",
			 @"bangladeshGreen" : @"Bangladesh Green",
			 @"bangladeshgreen" : @"Bangladesh Green",
			 @"barbiePink" : @"Barbie Pink",
			 @"barbiepink" : @"Barbie Pink",
			 @"barnRed" : @"Barn Red",
			 @"barnred" : @"Barn Red",
			 @"battleshipGrey" : @"Battleship Grey",
			 @"battleshipgrey" : @"Battleship Grey",
			 @"bazaar" : @"Bazaar",
			 @"bazaar" : @"Bazaar",
			 @"beauBlue" : @"Beau Blue",
			 @"beaublue" : @"Beau Blue",
			 @"beaver" : @"Beaver",
			 @"beaver" : @"Beaver",
			 @"beige" : @"Beige",
			 @"beige" : @"Beige",
			 @"bdazzledBlue" : @"B'dazzled Blue",
			 @"bdazzledblue" : @"B'dazzled Blue",
			 @"bigDipOruby" : @"Big Dip O’ruby",
			 @"bigdiporuby" : @"Big Dip O’ruby",
			 @"bisque" : @"Bisque",
			 @"bisque" : @"Bisque",
			 @"bistre" : @"Bistre",
			 @"bistre" : @"Bistre",
			 @"bistreBrown" : @"Bistre Brown",
			 @"bistrebrown" : @"Bistre Brown",
			 @"bitterLemon" : @"Bitter Lemon",
			 @"bitterlemon" : @"Bitter Lemon",
			 @"bitterLime" : @"Bitter Lime",
			 @"bitterlime" : @"Bitter Lime",
			 @"bittersweet" : @"Bittersweet",
			 @"bittersweet" : @"Bittersweet",
			 @"bittersweetShimmer" : @"Bittersweet Shimmer",
			 @"bittersweetshimmer" : @"Bittersweet Shimmer",
			 @"black" : @"Black",
			 @"black" : @"Black",
			 @"blackBean" : @"Black Bean",
			 @"blackbean" : @"Black Bean",
			 @"blackLeatherJacket" : @"Black Leather Jacket",
			 @"blackleatherjacket" : @"Black Leather Jacket",
			 @"blackOlive" : @"Black Olive",
			 @"blackolive" : @"Black Olive",
			 @"blanchedAlmond" : @"Blanched Almond",
			 @"blanchedalmond" : @"Blanched Almond",
			 @"blastOffBronze" : @"Blast-Off Bronze",
			 @"blastoffbronze" : @"Blast-Off Bronze",
			 @"bleuDeFrance" : @"Bleu De France",
			 @"bleudefrance" : @"Bleu De France",
			 @"blizzardBlue" : @"Blizzard Blue",
			 @"blizzardblue" : @"Blizzard Blue",
			 @"blond" : @"Blond",
			 @"blond" : @"Blond",
			 @"blue" : @"Blue",
			 @"blue" : @"Blue",
			 @"blueCrayola" : @"Blue (Crayola)",
			 @"bluecrayola" : @"Blue (Crayola)",
			 @"blueMunsell" : @"Blue (Munsell)",
			 @"bluemunsell" : @"Blue (Munsell)",
			 @"blueNCS" : @"Blue (NCS)",
			 @"bluencs" : @"Blue (NCS)",
			 @"bluePantone" : @"Blue (Pantone)",
			 @"bluepantone" : @"Blue (Pantone)",
			 @"bluePigment" : @"Blue (Pigment)",
			 @"bluepigment" : @"Blue (Pigment)",
			 @"blueRYB" : @"Blue (RYB)",
			 @"blueryb" : @"Blue (RYB)",
			 @"blueBell" : @"Blue Bell",
			 @"bluebell" : @"Blue Bell",
			 @"blueGray" : @"Blue-Gray",
			 @"bluegray" : @"Blue-Gray",
			 @"blueGreen" : @"Blue-Green",
			 @"bluegreen" : @"Blue-Green",
			 @"blueLagoon" : @"Blue Lagoon",
			 @"bluelagoon" : @"Blue Lagoon",
			 @"blueMagentaViolet" : @"Blue-Magenta Violet",
			 @"bluemagentaviolet" : @"Blue-Magenta Violet",
			 @"blueSapphire" : @"Blue Sapphire",
			 @"bluesapphire" : @"Blue Sapphire",
			 @"blueViolet" : @"Blue-Violet",
			 @"blueviolet" : @"Blue-Violet",
			 @"blueYonder" : @"Blue Yonder",
			 @"blueyonder" : @"Blue Yonder",
			 @"blueberry" : @"Blueberry",
			 @"blueberry" : @"Blueberry",
			 @"bluebonnet" : @"Bluebonnet",
			 @"bluebonnet" : @"Bluebonnet",
			 @"blush" : @"Blush",
			 @"blush" : @"Blush",
			 @"bole" : @"Bole",
			 @"bole" : @"Bole",
			 @"bondiBlue" : @"Bondi Blue",
			 @"bondiblue" : @"Bondi Blue",
			 @"bone" : @"Bone",
			 @"bone" : @"Bone",
			 @"bostonUniversityRed" : @"Boston University Red",
			 @"bostonuniversityred" : @"Boston University Red",
			 @"bottleGreen" : @"Bottle Green",
			 @"bottlegreen" : @"Bottle Green",
			 @"boysenberry" : @"Boysenberry",
			 @"boysenberry" : @"Boysenberry",
			 @"brandeisBlue" : @"Brandeis Blue",
			 @"brandeisblue" : @"Brandeis Blue",
			 @"brass" : @"Brass",
			 @"brass" : @"Brass",
			 @"brickRed" : @"Brick Red",
			 @"brickred" : @"Brick Red",
			 @"brightCerulean" : @"Bright Cerulean",
			 @"brightcerulean" : @"Bright Cerulean",
			 @"brightGreen" : @"Bright Green",
			 @"brightgreen" : @"Bright Green",
			 @"brightLavender" : @"Bright Lavender",
			 @"brightlavender" : @"Bright Lavender",
			 @"brightLilac" : @"Bright Lilac",
			 @"brightlilac" : @"Bright Lilac",
			 @"brightMaroon" : @"Bright Maroon",
			 @"brightmaroon" : @"Bright Maroon",
			 @"brightNavyBlue" : @"Bright Navy Blue",
			 @"brightnavyblue" : @"Bright Navy Blue",
			 @"brightPink" : @"Bright Pink",
			 @"brightpink" : @"Bright Pink",
			 @"brightTurquoise" : @"Bright Turquoise",
			 @"brightturquoise" : @"Bright Turquoise",
			 @"brightUbe" : @"Bright Ube",
			 @"brightube" : @"Bright Ube",
			 @"brilliantAzure" : @"Brilliant Azure",
			 @"brilliantazure" : @"Brilliant Azure",
			 @"brilliantLavender" : @"Brilliant Lavender",
			 @"brilliantlavender" : @"Brilliant Lavender",
			 @"brilliantRose" : @"Brilliant Rose",
			 @"brilliantrose" : @"Brilliant Rose",
			 @"brinkPink" : @"Brink Pink",
			 @"brinkpink" : @"Brink Pink",
			 @"britishRacingGreen" : @"British Racing Green",
			 @"britishracinggreen" : @"British Racing Green",
			 @"bronze" : @"Bronze",
			 @"bronze" : @"Bronze",
			 @"bronzeYellow" : @"Bronze Yellow",
			 @"bronzeyellow" : @"Bronze Yellow",
			 @"brownTraditional" : @"Brown (Traditional)",
			 @"browntraditional" : @"Brown (Traditional)",
			 @"brownWeb" : @"Brown (Web)",
			 @"brownweb" : @"Brown (Web)",
			 @"brownNose" : @"Brown-Nose",
			 @"brownnose" : @"Brown-Nose",
			 @"brownYellow" : @"Brown Yellow",
			 @"brownyellow" : @"Brown Yellow",
			 @"brunswickGreen" : @"Brunswick Green",
			 @"brunswickgreen" : @"Brunswick Green",
			 @"bubbleGum" : @"Bubble Gum",
			 @"bubblegum" : @"Bubble Gum",
			 @"bubbles" : @"Bubbles",
			 @"bubbles" : @"Bubbles",
			 @"buff" : @"Buff",
			 @"buff" : @"Buff",
			 @"budGreen" : @"Bud Green",
			 @"budgreen" : @"Bud Green",
			 @"bulgarianRose" : @"Bulgarian Rose",
			 @"bulgarianrose" : @"Bulgarian Rose",
			 @"burgundy" : @"Burgundy",
			 @"burgundy" : @"Burgundy",
			 @"burlywood" : @"Burlywood",
			 @"burlywood" : @"Burlywood",
			 @"burntOrange" : @"Burnt Orange",
			 @"burntorange" : @"Burnt Orange",
			 @"burntSienna" : @"Burnt Sienna",
			 @"burntsienna" : @"Burnt Sienna",
			 @"burntUmber" : @"Burnt Umber",
			 @"burntumber" : @"Burnt Umber",
			 @"byzantine" : @"Byzantine",
			 @"byzantine" : @"Byzantine",
			 @"byzantium" : @"Byzantium",
			 @"byzantium" : @"Byzantium",
			 @"cadet" : @"Cadet",
			 @"cadet" : @"Cadet",
			 @"cadetBlue" : @"Cadet Blue",
			 @"cadetblue" : @"Cadet Blue",
			 @"cadetGrey" : @"Cadet Grey",
			 @"cadetgrey" : @"Cadet Grey",
			 @"cadmiumGreen" : @"Cadmium Green",
			 @"cadmiumgreen" : @"Cadmium Green",
			 @"cadmiumOrange" : @"Cadmium Orange",
			 @"cadmiumorange" : @"Cadmium Orange",
			 @"cadmiumRed" : @"Cadmium Red",
			 @"cadmiumred" : @"Cadmium Red",
			 @"cadmiumYellow" : @"Cadmium Yellow",
			 @"cadmiumyellow" : @"Cadmium Yellow",
			 @"caféAuLait" : @"Café Au Lait",
			 @"caféaulait" : @"Café Au Lait",
			 @"caféNoir" : @"Café Noir",
			 @"cafénoir" : @"Café Noir",
			 @"calPolyGreen" : @"Cal Poly Green",
			 @"calpolygreen" : @"Cal Poly Green",
			 @"cambridgeBlue" : @"Cambridge Blue",
			 @"cambridgeblue" : @"Cambridge Blue",
			 @"camel" : @"Camel",
			 @"camel" : @"Camel",
			 @"cameoPink" : @"Cameo Pink",
			 @"cameopink" : @"Cameo Pink",
			 @"camouflageGreen" : @"Camouflage Green",
			 @"camouflagegreen" : @"Camouflage Green",
			 @"canaryYellow" : @"Canary Yellow",
			 @"canaryyellow" : @"Canary Yellow",
			 @"candyAppleRed" : @"Candy Apple Red",
			 @"candyapplered" : @"Candy Apple Red",
			 @"candyPink" : @"Candy Pink",
			 @"candypink" : @"Candy Pink",
			 @"capri" : @"Capri",
			 @"capri" : @"Capri",
			 @"caputMortuum" : @"Caput Mortuum",
			 @"caputmortuum" : @"Caput Mortuum",
			 @"cardinal" : @"Cardinal",
			 @"cardinal" : @"Cardinal",
			 @"caribbeanGreen" : @"Caribbean Green",
			 @"caribbeangreen" : @"Caribbean Green",
			 @"carmine" : @"Carmine",
			 @"carmine" : @"Carmine",
			 @"carmineMP" : @"Carmine (M&P)",
			 @"carminemp" : @"Carmine (M&P)",
			 @"carminePink" : @"Carmine Pink",
			 @"carminepink" : @"Carmine Pink",
			 @"carmineRed" : @"Carmine Red",
			 @"carminered" : @"Carmine Red",
			 @"carnationPink" : @"Carnation Pink",
			 @"carnationpink" : @"Carnation Pink",
			 @"carnelian" : @"Carnelian",
			 @"carnelian" : @"Carnelian",
			 @"carolinaBlue" : @"Carolina Blue",
			 @"carolinablue" : @"Carolina Blue",
			 @"carrotOrange" : @"Carrot Orange",
			 @"carrotorange" : @"Carrot Orange",
			 @"castletonGreen" : @"Castleton Green",
			 @"castletongreen" : @"Castleton Green",
			 @"catalinaBlue" : @"Catalina Blue",
			 @"catalinablue" : @"Catalina Blue",
			 @"catawba" : @"Catawba",
			 @"catawba" : @"Catawba",
			 @"cedarChest" : @"Cedar Chest",
			 @"cedarchest" : @"Cedar Chest",
			 @"ceil" : @"Ceil",
			 @"ceil" : @"Ceil",
			 @"celadon" : @"Celadon",
			 @"celadon" : @"Celadon",
			 @"celadonBlue" : @"Celadon Blue",
			 @"celadonblue" : @"Celadon Blue",
			 @"celadonGreen" : @"Celadon Green",
			 @"celadongreen" : @"Celadon Green",
			 @"celeste" : @"Celeste",
			 @"celeste" : @"Celeste",
			 @"celestialBlue" : @"Celestial Blue",
			 @"celestialblue" : @"Celestial Blue",
			 @"cerise" : @"Cerise",
			 @"cerise" : @"Cerise",
			 @"cerisePink" : @"Cerise Pink",
			 @"cerisepink" : @"Cerise Pink",
			 @"cerulean" : @"Cerulean",
			 @"cerulean" : @"Cerulean",
			 @"ceruleanBlue" : @"Cerulean Blue",
			 @"ceruleanblue" : @"Cerulean Blue",
			 @"ceruleanFrost" : @"Cerulean Frost",
			 @"ceruleanfrost" : @"Cerulean Frost",
			 @"cGBlue" : @"CG Blue",
			 @"cgblue" : @"CG Blue",
			 @"cGRed" : @"CG Red",
			 @"cgred" : @"CG Red",
			 @"chamoisee" : @"Chamoisee",
			 @"chamoisee" : @"Chamoisee",
			 @"champagne" : @"Champagne",
			 @"champagne" : @"Champagne",
			 @"charcoal" : @"Charcoal",
			 @"charcoal" : @"Charcoal",
			 @"charlestonGreen" : @"Charleston Green",
			 @"charlestongreen" : @"Charleston Green",
			 @"charmPink" : @"Charm Pink",
			 @"charmpink" : @"Charm Pink",
			 @"chartreuseTraditional" : @"Chartreuse (Traditional)",
			 @"chartreusetraditional" : @"Chartreuse (Traditional)",
			 @"chartreuseWeb" : @"Chartreuse (Web)",
			 @"chartreuseweb" : @"Chartreuse (Web)",
			 @"cherry" : @"Cherry",
			 @"cherry" : @"Cherry",
			 @"cherryBlossomPink" : @"Cherry Blossom Pink",
			 @"cherryblossompink" : @"Cherry Blossom Pink",
			 @"chestnut" : @"Chestnut",
			 @"chestnut" : @"Chestnut",
			 @"chinaPink" : @"China Pink",
			 @"chinapink" : @"China Pink",
			 @"chinaRose" : @"China Rose",
			 @"chinarose" : @"China Rose",
			 @"chineseRed" : @"Chinese Red",
			 @"chinesered" : @"Chinese Red",
			 @"chineseViolet" : @"Chinese Violet",
			 @"chineseviolet" : @"Chinese Violet",
			 @"chocolateTraditional" : @"Chocolate (Traditional)",
			 @"chocolatetraditional" : @"Chocolate (Traditional)",
			 @"chocolateWeb" : @"Chocolate (Web)",
			 @"chocolateweb" : @"Chocolate (Web)",
			 @"chromeYellow" : @"Chrome Yellow",
			 @"chromeyellow" : @"Chrome Yellow",
			 @"cinereous" : @"Cinereous",
			 @"cinereous" : @"Cinereous",
			 @"cinnabar" : @"Cinnabar",
			 @"cinnabar" : @"Cinnabar",
			 @"cinnamonCitationNeeded" : @"Cinnamon[Citation Needed]",
			 @"cinnamoncitationneeded" : @"Cinnamon[Citation Needed]",
			 @"citrine" : @"Citrine",
			 @"citrine" : @"Citrine",
			 @"citron" : @"Citron",
			 @"citron" : @"Citron",
			 @"claret" : @"Claret",
			 @"claret" : @"Claret",
			 @"classicRose" : @"Classic Rose",
			 @"classicrose" : @"Classic Rose",
			 @"cobaltBlue" : @"Cobalt Blue",
			 @"cobaltblue" : @"Cobalt Blue",
			 @"cocoaBrown" : @"Cocoa Brown",
			 @"cocoabrown" : @"Cocoa Brown",
			 @"coconut" : @"Coconut",
			 @"coconut" : @"Coconut",
			 @"coffee" : @"Coffee",
			 @"coffee" : @"Coffee",
			 @"columbiaBlue" : @"Columbia Blue",
			 @"columbiablue" : @"Columbia Blue",
			 @"congoPink" : @"Congo Pink",
			 @"congopink" : @"Congo Pink",
			 @"coolBlack" : @"Cool Black",
			 @"coolblack" : @"Cool Black",
			 @"coolGrey" : @"Cool Grey",
			 @"coolgrey" : @"Cool Grey",
			 @"copper" : @"Copper",
			 @"copper" : @"Copper",
			 @"copperCrayola" : @"Copper (Crayola)",
			 @"coppercrayola" : @"Copper (Crayola)",
			 @"copperPenny" : @"Copper Penny",
			 @"copperpenny" : @"Copper Penny",
			 @"copperRed" : @"Copper Red",
			 @"copperred" : @"Copper Red",
			 @"copperRose" : @"Copper Rose",
			 @"copperrose" : @"Copper Rose",
			 @"coquelicot" : @"Coquelicot",
			 @"coquelicot" : @"Coquelicot",
			 @"coral" : @"Coral",
			 @"coral" : @"Coral",
			 @"coralPink" : @"Coral Pink",
			 @"coralpink" : @"Coral Pink",
			 @"coralRed" : @"Coral Red",
			 @"coralred" : @"Coral Red",
			 @"cordovan" : @"Cordovan",
			 @"cordovan" : @"Cordovan",
			 @"corn" : @"Corn",
			 @"corn" : @"Corn",
			 @"cornellRed" : @"Cornell Red",
			 @"cornellred" : @"Cornell Red",
			 @"cornflowerBlue" : @"Cornflower Blue",
			 @"cornflowerblue" : @"Cornflower Blue",
			 @"cornsilk" : @"Cornsilk",
			 @"cornsilk" : @"Cornsilk",
			 @"cosmicLatte" : @"Cosmic Latte",
			 @"cosmiclatte" : @"Cosmic Latte",
			 @"coyoteBrown" : @"Coyote Brown",
			 @"coyotebrown" : @"Coyote Brown",
			 @"cottonCandy" : @"Cotton Candy",
			 @"cottoncandy" : @"Cotton Candy",
			 @"cranberry" : @"Cranberry",
			 @"cranberry" : @"Cranberry",
			 @"cream" : @"Cream",
			 @"cream" : @"Cream",
			 @"crimson" : @"Crimson",
			 @"crimson" : @"Crimson",
			 @"crimsonGlory" : @"Crimson Glory",
			 @"crimsonglory" : @"Crimson Glory",
			 @"crimsonRed" : @"Crimson Red",
			 @"crimsonred" : @"Crimson Red",
			 @"cyan" : @"Cyan",
			 @"cyan" : @"Cyan",
			 @"cyanAzure" : @"Cyan Azure",
			 @"cyanazure" : @"Cyan Azure",
			 @"cyanBlueAzure" : @"Cyan-Blue Azure",
			 @"cyanblueazure" : @"Cyan-Blue Azure",
			 @"cyanCobaltBlue" : @"Cyan Cobalt Blue",
			 @"cyancobaltblue" : @"Cyan Cobalt Blue",
			 @"cyanCornflowerBlue" : @"Cyan Cornflower Blue",
			 @"cyancornflowerblue" : @"Cyan Cornflower Blue",
			 @"cyanProcess" : @"Cyan (Process)",
			 @"cyanprocess" : @"Cyan (Process)",
			 @"cyberGrape" : @"Cyber Grape",
			 @"cybergrape" : @"Cyber Grape",
			 @"cyberYellow" : @"Cyber Yellow",
			 @"cyberyellow" : @"Cyber Yellow",
			 @"daffodil" : @"Daffodil",
			 @"daffodil" : @"Daffodil",
			 @"dandelion" : @"Dandelion",
			 @"dandelion" : @"Dandelion",
			 @"darkBlue" : @"Dark Blue",
			 @"darkblue" : @"Dark Blue",
			 @"darkBlueGray" : @"Dark Blue-Gray",
			 @"darkbluegray" : @"Dark Blue-Gray",
			 @"darkBrown" : @"Dark Brown",
			 @"darkbrown" : @"Dark Brown",
			 @"darkBrownTangelo" : @"Dark Brown-Tangelo",
			 @"darkbrowntangelo" : @"Dark Brown-Tangelo",
			 @"darkByzantium" : @"Dark Byzantium",
			 @"darkbyzantium" : @"Dark Byzantium",
			 @"darkCandyAppleRed" : @"Dark Candy Apple Red",
			 @"darkcandyapplered" : @"Dark Candy Apple Red",
			 @"darkCerulean" : @"Dark Cerulean",
			 @"darkcerulean" : @"Dark Cerulean",
			 @"darkChestnut" : @"Dark Chestnut",
			 @"darkchestnut" : @"Dark Chestnut",
			 @"darkCoral" : @"Dark Coral",
			 @"darkcoral" : @"Dark Coral",
			 @"darkCyan" : @"Dark Cyan",
			 @"darkcyan" : @"Dark Cyan",
			 @"darkElectricBlue" : @"Dark Electric Blue",
			 @"darkelectricblue" : @"Dark Electric Blue",
			 @"darkGoldenrod" : @"Dark Goldenrod",
			 @"darkgoldenrod" : @"Dark Goldenrod",
			 @"darkGrayX11" : @"Dark Gray (X11)",
			 @"darkgrayx11" : @"Dark Gray (X11)",
			 @"darkGreen" : @"Dark Green",
			 @"darkgreen" : @"Dark Green",
			 @"darkGreenX11" : @"Dark Green (X11)",
			 @"darkgreenx11" : @"Dark Green (X11)",
			 @"darkImperialBlue" : @"Dark Imperial Blue",
			 @"darkimperialblue" : @"Dark Imperial Blue",
			 @"darkImperialBlue2" : @"Dark Imperial Blue",
			 @"darkimperialblue2" : @"Dark Imperial Blue",
			 @"darkJungleGreen" : @"Dark Jungle Green",
			 @"darkjunglegreen" : @"Dark Jungle Green",
			 @"darkKhaki" : @"Dark Khaki",
			 @"darkkhaki" : @"Dark Khaki",
			 @"darkLava" : @"Dark Lava",
			 @"darklava" : @"Dark Lava",
			 @"darkLavender" : @"Dark Lavender",
			 @"darklavender" : @"Dark Lavender",
			 @"darkLiver" : @"Dark Liver",
			 @"darkliver" : @"Dark Liver",
			 @"darkLiverHorses" : @"Dark Liver (Horses)",
			 @"darkliverhorses" : @"Dark Liver (Horses)",
			 @"darkMagenta" : @"Dark Magenta",
			 @"darkmagenta" : @"Dark Magenta",
			 @"darkMediumGray" : @"Dark Medium Gray",
			 @"darkmediumgray" : @"Dark Medium Gray",
			 @"darkMidnightBlue" : @"Dark Midnight Blue",
			 @"darkmidnightblue" : @"Dark Midnight Blue",
			 @"darkMossGreen" : @"Dark Moss Green",
			 @"darkmossgreen" : @"Dark Moss Green",
			 @"darkOliveGreen" : @"Dark Olive Green",
			 @"darkolivegreen" : @"Dark Olive Green",
			 @"darkOrange" : @"Dark Orange",
			 @"darkorange" : @"Dark Orange",
			 @"darkOrchid" : @"Dark Orchid",
			 @"darkorchid" : @"Dark Orchid",
			 @"darkPastelBlue" : @"Dark Pastel Blue",
			 @"darkpastelblue" : @"Dark Pastel Blue",
			 @"darkPastelGreen" : @"Dark Pastel Green",
			 @"darkpastelgreen" : @"Dark Pastel Green",
			 @"darkPastelPurple" : @"Dark Pastel Purple",
			 @"darkpastelpurple" : @"Dark Pastel Purple",
			 @"darkPastelRed" : @"Dark Pastel Red",
			 @"darkpastelred" : @"Dark Pastel Red",
			 @"darkPink" : @"Dark Pink",
			 @"darkpink" : @"Dark Pink",
			 @"darkPowderBlue" : @"Dark Powder Blue",
			 @"darkpowderblue" : @"Dark Powder Blue",
			 @"darkPuce" : @"Dark Puce",
			 @"darkpuce" : @"Dark Puce",
			 @"darkPurple" : @"Dark Purple",
			 @"darkpurple" : @"Dark Purple",
			 @"darkRaspberry" : @"Dark Raspberry",
			 @"darkraspberry" : @"Dark Raspberry",
			 @"darkRed" : @"Dark Red",
			 @"darkred" : @"Dark Red",
			 @"darkSalmon" : @"Dark Salmon",
			 @"darksalmon" : @"Dark Salmon",
			 @"darkScarlet" : @"Dark Scarlet",
			 @"darkscarlet" : @"Dark Scarlet",
			 @"darkSeaGreen" : @"Dark Sea Green",
			 @"darkseagreen" : @"Dark Sea Green",
			 @"darkSienna" : @"Dark Sienna",
			 @"darksienna" : @"Dark Sienna",
			 @"darkSkyBlue" : @"Dark Sky Blue",
			 @"darkskyblue" : @"Dark Sky Blue",
			 @"darkSlateBlue" : @"Dark Slate Blue",
			 @"darkslateblue" : @"Dark Slate Blue",
			 @"darkSlateGray" : @"Dark Slate Gray",
			 @"darkslategray" : @"Dark Slate Gray",
			 @"darkSpringGreen" : @"Dark Spring Green",
			 @"darkspringgreen" : @"Dark Spring Green",
			 @"darkTan" : @"Dark Tan",
			 @"darktan" : @"Dark Tan",
			 @"darkTangerine" : @"Dark Tangerine",
			 @"darktangerine" : @"Dark Tangerine",
			 @"darkTaupe" : @"Dark Taupe",
			 @"darktaupe" : @"Dark Taupe",
			 @"darkTerraCotta" : @"Dark Terra Cotta",
			 @"darkterracotta" : @"Dark Terra Cotta",
			 @"darkTurquoise" : @"Dark Turquoise",
			 @"darkturquoise" : @"Dark Turquoise",
			 @"darkVanilla" : @"Dark Vanilla",
			 @"darkvanilla" : @"Dark Vanilla",
			 @"darkViolet" : @"Dark Violet",
			 @"darkviolet" : @"Dark Violet",
			 @"darkYellow" : @"Dark Yellow",
			 @"darkyellow" : @"Dark Yellow",
			 @"dartmouthGreen" : @"Dartmouth Green",
			 @"dartmouthgreen" : @"Dartmouth Green",
			 @"davysGrey" : @"Davy's Grey",
			 @"davysgrey" : @"Davy's Grey",
			 @"debianRed" : @"Debian Red",
			 @"debianred" : @"Debian Red",
			 @"deepAquamarine" : @"Deep Aquamarine",
			 @"deepaquamarine" : @"Deep Aquamarine",
			 @"deepCarmine" : @"Deep Carmine",
			 @"deepcarmine" : @"Deep Carmine",
			 @"deepCarminePink" : @"Deep Carmine Pink",
			 @"deepcarminepink" : @"Deep Carmine Pink",
			 @"deepCarrotOrange" : @"Deep Carrot Orange",
			 @"deepcarrotorange" : @"Deep Carrot Orange",
			 @"deepCerise" : @"Deep Cerise",
			 @"deepcerise" : @"Deep Cerise",
			 @"deepChampagne" : @"Deep Champagne",
			 @"deepchampagne" : @"Deep Champagne",
			 @"deepChestnut" : @"Deep Chestnut",
			 @"deepchestnut" : @"Deep Chestnut",
			 @"deepCoffee" : @"Deep Coffee",
			 @"deepcoffee" : @"Deep Coffee",
			 @"deepFuchsia" : @"Deep Fuchsia",
			 @"deepfuchsia" : @"Deep Fuchsia",
			 @"deepGreen" : @"Deep Green",
			 @"deepgreen" : @"Deep Green",
			 @"deepGreenCyanTurquoise" : @"Deep Green-Cyan Turquoise",
			 @"deepgreencyanturquoise" : @"Deep Green-Cyan Turquoise",
			 @"deepJungleGreen" : @"Deep Jungle Green",
			 @"deepjunglegreen" : @"Deep Jungle Green",
			 @"deepKoamaru" : @"Deep Koamaru",
			 @"deepkoamaru" : @"Deep Koamaru",
			 @"deepLemon" : @"Deep Lemon",
			 @"deeplemon" : @"Deep Lemon",
			 @"deepLilac" : @"Deep Lilac",
			 @"deeplilac" : @"Deep Lilac",
			 @"deepMagenta" : @"Deep Magenta",
			 @"deepmagenta" : @"Deep Magenta",
			 @"deepMaroon" : @"Deep Maroon",
			 @"deepmaroon" : @"Deep Maroon",
			 @"deepMauve" : @"Deep Mauve",
			 @"deepmauve" : @"Deep Mauve",
			 @"deepMossGreen" : @"Deep Moss Green",
			 @"deepmossgreen" : @"Deep Moss Green",
			 @"deepPeach" : @"Deep Peach",
			 @"deeppeach" : @"Deep Peach",
			 @"deepPink" : @"Deep Pink",
			 @"deeppink" : @"Deep Pink",
			 @"deepPuce" : @"Deep Puce",
			 @"deeppuce" : @"Deep Puce",
			 @"deepRed" : @"Deep Red",
			 @"deepred" : @"Deep Red",
			 @"deepRuby" : @"Deep Ruby",
			 @"deepruby" : @"Deep Ruby",
			 @"deepSaffron" : @"Deep Saffron",
			 @"deepsaffron" : @"Deep Saffron",
			 @"deepSkyBlue" : @"Deep Sky Blue",
			 @"deepskyblue" : @"Deep Sky Blue",
			 @"deepSpaceSparkle" : @"Deep Space Sparkle",
			 @"deepspacesparkle" : @"Deep Space Sparkle",
			 @"deepSpringBud" : @"Deep Spring Bud",
			 @"deepspringbud" : @"Deep Spring Bud",
			 @"deepTaupe" : @"Deep Taupe",
			 @"deeptaupe" : @"Deep Taupe",
			 @"deepTuscanRed" : @"Deep Tuscan Red",
			 @"deeptuscanred" : @"Deep Tuscan Red",
			 @"deepViolet" : @"Deep Violet",
			 @"deepviolet" : @"Deep Violet",
			 @"deer" : @"Deer",
			 @"deer" : @"Deer",
			 @"denim" : @"Denim",
			 @"denim" : @"Denim",
			 @"desaturatedCyan" : @"Desaturated Cyan",
			 @"desaturatedcyan" : @"Desaturated Cyan",
			 @"desert" : @"Desert",
			 @"desert" : @"Desert",
			 @"desertSand" : @"Desert Sand",
			 @"desertsand" : @"Desert Sand",
			 @"desire" : @"Desire",
			 @"desire" : @"Desire",
			 @"diamond" : @"Diamond",
			 @"diamond" : @"Diamond",
			 @"dimGray" : @"Dim Gray",
			 @"dimgray" : @"Dim Gray",
			 @"dirt" : @"Dirt",
			 @"dirt" : @"Dirt",
			 @"dodgerBlue" : @"Dodger Blue",
			 @"dodgerblue" : @"Dodger Blue",
			 @"dogwoodRose" : @"Dogwood Rose",
			 @"dogwoodrose" : @"Dogwood Rose",
			 @"dollarBill" : @"Dollar Bill",
			 @"dollarbill" : @"Dollar Bill",
			 @"donkeyBrown" : @"Donkey Brown",
			 @"donkeybrown" : @"Donkey Brown",
			 @"drab" : @"Drab",
			 @"drab" : @"Drab",
			 @"dukeBlue" : @"Duke Blue",
			 @"dukeblue" : @"Duke Blue",
			 @"dustStorm" : @"Dust Storm",
			 @"duststorm" : @"Dust Storm",
			 @"dutchWhite" : @"Dutch White",
			 @"dutchwhite" : @"Dutch White",
			 @"earthYellow" : @"Earth Yellow",
			 @"earthyellow" : @"Earth Yellow",
			 @"ebony" : @"Ebony",
			 @"ebony" : @"Ebony",
			 @"ecru" : @"Ecru",
			 @"ecru" : @"Ecru",
			 @"eerieBlack" : @"Eerie Black",
			 @"eerieblack" : @"Eerie Black",
			 @"eggplant" : @"Eggplant",
			 @"eggplant" : @"Eggplant",
			 @"eggshell" : @"Eggshell",
			 @"eggshell" : @"Eggshell",
			 @"egyptianBlue" : @"Egyptian Blue",
			 @"egyptianblue" : @"Egyptian Blue",
			 @"electricBlue" : @"Electric Blue",
			 @"electricblue" : @"Electric Blue",
			 @"electricCrimson" : @"Electric Crimson",
			 @"electriccrimson" : @"Electric Crimson",
			 @"electricCyan" : @"Electric Cyan",
			 @"electriccyan" : @"Electric Cyan",
			 @"electricGreen" : @"Electric Green",
			 @"electricgreen" : @"Electric Green",
			 @"electricIndigo" : @"Electric Indigo",
			 @"electricindigo" : @"Electric Indigo",
			 @"electricLavender" : @"Electric Lavender",
			 @"electriclavender" : @"Electric Lavender",
			 @"electricLime" : @"Electric Lime",
			 @"electriclime" : @"Electric Lime",
			 @"electricPurple" : @"Electric Purple",
			 @"electricpurple" : @"Electric Purple",
			 @"electricUltramarine" : @"Electric Ultramarine",
			 @"electricultramarine" : @"Electric Ultramarine",
			 @"electricViolet" : @"Electric Violet",
			 @"electricviolet" : @"Electric Violet",
			 @"electricYellow" : @"Electric Yellow",
			 @"electricyellow" : @"Electric Yellow",
			 @"emerald" : @"Emerald",
			 @"emerald" : @"Emerald",
			 @"eminence" : @"Eminence",
			 @"eminence" : @"Eminence",
			 @"englishGreen" : @"English Green",
			 @"englishgreen" : @"English Green",
			 @"englishLavender" : @"English Lavender",
			 @"englishlavender" : @"English Lavender",
			 @"englishRed" : @"English Red",
			 @"englishred" : @"English Red",
			 @"englishViolet" : @"English Violet",
			 @"englishviolet" : @"English Violet",
			 @"etonBlue" : @"Eton Blue",
			 @"etonblue" : @"Eton Blue",
			 @"eucalyptus" : @"Eucalyptus",
			 @"eucalyptus" : @"Eucalyptus",
			 @"fallow" : @"Fallow",
			 @"fallow" : @"Fallow",
			 @"faluRed" : @"Falu Red",
			 @"falured" : @"Falu Red",
			 @"fandango" : @"Fandango",
			 @"fandango" : @"Fandango",
			 @"fandangoPink" : @"Fandango Pink",
			 @"fandangopink" : @"Fandango Pink",
			 @"fashionFuchsia" : @"Fashion Fuchsia",
			 @"fashionfuchsia" : @"Fashion Fuchsia",
			 @"fawn" : @"Fawn",
			 @"fawn" : @"Fawn",
			 @"feldgrau" : @"Feldgrau",
			 @"feldgrau" : @"Feldgrau",
			 @"feldspar" : @"Feldspar",
			 @"feldspar" : @"Feldspar",
			 @"fernGreen" : @"Fern Green",
			 @"ferngreen" : @"Fern Green",
			 @"ferrariRed" : @"Ferrari Red",
			 @"ferrarired" : @"Ferrari Red",
			 @"fieldDrab" : @"Field Drab",
			 @"fielddrab" : @"Field Drab",
			 @"firebrick" : @"Firebrick",
			 @"firebrick" : @"Firebrick",
			 @"fireEngineRed" : @"Fire Engine Red",
			 @"fireenginered" : @"Fire Engine Red",
			 @"flame" : @"Flame",
			 @"flame" : @"Flame",
			 @"flamingoPink" : @"Flamingo Pink",
			 @"flamingopink" : @"Flamingo Pink",
			 @"flattery" : @"Flattery",
			 @"flattery" : @"Flattery",
			 @"flavescent" : @"Flavescent",
			 @"flavescent" : @"Flavescent",
			 @"flax" : @"Flax",
			 @"flax" : @"Flax",
			 @"flirt" : @"Flirt",
			 @"flirt" : @"Flirt",
			 @"floralWhite" : @"Floral White",
			 @"floralwhite" : @"Floral White",
			 @"fluorescentOrange" : @"Fluorescent Orange",
			 @"fluorescentorange" : @"Fluorescent Orange",
			 @"fluorescentPink" : @"Fluorescent Pink",
			 @"fluorescentpink" : @"Fluorescent Pink",
			 @"fluorescentYellow" : @"Fluorescent Yellow",
			 @"fluorescentyellow" : @"Fluorescent Yellow",
			 @"folly" : @"Folly",
			 @"folly" : @"Folly",
			 @"forestGreenTraditional" : @"Forest Green (Traditional)",
			 @"forestgreentraditional" : @"Forest Green (Traditional)",
			 @"forestGreenWeb" : @"Forest Green (Web)",
			 @"forestgreenweb" : @"Forest Green (Web)",
			 @"frenchBeige" : @"French Beige",
			 @"frenchbeige" : @"French Beige",
			 @"frenchBistre" : @"French Bistre",
			 @"frenchbistre" : @"French Bistre",
			 @"frenchBlue" : @"French Blue",
			 @"frenchblue" : @"French Blue",
			 @"frenchFuchsia" : @"French Fuchsia",
			 @"frenchfuchsia" : @"French Fuchsia",
			 @"frenchLilac" : @"French Lilac",
			 @"frenchlilac" : @"French Lilac",
			 @"frenchLime" : @"French Lime",
			 @"frenchlime" : @"French Lime",
			 @"frenchMauve" : @"French Mauve",
			 @"frenchmauve" : @"French Mauve",
			 @"frenchPink" : @"French Pink",
			 @"frenchpink" : @"French Pink",
			 @"frenchPlum" : @"French Plum",
			 @"frenchplum" : @"French Plum",
			 @"frenchPuce" : @"French Puce",
			 @"frenchpuce" : @"French Puce",
			 @"frenchRaspberry" : @"French Raspberry",
			 @"frenchraspberry" : @"French Raspberry",
			 @"frenchRose" : @"French Rose",
			 @"frenchrose" : @"French Rose",
			 @"frenchSkyBlue" : @"French Sky Blue",
			 @"frenchskyblue" : @"French Sky Blue",
			 @"frenchViolet" : @"French Violet",
			 @"frenchviolet" : @"French Violet",
			 @"frenchWine" : @"French Wine",
			 @"frenchwine" : @"French Wine",
			 @"freshAir" : @"Fresh Air",
			 @"freshair" : @"Fresh Air",
			 @"fuchsia" : @"Fuchsia",
			 @"fuchsia" : @"Fuchsia",
			 @"fuchsiaCrayola" : @"Fuchsia (Crayola)",
			 @"fuchsiacrayola" : @"Fuchsia (Crayola)",
			 @"fuchsiaPink" : @"Fuchsia Pink",
			 @"fuchsiapink" : @"Fuchsia Pink",
			 @"fuchsiaPurple" : @"Fuchsia Purple",
			 @"fuchsiapurple" : @"Fuchsia Purple",
			 @"fuchsiaRose" : @"Fuchsia Rose",
			 @"fuchsiarose" : @"Fuchsia Rose",
			 @"fulvous" : @"Fulvous",
			 @"fulvous" : @"Fulvous",
			 @"fuzzyWuzzy" : @"Fuzzy Wuzzy",
			 @"fuzzywuzzy" : @"Fuzzy Wuzzy",
			 @"gamboge" : @"Gamboge",
			 @"gamboge" : @"Gamboge",
			 @"gambogeOrangeBrown" : @"Gamboge Orange (Brown)",
			 @"gambogeorangebrown" : @"Gamboge Orange (Brown)",
			 @"genericViridian" : @"Generic Viridian",
			 @"genericviridian" : @"Generic Viridian",
			 @"ghostWhite" : @"Ghost White",
			 @"ghostwhite" : @"Ghost White",
			 @"giantsOrange" : @"Giants Orange",
			 @"giantsorange" : @"Giants Orange",
			 @"grussrel" : @"Grussrel",
			 @"grussrel" : @"Grussrel",
			 @"glaucous" : @"Glaucous",
			 @"glaucous" : @"Glaucous",
			 @"glitter" : @"Glitter",
			 @"glitter" : @"Glitter",
			 @"gOGreen" : @"GO Green",
			 @"gogreen" : @"GO Green",
			 @"goldMetallic" : @"Gold (Metallic)",
			 @"goldmetallic" : @"Gold (Metallic)",
			 @"goldWebGolden" : @"Gold (Web) (Golden)",
			 @"goldwebgolden" : @"Gold (Web) (Golden)",
			 @"goldFusion" : @"Gold Fusion",
			 @"goldfusion" : @"Gold Fusion",
			 @"goldenBrown" : @"Golden Brown",
			 @"goldenbrown" : @"Golden Brown",
			 @"goldenPoppy" : @"Golden Poppy",
			 @"goldenpoppy" : @"Golden Poppy",
			 @"goldenYellow" : @"Golden Yellow",
			 @"goldenyellow" : @"Golden Yellow",
			 @"goldenrod" : @"Goldenrod",
			 @"goldenrod" : @"Goldenrod",
			 @"grannySmithApple" : @"Granny Smith Apple",
			 @"grannysmithapple" : @"Granny Smith Apple",
			 @"grape" : @"Grape",
			 @"grape" : @"Grape",
			 @"gray" : @"Gray",
			 @"gray" : @"Gray",
			 @"grayHTMLCSSGray" : @"Gray (HTML/CSS Gray)",
			 @"grayhtmlcssgray" : @"Gray (HTML/CSS Gray)",
			 @"grayX11Gray" : @"Gray (X11 Gray)",
			 @"grayx11gray" : @"Gray (X11 Gray)",
			 @"grayAsparagus" : @"Gray-Asparagus",
			 @"grayasparagus" : @"Gray-Asparagus",
			 @"grayBlue" : @"Gray-Blue",
			 @"grayblue" : @"Gray-Blue",
			 @"greenColorWheelX11Green" : @"Green (Color Wheel) (X11 Green)",
			 @"greencolorwheelx11green" : @"Green (Color Wheel) (X11 Green)",
			 @"greenCrayola" : @"Green (Crayola)",
			 @"greencrayola" : @"Green (Crayola)",
			 @"greenHTMLCSSColor" : @"Green (HTML/CSS Color)",
			 @"greenhtmlcsscolor" : @"Green (HTML/CSS Color)",
			 @"greenMunsell" : @"Green (Munsell)",
			 @"greenmunsell" : @"Green (Munsell)",
			 @"greenNCS" : @"Green (NCS)",
			 @"greenncs" : @"Green (NCS)",
			 @"greenPantone" : @"Green (Pantone)",
			 @"greenpantone" : @"Green (Pantone)",
			 @"greenPigment" : @"Green (Pigment)",
			 @"greenpigment" : @"Green (Pigment)",
			 @"greenRYB" : @"Green (RYB)",
			 @"greenryb" : @"Green (RYB)",
			 @"greenBlue" : @"Green-Blue",
			 @"greenblue" : @"Green-Blue",
			 @"greenCyan" : @"Green-Cyan",
			 @"greencyan" : @"Green-Cyan",
			 @"greenYellow" : @"Green-Yellow",
			 @"greenyellow" : @"Green-Yellow",
			 @"grizzly" : @"Grizzly",
			 @"grizzly" : @"Grizzly",
			 @"grullo" : @"Grullo",
			 @"grullo" : @"Grullo",
			 @"guppieGreen" : @"Guppie Green",
			 @"guppiegreen" : @"Guppie Green",
			 @"halayàÚbe" : @"Halayà Úbe",
			 @"halayàúbe" : @"Halayà Úbe",
			 @"hanBlue" : @"Han Blue",
			 @"hanblue" : @"Han Blue",
			 @"hanPurple" : @"Han Purple",
			 @"hanpurple" : @"Han Purple",
			 @"hansaYellow" : @"Hansa Yellow",
			 @"hansayellow" : @"Hansa Yellow",
			 @"harlequin" : @"Harlequin",
			 @"harlequin" : @"Harlequin",
			 @"harlequinGreen" : @"Harlequin Green",
			 @"harlequingreen" : @"Harlequin Green",
			 @"harvardCrimson" : @"Harvard Crimson",
			 @"harvardcrimson" : @"Harvard Crimson",
			 @"harvestGold" : @"Harvest Gold",
			 @"harvestgold" : @"Harvest Gold",
			 @"heartGold" : @"Heart Gold",
			 @"heartgold" : @"Heart Gold",
			 @"heliotrope" : @"Heliotrope",
			 @"heliotrope" : @"Heliotrope",
			 @"heliotropeGray" : @"Heliotrope Gray",
			 @"heliotropegray" : @"Heliotrope Gray",
			 @"heliotropeMagenta" : @"Heliotrope Magenta",
			 @"heliotropemagenta" : @"Heliotrope Magenta",
			 @"hollywoodCerise" : @"Hollywood Cerise",
			 @"hollywoodcerise" : @"Hollywood Cerise",
			 @"honeydew" : @"Honeydew",
			 @"honeydew" : @"Honeydew",
			 @"honoluluBlue" : @"Honolulu Blue",
			 @"honolulublue" : @"Honolulu Blue",
			 @"hookersGreen" : @"Hooker's Green",
			 @"hookersgreen" : @"Hooker's Green",
			 @"hotMagenta" : @"Hot Magenta",
			 @"hotmagenta" : @"Hot Magenta",
			 @"hotPink" : @"Hot Pink",
			 @"hotpink" : @"Hot Pink",
			 @"hunterGreen" : @"Hunter Green",
			 @"huntergreen" : @"Hunter Green",
			 @"iceberg" : @"Iceberg",
			 @"iceberg" : @"Iceberg",
			 @"icterine" : @"Icterine",
			 @"icterine" : @"Icterine",
			 @"illuminatingEmerald" : @"Illuminating Emerald",
			 @"illuminatingemerald" : @"Illuminating Emerald",
			 @"imperial" : @"Imperial",
			 @"imperial" : @"Imperial",
			 @"imperialBlue" : @"Imperial Blue",
			 @"imperialblue" : @"Imperial Blue",
			 @"imperialPurple" : @"Imperial Purple",
			 @"imperialpurple" : @"Imperial Purple",
			 @"imperialRed" : @"Imperial Red",
			 @"imperialred" : @"Imperial Red",
			 @"inchworm" : @"Inchworm",
			 @"inchworm" : @"Inchworm",
			 @"independence" : @"Independence",
			 @"independence" : @"Independence",
			 @"indiaGreen" : @"India Green",
			 @"indiagreen" : @"India Green",
			 @"indianRed" : @"Indian Red",
			 @"indianred" : @"Indian Red",
			 @"indianYellow" : @"Indian Yellow",
			 @"indianyellow" : @"Indian Yellow",
			 @"indigo" : @"Indigo",
			 @"indigo" : @"Indigo",
			 @"indigoDye" : @"Indigo Dye",
			 @"indigodye" : @"Indigo Dye",
			 @"indigoWeb" : @"Indigo (Web)",
			 @"indigoweb" : @"Indigo (Web)",
			 @"internationalKleinBlue" : @"International Klein Blue",
			 @"internationalkleinblue" : @"International Klein Blue",
			 @"internationalOrangeAerospace" : @"International Orange (Aerospace)",
			 @"internationalorangeaerospace" : @"International Orange (Aerospace)",
			 @"internationalOrangeEngineering" : @"International Orange (Engineering)",
			 @"internationalorangeengineering" : @"International Orange (Engineering)",
			 @"internationalOrangeGoldenGateBridge" : @"International Orange (Golden Gate Bridge)",
			 @"internationalorangegoldengatebridge" : @"International Orange (Golden Gate Bridge)",
			 @"iris" : @"Iris",
			 @"iris" : @"Iris",
			 @"irresistible" : @"Irresistible",
			 @"irresistible" : @"Irresistible",
			 @"isabelline" : @"Isabelline",
			 @"isabelline" : @"Isabelline",
			 @"islamicGreen" : @"Islamic Green",
			 @"islamicgreen" : @"Islamic Green",
			 @"italianSkyBlue" : @"Italian Sky Blue",
			 @"italianskyblue" : @"Italian Sky Blue",
			 @"ivory" : @"Ivory",
			 @"ivory" : @"Ivory",
			 @"jade" : @"Jade",
			 @"jade" : @"Jade",
			 @"japaneseCarmine" : @"Japanese Carmine",
			 @"japanesecarmine" : @"Japanese Carmine",
			 @"japaneseIndigo" : @"Japanese Indigo",
			 @"japaneseindigo" : @"Japanese Indigo",
			 @"japaneseViolet" : @"Japanese Violet",
			 @"japaneseviolet" : @"Japanese Violet",
			 @"jasmine" : @"Jasmine",
			 @"jasmine" : @"Jasmine",
			 @"jasper" : @"Jasper",
			 @"jasper" : @"Jasper",
			 @"jazzberryJam" : @"Jazzberry Jam",
			 @"jazzberryjam" : @"Jazzberry Jam",
			 @"jellyBean" : @"Jelly Bean",
			 @"jellybean" : @"Jelly Bean",
			 @"jet" : @"Jet",
			 @"jet" : @"Jet",
			 @"jonquil" : @"Jonquil",
			 @"jonquil" : @"Jonquil",
			 @"jordyBlue" : @"Jordy Blue",
			 @"jordyblue" : @"Jordy Blue",
			 @"juneBud" : @"June Bud",
			 @"junebud" : @"June Bud",
			 @"jungleGreen" : @"Jungle Green",
			 @"junglegreen" : @"Jungle Green",
			 @"kellyGreen" : @"Kelly Green",
			 @"kellygreen" : @"Kelly Green",
			 @"kenyanCopper" : @"Kenyan Copper",
			 @"kenyancopper" : @"Kenyan Copper",
			 @"keppel" : @"Keppel",
			 @"keppel" : @"Keppel",
			 @"jawadChickenColorHTMLCSSKhaki" : @"Jawad/Chicken Color (HTML/CSS) (Khaki)",
			 @"jawadchickencolorhtmlcsskhaki" : @"Jawad/Chicken Color (HTML/CSS) (Khaki)",
			 @"khakiX11LightKhaki" : @"Khaki (X11) (Light Khaki)",
			 @"khakix11lightkhaki" : @"Khaki (X11) (Light Khaki)",
			 @"kobe" : @"Kobe",
			 @"kobe" : @"Kobe",
			 @"kobi" : @"Kobi",
			 @"kobi" : @"Kobi",
			 @"kombuGreen" : @"Kombu Green",
			 @"kombugreen" : @"Kombu Green",
			 @"kUCrimson" : @"KU Crimson",
			 @"kucrimson" : @"KU Crimson",
			 @"laSalleGreen" : @"La Salle Green",
			 @"lasallegreen" : @"La Salle Green",
			 @"languidLavender" : @"Languid Lavender",
			 @"languidlavender" : @"Languid Lavender",
			 @"lapisLazuli" : @"Lapis Lazuli",
			 @"lapislazuli" : @"Lapis Lazuli",
			 @"laserLemon" : @"Laser Lemon",
			 @"laserlemon" : @"Laser Lemon",
			 @"laurelGreen" : @"Laurel Green",
			 @"laurelgreen" : @"Laurel Green",
			 @"lava" : @"Lava",
			 @"lava" : @"Lava",
			 @"lavenderFloral" : @"Lavender (Floral)",
			 @"lavenderfloral" : @"Lavender (Floral)",
			 @"lavenderWeb" : @"Lavender (Web)",
			 @"lavenderweb" : @"Lavender (Web)",
			 @"lavenderBlue" : @"Lavender Blue",
			 @"lavenderblue" : @"Lavender Blue",
			 @"lavenderBlush" : @"Lavender Blush",
			 @"lavenderblush" : @"Lavender Blush",
			 @"lavenderGray" : @"Lavender Gray",
			 @"lavendergray" : @"Lavender Gray",
			 @"lavenderIndigo" : @"Lavender Indigo",
			 @"lavenderindigo" : @"Lavender Indigo",
			 @"lavenderMagenta" : @"Lavender Magenta",
			 @"lavendermagenta" : @"Lavender Magenta",
			 @"lavenderMist" : @"Lavender Mist",
			 @"lavendermist" : @"Lavender Mist",
			 @"lavenderPink" : @"Lavender Pink",
			 @"lavenderpink" : @"Lavender Pink",
			 @"lavenderPurple" : @"Lavender Purple",
			 @"lavenderpurple" : @"Lavender Purple",
			 @"lavenderRose" : @"Lavender Rose",
			 @"lavenderrose" : @"Lavender Rose",
			 @"lawnGreen" : @"Lawn Green",
			 @"lawngreen" : @"Lawn Green",
			 @"lemon" : @"Lemon",
			 @"lemon" : @"Lemon",
			 @"lemonChiffon" : @"Lemon Chiffon",
			 @"lemonchiffon" : @"Lemon Chiffon",
			 @"lemonCurry" : @"Lemon Curry",
			 @"lemoncurry" : @"Lemon Curry",
			 @"lemonGlacier" : @"Lemon Glacier",
			 @"lemonglacier" : @"Lemon Glacier",
			 @"lemonLime" : @"Lemon Lime",
			 @"lemonlime" : @"Lemon Lime",
			 @"lemonMeringue" : @"Lemon Meringue",
			 @"lemonmeringue" : @"Lemon Meringue",
			 @"lemonYellow" : @"Lemon Yellow",
			 @"lemonyellow" : @"Lemon Yellow",
			 @"lenurple" : @"Lenurple",
			 @"lenurple" : @"Lenurple",
			 @"licorice" : @"Licorice",
			 @"licorice" : @"Licorice",
			 @"liberty" : @"Liberty",
			 @"liberty" : @"Liberty",
			 @"lightApricot" : @"Light Apricot",
			 @"lightapricot" : @"Light Apricot",
			 @"lightBlue" : @"Light Blue",
			 @"lightblue" : @"Light Blue",
			 @"lightBrilliantRed" : @"Light Brilliant Red",
			 @"lightbrilliantred" : @"Light Brilliant Red",
			 @"lightBrown" : @"Light Brown",
			 @"lightbrown" : @"Light Brown",
			 @"lightCarminePink" : @"Light Carmine Pink",
			 @"lightcarminepink" : @"Light Carmine Pink",
			 @"lightCobaltBlue" : @"Light Cobalt Blue",
			 @"lightcobaltblue" : @"Light Cobalt Blue",
			 @"lightCoral" : @"Light Coral",
			 @"lightcoral" : @"Light Coral",
			 @"lightCornflowerBlue" : @"Light Cornflower Blue",
			 @"lightcornflowerblue" : @"Light Cornflower Blue",
			 @"lightCrimson" : @"Light Crimson",
			 @"lightcrimson" : @"Light Crimson",
			 @"lightCyan" : @"Light Cyan",
			 @"lightcyan" : @"Light Cyan",
			 @"lightDeepPink" : @"Light Deep Pink",
			 @"lightdeeppink" : @"Light Deep Pink",
			 @"lightFrenchBeige" : @"Light French Beige",
			 @"lightfrenchbeige" : @"Light French Beige",
			 @"lightFuchsiaPink" : @"Light Fuchsia Pink",
			 @"lightfuchsiapink" : @"Light Fuchsia Pink",
			 @"lightGoldenrodYellow" : @"Light Goldenrod Yellow",
			 @"lightgoldenrodyellow" : @"Light Goldenrod Yellow",
			 @"lightGray" : @"Light Gray",
			 @"lightgray" : @"Light Gray",
			 @"lightGrayishMagenta" : @"Light Grayish Magenta",
			 @"lightgrayishmagenta" : @"Light Grayish Magenta",
			 @"lightGreen" : @"Light Green",
			 @"lightgreen" : @"Light Green",
			 @"lightHotPink" : @"Light Hot Pink",
			 @"lighthotpink" : @"Light Hot Pink",
			 @"lightKhaki" : @"Light Khaki",
			 @"lightkhaki" : @"Light Khaki",
			 @"lightMediumOrchid" : @"Light Medium Orchid",
			 @"lightmediumorchid" : @"Light Medium Orchid",
			 @"lightMossGreen" : @"Light Moss Green",
			 @"lightmossgreen" : @"Light Moss Green",
			 @"lightOrchid" : @"Light Orchid",
			 @"lightorchid" : @"Light Orchid",
			 @"lightPastelPurple" : @"Light Pastel Purple",
			 @"lightpastelpurple" : @"Light Pastel Purple",
			 @"lightPink" : @"Light Pink",
			 @"lightpink" : @"Light Pink",
			 @"lightRedOchre" : @"Light Red Ochre",
			 @"lightredochre" : @"Light Red Ochre",
			 @"lightSalmon" : @"Light Salmon",
			 @"lightsalmon" : @"Light Salmon",
			 @"lightSalmonPink" : @"Light Salmon Pink",
			 @"lightsalmonpink" : @"Light Salmon Pink",
			 @"lightSeaGreen" : @"Light Sea Green",
			 @"lightseagreen" : @"Light Sea Green",
			 @"lightSkyBlue" : @"Light Sky Blue",
			 @"lightskyblue" : @"Light Sky Blue",
			 @"lightSlateGray" : @"Light Slate Gray",
			 @"lightslategray" : @"Light Slate Gray",
			 @"lightSteelBlue" : @"Light Steel Blue",
			 @"lightsteelblue" : @"Light Steel Blue",
			 @"lightTaupe" : @"Light Taupe",
			 @"lighttaupe" : @"Light Taupe",
			 @"lightThulianPink" : @"Light Thulian Pink",
			 @"lightthulianpink" : @"Light Thulian Pink",
			 @"lightYellow" : @"Light Yellow",
			 @"lightyellow" : @"Light Yellow",
			 @"lilac" : @"Lilac",
			 @"lilac" : @"Lilac",
			 @"limeColorWheel" : @"Lime (Color Wheel)",
			 @"limecolorwheel" : @"Lime (Color Wheel)",
			 @"limeWebX11Green" : @"Lime (Web) (X11 Green)",
			 @"limewebx11green" : @"Lime (Web) (X11 Green)",
			 @"limeGreen" : @"Lime Green",
			 @"limegreen" : @"Lime Green",
			 @"limerick" : @"Limerick",
			 @"limerick" : @"Limerick",
			 @"lincolnGreen" : @"Lincoln Green",
			 @"lincolngreen" : @"Lincoln Green",
			 @"linen" : @"Linen",
			 @"linen" : @"Linen",
			 @"lion" : @"Lion",
			 @"lion" : @"Lion",
			 @"liseranPurple" : @"Liseran Purple",
			 @"liseranpurple" : @"Liseran Purple",
			 @"littleBoyBlue" : @"Little Boy Blue",
			 @"littleboyblue" : @"Little Boy Blue",
			 @"liver" : @"Liver",
			 @"liver" : @"Liver",
			 @"liverDogs" : @"Liver (Dogs)",
			 @"liverdogs" : @"Liver (Dogs)",
			 @"liverOrgan" : @"Liver (Organ)",
			 @"liverorgan" : @"Liver (Organ)",
			 @"liverChestnut" : @"Liver Chestnut",
			 @"liverchestnut" : @"Liver Chestnut",
			 @"livid" : @"Livid",
			 @"livid" : @"Livid",
			 @"lumber" : @"Lumber",
			 @"lumber" : @"Lumber",
			 @"lust" : @"Lust",
			 @"lust" : @"Lust",
			 @"magenta" : @"Magenta",
			 @"magenta" : @"Magenta",
			 @"magentaCrayola" : @"Magenta (Crayola)",
			 @"magentacrayola" : @"Magenta (Crayola)",
			 @"magentaDye" : @"Magenta (Dye)",
			 @"magentadye" : @"Magenta (Dye)",
			 @"magentaPantone" : @"Magenta (Pantone)",
			 @"magentapantone" : @"Magenta (Pantone)",
			 @"magentaProcess" : @"Magenta (Process)",
			 @"magentaprocess" : @"Magenta (Process)",
			 @"magentaHaze" : @"Magenta Haze",
			 @"magentahaze" : @"Magenta Haze",
			 @"magentaPink" : @"Magenta-Pink",
			 @"magentapink" : @"Magenta-Pink",
			 @"magicMint" : @"Magic Mint",
			 @"magicmint" : @"Magic Mint",
			 @"magnolia" : @"Magnolia",
			 @"magnolia" : @"Magnolia",
			 @"mahogany" : @"Mahogany",
			 @"mahogany" : @"Mahogany",
			 @"maize" : @"Maize",
			 @"maize" : @"Maize",
			 @"majorelleBlue" : @"Majorelle Blue",
			 @"majorelleblue" : @"Majorelle Blue",
			 @"malachite" : @"Malachite",
			 @"malachite" : @"Malachite",
			 @"manatee" : @"Manatee",
			 @"manatee" : @"Manatee",
			 @"mangoTango" : @"Mango Tango",
			 @"mangotango" : @"Mango Tango",
			 @"mantis" : @"Mantis",
			 @"mantis" : @"Mantis",
			 @"mardiGras" : @"Mardi Gras",
			 @"mardigras" : @"Mardi Gras",
			 @"marigold" : @"Marigold",
			 @"marigold" : @"Marigold",
			 @"maroonCrayola" : @"Maroon (Crayola)",
			 @"marooncrayola" : @"Maroon (Crayola)",
			 @"maroonHTMLCSS" : @"Maroon (HTML/CSS)",
			 @"maroonhtmlcss" : @"Maroon (HTML/CSS)",
			 @"maroonX11" : @"Maroon (X11)",
			 @"maroonx11" : @"Maroon (X11)",
			 @"mauve" : @"Mauve",
			 @"mauve" : @"Mauve",
			 @"mauveTaupe" : @"Mauve Taupe",
			 @"mauvetaupe" : @"Mauve Taupe",
			 @"mauvelous" : @"Mauvelous",
			 @"mauvelous" : @"Mauvelous",
			 @"mayGreen" : @"May Green",
			 @"maygreen" : @"May Green",
			 @"mayaBlue" : @"Maya Blue",
			 @"mayablue" : @"Maya Blue",
			 @"meatBrown" : @"Meat Brown",
			 @"meatbrown" : @"Meat Brown",
			 @"mediumAquamarine" : @"Medium Aquamarine",
			 @"mediumaquamarine" : @"Medium Aquamarine",
			 @"mediumBlue" : @"Medium Blue",
			 @"mediumblue" : @"Medium Blue",
			 @"mediumCandyAppleRed" : @"Medium Candy Apple Red",
			 @"mediumcandyapplered" : @"Medium Candy Apple Red",
			 @"mediumCarmine" : @"Medium Carmine",
			 @"mediumcarmine" : @"Medium Carmine",
			 @"mediumChampagne" : @"Medium Champagne",
			 @"mediumchampagne" : @"Medium Champagne",
			 @"mediumElectricBlue" : @"Medium Electric Blue",
			 @"mediumelectricblue" : @"Medium Electric Blue",
			 @"mediumJungleGreen" : @"Medium Jungle Green",
			 @"mediumjunglegreen" : @"Medium Jungle Green",
			 @"mediumLavenderMagenta" : @"Medium Lavender Magenta",
			 @"mediumlavendermagenta" : @"Medium Lavender Magenta",
			 @"mediumOrchid" : @"Medium Orchid",
			 @"mediumorchid" : @"Medium Orchid",
			 @"mediumPersianBlue" : @"Medium Persian Blue",
			 @"mediumpersianblue" : @"Medium Persian Blue",
			 @"mediumPurple" : @"Medium Purple",
			 @"mediumpurple" : @"Medium Purple",
			 @"mediumRedViolet" : @"Medium Red-Violet",
			 @"mediumredviolet" : @"Medium Red-Violet",
			 @"mediumRuby" : @"Medium Ruby",
			 @"mediumruby" : @"Medium Ruby",
			 @"mediumSeaGreen" : @"Medium Sea Green",
			 @"mediumseagreen" : @"Medium Sea Green",
			 @"mediumSkyBlue" : @"Medium Sky Blue",
			 @"mediumskyblue" : @"Medium Sky Blue",
			 @"mediumSlateBlue" : @"Medium Slate Blue",
			 @"mediumslateblue" : @"Medium Slate Blue",
			 @"mediumSpringBud" : @"Medium Spring Bud",
			 @"mediumspringbud" : @"Medium Spring Bud",
			 @"mediumSpringGreen" : @"Medium Spring Green",
			 @"mediumspringgreen" : @"Medium Spring Green",
			 @"mediumTaupe" : @"Medium Taupe",
			 @"mediumtaupe" : @"Medium Taupe",
			 @"mediumTurquoise" : @"Medium Turquoise",
			 @"mediumturquoise" : @"Medium Turquoise",
			 @"mediumTuscanRed" : @"Medium Tuscan Red",
			 @"mediumtuscanred" : @"Medium Tuscan Red",
			 @"mediumVermilion" : @"Medium Vermilion",
			 @"mediumvermilion" : @"Medium Vermilion",
			 @"mediumVioletRed" : @"Medium Violet-Red",
			 @"mediumvioletred" : @"Medium Violet-Red",
			 @"mellowApricot" : @"Mellow Apricot",
			 @"mellowapricot" : @"Mellow Apricot",
			 @"mellowYellow" : @"Mellow Yellow",
			 @"mellowyellow" : @"Mellow Yellow",
			 @"melon" : @"Melon",
			 @"melon" : @"Melon",
			 @"metallicSeaweed" : @"Metallic Seaweed",
			 @"metallicseaweed" : @"Metallic Seaweed",
			 @"metallicSunburst" : @"Metallic Sunburst",
			 @"metallicsunburst" : @"Metallic Sunburst",
			 @"mexicanPink" : @"Mexican Pink",
			 @"mexicanpink" : @"Mexican Pink",
			 @"midnightBlue" : @"Midnight Blue",
			 @"midnightblue" : @"Midnight Blue",
			 @"midnightGreenEagleGreen" : @"Midnight Green (Eagle Green)",
			 @"midnightgreeneaglegreen" : @"Midnight Green (Eagle Green)",
			 @"mikadoYellow" : @"Mikado Yellow",
			 @"mikadoyellow" : @"Mikado Yellow",
			 @"mindaro" : @"Mindaro",
			 @"mindaro" : @"Mindaro",
			 @"ming" : @"Ming",
			 @"ming" : @"Ming",
			 @"mint" : @"Mint",
			 @"mint" : @"Mint",
			 @"mintCream" : @"Mint Cream",
			 @"mintcream" : @"Mint Cream",
			 @"mintGreen" : @"Mint Green",
			 @"mintgreen" : @"Mint Green",
			 @"mistyRose" : @"Misty Rose",
			 @"mistyrose" : @"Misty Rose",
			 @"moccasin" : @"Moccasin",
			 @"moccasin" : @"Moccasin",
			 @"modeBeige" : @"Mode Beige",
			 @"modebeige" : @"Mode Beige",
			 @"moonstoneBlue" : @"Moonstone Blue",
			 @"moonstoneblue" : @"Moonstone Blue",
			 @"mordantRed19" : @"Mordant Red 19",
			 @"mordantred19" : @"Mordant Red 19",
			 @"mossGreen" : @"Moss Green",
			 @"mossgreen" : @"Moss Green",
			 @"mountainMeadow" : @"Mountain Meadow",
			 @"mountainmeadow" : @"Mountain Meadow",
			 @"mountbattenPink" : @"Mountbatten Pink",
			 @"mountbattenpink" : @"Mountbatten Pink",
			 @"mSUGreen" : @"MSU Green",
			 @"msugreen" : @"MSU Green",
			 @"mughalGreen" : @"Mughal Green",
			 @"mughalgreen" : @"Mughal Green",
			 @"mulberry" : @"Mulberry",
			 @"mulberry" : @"Mulberry",
			 @"mustard" : @"Mustard",
			 @"mustard" : @"Mustard",
			 @"myrtleGreen" : @"Myrtle Green",
			 @"myrtlegreen" : @"Myrtle Green",
			 @"nadeshikoPink" : @"Nadeshiko Pink",
			 @"nadeshikopink" : @"Nadeshiko Pink",
			 @"napierGreen" : @"Napier Green",
			 @"napiergreen" : @"Napier Green",
			 @"naplesYellow" : @"Naples Yellow",
			 @"naplesyellow" : @"Naples Yellow",
			 @"navajoWhite" : @"Navajo White",
			 @"navajowhite" : @"Navajo White",
			 @"navy" : @"Navy",
			 @"navy" : @"Navy",
			 @"navyPurple" : @"Navy Purple",
			 @"navypurple" : @"Navy Purple",
			 @"neonCarrot" : @"Neon Carrot",
			 @"neoncarrot" : @"Neon Carrot",
			 @"neonFuchsia" : @"Neon Fuchsia",
			 @"neonfuchsia" : @"Neon Fuchsia",
			 @"neonGreen" : @"Neon Green",
			 @"neongreen" : @"Neon Green",
			 @"car" : @"Car",
			 @"car" : @"New Car",
			 @"yorkPink" : @"York Pink",
			 @"yorkPink" : @"New York Pink",
			 @"nonPhotoBlue" : @"Non-Photo Blue",
			 @"nonphotoblue" : @"Non-Photo Blue",
			 @"northTexasGreen" : @"North Texas Green",
			 @"northtexasgreen" : @"North Texas Green",
			 @"nyanza" : @"Nyanza",
			 @"nyanza" : @"Nyanza",
			 @"oceanBoatBlue" : @"Ocean Boat Blue",
			 @"oceanboatblue" : @"Ocean Boat Blue",
			 @"ochre" : @"Ochre",
			 @"ochre" : @"Ochre",
			 @"officeGreen" : @"Office Green",
			 @"officegreen" : @"Office Green",
			 @"oldBurgundy" : @"Old Burgundy",
			 @"oldburgundy" : @"Old Burgundy",
			 @"oldGold" : @"Old Gold",
			 @"oldgold" : @"Old Gold",
			 @"oldHeliotrope" : @"Old Heliotrope",
			 @"oldheliotrope" : @"Old Heliotrope",
			 @"oldLace" : @"Old Lace",
			 @"oldlace" : @"Old Lace",
			 @"oldLavender" : @"Old Lavender",
			 @"oldlavender" : @"Old Lavender",
			 @"oldMauve" : @"Old Mauve",
			 @"oldmauve" : @"Old Mauve",
			 @"oldMossGreen" : @"Old Moss Green",
			 @"oldmossgreen" : @"Old Moss Green",
			 @"oldRose" : @"Old Rose",
			 @"oldrose" : @"Old Rose",
			 @"oldSilver" : @"Old Silver",
			 @"oldsilver" : @"Old Silver",
			 @"olive" : @"Olive",
			 @"olive" : @"Olive",
			 @"oliveDrab3" : @"Olive Drab (#3)",
			 @"olivedrab3" : @"Olive Drab (#3)",
			 @"oliveDrab7" : @"Olive Drab #7",
			 @"olivedrab7" : @"Olive Drab #7",
			 @"olivine" : @"Olivine",
			 @"olivine" : @"Olivine",
			 @"onyx" : @"Onyx",
			 @"onyx" : @"Onyx",
			 @"operaMauve" : @"Opera Mauve",
			 @"operamauve" : @"Opera Mauve",
			 @"orangeColorWheel" : @"Orange (Color Wheel)",
			 @"orangecolorwheel" : @"Orange (Color Wheel)",
			 @"orangeCrayola" : @"Orange (Crayola)",
			 @"orangecrayola" : @"Orange (Crayola)",
			 @"orangePantone" : @"Orange (Pantone)",
			 @"orangepantone" : @"Orange (Pantone)",
			 @"orangeRYB" : @"Orange (RYB)",
			 @"orangeryb" : @"Orange (RYB)",
			 @"orangeWeb" : @"Orange (Web)",
			 @"orangeweb" : @"Orange (Web)",
			 @"orangePeel" : @"Orange Peel",
			 @"orangepeel" : @"Orange Peel",
			 @"orangeRed" : @"Orange-Red",
			 @"orangered" : @"Orange-Red",
			 @"orangeYellow" : @"Orange-Yellow",
			 @"orangeyellow" : @"Orange-Yellow",
			 @"orchid" : @"Orchid",
			 @"orchid" : @"Orchid",
			 @"orchidPink" : @"Orchid Pink",
			 @"orchidpink" : @"Orchid Pink",
			 @"oriolesOrange" : @"Orioles Orange",
			 @"oriolesorange" : @"Orioles Orange",
			 @"otterBrown" : @"Otter Brown",
			 @"otterbrown" : @"Otter Brown",
			 @"outerSpace" : @"Outer Space",
			 @"outerspace" : @"Outer Space",
			 @"outrageousOrange" : @"Outrageous Orange",
			 @"outrageousorange" : @"Outrageous Orange",
			 @"oxfordBlue" : @"Oxford Blue",
			 @"oxfordblue" : @"Oxford Blue",
			 @"oUCrimsonRed" : @"OU Crimson Red",
			 @"oucrimsonred" : @"OU Crimson Red",
			 @"pakistanGreen" : @"Pakistan Green",
			 @"pakistangreen" : @"Pakistan Green",
			 @"palatinateBlue" : @"Palatinate Blue",
			 @"palatinateblue" : @"Palatinate Blue",
			 @"palatinatePurple" : @"Palatinate Purple",
			 @"palatinatepurple" : @"Palatinate Purple",
			 @"paleAqua" : @"Pale Aqua",
			 @"paleaqua" : @"Pale Aqua",
			 @"paleBlue" : @"Pale Blue",
			 @"paleblue" : @"Pale Blue",
			 @"paleBrown" : @"Pale Brown",
			 @"palebrown" : @"Pale Brown",
			 @"paleCarmine" : @"Pale Carmine",
			 @"palecarmine" : @"Pale Carmine",
			 @"paleCerulean" : @"Pale Cerulean",
			 @"palecerulean" : @"Pale Cerulean",
			 @"paleChestnut" : @"Pale Chestnut",
			 @"palechestnut" : @"Pale Chestnut",
			 @"paleCopper" : @"Pale Copper",
			 @"palecopper" : @"Pale Copper",
			 @"paleCornflowerBlue" : @"Pale Cornflower Blue",
			 @"palecornflowerblue" : @"Pale Cornflower Blue",
			 @"paleCyan" : @"Pale Cyan",
			 @"palecyan" : @"Pale Cyan",
			 @"paleGold" : @"Pale Gold",
			 @"palegold" : @"Pale Gold",
			 @"paleGoldenrod" : @"Pale Goldenrod",
			 @"palegoldenrod" : @"Pale Goldenrod",
			 @"paleGreen" : @"Pale Green",
			 @"palegreen" : @"Pale Green",
			 @"paleLavender" : @"Pale Lavender",
			 @"palelavender" : @"Pale Lavender",
			 @"paleMagenta" : @"Pale Magenta",
			 @"palemagenta" : @"Pale Magenta",
			 @"paleMagentaPink" : @"Pale Magenta-Pink",
			 @"palemagentapink" : @"Pale Magenta-Pink",
			 @"palePink" : @"Pale Pink",
			 @"palepink" : @"Pale Pink",
			 @"palePlum" : @"Pale Plum",
			 @"paleplum" : @"Pale Plum",
			 @"paleRedViolet" : @"Pale Red-Violet",
			 @"paleredviolet" : @"Pale Red-Violet",
			 @"paleRobinEggBlue" : @"Pale Robin Egg Blue",
			 @"palerobineggblue" : @"Pale Robin Egg Blue",
			 @"paleSilver" : @"Pale Silver",
			 @"palesilver" : @"Pale Silver",
			 @"paleSpringBud" : @"Pale Spring Bud",
			 @"palespringbud" : @"Pale Spring Bud",
			 @"paleTaupe" : @"Pale Taupe",
			 @"paletaupe" : @"Pale Taupe",
			 @"paleTurquoise" : @"Pale Turquoise",
			 @"paleturquoise" : @"Pale Turquoise",
			 @"paleViolet" : @"Pale Violet",
			 @"paleviolet" : @"Pale Violet",
			 @"paleVioletRed" : @"Pale Violet-Red",
			 @"palevioletred" : @"Pale Violet-Red",
			 @"pansyPurple" : @"Pansy Purple",
			 @"pansypurple" : @"Pansy Purple",
			 @"paoloVeroneseGreen" : @"Paolo Veronese Green",
			 @"paoloveronesegreen" : @"Paolo Veronese Green",
			 @"papayaWhip" : @"Papaya Whip",
			 @"papayawhip" : @"Papaya Whip",
			 @"paradisePink" : @"Paradise Pink",
			 @"paradisepink" : @"Paradise Pink",
			 @"parisGreen" : @"Paris Green",
			 @"parisgreen" : @"Paris Green",
			 @"pastelBlue" : @"Pastel Blue",
			 @"pastelblue" : @"Pastel Blue",
			 @"pastelBrown" : @"Pastel Brown",
			 @"pastelbrown" : @"Pastel Brown",
			 @"pastelGray" : @"Pastel Gray",
			 @"pastelgray" : @"Pastel Gray",
			 @"pastelGreen" : @"Pastel Green",
			 @"pastelgreen" : @"Pastel Green",
			 @"pastelMagenta" : @"Pastel Magenta",
			 @"pastelmagenta" : @"Pastel Magenta",
			 @"pastelOrange" : @"Pastel Orange",
			 @"pastelorange" : @"Pastel Orange",
			 @"pastelPink" : @"Pastel Pink",
			 @"pastelpink" : @"Pastel Pink",
			 @"pastelPurple" : @"Pastel Purple",
			 @"pastelpurple" : @"Pastel Purple",
			 @"pastelRed" : @"Pastel Red",
			 @"pastelred" : @"Pastel Red",
			 @"pastelViolet" : @"Pastel Violet",
			 @"pastelviolet" : @"Pastel Violet",
			 @"pastelYellow" : @"Pastel Yellow",
			 @"pastelyellow" : @"Pastel Yellow",
			 @"patriarch" : @"Patriarch",
			 @"patriarch" : @"Patriarch",
			 @"paynesGrey" : @"Payne's Grey",
			 @"paynesgrey" : @"Payne's Grey",
			 @"peach" : @"Peach",
			 @"peach" : @"Peach",
			 @"peach2" : @"Peach",
			 @"peach2" : @"Peach",
			 @"peachOrange" : @"Peach-Orange",
			 @"peachorange" : @"Peach-Orange",
			 @"peachPuff" : @"Peach Puff",
			 @"peachpuff" : @"Peach Puff",
			 @"peachYellow" : @"Peach-Yellow",
			 @"peachyellow" : @"Peach-Yellow",
			 @"pear" : @"Pear",
			 @"pear" : @"Pear",
			 @"pearl" : @"Pearl",
			 @"pearl" : @"Pearl",
			 @"pearlAqua" : @"Pearl Aqua",
			 @"pearlaqua" : @"Pearl Aqua",
			 @"pearlyPurple" : @"Pearly Purple",
			 @"pearlypurple" : @"Pearly Purple",
			 @"peridot" : @"Peridot",
			 @"peridot" : @"Peridot",
			 @"periwinkle" : @"Periwinkle",
			 @"periwinkle" : @"Periwinkle",
			 @"persianBlue" : @"Persian Blue",
			 @"persianblue" : @"Persian Blue",
			 @"persianGreen" : @"Persian Green",
			 @"persiangreen" : @"Persian Green",
			 @"persianIndigo" : @"Persian Indigo",
			 @"persianindigo" : @"Persian Indigo",
			 @"persianOrange" : @"Persian Orange",
			 @"persianorange" : @"Persian Orange",
			 @"persianPink" : @"Persian Pink",
			 @"persianpink" : @"Persian Pink",
			 @"persianPlum" : @"Persian Plum",
			 @"persianplum" : @"Persian Plum",
			 @"persianRed" : @"Persian Red",
			 @"persianred" : @"Persian Red",
			 @"persianRose" : @"Persian Rose",
			 @"persianrose" : @"Persian Rose",
			 @"persimmon" : @"Persimmon",
			 @"persimmon" : @"Persimmon",
			 @"peru" : @"Peru",
			 @"peru" : @"Peru",
			 @"phlox" : @"Phlox",
			 @"phlox" : @"Phlox",
			 @"phthaloBlue" : @"Phthalo Blue",
			 @"phthaloblue" : @"Phthalo Blue",
			 @"phthaloGreen" : @"Phthalo Green",
			 @"phthalogreen" : @"Phthalo Green",
			 @"pictonBlue" : @"Picton Blue",
			 @"pictonblue" : @"Picton Blue",
			 @"pictorialCarmine" : @"Pictorial Carmine",
			 @"pictorialcarmine" : @"Pictorial Carmine",
			 @"piggyPink" : @"Piggy Pink",
			 @"piggypink" : @"Piggy Pink",
			 @"pineGreen" : @"Pine Green",
			 @"pinegreen" : @"Pine Green",
			 @"pineapple" : @"Pineapple",
			 @"pineapple" : @"Pineapple",
			 @"pink" : @"Pink",
			 @"pink" : @"Pink",
			 @"pinkPantone" : @"Pink (Pantone)",
			 @"pinkpantone" : @"Pink (Pantone)",
			 @"pinkLace" : @"Pink Lace",
			 @"pinklace" : @"Pink Lace",
			 @"pinkLavender" : @"Pink Lavender",
			 @"pinklavender" : @"Pink Lavender",
			 @"pinkOrange" : @"Pink-Orange",
			 @"pinkorange" : @"Pink-Orange",
			 @"pinkPearl" : @"Pink Pearl",
			 @"pinkpearl" : @"Pink Pearl",
			 @"pinkRaspberry" : @"Pink Raspberry",
			 @"pinkraspberry" : @"Pink Raspberry",
			 @"pinkSherbet" : @"Pink Sherbet",
			 @"pinksherbet" : @"Pink Sherbet",
			 @"pistachio" : @"Pistachio",
			 @"pistachio" : @"Pistachio",
			 @"platinum" : @"Platinum",
			 @"platinum" : @"Platinum",
			 @"plum" : @"Plum",
			 @"plum" : @"Plum",
			 @"plumWeb" : @"Plum (Web)",
			 @"plumweb" : @"Plum (Web)",
			 @"pompAndPower" : @"Pomp And Power",
			 @"pompandpower" : @"Pomp And Power",
			 @"popstar" : @"Popstar",
			 @"popstar" : @"Popstar",
			 @"portlandOrange" : @"Portland Orange",
			 @"portlandorange" : @"Portland Orange",
			 @"powderBlue" : @"Powder Blue",
			 @"powderblue" : @"Powder Blue",
			 @"princetonOrange" : @"Princeton Orange",
			 @"princetonorange" : @"Princeton Orange",
			 @"prune" : @"Prune",
			 @"prune" : @"Prune",
			 @"prussianBlue" : @"Prussian Blue",
			 @"prussianblue" : @"Prussian Blue",
			 @"psychedelicPurple" : @"Psychedelic Purple",
			 @"psychedelicpurple" : @"Psychedelic Purple",
			 @"puce" : @"Puce",
			 @"puce" : @"Puce",
			 @"puceRed" : @"Puce Red",
			 @"pucered" : @"Puce Red",
			 @"pullmanBrownUPSBrown" : @"Pullman Brown (UPS Brown)",
			 @"pullmanbrownupsbrown" : @"Pullman Brown (UPS Brown)",
			 @"pullmanGreen" : @"Pullman Green",
			 @"pullmangreen" : @"Pullman Green",
			 @"pumpkin" : @"Pumpkin",
			 @"pumpkin" : @"Pumpkin",
			 @"purpleHTML" : @"Purple (HTML)",
			 @"purplehtml" : @"Purple (HTML)",
			 @"purpleMunsell" : @"Purple (Munsell)",
			 @"purplemunsell" : @"Purple (Munsell)",
			 @"purpleX11" : @"Purple (X11)",
			 @"purplex11" : @"Purple (X11)",
			 @"purpleHeart" : @"Purple Heart",
			 @"purpleheart" : @"Purple Heart",
			 @"purpleMountainMajesty" : @"Purple Mountain Majesty",
			 @"purplemountainmajesty" : @"Purple Mountain Majesty",
			 @"purpleNavy" : @"Purple Navy",
			 @"purplenavy" : @"Purple Navy",
			 @"purplePizzazz" : @"Purple Pizzazz",
			 @"purplepizzazz" : @"Purple Pizzazz",
			 @"purpleTaupe" : @"Purple Taupe",
			 @"purpletaupe" : @"Purple Taupe",
			 @"purpureus" : @"Purpureus",
			 @"purpureus" : @"Purpureus",
			 @"quartz" : @"Quartz",
			 @"quartz" : @"Quartz",
			 @"queenBlue" : @"Queen Blue",
			 @"queenblue" : @"Queen Blue",
			 @"queenPink" : @"Queen Pink",
			 @"queenpink" : @"Queen Pink",
			 @"quinacridoneMagenta" : @"Quinacridone Magenta",
			 @"quinacridonemagenta" : @"Quinacridone Magenta",
			 @"rackley" : @"Rackley",
			 @"rackley" : @"Rackley",
			 @"radicalRed" : @"Radical Red",
			 @"radicalred" : @"Radical Red",
			 @"rajah" : @"Rajah",
			 @"rajah" : @"Rajah",
			 @"raspberry" : @"Raspberry",
			 @"raspberry" : @"Raspberry",
			 @"raspberryGlace" : @"Raspberry Glace",
			 @"raspberryglace" : @"Raspberry Glace",
			 @"raspberryPink" : @"Raspberry Pink",
			 @"raspberrypink" : @"Raspberry Pink",
			 @"raspberryRose" : @"Raspberry Rose",
			 @"raspberryrose" : @"Raspberry Rose",
			 @"rawUmber" : @"Raw Umber",
			 @"rawumber" : @"Raw Umber",
			 @"razzleDazzleRose" : @"Razzle Dazzle Rose",
			 @"razzledazzlerose" : @"Razzle Dazzle Rose",
			 @"razzmatazz" : @"Razzmatazz",
			 @"razzmatazz" : @"Razzmatazz",
			 @"razzmicBerry" : @"Razzmic Berry",
			 @"razzmicberry" : @"Razzmic Berry",
			 @"rebeccaPurple" : @"Rebecca Purple",
			 @"rebeccapurple" : @"Rebecca Purple",
			 @"red" : @"Red",
			 @"red" : @"Red",
			 @"redCrayola" : @"Red (Crayola)",
			 @"redcrayola" : @"Red (Crayola)",
			 @"redMunsell" : @"Red (Munsell)",
			 @"redmunsell" : @"Red (Munsell)",
			 @"redNCS" : @"Red (NCS)",
			 @"redncs" : @"Red (NCS)",
			 @"redPantone" : @"Red (Pantone)",
			 @"redpantone" : @"Red (Pantone)",
			 @"redPigment" : @"Red (Pigment)",
			 @"redpigment" : @"Red (Pigment)",
			 @"redRYB" : @"Red (RYB)",
			 @"redryb" : @"Red (RYB)",
			 @"redBrown" : @"Red-Brown",
			 @"redbrown" : @"Red-Brown",
			 @"redDevil" : @"Red Devil",
			 @"reddevil" : @"Red Devil",
			 @"redOrange" : @"Red-Orange",
			 @"redorange" : @"Red-Orange",
			 @"redPurple" : @"Red-Purple",
			 @"redpurple" : @"Red-Purple",
			 @"redViolet" : @"Red-Violet",
			 @"redviolet" : @"Red-Violet",
			 @"redwood" : @"Redwood",
			 @"redwood" : @"Redwood",
			 @"regalia" : @"Regalia",
			 @"regalia" : @"Regalia",
			 @"registrationBlack" : @"Registration Black",
			 @"registrationblack" : @"Registration Black",
			 @"resolutionBlue" : @"Resolution Blue",
			 @"resolutionblue" : @"Resolution Blue",
			 @"rhythm" : @"Rhythm",
			 @"rhythm" : @"Rhythm",
			 @"richBlack" : @"Rich Black",
			 @"richblack" : @"Rich Black",
			 @"richBlackFOGRA29" : @"Rich Black (FOGRA29)",
			 @"richblackfogra29" : @"Rich Black (FOGRA29)",
			 @"richBlackFOGRA39" : @"Rich Black (FOGRA39)",
			 @"richblackfogra39" : @"Rich Black (FOGRA39)",
			 @"richBrilliantLavender" : @"Rich Brilliant Lavender",
			 @"richbrilliantlavender" : @"Rich Brilliant Lavender",
			 @"richCarmine" : @"Rich Carmine",
			 @"richcarmine" : @"Rich Carmine",
			 @"richElectricBlue" : @"Rich Electric Blue",
			 @"richelectricblue" : @"Rich Electric Blue",
			 @"richLavender" : @"Rich Lavender",
			 @"richlavender" : @"Rich Lavender",
			 @"richLilac" : @"Rich Lilac",
			 @"richlilac" : @"Rich Lilac",
			 @"richMaroon" : @"Rich Maroon",
			 @"richmaroon" : @"Rich Maroon",
			 @"rifleGreen" : @"Rifle Green",
			 @"riflegreen" : @"Rifle Green",
			 @"roastCoffee" : @"Roast Coffee",
			 @"roastcoffee" : @"Roast Coffee",
			 @"robinEggBlue" : @"Robin Egg Blue",
			 @"robineggblue" : @"Robin Egg Blue",
			 @"rocketMetallic" : @"Rocket Metallic",
			 @"rocketmetallic" : @"Rocket Metallic",
			 @"romanSilver" : @"Roman Silver",
			 @"romansilver" : @"Roman Silver",
			 @"rose" : @"Rose",
			 @"rose" : @"Rose",
			 @"roseBonbon" : @"Rose Bonbon",
			 @"rosebonbon" : @"Rose Bonbon",
			 @"roseEbony" : @"Rose Ebony",
			 @"roseebony" : @"Rose Ebony",
			 @"roseGold" : @"Rose Gold",
			 @"rosegold" : @"Rose Gold",
			 @"roseMadder" : @"Rose Madder",
			 @"rosemadder" : @"Rose Madder",
			 @"rosePink" : @"Rose Pink",
			 @"rosepink" : @"Rose Pink",
			 @"roseQuartz" : @"Rose Quartz",
			 @"rosequartz" : @"Rose Quartz",
			 @"roseRed" : @"Rose Red",
			 @"rosered" : @"Rose Red",
			 @"roseTaupe" : @"Rose Taupe",
			 @"rosetaupe" : @"Rose Taupe",
			 @"roseVale" : @"Rose Vale",
			 @"rosevale" : @"Rose Vale",
			 @"rosewood" : @"Rosewood",
			 @"rosewood" : @"Rosewood",
			 @"rossoCorsa" : @"Rosso Corsa",
			 @"rossocorsa" : @"Rosso Corsa",
			 @"rosyBrown" : @"Rosy Brown",
			 @"rosybrown" : @"Rosy Brown",
			 @"royalAzure" : @"Royal Azure",
			 @"royalazure" : @"Royal Azure",
			 @"royalBlue" : @"Royal Blue",
			 @"royalblue" : @"Royal Blue",
			 @"royalBlue2" : @"Royal Blue",
			 @"royalblue2" : @"Royal Blue",
			 @"royalFuchsia" : @"Royal Fuchsia",
			 @"royalfuchsia" : @"Royal Fuchsia",
			 @"royalPurple" : @"Royal Purple",
			 @"royalpurple" : @"Royal Purple",
			 @"royalYellow" : @"Royal Yellow",
			 @"royalyellow" : @"Royal Yellow",
			 @"ruber" : @"Ruber",
			 @"ruber" : @"Ruber",
			 @"rubineRed" : @"Rubine Red",
			 @"rubinered" : @"Rubine Red",
			 @"ruby" : @"Ruby",
			 @"ruby" : @"Ruby",
			 @"rubyRed" : @"Ruby Red",
			 @"rubyred" : @"Ruby Red",
			 @"ruddy" : @"Ruddy",
			 @"ruddy" : @"Ruddy",
			 @"ruddyBrown" : @"Ruddy Brown",
			 @"ruddybrown" : @"Ruddy Brown",
			 @"ruddyPink" : @"Ruddy Pink",
			 @"ruddypink" : @"Ruddy Pink",
			 @"rufous" : @"Rufous",
			 @"rufous" : @"Rufous",
			 @"russet" : @"Russet",
			 @"russet" : @"Russet",
			 @"russianGreen" : @"Russian Green",
			 @"russiangreen" : @"Russian Green",
			 @"russianViolet" : @"Russian Violet",
			 @"russianviolet" : @"Russian Violet",
			 @"rust" : @"Rust",
			 @"rust" : @"Rust",
			 @"rustyRed" : @"Rusty Red",
			 @"rustyred" : @"Rusty Red",
			 @"sacramentoStateGreen" : @"Sacramento State Green",
			 @"sacramentostategreen" : @"Sacramento State Green",
			 @"saddleBrown" : @"Saddle Brown",
			 @"saddlebrown" : @"Saddle Brown",
			 @"safetyOrange" : @"Safety Orange",
			 @"safetyorange" : @"Safety Orange",
			 @"safetyOrangeBlazeOrange" : @"Safety Orange (Blaze Orange)",
			 @"safetyorangeblazeorange" : @"Safety Orange (Blaze Orange)",
			 @"safetyYellow" : @"Safety Yellow",
			 @"safetyyellow" : @"Safety Yellow",
			 @"saffron" : @"Saffron",
			 @"saffron" : @"Saffron",
			 @"sage" : @"Sage",
			 @"sage" : @"Sage",
			 @"stPatricksBlue" : @"St. Patrick's Blue",
			 @"stpatricksblue" : @"St. Patrick's Blue",
			 @"salmon" : @"Salmon",
			 @"salmon" : @"Salmon",
			 @"salmonPink" : @"Salmon Pink",
			 @"salmonpink" : @"Salmon Pink",
			 @"sand" : @"Sand",
			 @"sand" : @"Sand",
			 @"sandDune" : @"Sand Dune",
			 @"sanddune" : @"Sand Dune",
			 @"sandstorm" : @"Sandstorm",
			 @"sandstorm" : @"Sandstorm",
			 @"sandyBrown" : @"Sandy Brown",
			 @"sandybrown" : @"Sandy Brown",
			 @"sandyTaupe" : @"Sandy Taupe",
			 @"sandytaupe" : @"Sandy Taupe",
			 @"sangria" : @"Sangria",
			 @"sangria" : @"Sangria",
			 @"sapGreen" : @"Sap Green",
			 @"sapgreen" : @"Sap Green",
			 @"sapphire" : @"Sapphire",
			 @"sapphire" : @"Sapphire",
			 @"sapphireBlue" : @"Sapphire Blue",
			 @"sapphireblue" : @"Sapphire Blue",
			 @"satinSheenGold" : @"Satin Sheen Gold",
			 @"satinsheengold" : @"Satin Sheen Gold",
			 @"scarlet" : @"Scarlet",
			 @"scarlet" : @"Scarlet",
			 @"scarlet2" : @"Scarlet",
			 @"scarlet2" : @"Scarlet",
			 @"schaussPink" : @"Schauss Pink",
			 @"schausspink" : @"Schauss Pink",
			 @"schoolBusYellow" : @"School Bus Yellow",
			 @"schoolbusyellow" : @"School Bus Yellow",
			 @"screaminGreen" : @"Screamin' Green",
			 @"screamingreen" : @"Screamin' Green",
			 @"seaBlue" : @"Sea Blue",
			 @"seablue" : @"Sea Blue",
			 @"seaGreen" : @"Sea Green",
			 @"seagreen" : @"Sea Green",
			 @"sealBrown" : @"Seal Brown",
			 @"sealbrown" : @"Seal Brown",
			 @"seashell" : @"Seashell",
			 @"seashell" : @"Seashell",
			 @"selectiveYellow" : @"Selective Yellow",
			 @"selectiveyellow" : @"Selective Yellow",
			 @"sepia" : @"Sepia",
			 @"sepia" : @"Sepia",
			 @"shadow" : @"Shadow",
			 @"shadow" : @"Shadow",
			 @"shadowBlue" : @"Shadow Blue",
			 @"shadowblue" : @"Shadow Blue",
			 @"shampoo" : @"Shampoo",
			 @"shampoo" : @"Shampoo",
			 @"shamrockGreen" : @"Shamrock Green",
			 @"shamrockgreen" : @"Shamrock Green",
			 @"sheenGreen" : @"Sheen Green",
			 @"sheengreen" : @"Sheen Green",
			 @"shimmeringBlush" : @"Shimmering Blush",
			 @"shimmeringblush" : @"Shimmering Blush",
			 @"shockingPink" : @"Shocking Pink",
			 @"shockingpink" : @"Shocking Pink",
			 @"shockingPinkCrayola" : @"Shocking Pink (Crayola)",
			 @"shockingpinkcrayola" : @"Shocking Pink (Crayola)",
			 @"sienna" : @"Sienna",
			 @"sienna" : @"Sienna",
			 @"silver" : @"Silver",
			 @"silver" : @"Silver",
			 @"silverChalice" : @"Silver Chalice",
			 @"silverchalice" : @"Silver Chalice",
			 @"silverLakeBlue" : @"Silver Lake Blue",
			 @"silverlakeblue" : @"Silver Lake Blue",
			 @"silverPink" : @"Silver Pink",
			 @"silverpink" : @"Silver Pink",
			 @"silverSand" : @"Silver Sand",
			 @"silversand" : @"Silver Sand",
			 @"sinopia" : @"Sinopia",
			 @"sinopia" : @"Sinopia",
			 @"skobeloff" : @"Skobeloff",
			 @"skobeloff" : @"Skobeloff",
			 @"skyBlue" : @"Sky Blue",
			 @"skyblue" : @"Sky Blue",
			 @"skyMagenta" : @"Sky Magenta",
			 @"skymagenta" : @"Sky Magenta",
			 @"slateBlue" : @"Slate Blue",
			 @"slateblue" : @"Slate Blue",
			 @"slateGray" : @"Slate Gray",
			 @"slategray" : @"Slate Gray",
			 @"smaltDarkPowderBlue" : @"Smalt (Dark Powder Blue)",
			 @"smaltdarkpowderblue" : @"Smalt (Dark Powder Blue)",
			 @"smitten" : @"Smitten",
			 @"smitten" : @"Smitten",
			 @"smoke" : @"Smoke",
			 @"smoke" : @"Smoke",
			 @"smokyBlack" : @"Smoky Black",
			 @"smokyblack" : @"Smoky Black",
			 @"smokyTopaz" : @"Smoky Topaz",
			 @"smokytopaz" : @"Smoky Topaz",
			 @"snow" : @"Snow",
			 @"snow" : @"Snow",
			 @"soap" : @"Soap",
			 @"soap" : @"Soap",
			 @"solidPink" : @"Solid Pink",
			 @"solidpink" : @"Solid Pink",
			 @"sonicSilver" : @"Sonic Silver",
			 @"sonicsilver" : @"Sonic Silver",
			 @"spartanCrimson" : @"Spartan Crimson",
			 @"spartancrimson" : @"Spartan Crimson",
			 @"spaceCadet" : @"Space Cadet",
			 @"spacecadet" : @"Space Cadet",
			 @"spanishBistre" : @"Spanish Bistre",
			 @"spanishbistre" : @"Spanish Bistre",
			 @"spanishBlue" : @"Spanish Blue",
			 @"spanishblue" : @"Spanish Blue",
			 @"spanishCarmine" : @"Spanish Carmine",
			 @"spanishcarmine" : @"Spanish Carmine",
			 @"spanishCrimson" : @"Spanish Crimson",
			 @"spanishcrimson" : @"Spanish Crimson",
			 @"spanishGray" : @"Spanish Gray",
			 @"spanishgray" : @"Spanish Gray",
			 @"spanishGreen" : @"Spanish Green",
			 @"spanishgreen" : @"Spanish Green",
			 @"spanishOrange" : @"Spanish Orange",
			 @"spanishorange" : @"Spanish Orange",
			 @"spanishPink" : @"Spanish Pink",
			 @"spanishpink" : @"Spanish Pink",
			 @"spanishRed" : @"Spanish Red",
			 @"spanishred" : @"Spanish Red",
			 @"spanishSkyBlue" : @"Spanish Sky Blue",
			 @"spanishskyblue" : @"Spanish Sky Blue",
			 @"spanishViolet" : @"Spanish Violet",
			 @"spanishviolet" : @"Spanish Violet",
			 @"spanishViridian" : @"Spanish Viridian",
			 @"spanishviridian" : @"Spanish Viridian",
			 @"spicyMix" : @"Spicy Mix",
			 @"spicymix" : @"Spicy Mix",
			 @"spiroDiscoBall" : @"Spiro Disco Ball",
			 @"spirodiscoball" : @"Spiro Disco Ball",
			 @"springBud" : @"Spring Bud",
			 @"springbud" : @"Spring Bud",
			 @"springGreen" : @"Spring Green",
			 @"springgreen" : @"Spring Green",
			 @"starCommandBlue" : @"Star Command Blue",
			 @"starcommandblue" : @"Star Command Blue",
			 @"steelBlue" : @"Steel Blue",
			 @"steelblue" : @"Steel Blue",
			 @"steelPink" : @"Steel Pink",
			 @"steelpink" : @"Steel Pink",
			 @"stilDeGrainYellow" : @"Stil De Grain Yellow",
			 @"stildegrainyellow" : @"Stil De Grain Yellow",
			 @"stizza" : @"Stizza",
			 @"stizza" : @"Stizza",
			 @"stormcloud" : @"Stormcloud",
			 @"stormcloud" : @"Stormcloud",
			 @"straw" : @"Straw",
			 @"straw" : @"Straw",
			 @"strawberry" : @"Strawberry",
			 @"strawberry" : @"Strawberry",
			 @"sunglow" : @"Sunglow",
			 @"sunglow" : @"Sunglow",
			 @"sunray" : @"Sunray",
			 @"sunray" : @"Sunray",
			 @"sunset" : @"Sunset",
			 @"sunset" : @"Sunset",
			 @"sunsetOrange" : @"Sunset Orange",
			 @"sunsetorange" : @"Sunset Orange",
			 @"superPink" : @"Super Pink",
			 @"superpink" : @"Super Pink",
			 @"tan" : @"Tan",
			 @"tan" : @"Tan",
			 @"tangelo" : @"Tangelo",
			 @"tangelo" : @"Tangelo",
			 @"tangerine" : @"Tangerine",
			 @"tangerine" : @"Tangerine",
			 @"tangerineYellow" : @"Tangerine Yellow",
			 @"tangerineyellow" : @"Tangerine Yellow",
			 @"tangoPink" : @"Tango Pink",
			 @"tangopink" : @"Tango Pink",
			 @"taupe" : @"Taupe",
			 @"taupe" : @"Taupe",
			 @"taupeGray" : @"Taupe Gray",
			 @"taupegray" : @"Taupe Gray",
			 @"teaGreen" : @"Tea Green",
			 @"teagreen" : @"Tea Green",
			 @"teaRose" : @"Tea Rose",
			 @"tearose" : @"Tea Rose",
			 @"teaRose2" : @"Tea Rose",
			 @"tearose2" : @"Tea Rose",
			 @"teal" : @"Teal",
			 @"teal" : @"Teal",
			 @"tealBlue" : @"Teal Blue",
			 @"tealblue" : @"Teal Blue",
			 @"tealDeer" : @"Teal Deer",
			 @"tealdeer" : @"Teal Deer",
			 @"tealGreen" : @"Teal Green",
			 @"tealgreen" : @"Teal Green",
			 @"telemagenta" : @"Telemagenta",
			 @"telemagenta" : @"Telemagenta",
			 @"tenne" : @"Tenne",
			 @"tenne" : @"Tenne",
			 @"terraCotta" : @"Terra Cotta",
			 @"terracotta" : @"Terra Cotta",
			 @"thistle" : @"Thistle",
			 @"thistle" : @"Thistle",
			 @"thulianPink" : @"Thulian Pink",
			 @"thulianpink" : @"Thulian Pink",
			 @"tickleMePink" : @"Tickle Me Pink",
			 @"ticklemepink" : @"Tickle Me Pink",
			 @"tiffanyBlue" : @"Tiffany Blue",
			 @"tiffanyblue" : @"Tiffany Blue",
			 @"tigersEye" : @"Tiger's Eye",
			 @"tigerseye" : @"Tiger's Eye",
			 @"timberwolf" : @"Timberwolf",
			 @"timberwolf" : @"Timberwolf",
			 @"titaniumYellow" : @"Titanium Yellow",
			 @"titaniumyellow" : @"Titanium Yellow",
			 @"tomato" : @"Tomato",
			 @"tomato" : @"Tomato",
			 @"toolbox" : @"Toolbox",
			 @"toolbox" : @"Toolbox",
			 @"topaz" : @"Topaz",
			 @"topaz" : @"Topaz",
			 @"tractorRed" : @"Tractor Red",
			 @"tractorred" : @"Tractor Red",
			 @"trolleyGrey" : @"Trolley Grey",
			 @"trolleygrey" : @"Trolley Grey",
			 @"tropicalRainForest" : @"Tropical Rain Forest",
			 @"tropicalrainforest" : @"Tropical Rain Forest",
			 @"trueBlue" : @"True Blue",
			 @"trueblue" : @"True Blue",
			 @"tuftsBlue" : @"Tufts Blue",
			 @"tuftsblue" : @"Tufts Blue",
			 @"tulip" : @"Tulip",
			 @"tulip" : @"Tulip",
			 @"tumbleweed" : @"Tumbleweed",
			 @"tumbleweed" : @"Tumbleweed",
			 @"turkishRose" : @"Turkish Rose",
			 @"turkishrose" : @"Turkish Rose",
			 @"turquoise" : @"Turquoise",
			 @"turquoise" : @"Turquoise",
			 @"turquoiseBlue" : @"Turquoise Blue",
			 @"turquoiseblue" : @"Turquoise Blue",
			 @"turquoiseGreen" : @"Turquoise Green",
			 @"turquoisegreen" : @"Turquoise Green",
			 @"tuscan" : @"Tuscan",
			 @"tuscan" : @"Tuscan",
			 @"tuscanBrown" : @"Tuscan Brown",
			 @"tuscanbrown" : @"Tuscan Brown",
			 @"tuscanRed" : @"Tuscan Red",
			 @"tuscanred" : @"Tuscan Red",
			 @"tuscanTan" : @"Tuscan Tan",
			 @"tuscantan" : @"Tuscan Tan",
			 @"tuscany" : @"Tuscany",
			 @"tuscany" : @"Tuscany",
			 @"twilightLavender" : @"Twilight Lavender",
			 @"twilightlavender" : @"Twilight Lavender",
			 @"tyrianPurple" : @"Tyrian Purple",
			 @"tyrianpurple" : @"Tyrian Purple",
			 @"uABlue" : @"UA Blue",
			 @"uablue" : @"UA Blue",
			 @"uARed" : @"UA Red",
			 @"uared" : @"UA Red",
			 @"ube" : @"Ube",
			 @"ube" : @"Ube",
			 @"uCLABlue" : @"UCLA Blue",
			 @"uclablue" : @"UCLA Blue",
			 @"uCLAGold" : @"UCLA Gold",
			 @"uclagold" : @"UCLA Gold",
			 @"uFOGreen" : @"UFO Green",
			 @"ufogreen" : @"UFO Green",
			 @"ultramarine" : @"Ultramarine",
			 @"ultramarine" : @"Ultramarine",
			 @"ultramarineBlue" : @"Ultramarine Blue",
			 @"ultramarineblue" : @"Ultramarine Blue",
			 @"ultraPink" : @"Ultra Pink",
			 @"ultrapink" : @"Ultra Pink",
			 @"ultraRed" : @"Ultra Red",
			 @"ultrared" : @"Ultra Red",
			 @"umber" : @"Umber",
			 @"umber" : @"Umber",
			 @"unbleachedSilk" : @"Unbleached Silk",
			 @"unbleachedsilk" : @"Unbleached Silk",
			 @"unitedNationsBlue" : @"United Nations Blue",
			 @"unitednationsblue" : @"United Nations Blue",
			 @"universityOfCaliforniaGold" : @"University Of California Gold",
			 @"universityofcaliforniagold" : @"University Of California Gold",
			 @"unmellowYellow" : @"Unmellow Yellow",
			 @"unmellowyellow" : @"Unmellow Yellow",
			 @"uPForestGreen" : @"UP Forest Green",
			 @"upforestgreen" : @"UP Forest Green",
			 @"uPMaroon" : @"UP Maroon",
			 @"upmaroon" : @"UP Maroon",
			 @"upsdellRed" : @"Upsdell Red",
			 @"upsdellred" : @"Upsdell Red",
			 @"urobilin" : @"Urobilin",
			 @"urobilin" : @"Urobilin",
			 @"uSAFABlue" : @"USAFA Blue",
			 @"usafablue" : @"USAFA Blue",
			 @"uSCCardinal" : @"USC Cardinal",
			 @"usccardinal" : @"USC Cardinal",
			 @"uSCGold" : @"USC Gold",
			 @"uscgold" : @"USC Gold",
			 @"universityOfTennesseeOrange" : @"University Of Tennessee Orange",
			 @"universityoftennesseeorange" : @"University Of Tennessee Orange",
			 @"utahCrimson" : @"Utah Crimson",
			 @"utahcrimson" : @"Utah Crimson",
			 @"vanilla" : @"Vanilla",
			 @"vanilla" : @"Vanilla",
			 @"vanillaIce" : @"Vanilla Ice",
			 @"vanillaice" : @"Vanilla Ice",
			 @"vegasGold" : @"Vegas Gold",
			 @"vegasgold" : @"Vegas Gold",
			 @"venetianRed" : @"Venetian Red",
			 @"venetianred" : @"Venetian Red",
			 @"verdigris" : @"Verdigris",
			 @"verdigris" : @"Verdigris",
			 @"vermilion" : @"Vermilion",
			 @"vermilion" : @"Vermilion",
			 @"vermilion2" : @"Vermilion",
			 @"vermilion2" : @"Vermilion",
			 @"veronica" : @"Veronica",
			 @"veronica" : @"Veronica",
			 @"veryLightAzure" : @"Very Light Azure",
			 @"verylightazure" : @"Very Light Azure",
			 @"veryLightBlue" : @"Very Light Blue",
			 @"verylightblue" : @"Very Light Blue",
			 @"veryLightMalachiteGreen" : @"Very Light Malachite Green",
			 @"verylightmalachitegreen" : @"Very Light Malachite Green",
			 @"veryLightTangelo" : @"Very Light Tangelo",
			 @"verylighttangelo" : @"Very Light Tangelo",
			 @"veryPaleOrange" : @"Very Pale Orange",
			 @"verypaleorange" : @"Very Pale Orange",
			 @"veryPaleYellow" : @"Very Pale Yellow",
			 @"verypaleyellow" : @"Very Pale Yellow",
			 @"violet" : @"Violet",
			 @"violet" : @"Violet",
			 @"violetColorWheel" : @"Violet (Color Wheel)",
			 @"violetcolorwheel" : @"Violet (Color Wheel)",
			 @"violetRYB" : @"Violet (RYB)",
			 @"violetryb" : @"Violet (RYB)",
			 @"violetWeb" : @"Violet (Web)",
			 @"violetweb" : @"Violet (Web)",
			 @"violetBlue" : @"Violet-Blue",
			 @"violetblue" : @"Violet-Blue",
			 @"violetRed" : @"Violet-Red",
			 @"violetred" : @"Violet-Red",
			 @"viridian" : @"Viridian",
			 @"viridian" : @"Viridian",
			 @"viridianGreen" : @"Viridian Green",
			 @"viridiangreen" : @"Viridian Green",
			 @"vistaBlue" : @"Vista Blue",
			 @"vistablue" : @"Vista Blue",
			 @"vividAmber" : @"Vivid Amber",
			 @"vividamber" : @"Vivid Amber",
			 @"vividAuburn" : @"Vivid Auburn",
			 @"vividauburn" : @"Vivid Auburn",
			 @"vividBurgundy" : @"Vivid Burgundy",
			 @"vividburgundy" : @"Vivid Burgundy",
			 @"vividCerise" : @"Vivid Cerise",
			 @"vividcerise" : @"Vivid Cerise",
			 @"vividCerulean" : @"Vivid Cerulean",
			 @"vividcerulean" : @"Vivid Cerulean",
			 @"vividCrimson" : @"Vivid Crimson",
			 @"vividcrimson" : @"Vivid Crimson",
			 @"vividGamboge" : @"Vivid Gamboge",
			 @"vividgamboge" : @"Vivid Gamboge",
			 @"vividLimeGreen" : @"Vivid Lime Green",
			 @"vividlimegreen" : @"Vivid Lime Green",
			 @"vividMalachite" : @"Vivid Malachite",
			 @"vividmalachite" : @"Vivid Malachite",
			 @"vividMulberry" : @"Vivid Mulberry",
			 @"vividmulberry" : @"Vivid Mulberry",
			 @"vividOrange" : @"Vivid Orange",
			 @"vividorange" : @"Vivid Orange",
			 @"vividOrangePeel" : @"Vivid Orange Peel",
			 @"vividorangepeel" : @"Vivid Orange Peel",
			 @"vividOrchid" : @"Vivid Orchid",
			 @"vividorchid" : @"Vivid Orchid",
			 @"vividRaspberry" : @"Vivid Raspberry",
			 @"vividraspberry" : @"Vivid Raspberry",
			 @"vividRed" : @"Vivid Red",
			 @"vividred" : @"Vivid Red",
			 @"vividRedTangelo" : @"Vivid Red-Tangelo",
			 @"vividredtangelo" : @"Vivid Red-Tangelo",
			 @"vividSkyBlue" : @"Vivid Sky Blue",
			 @"vividskyblue" : @"Vivid Sky Blue",
			 @"vividTangelo" : @"Vivid Tangelo",
			 @"vividtangelo" : @"Vivid Tangelo",
			 @"vividTangerine" : @"Vivid Tangerine",
			 @"vividtangerine" : @"Vivid Tangerine",
			 @"vividVermilion" : @"Vivid Vermilion",
			 @"vividvermilion" : @"Vivid Vermilion",
			 @"vividViolet" : @"Vivid Violet",
			 @"vividviolet" : @"Vivid Violet",
			 @"vividYellow" : @"Vivid Yellow",
			 @"vividyellow" : @"Vivid Yellow",
			 @"warmBlack" : @"Warm Black",
			 @"warmblack" : @"Warm Black",
			 @"waterspout" : @"Waterspout",
			 @"waterspout" : @"Waterspout",
			 @"wenge" : @"Wenge",
			 @"wenge" : @"Wenge",
			 @"wheat" : @"Wheat",
			 @"wheat" : @"Wheat",
			 @"white" : @"White",
			 @"white" : @"White",
			 @"whiteSmoke" : @"White Smoke",
			 @"whitesmoke" : @"White Smoke",
			 @"wildBlueYonder" : @"Wild Blue Yonder",
			 @"wildblueyonder" : @"Wild Blue Yonder",
			 @"wildOrchid" : @"Wild Orchid",
			 @"wildorchid" : @"Wild Orchid",
			 @"wildStrawberry" : @"Wild Strawberry",
			 @"wildstrawberry" : @"Wild Strawberry",
			 @"wildWatermelon" : @"Wild Watermelon",
			 @"wildwatermelon" : @"Wild Watermelon",
			 @"willpowerOrange" : @"Willpower Orange",
			 @"willpowerorange" : @"Willpower Orange",
			 @"windsorTan" : @"Windsor Tan",
			 @"windsortan" : @"Windsor Tan",
			 @"wine" : @"Wine",
			 @"wine" : @"Wine",
			 @"wineDregs" : @"Wine Dregs",
			 @"winedregs" : @"Wine Dregs",
			 @"wisteria" : @"Wisteria",
			 @"wisteria" : @"Wisteria",
			 @"woodBrown" : @"Wood Brown",
			 @"woodbrown" : @"Wood Brown",
			 @"xanadu" : @"Xanadu",
			 @"xanadu" : @"Xanadu",
			 @"yaleBlue" : @"Yale Blue",
			 @"yaleblue" : @"Yale Blue",
			 @"yankeesBlue" : @"Yankees Blue",
			 @"yankeesblue" : @"Yankees Blue",
			 @"yellow" : @"Yellow",
			 @"yellow" : @"Yellow",
			 @"yellowCrayola" : @"Yellow (Crayola)",
			 @"yellowcrayola" : @"Yellow (Crayola)",
			 @"yellowMunsell" : @"Yellow (Munsell)",
			 @"yellowmunsell" : @"Yellow (Munsell)",
			 @"yellowNCS" : @"Yellow (NCS)",
			 @"yellowncs" : @"Yellow (NCS)",
			 @"yellowPantone" : @"Yellow (Pantone)",
			 @"yellowpantone" : @"Yellow (Pantone)",
			 @"yellowProcess" : @"Yellow (Process)",
			 @"yellowprocess" : @"Yellow (Process)",
			 @"yellowRYB" : @"Yellow (RYB)",
			 @"yellowryb" : @"Yellow (RYB)",
			 @"yellowGreen" : @"Yellow-Green",
			 @"yellowgreen" : @"Yellow-Green",
			 @"yellowOrange" : @"Yellow Orange",
			 @"yelloworange" : @"Yellow Orange",
			 @"yellowRose" : @"Yellow Rose",
			 @"yellowrose" : @"Yellow Rose",
			 @"zaffre" : @"Zaffre",
			 @"zaffre" : @"Zaffre",
			 @"zinnwalditeBrown" : @"Zinnwaldite Brown",
			 @"zinnwalditebrown" : @"Zinnwaldite Brown",
			 @"zomp" : @"Zomp",
			 @"zomp" : @"Zomp",
			 @"blackColor" : @"Black",
			 @"blackcolor" : @"Black",
			 @"darkGrayColor" : @"DarkGray",
			 @"darkgraycolor" : @"DarkGray",
			 @"lightGrayColor" : @"LightGray",
			 @"lightgraycolor" : @"LightGray",
			 @"lightGrayColor" : @"LightGray",
			 @"lightgraycolor" : @"LightGray",
			 @"whiteColor" : @"White",
			 @"whitecolor" : @"White",
			 @"grayColor" : @"Gray",
			 @"graycolor" : @"Gray",
			 @"redColor" : @"Red",
			 @"redcolor" : @"Red",
			 @"greenColor" : @"Green",
			 @"greencolor" : @"Green",
			 @"blueColor" : @"Blue",
			 @"bluecolor" : @"Blue",
			 @"cyanColor" : @"Cyan",
			 @"cyancolor" : @"Cyan",
			 @"yellowColor" : @"Yellow",
			 @"yellowcolor" : @"Yellow",
			 @"magentaColor" : @"Magenta",
			 @"magentacolor" : @"Magenta",
			 @"orangeColor" : @"Orange",
			 @"orangecolor" : @"Orange",
			 @"purpleColor" : @"Purple",
			 @"purplecolor" : @"Purple",
			 @"brownColor" : @"Brown",
			 @"browncolor" : @"Brown",
			 @"clearColor" : @"Clear",
			 @"clearcolor" : @"Clear"};
}

#pragma mark - Colors

+ (NKFColor *)acidGreen {
	NKFColor *acidGreen = [NKFColor colorWithRed:69.0f/100.0f green:0.75f blue:1.0f/10.0f alpha:1.0f];
	return acidGreen;
}

+ (NKFColor *)aero {
	NKFColor *aero = [NKFColor colorWithRed:49.0f/100.0f green:73.0f/100.0f blue:91.0f/100.0f alpha:1.0f];
	return aero;
}

+ (NKFColor *)aeroBlue {
	NKFColor *aeroBlue = [NKFColor colorWithRed:79.0f/100.0f green:1.0f blue:9.0f/10.0f alpha:1.0f];
	return aeroBlue;
}

+ (NKFColor *)africanViolet {
	NKFColor *africanViolet = [NKFColor colorWithRed:7.0f/10.0f green:52.0f/100.0f blue:0.75f alpha:1.0f];
	return africanViolet;
}

+ (NKFColor *)airForceBlueRAF {
	NKFColor *airForceBlueRAF = [NKFColor colorWithRed:36.0f/100.0f green:54.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
	return airForceBlueRAF;
}

+ (NKFColor *)airForceBlueUSAF {
	NKFColor *airForceBlueUSAF = [NKFColor colorWithRed:0.0f green:19.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
	return airForceBlueUSAF;
}

+ (NKFColor *)airSuperiorityBlue {
	NKFColor *airSuperiorityBlue = [NKFColor colorWithRed:45.0f/100.0f green:63.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
	return airSuperiorityBlue;
}

+ (NKFColor *)alabamaCrimson {
	NKFColor *alabamaCrimson = [NKFColor colorWithRed:69.0f/100.0f green:0.0f blue:16.0f/100.0f alpha:1.0f];
	return alabamaCrimson;
}

+ (NKFColor *)aliceBlue {
	NKFColor *aliceBlue = [NKFColor colorWithRed:94.0f/100.0f green:97.0f/100.0f blue:1.0f alpha:1.0f];
	return aliceBlue;
}

+ (NKFColor *)alizarinCrimson {
	NKFColor *alizarinCrimson = [NKFColor colorWithRed:89.0f/100.0f green:15.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
	return alizarinCrimson;
}

+ (NKFColor *)alloyOrange {
	NKFColor *alloyOrange = [NKFColor colorWithRed:77.0f/100.0f green:38.0f/100.0f blue:6.0f/100.0f alpha:1.0f];
	return alloyOrange;
}

+ (NKFColor *)almond {
	NKFColor *almond = [NKFColor colorWithRed:94.0f/100.0f green:87.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
	return almond;
}

+ (NKFColor *)amaranth {
	NKFColor *amaranth = [NKFColor colorWithRed:9.0f/10.0f green:0.1667f blue:31.0f/100.0f alpha:1.0f];
	return amaranth;
}

+ (NKFColor *)amaranthDeepPurple {
	NKFColor *amaranthDeepPurple = [NKFColor colorWithRed:0.667f green:15.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
	return amaranthDeepPurple;
}

+ (NKFColor *)amaranthPink {
	NKFColor *amaranthPink = [NKFColor colorWithRed:95.0f/100.0f green:61.0f/100.0f blue:73.0f/100.0f alpha:1.0f];
	return amaranthPink;
}

+ (NKFColor *)amaranthPurple {
	NKFColor *amaranthPurple = [NKFColor colorWithRed:0.667f green:15.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
	return amaranthPurple;
}

+ (NKFColor *)amaranthRed {
	NKFColor *amaranthRed = [NKFColor colorWithRed:83.0f/100.0f green:13.0f/100.0f blue:18.0f/100.0f alpha:1.0f];
	return amaranthRed;
}

+ (NKFColor *)amazonGreen {
	NKFColor *amazonGreen = [NKFColor colorWithRed:23.0f/100.0f green:48.0f/100.0f blue:34.0f/100.0f alpha:1.0f];
	return amazonGreen;
}

+ (NKFColor *)amber {
	NKFColor *amber = [NKFColor colorWithRed:1.0f green:0.75f blue:0.0f alpha:1.0f];
	return amber;
}

+ (NKFColor *)amberSAEECE {
	NKFColor *amberSAEECE = [NKFColor colorWithRed:1.0f green:49.0f/100.0f blue:0.0f alpha:1.0f];
	return amberSAEECE;
}

+ (NKFColor *)americanRose {
	NKFColor *americanRose = [NKFColor colorWithRed:1.0f green:1.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
	return americanRose;
}

+ (NKFColor *)amethyst {
	NKFColor *amethyst = [NKFColor colorWithRed:6.0f/10.0f green:4.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
	return amethyst;
}

+ (NKFColor *)androidGreen {
	NKFColor *androidGreen = [NKFColor colorWithRed:64.0f/100.0f green:78.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
	return androidGreen;
}

+ (NKFColor *)antiFlashWhite {
	NKFColor *antiFlashWhite = [NKFColor colorWithRed:95.0f/100.0f green:95.0f/100.0f blue:96.0f/100.0f alpha:1.0f];
	return antiFlashWhite;
}

+ (NKFColor *)antiqueBrass {
	NKFColor *antiqueBrass = [NKFColor colorWithRed:8.0f/10.0f green:58.0f/100.0f blue:46.0f/100.0f alpha:1.0f];
	return antiqueBrass;
}

+ (NKFColor *)antiqueBronze {
	NKFColor *antiqueBronze = [NKFColor colorWithRed:4.0f/10.0f green:36.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
	return antiqueBronze;
}

+ (NKFColor *)antiqueFuchsia {
	NKFColor *antiqueFuchsia = [NKFColor colorWithRed:57.0f/100.0f green:36.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
	return antiqueFuchsia;
}

+ (NKFColor *)antiqueRuby {
	NKFColor *antiqueRuby = [NKFColor colorWithRed:52.0f/100.0f green:11.0f/100.0f blue:18.0f/100.0f alpha:1.0f];
	return antiqueRuby;
}

+ (NKFColor *)antiqueWhite {
	NKFColor *antiqueWhite = [NKFColor colorWithRed:98.0f/100.0f green:92.0f/100.0f blue:84.0f/100.0f alpha:1.0f];
	return antiqueWhite;
}

+ (NKFColor *)aoEnglish {
	NKFColor *aoEnglish = [NKFColor colorWithRed:0.0f green:0.5f blue:0.0f alpha:1.0f];
	return aoEnglish;
}

+ (NKFColor *)appleGreen {
	NKFColor *appleGreen = [NKFColor colorWithRed:55.0f/100.0f green:71.0f/100.0f blue:0.0f alpha:1.0f];
	return appleGreen;
}

+ (NKFColor *)apricot {
	NKFColor *apricot = [NKFColor colorWithRed:98.0f/100.0f green:81.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
	return apricot;
}

+ (NKFColor *)aqua {
	NKFColor *aqua = [NKFColor colorWithRed:0.0f green:1.0f blue:1.0f alpha:1.0f];
	return aqua;
}

+ (NKFColor *)aquamarine {
	NKFColor *aquamarine = [NKFColor colorWithRed:0.5f green:1.0f blue:83.0f/100.0f alpha:1.0f];
	return aquamarine;
}

+ (NKFColor *)armyGreen {
	NKFColor *armyGreen = [NKFColor colorWithRed:29.0f/100.0f green:0.333f blue:13.0f/100.0f alpha:1.0f];
	return armyGreen;
}

+ (NKFColor *)arsenic {
	NKFColor *arsenic = [NKFColor colorWithRed:23.0f/100.0f green:27.0f/100.0f blue:29.0f/100.0f alpha:1.0f];
	return arsenic;
}

+ (NKFColor *)artichoke {
	NKFColor *artichoke = [NKFColor colorWithRed:56.0f/100.0f green:59.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
	return artichoke;
}

+ (NKFColor *)arylideYellow {
	NKFColor *arylideYellow = [NKFColor colorWithRed:91.0f/100.0f green:84.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
	return arylideYellow;
}

+ (NKFColor *)ashGrey {
	NKFColor *ashGrey = [NKFColor colorWithRed:7.0f/10.0f green:0.75f blue:71.0f/100.0f alpha:1.0f];
	return ashGrey;
}

+ (NKFColor *)asparagus {
	NKFColor *asparagus = [NKFColor colorWithRed:53.0f/100.0f green:66.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
	return asparagus;
}

+ (NKFColor *)atomicTangerine {
	NKFColor *atomicTangerine = [NKFColor colorWithRed:1.0f green:6.0f/10.0f blue:4.0f/10.0f alpha:1.0f];
	return atomicTangerine;
}

+ (NKFColor *)auburn {
	NKFColor *auburn = [NKFColor colorWithRed:65.0f/100.0f green:16.0f/100.0f blue:16.0f/100.0f alpha:1.0f];
	return auburn;
}

+ (NKFColor *)aureolin {
	NKFColor *aureolin = [NKFColor colorWithRed:99.0f/100.0f green:93.0f/100.0f blue:0.0f alpha:1.0f];
	return aureolin;
}

+ (NKFColor *)auroMetalSaurus {
	NKFColor *auroMetalSaurus = [NKFColor colorWithRed:43.0f/100.0f green:0.5f blue:0.5f alpha:1.0f];
	return auroMetalSaurus;
}

+ (NKFColor *)avocado {
	NKFColor *avocado = [NKFColor colorWithRed:34.0f/100.0f green:51.0f/100.0f blue:1.0f/100.0f alpha:1.0f];
	return avocado;
}

+ (NKFColor *)azure {
	NKFColor *azure = [NKFColor colorWithRed:0.0f green:0.5f blue:1.0f alpha:1.0f];
	return azure;
}

+ (NKFColor *)azureWebColor {
	NKFColor *azureWebColor = [NKFColor colorWithRed:94.0f/100.0f green:1.0f blue:1.0f alpha:1.0f];
	return azureWebColor;
}

+ (NKFColor *)azureMist {
	NKFColor *azureMist = [NKFColor colorWithRed:94.0f/100.0f green:1.0f blue:1.0f alpha:1.0f];
	return azureMist;
}

+ (NKFColor *)azureishWhite {
	NKFColor *azureishWhite = [NKFColor colorWithRed:86.0f/100.0f green:91.0f/100.0f blue:96.0f/100.0f alpha:1.0f];
	return azureishWhite;
}

+ (NKFColor *)babyBlue {
	NKFColor *babyBlue = [NKFColor colorWithRed:54.0f/100.0f green:81.0f/100.0f blue:94.0f/100.0f alpha:1.0f];
	return babyBlue;
}

+ (NKFColor *)babyBlueEyes {
	NKFColor *babyBlueEyes = [NKFColor colorWithRed:63.0f/100.0f green:79.0f/100.0f blue:95.0f/100.0f alpha:1.0f];
	return babyBlueEyes;
}

+ (NKFColor *)babyPink {
	NKFColor *babyPink = [NKFColor colorWithRed:96.0f/100.0f green:76.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
	return babyPink;
}

+ (NKFColor *)babyPowder {
	NKFColor *babyPowder = [NKFColor colorWithRed:1.0f green:1.0f blue:98.0f/100.0f alpha:1.0f];
	return babyPowder;
}

+ (NKFColor *)bakerMillerPink {
	NKFColor *bakerMillerPink = [NKFColor colorWithRed:1.0f green:57.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
	return bakerMillerPink;
}

+ (NKFColor *)ballBlue {
	NKFColor *ballBlue = [NKFColor colorWithRed:13.0f/100.0f green:0.667f blue:8.0f/10.0f alpha:1.0f];
	return ballBlue;
}

+ (NKFColor *)bananaMania {
	NKFColor *bananaMania = [NKFColor colorWithRed:98.0f/100.0f green:91.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
	return bananaMania;
}

+ (NKFColor *)bananaYellow {
	NKFColor *bananaYellow = [NKFColor colorWithRed:1.0f green:88.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
	return bananaYellow;
}

+ (NKFColor *)bangladeshGreen {
	NKFColor *bangladeshGreen = [NKFColor colorWithRed:0.0f green:42.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
	return bangladeshGreen;
}

+ (NKFColor *)barbiePink {
	NKFColor *barbiePink = [NKFColor colorWithRed:88.0f/100.0f green:13.0f/100.0f blue:54.0f/100.0f alpha:1.0f];
	return barbiePink;
}

+ (NKFColor *)barnRed {
	NKFColor *barnRed = [NKFColor colorWithRed:49.0f/100.0f green:4.0f/100.0f blue:1.0f/100.0f alpha:1.0f];
	return barnRed;
}

+ (NKFColor *)battleshipGrey {
	NKFColor *battleshipGrey = [NKFColor colorWithRed:52.0f/100.0f green:52.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
	return battleshipGrey;
}

+ (NKFColor *)bazaar {
	NKFColor *bazaar = [NKFColor colorWithRed:6.0f/10.0f green:47.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
	return bazaar;
}

+ (NKFColor *)beauBlue {
	NKFColor *beauBlue = [NKFColor colorWithRed:74.0f/100.0f green:83.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
	return beauBlue;
}

+ (NKFColor *)beaver {
	NKFColor *beaver = [NKFColor colorWithRed:62.0f/100.0f green:51.0f/100.0f blue:44.0f/100.0f alpha:1.0f];
	return beaver;
}

+ (NKFColor *)beige {
	NKFColor *beige = [NKFColor colorWithRed:96.0f/100.0f green:96.0f/100.0f blue:86.0f/100.0f alpha:1.0f];
	return beige;
}

+ (NKFColor *)bdazzledBlue {
	NKFColor *bdazzledBlue = [NKFColor colorWithRed:18.0f/100.0f green:35.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
	return bdazzledBlue;
}

+ (NKFColor *)bigDipOruby {
	NKFColor *bigDipOruby = [NKFColor colorWithRed:61.0f/100.0f green:15.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
	return bigDipOruby;
}

+ (NKFColor *)bisque {
	NKFColor *bisque = [NKFColor colorWithRed:1.0f green:89.0f/100.0f blue:77.0f/100.0f alpha:1.0f];
	return bisque;
}

+ (NKFColor *)bistre {
	NKFColor *bistre = [NKFColor colorWithRed:24.0f/100.0f green:0.1667f blue:12.0f/100.0f alpha:1.0f];
	return bistre;
}

+ (NKFColor *)bistreBrown {
	NKFColor *bistreBrown = [NKFColor colorWithRed:59.0f/100.0f green:44.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
	return bistreBrown;
}

+ (NKFColor *)bitterLemon {
	NKFColor *bitterLemon = [NKFColor colorWithRed:79.0f/100.0f green:88.0f/100.0f blue:5.0f/100.0f alpha:1.0f];
	return bitterLemon;
}

+ (NKFColor *)bitterLime {
	NKFColor *bitterLime = [NKFColor colorWithRed:0.75f green:1.0f blue:0.0f alpha:1.0f];
	return bitterLime;
}

+ (NKFColor *)bittersweet {
	NKFColor *bittersweet = [NKFColor colorWithRed:1.0f green:44.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
	return bittersweet;
}

+ (NKFColor *)bittersweetShimmer {
	NKFColor *bittersweetShimmer = [NKFColor colorWithRed:0.75f green:31.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
	return bittersweetShimmer;
}

+ (NKFColor *)black {
	NKFColor *black = [NKFColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
	return black;
}

+ (NKFColor *)blackBean {
	NKFColor *blackBean = [NKFColor colorWithRed:24.0f/100.0f green:5.0f/100.0f blue:1.0f/100.0f alpha:1.0f];
	return blackBean;
}

+ (NKFColor *)blackLeatherJacket {
	NKFColor *blackLeatherJacket = [NKFColor colorWithRed:15.0f/100.0f green:21.0f/100.0f blue:16.0f/100.0f alpha:1.0f];
	return blackLeatherJacket;
}

+ (NKFColor *)blackOlive {
	NKFColor *blackOlive = [NKFColor colorWithRed:23.0f/100.0f green:24.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
	return blackOlive;
}

+ (NKFColor *)blanchedAlmond {
	NKFColor *blanchedAlmond = [NKFColor colorWithRed:1.0f green:92.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
	return blanchedAlmond;
}

+ (NKFColor *)blastOffBronze {
	NKFColor *blastOffBronze = [NKFColor colorWithRed:65.0f/100.0f green:44.0f/100.0f blue:39.0f/100.0f alpha:1.0f];
	return blastOffBronze;
}

+ (NKFColor *)bleuDeFrance {
	NKFColor *bleuDeFrance = [NKFColor colorWithRed:19.0f/100.0f green:55.0f/100.0f blue:91.0f/100.0f alpha:1.0f];
	return bleuDeFrance;
}

+ (NKFColor *)blizzardBlue {
	NKFColor *blizzardBlue = [NKFColor colorWithRed:0.667f green:9.0f/10.0f blue:93.0f/100.0f alpha:1.0f];
	return blizzardBlue;
}

+ (NKFColor *)blond {
	NKFColor *blond = [NKFColor colorWithRed:98.0f/100.0f green:94.0f/100.0f blue:0.75f alpha:1.0f];
	return blond;
}

+ (NKFColor *)blue {
	NKFColor *blue = [NKFColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:1.0f];
	return blue;
}

+ (NKFColor *)blueCrayola {
	NKFColor *blueCrayola = [NKFColor colorWithRed:12.0f/100.0f green:46.0f/100.0f blue:1.0f alpha:1.0f];
	return blueCrayola;
}

+ (NKFColor *)blueMunsell {
	NKFColor *blueMunsell = [NKFColor colorWithRed:0.0f green:58.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
	return blueMunsell;
}

+ (NKFColor *)blueNCS {
	NKFColor *blueNCS = [NKFColor colorWithRed:0.0f green:53.0f/100.0f blue:74.0f/100.0f alpha:1.0f];
	return blueNCS;
}

+ (NKFColor *)bluePantone {
	NKFColor *bluePantone = [NKFColor colorWithRed:0.0f green:9.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
	return bluePantone;
}

+ (NKFColor *)bluePigment {
	NKFColor *bluePigment = [NKFColor colorWithRed:2.0f/10.0f green:2.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
	return bluePigment;
}

+ (NKFColor *)blueRYB {
	NKFColor *blueRYB = [NKFColor colorWithRed:1.0f/100.0f green:28.0f/100.0f blue:1.0f alpha:1.0f];
	return blueRYB;
}

+ (NKFColor *)blueBell {
	NKFColor *blueBell = [NKFColor colorWithRed:64.0f/100.0f green:64.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
	return blueBell;
}

+ (NKFColor *)blueGray {
	NKFColor *blueGray = [NKFColor colorWithRed:4.0f/10.0f green:6.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
	return blueGray;
}

+ (NKFColor *)blueGreen {
	NKFColor *blueGreen = [NKFColor colorWithRed:5.0f/100.0f green:6.0f/10.0f blue:73.0f/100.0f alpha:1.0f];
	return blueGreen;
}

+ (NKFColor *)blueLagoon {
	NKFColor *blueLagoon = [NKFColor colorWithRed:37.0f/100.0f green:58.0f/100.0f blue:63.0f/100.0f alpha:1.0f];
	return blueLagoon;
}

+ (NKFColor *)blueMagentaViolet {
	NKFColor *blueMagentaViolet = [NKFColor colorWithRed:0.333f green:21.0f/100.0f blue:57.0f/100.0f alpha:1.0f];
	return blueMagentaViolet;
}

+ (NKFColor *)blueSapphire {
	NKFColor *blueSapphire = [NKFColor colorWithRed:7.0f/100.0f green:38.0f/100.0f blue:0.5f alpha:1.0f];
	return blueSapphire;
}

+ (NKFColor *)blueViolet {
	NKFColor *blueViolet = [NKFColor colorWithRed:54.0f/100.0f green:0.1667f blue:89.0f/100.0f alpha:1.0f];
	return blueViolet;
}

+ (NKFColor *)blueYonder {
	NKFColor *blueYonder = [NKFColor colorWithRed:31.0f/100.0f green:45.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
	return blueYonder;
}

+ (NKFColor *)blueberry {
	NKFColor *blueberry = [NKFColor colorWithRed:31.0f/100.0f green:53.0f/100.0f blue:97.0f/100.0f alpha:1.0f];
	return blueberry;
}

+ (NKFColor *)bluebonnet {
	NKFColor *bluebonnet = [NKFColor colorWithRed:11.0f/100.0f green:11.0f/100.0f blue:94.0f/100.0f alpha:1.0f];
	return bluebonnet;
}

+ (NKFColor *)blush {
	NKFColor *blush = [NKFColor colorWithRed:87.0f/100.0f green:36.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
	return blush;
}

+ (NKFColor *)bole {
	NKFColor *bole = [NKFColor colorWithRed:47.0f/100.0f green:27.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
	return bole;
}

+ (NKFColor *)bondiBlue {
	NKFColor *bondiBlue = [NKFColor colorWithRed:0.0f green:58.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
	return bondiBlue;
}

+ (NKFColor *)bone {
	NKFColor *bone = [NKFColor colorWithRed:89.0f/100.0f green:85.0f/100.0f blue:79.0f/100.0f alpha:1.0f];
	return bone;
}

+ (NKFColor *)bostonUniversityRed {
	NKFColor *bostonUniversityRed = [NKFColor colorWithRed:8.0f/10.0f green:0.0f blue:0.0f alpha:1.0f];
	return bostonUniversityRed;
}

+ (NKFColor *)bottleGreen {
	NKFColor *bottleGreen = [NKFColor colorWithRed:0.0f green:42.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
	return bottleGreen;
}

+ (NKFColor *)boysenberry {
	NKFColor *boysenberry = [NKFColor colorWithRed:53.0f/100.0f green:2.0f/10.0f blue:38.0f/100.0f alpha:1.0f];
	return boysenberry;
}

+ (NKFColor *)brandeisBlue {
	NKFColor *brandeisBlue = [NKFColor colorWithRed:0.0f green:44.0f/100.0f blue:1.0f alpha:1.0f];
	return brandeisBlue;
}

+ (NKFColor *)brass {
	NKFColor *brass = [NKFColor colorWithRed:71.0f/100.0f green:65.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
	return brass;
}

+ (NKFColor *)brickRed {
	NKFColor *brickRed = [NKFColor colorWithRed:8.0f/10.0f green:0.25f blue:0.333f alpha:1.0f];
	return brickRed;
}

+ (NKFColor *)brightCerulean {
	NKFColor *brightCerulean = [NKFColor colorWithRed:11.0f/100.0f green:0.667f blue:84.0f/100.0f alpha:1.0f];
	return brightCerulean;
}

+ (NKFColor *)brightGreen {
	NKFColor *brightGreen = [NKFColor colorWithRed:4.0f/10.0f green:1.0f blue:0.0f alpha:1.0f];
	return brightGreen;
}

+ (NKFColor *)brightLavender {
	NKFColor *brightLavender = [NKFColor colorWithRed:0.75f green:58.0f/100.0f blue:89.0f/100.0f alpha:1.0f];
	return brightLavender;
}

+ (NKFColor *)brightLilac {
	NKFColor *brightLilac = [NKFColor colorWithRed:85.0f/100.0f green:57.0f/100.0f blue:94.0f/100.0f alpha:1.0f];
	return brightLilac;
}

+ (NKFColor *)brightMaroon {
	NKFColor *brightMaroon = [NKFColor colorWithRed:76.0f/100.0f green:13.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
	return brightMaroon;
}

+ (NKFColor *)brightNavyBlue {
	NKFColor *brightNavyBlue = [NKFColor colorWithRed:1.0f/10.0f green:45.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
	return brightNavyBlue;
}

+ (NKFColor *)brightPink {
	NKFColor *brightPink = [NKFColor colorWithRed:1.0f green:0.0f blue:0.5f alpha:1.0f];
	return brightPink;
}

+ (NKFColor *)brightTurquoise {
	NKFColor *brightTurquoise = [NKFColor colorWithRed:3.0f/100.0f green:91.0f/100.0f blue:87.0f/100.0f alpha:1.0f];
	return brightTurquoise;
}

+ (NKFColor *)brightUbe {
	NKFColor *brightUbe = [NKFColor colorWithRed:82.0f/100.0f green:62.0f/100.0f blue:91.0f/100.0f alpha:1.0f];
	return brightUbe;
}

+ (NKFColor *)brilliantAzure {
	NKFColor *brilliantAzure = [NKFColor colorWithRed:2.0f/10.0f green:6.0f/10.0f blue:1.0f alpha:1.0f];
	return brilliantAzure;
}

+ (NKFColor *)brilliantLavender {
	NKFColor *brilliantLavender = [NKFColor colorWithRed:96.0f/100.0f green:73.0f/100.0f blue:1.0f alpha:1.0f];
	return brilliantLavender;
}

+ (NKFColor *)brilliantRose {
	NKFColor *brilliantRose = [NKFColor colorWithRed:1.0f green:0.333f blue:64.0f/100.0f alpha:1.0f];
	return brilliantRose;
}

+ (NKFColor *)brinkPink {
	NKFColor *brinkPink = [NKFColor colorWithRed:98.0f/100.0f green:38.0f/100.0f blue:0.5f alpha:1.0f];
	return brinkPink;
}

+ (NKFColor *)britishRacingGreen {
	NKFColor *britishRacingGreen = [NKFColor colorWithRed:0.0f green:26.0f/100.0f blue:15.0f/100.0f alpha:1.0f];
	return britishRacingGreen;
}

+ (NKFColor *)bronze {
	NKFColor *bronze = [NKFColor colorWithRed:8.0f/10.0f green:0.5f blue:2.0f/10.0f alpha:1.0f];
	return bronze;
}

+ (NKFColor *)bronzeYellow {
	NKFColor *bronzeYellow = [NKFColor colorWithRed:45.0f/100.0f green:44.0f/100.0f blue:0.0f alpha:1.0f];
	return bronzeYellow;
}

+ (NKFColor *)brownTraditional {
	NKFColor *brownTraditional = [NKFColor colorWithRed:59.0f/100.0f green:29.0f/100.0f blue:0.0f alpha:1.0f];
	return brownTraditional;
}

+ (NKFColor *)brownWeb {
	NKFColor *brownWeb = [NKFColor colorWithRed:65.0f/100.0f green:16.0f/100.0f blue:16.0f/100.0f alpha:1.0f];
	return brownWeb;
}

+ (NKFColor *)brownNose {
	NKFColor *brownNose = [NKFColor colorWithRed:42.0f/100.0f green:27.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
	return brownNose;
}

+ (NKFColor *)brownYellow {
	NKFColor *brownYellow = [NKFColor colorWithRed:8.0f/10.0f green:6.0f/10.0f blue:4.0f/10.0f alpha:1.0f];
	return brownYellow;
}

+ (NKFColor *)brunswickGreen {
	NKFColor *brunswickGreen = [NKFColor colorWithRed:11.0f/100.0f green:3.0f/10.0f blue:24.0f/100.0f alpha:1.0f];
	return brunswickGreen;
}

+ (NKFColor *)bubbleGum {
	NKFColor *bubbleGum = [NKFColor colorWithRed:1.0f green:76.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
	return bubbleGum;
}

+ (NKFColor *)bubbles {
	NKFColor *bubbles = [NKFColor colorWithRed:91.0f/100.0f green:1.0f blue:1.0f alpha:1.0f];
	return bubbles;
}

+ (NKFColor *)buff {
	NKFColor *buff = [NKFColor colorWithRed:237.0f/255.0f green:222.0f/255.0f blue:132.0f/255.0f alpha:1.0f];
	return buff;
}

+ (NKFColor *)budGreen {
	NKFColor *budGreen = [NKFColor colorWithRed:48.0f/100.0f green:71.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
	return budGreen;
}

+ (NKFColor *)bulgarianRose {
	NKFColor *bulgarianRose = [NKFColor colorWithRed:28.0f/100.0f green:2.0f/100.0f blue:3.0f/100.0f alpha:1.0f];
	return bulgarianRose;
}

+ (NKFColor *)burgundy {
	NKFColor *burgundy = [NKFColor colorWithRed:0.5f green:0.0f blue:13.0f/100.0f alpha:1.0f];
	return burgundy;
}

+ (NKFColor *)burlywood {
	NKFColor *burlywood = [NKFColor colorWithRed:87.0f/100.0f green:72.0f/100.0f blue:53.0f/100.0f alpha:1.0f];
	return burlywood;
}

+ (NKFColor *)burntOrange {
	NKFColor *burntOrange = [NKFColor colorWithRed:8.0f/10.0f green:0.333f blue:0.0f alpha:1.0f];
	return burntOrange;
}

+ (NKFColor *)burntSienna {
	NKFColor *burntSienna = [NKFColor colorWithRed:91.0f/100.0f green:45.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
	return burntSienna;
}

+ (NKFColor *)burntUmber {
	NKFColor *burntUmber = [NKFColor colorWithRed:54.0f/100.0f green:2.0f/10.0f blue:14.0f/100.0f alpha:1.0f];
	return burntUmber;
}

+ (NKFColor *)byzantine {
	NKFColor *byzantine = [NKFColor colorWithRed:74.0f/100.0f green:2.0f/10.0f blue:64.0f/100.0f alpha:1.0f];
	return byzantine;
}

+ (NKFColor *)byzantium {
	NKFColor *byzantium = [NKFColor colorWithRed:44.0f/100.0f green:16.0f/100.0f blue:39.0f/100.0f alpha:1.0f];
	return byzantium;
}

+ (NKFColor *)cadet {
	NKFColor *cadet = [NKFColor colorWithRed:0.333f green:41.0f/100.0f blue:45.0f/100.0f alpha:1.0f];
	return cadet;
}

+ (NKFColor *)cadetBlue {
	NKFColor *cadetBlue = [NKFColor colorWithRed:37.0f/100.0f green:62.0f/100.0f blue:63.0f/100.0f alpha:1.0f];
	return cadetBlue;
}

+ (NKFColor *)cadetGrey {
	NKFColor *cadetGrey = [NKFColor colorWithRed:57.0f/100.0f green:64.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
	return cadetGrey;
}

+ (NKFColor *)cadmiumGreen {
	NKFColor *cadmiumGreen = [NKFColor colorWithRed:0.0f green:42.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
	return cadmiumGreen;
}

+ (NKFColor *)cadmiumOrange {
	NKFColor *cadmiumOrange = [NKFColor colorWithRed:93.0f/100.0f green:53.0f/100.0f blue:18.0f/100.0f alpha:1.0f];
	return cadmiumOrange;
}

+ (NKFColor *)cadmiumRed {
	NKFColor *cadmiumRed = [NKFColor colorWithRed:89.0f/100.0f green:0.0f blue:13.0f/100.0f alpha:1.0f];
	return cadmiumRed;
}

+ (NKFColor *)cadmiumYellow {
	NKFColor *cadmiumYellow = [NKFColor colorWithRed:1.0f green:96.0f/100.0f blue:0.0f alpha:1.0f];
	return cadmiumYellow;
}

+ (NKFColor *)caféAuLait {
	NKFColor *caféAuLait = [NKFColor colorWithRed:65.0f/100.0f green:48.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
	return caféAuLait;
}

+ (NKFColor *)caféNoir {
	NKFColor *caféNoir = [NKFColor colorWithRed:29.0f/100.0f green:21.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return caféNoir;
}

+ (NKFColor *)calPoly {
	NKFColor *calPoly = [NKFColor colorWithRed:12.0f/100.0f green:3.0f/10.0f blue:0.1667f alpha:1.0f];
	return calPoly;
}

+ (NKFColor *)calPolyGreen {
	NKFColor *calPolyGreen = [NKFColor colorWithRed:12.0f/100.0f green:3.0f/10.0f blue:0.1667f alpha:1.0f];
	return calPolyGreen;
}

+ (NKFColor *)cambridge {
	NKFColor *cambridge = [NKFColor colorWithRed:64.0f/100.0f green:76.0f/100.0f blue:68.0f/100.0f alpha:1.0f];
	return cambridge;
}

+ (NKFColor *)cambridgeBlue {
	NKFColor *cambridgeBlue = [NKFColor colorWithRed:64.0f/100.0f green:76.0f/100.0f blue:68.0f/100.0f alpha:1.0f];
	return cambridgeBlue;
}

+ (NKFColor *)camel {
	NKFColor *camel = [NKFColor colorWithRed:76.0f/100.0f green:6.0f/10.0f blue:42.0f/100.0f alpha:1.0f];
	return camel;
}

+ (NKFColor *)cameoPink {
	NKFColor *cameoPink = [NKFColor colorWithRed:94.0f/100.0f green:73.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
	return cameoPink;
}

+ (NKFColor *)camouflageGreen {
	NKFColor *camouflageGreen = [NKFColor colorWithRed:47.0f/100.0f green:53.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
	return camouflageGreen;
}

+ (NKFColor *)canaryYellow {
	NKFColor *canaryYellow = [NKFColor colorWithRed:1.0f green:94.0f/100.0f blue:0.0f alpha:1.0f];
	return canaryYellow;
}

+ (NKFColor *)candyAppleRed {
	NKFColor *candyAppleRed = [NKFColor colorWithRed:1.0f green:3.0f/100.0f blue:0.0f alpha:1.0f];
	return candyAppleRed;
}

+ (NKFColor *)candyPink {
	NKFColor *candyPink = [NKFColor colorWithRed:89.0f/100.0f green:44.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
	return candyPink;
}

+ (NKFColor *)capri {
	NKFColor *capri = [NKFColor colorWithRed:0.0f green:0.75f blue:1.0f alpha:1.0f];
	return capri;
}

+ (NKFColor *)caputMortuum {
	NKFColor *caputMortuum = [NKFColor colorWithRed:35.0f/100.0f green:15.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return caputMortuum;
}

+ (NKFColor *)cardinal {
	NKFColor *cardinal = [NKFColor colorWithRed:77.0f/100.0f green:12.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
	return cardinal;
}

+ (NKFColor *)caribbeanGreen {
	NKFColor *caribbeanGreen = [NKFColor colorWithRed:0.0f green:8.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
	return caribbeanGreen;
}

+ (NKFColor *)carmine {
	NKFColor *carmine = [NKFColor colorWithRed:59.0f/100.0f green:0.0f blue:9.0f/100.0f alpha:1.0f];
	return carmine;
}

+ (NKFColor *)carmineMP {
	NKFColor *carmineMP = [NKFColor colorWithRed:84.0f/100.0f green:0.0f blue:0.25f alpha:1.0f];
	return carmineMP;
}

+ (NKFColor *)carminePink {
	NKFColor *carminePink = [NKFColor colorWithRed:92.0f/100.0f green:3.0f/10.0f blue:26.0f/100.0f alpha:1.0f];
	return carminePink;
}

+ (NKFColor *)carmineRed {
	NKFColor *carmineRed = [NKFColor colorWithRed:1.0f green:0.0f blue:22.0f/100.0f alpha:1.0f];
	return carmineRed;
}

+ (NKFColor *)carnationPink {
	NKFColor *carnationPink = [NKFColor colorWithRed:1.0f green:65.0f/100.0f blue:79.0f/100.0f alpha:1.0f];
	return carnationPink;
}

+ (NKFColor *)carnelian {
	NKFColor *carnelian = [NKFColor colorWithRed:7.0f/10.0f green:11.0f/100.0f blue:11.0f/100.0f alpha:1.0f];
	return carnelian;
}

+ (NKFColor *)carolinaBlue {
	NKFColor *carolinaBlue = [NKFColor colorWithRed:34.0f/100.0f green:63.0f/100.0f blue:83.0f/100.0f alpha:1.0f];
	return carolinaBlue;
}

+ (NKFColor *)carrotOrange {
	NKFColor *carrotOrange = [NKFColor colorWithRed:93.0f/100.0f green:57.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return carrotOrange;
}

+ (NKFColor *)castletonGreen {
	NKFColor *castletonGreen = [NKFColor colorWithRed:0.0f green:34.0f/100.0f blue:0.25f alpha:1.0f];
	return castletonGreen;
}

+ (NKFColor *)catalinaBlue {
	NKFColor *catalinaBlue = [NKFColor colorWithRed:2.0f/100.0f green:16.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
	return catalinaBlue;
}

+ (NKFColor *)catawba {
	NKFColor *catawba = [NKFColor colorWithRed:44.0f/100.0f green:21.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
	return catawba;
}

+ (NKFColor *)cedarChest {
	NKFColor *cedarChest = [NKFColor colorWithRed:79.0f/100.0f green:35.0f/100.0f blue:29.0f/100.0f alpha:1.0f];
	return cedarChest;
}

+ (NKFColor *)ceil {
	NKFColor *ceil = [NKFColor colorWithRed:57.0f/100.0f green:63.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
	return ceil;
}

+ (NKFColor *)celadon {
	NKFColor *celadon = [NKFColor colorWithRed:0.667f green:88.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
	return celadon;
}

+ (NKFColor *)celadonBlue {
	NKFColor *celadonBlue = [NKFColor colorWithRed:0.0f green:48.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
	return celadonBlue;
}

+ (NKFColor *)celadonGreen {
	NKFColor *celadonGreen = [NKFColor colorWithRed:18.0f/100.0f green:52.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
	return celadonGreen;
}

+ (NKFColor *)celeste {
	NKFColor *celeste = [NKFColor colorWithRed:7.0f/10.0f green:1.0f blue:1.0f alpha:1.0f];
	return celeste;
}

+ (NKFColor *)celestialBlue {
	NKFColor *celestialBlue = [NKFColor colorWithRed:29.0f/100.0f green:59.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
	return celestialBlue;
}

+ (NKFColor *)cerise {
	NKFColor *cerise = [NKFColor colorWithRed:87.0f/100.0f green:19.0f/100.0f blue:39.0f/100.0f alpha:1.0f];
	return cerise;
}

+ (NKFColor *)cerisePink {
	NKFColor *cerisePink = [NKFColor colorWithRed:93.0f/100.0f green:23.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
	return cerisePink;
}

+ (NKFColor *)cerulean {
	NKFColor *cerulean = [NKFColor colorWithRed:0.0f green:48.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
	return cerulean;
}

+ (NKFColor *)ceruleanBlue {
	NKFColor *ceruleanBlue = [NKFColor colorWithRed:16.0f/100.0f green:32.0f/100.0f blue:0.75f alpha:1.0f];
	return ceruleanBlue;
}

+ (NKFColor *)ceruleanFrost {
	NKFColor *ceruleanFrost = [NKFColor colorWithRed:43.0f/100.0f green:61.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
	return ceruleanFrost;
}

+ (NKFColor *)cGBlue {
	NKFColor *cGBlue = [NKFColor colorWithRed:0.0f green:48.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
	return cGBlue;
}

+ (NKFColor *)cGRed {
	NKFColor *cGRed = [NKFColor colorWithRed:88.0f/100.0f green:24.0f/100.0f blue:19.0f/100.0f alpha:1.0f];
	return cGRed;
}

+ (NKFColor *)chamoisee {
	NKFColor *chamoisee = [NKFColor colorWithRed:63.0f/100.0f green:47.0f/100.0f blue:35.0f/100.0f alpha:1.0f];
	return chamoisee;
}

+ (NKFColor *)champagne {
	NKFColor *champagne = [NKFColor colorWithRed:97.0f/100.0f green:91.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
	return champagne;
}

+ (NKFColor *)charcoal {
	NKFColor *charcoal = [NKFColor colorWithRed:21.0f/100.0f green:27.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
	return charcoal;
}

+ (NKFColor *)charlestonGreen {
	NKFColor *charlestonGreen = [NKFColor colorWithRed:14.0f/100.0f green:0.1667f blue:0.1667f alpha:1.0f];
	return charlestonGreen;
}

+ (NKFColor *)charmPink {
	NKFColor *charmPink = [NKFColor colorWithRed:9.0f/10.0f green:56.0f/100.0f blue:0.667f alpha:1.0f];
	return charmPink;
}

+ (NKFColor *)chartreuseTraditional {
	NKFColor *chartreuseTraditional = [NKFColor colorWithRed:87.0f/100.0f green:1.0f blue:0.0f alpha:1.0f];
	return chartreuseTraditional;
}

+ (NKFColor *)chartreuseWeb {
	NKFColor *chartreuseWeb = [NKFColor colorWithRed:0.5f green:1.0f blue:0.0f alpha:1.0f];
	return chartreuseWeb;
}

+ (NKFColor *)cherry {
	NKFColor *cherry = [NKFColor colorWithRed:87.0f/100.0f green:19.0f/100.0f blue:39.0f/100.0f alpha:1.0f];
	return cherry;
}

+ (NKFColor *)cherryBlossomPink {
	NKFColor *cherryBlossomPink = [NKFColor colorWithRed:1.0f green:72.0f/100.0f blue:77.0f/100.0f alpha:1.0f];
	return cherryBlossomPink;
}

+ (NKFColor *)chestnut {
	NKFColor *chestnut = [NKFColor colorWithRed:58.0f/100.0f green:27.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
	return chestnut;
}

+ (NKFColor *)chinaPink {
	NKFColor *chinaPink = [NKFColor colorWithRed:87.0f/100.0f green:44.0f/100.0f blue:63.0f/100.0f alpha:1.0f];
	return chinaPink;
}

+ (NKFColor *)chinaRose {
	NKFColor *chinaRose = [NKFColor colorWithRed:66.0f/100.0f green:32.0f/100.0f blue:43.0f/100.0f alpha:1.0f];
	return chinaRose;
}

+ (NKFColor *)chineseRed {
	NKFColor *chineseRed = [NKFColor colorWithRed:0.667f green:22.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
	return chineseRed;
}

+ (NKFColor *)chineseViolet {
	NKFColor *chineseViolet = [NKFColor colorWithRed:52.0f/100.0f green:38.0f/100.0f blue:53.0f/100.0f alpha:1.0f];
	return chineseViolet;
}

+ (NKFColor *)chocolate {
    return [NKFColor chocolateTraditional];
}

+ (NKFColor *)chocolateTraditional {
	NKFColor *chocolateTraditional = [NKFColor colorWithRed:48.0f/100.0f green:0.25f blue:0.0f alpha:1.0f];
	return chocolateTraditional;
}

+ (NKFColor *)chocolateWeb {
	NKFColor *chocolateWeb = [NKFColor colorWithRed:82.0f/100.0f green:41.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
	return chocolateWeb;
}

+ (NKFColor *)chromeYellow {
	NKFColor *chromeYellow = [NKFColor colorWithRed:1.0f green:65.0f/100.0f blue:0.0f alpha:1.0f];
	return chromeYellow;
}

+ (NKFColor *)cinereous {
	NKFColor *cinereous = [NKFColor colorWithRed:6.0f/10.0f green:51.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
	return cinereous;
}

+ (NKFColor *)cinnabar {
	NKFColor *cinnabar = [NKFColor colorWithRed:89.0f/100.0f green:26.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
	return cinnabar;
}

+ (NKFColor *)cinnamonCitationNeeded {
	NKFColor *cinnamonCitationNeeded = [NKFColor colorWithRed:82.0f/100.0f green:41.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
	return cinnamonCitationNeeded;
}

+ (NKFColor *)citrine {
	NKFColor *citrine = [NKFColor colorWithRed:89.0f/100.0f green:82.0f/100.0f blue:4.0f/100.0f alpha:1.0f];
	return citrine;
}

+ (NKFColor *)citron {
	NKFColor *citron = [NKFColor colorWithRed:62.0f/100.0f green:66.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
	return citron;
}

+ (NKFColor *)claret {
	NKFColor *claret = [NKFColor colorWithRed:0.5f green:9.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
	return claret;
}

+ (NKFColor *)classicRose {
	NKFColor *classicRose = [NKFColor colorWithRed:98.0f/100.0f green:8.0f/10.0f blue:91.0f/100.0f alpha:1.0f];
	return classicRose;
}

+ (NKFColor *)cobaltBlue {
	NKFColor *cobaltBlue = [NKFColor colorWithRed:0.0f green:28.0f/100.0f blue:0.667f alpha:1.0f];
	return cobaltBlue;
}

+ (NKFColor *)cocoaBrown {
	NKFColor *cocoaBrown = [NKFColor colorWithRed:82.0f/100.0f green:41.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
	return cocoaBrown;
}

+ (NKFColor *)coconut {
	NKFColor *coconut = [NKFColor colorWithRed:59.0f/100.0f green:35.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
	return coconut;
}

+ (NKFColor *)coffee {
	NKFColor *coffee = [NKFColor colorWithRed:44.0f/100.0f green:31.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
	return coffee;
}

+ (NKFColor *)columbiaBlue {
	NKFColor *columbiaBlue = [NKFColor colorWithRed:77.0f/100.0f green:85.0f/100.0f blue:89.0f/100.0f alpha:1.0f];
	return columbiaBlue;
}

+ (NKFColor *)congoPink {
	NKFColor *congoPink = [NKFColor colorWithRed:97.0f/100.0f green:51.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
	return congoPink;
}

+ (NKFColor *)coolBlack {
	NKFColor *coolBlack = [NKFColor colorWithRed:0.0f green:18.0f/100.0f blue:39.0f/100.0f alpha:1.0f];
	return coolBlack;
}

+ (NKFColor *)coolGrey {
	NKFColor *coolGrey = [NKFColor colorWithRed:55.0f/100.0f green:57.0f/100.0f blue:0.667f alpha:1.0f];
	return coolGrey;
}

+ (NKFColor *)copper {
	NKFColor *copper = [NKFColor colorWithRed:72.0f/100.0f green:45.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
	return copper;
}

+ (NKFColor *)copperCrayola {
	NKFColor *copperCrayola = [NKFColor colorWithRed:85.0f/100.0f green:54.0f/100.0f blue:4.0f/10.0f alpha:1.0f];
	return copperCrayola;
}

+ (NKFColor *)copperPenny {
	NKFColor *copperPenny = [NKFColor colorWithRed:68.0f/100.0f green:44.0f/100.0f blue:41.0f/100.0f alpha:1.0f];
	return copperPenny;
}

+ (NKFColor *)copperRed {
	NKFColor *copperRed = [NKFColor colorWithRed:8.0f/10.0f green:43.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
	return copperRed;
}

+ (NKFColor *)copperRose {
	NKFColor *copperRose = [NKFColor colorWithRed:6.0f/10.0f green:4.0f/10.0f blue:4.0f/10.0f alpha:1.0f];
	return copperRose;
}

+ (NKFColor *)coquelicot {
	NKFColor *coquelicot = [NKFColor colorWithRed:1.0f green:22.0f/100.0f blue:0.0f alpha:1.0f];
	return coquelicot;
}

+ (NKFColor *)coral {
	NKFColor *coral = [NKFColor colorWithRed:1.0f green:0.5f blue:31.0f/100.0f alpha:1.0f];
	return coral;
}

+ (NKFColor *)coralPink {
	NKFColor *coralPink = [NKFColor colorWithRed:97.0f/100.0f green:51.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
	return coralPink;
}

+ (NKFColor *)coralRed {
	NKFColor *coralRed = [NKFColor colorWithRed:1.0f green:0.25f blue:0.25f alpha:1.0f];
	return coralRed;
}

+ (NKFColor *)cordovan {
	NKFColor *cordovan = [NKFColor colorWithRed:54.0f/100.0f green:0.25f blue:27.0f/100.0f alpha:1.0f];
	return cordovan;
}

+ (NKFColor *)corn {
	NKFColor *corn = [NKFColor colorWithRed:98.0f/100.0f green:93.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
	return corn;
}

+ (NKFColor *)cornellRed {
	NKFColor *cornellRed = [NKFColor colorWithRed:7.0f/10.0f green:11.0f/100.0f blue:11.0f/100.0f alpha:1.0f];
	return cornellRed;
}

+ (NKFColor *)cornflowerBlue {
	NKFColor *cornflowerBlue = [NKFColor colorWithRed:39.0f/100.0f green:58.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
	return cornflowerBlue;
}

+ (NKFColor *)cornsilk {
	NKFColor *cornsilk = [NKFColor colorWithRed:1.0f green:97.0f/100.0f blue:86.0f/100.0f alpha:1.0f];
	return cornsilk;
}

+ (NKFColor *)cosmicLatte {
	NKFColor *cosmicLatte = [NKFColor colorWithRed:1.0f green:97.0f/100.0f blue:91.0f/100.0f alpha:1.0f];
	return cosmicLatte;
}

+ (NKFColor *)coyoteBrown {
	NKFColor *coyoteBrown = [NKFColor colorWithRed:51.0f/100.0f green:38.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
	return coyoteBrown;
}

+ (NKFColor *)cottonCandy {
	NKFColor *cottonCandy = [NKFColor colorWithRed:1.0f green:74.0f/100.0f blue:85.0f/100.0f alpha:1.0f];
	return cottonCandy;
}

+ (NKFColor *)cranberry {
	return [NKFColor colorWithRed:190.0f/255.0f green:8.0f/255.0f blue:61.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)cream {
	NKFColor *cream = [NKFColor colorWithRed:1.0f green:99.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
	return cream;
}

+ (NKFColor *)crimson {
	NKFColor *crimson = [NKFColor colorWithRed:86.0f/100.0f green:8.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
	return crimson;
}

+ (NKFColor *)crimsonGlory {
	NKFColor *crimsonGlory = [NKFColor colorWithRed:0.75f green:0.0f blue:2.0f/10.0f alpha:1.0f];
	return crimsonGlory;
}

+ (NKFColor *)crimsonRed {
	NKFColor *crimsonRed = [NKFColor colorWithRed:6.0f/10.0f green:0.0f blue:0.0f alpha:1.0f];
	return crimsonRed;
}

+ (NKFColor *)cyan {
	NKFColor *cyan = [NKFColor colorWithRed:0.0f green:1.0f blue:1.0f alpha:1.0f];
	return cyan;
}

+ (NKFColor *)cyanAzure {
	NKFColor *cyanAzure = [NKFColor colorWithRed:31.0f/100.0f green:51.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
	return cyanAzure;
}

+ (NKFColor *)cyanBlueAzure {
	NKFColor *cyanBlueAzure = [NKFColor colorWithRed:27.0f/100.0f green:51.0f/100.0f blue:0.75f alpha:1.0f];
	return cyanBlueAzure;
}

+ (NKFColor *)cyanCobaltBlue {
	NKFColor *cyanCobaltBlue = [NKFColor colorWithRed:16.0f/100.0f green:35.0f/100.0f blue:61.0f/100.0f alpha:1.0f];
	return cyanCobaltBlue;
}

+ (NKFColor *)cyanCornflowerBlue {
	NKFColor *cyanCornflowerBlue = [NKFColor colorWithRed:9.0f/100.0f green:55.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
	return cyanCornflowerBlue;
}

+ (NKFColor *)cyanProcess {
	NKFColor *cyanProcess = [NKFColor colorWithRed:0.0f green:72.0f/100.0f blue:92.0f/100.0f alpha:1.0f];
	return cyanProcess;
}

+ (NKFColor *)cyberGrape {
	NKFColor *cyberGrape = [NKFColor colorWithRed:35.0f/100.0f green:26.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
	return cyberGrape;
}

+ (NKFColor *)cyberYellow {
	NKFColor *cyberYellow = [NKFColor colorWithRed:1.0f green:83.0f/100.0f blue:0.0f alpha:1.0f];
	return cyberYellow;
}

+ (NKFColor *)daffodil {
	NKFColor *daffodil = [NKFColor colorWithRed:1.0f green:1.0f blue:19.0f/100.0f alpha:1.0f];
	return daffodil;
}

+ (NKFColor *)dandelion {
	NKFColor *dandelion = [NKFColor colorWithRed:94.0f/100.0f green:88.0f/100.0f blue:19.0f/100.0f alpha:1.0f];
	return dandelion;
}

+ (NKFColor *)darkBlue {
	NKFColor *darkBlue = [NKFColor colorWithRed:0.0f green:0.0f blue:55.0f/100.0f alpha:1.0f];
	return darkBlue;
}

+ (NKFColor *)darkBlueGray {
	NKFColor *darkBlueGray = [NKFColor colorWithRed:4.0f/10.0f green:4.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
	return darkBlueGray;
}

+ (NKFColor *)darkBrown {
	NKFColor *darkBrown = [NKFColor colorWithRed:4.0f/10.0f green:26.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return darkBrown;
}

+ (NKFColor *)darkBrownTangelo {
	NKFColor *darkBrownTangelo = [NKFColor colorWithRed:53.0f/100.0f green:4.0f/10.0f blue:31.0f/100.0f alpha:1.0f];
	return darkBrownTangelo;
}

+ (NKFColor *)darkByzantium {
	NKFColor *darkByzantium = [NKFColor colorWithRed:36.0f/100.0f green:22.0f/100.0f blue:0.333f alpha:1.0f];
	return darkByzantium;
}

+ (NKFColor *)darkCandyAppleRed {
	NKFColor *darkCandyAppleRed = [NKFColor colorWithRed:64.0f/100.0f green:0.0f blue:0.0f alpha:1.0f];
	return darkCandyAppleRed;
}

+ (NKFColor *)darkCerulean {
	NKFColor *darkCerulean = [NKFColor colorWithRed:3.0f/100.0f green:27.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
	return darkCerulean;
}

+ (NKFColor *)darkChestnut {
	NKFColor *darkChestnut = [NKFColor colorWithRed:6.0f/10.0f green:41.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
	return darkChestnut;
}

+ (NKFColor *)darkCoral {
	NKFColor *darkCoral = [NKFColor colorWithRed:8.0f/10.0f green:36.0f/100.0f blue:27.0f/100.0f alpha:1.0f];
	return darkCoral;
}

+ (NKFColor *)darkCyan {
	NKFColor *darkCyan = [NKFColor colorWithRed:0.0f green:55.0f/100.0f blue:55.0f/100.0f alpha:1.0f];
	return darkCyan;
}

+ (NKFColor *)darkElectricBlue {
	NKFColor *darkElectricBlue = [NKFColor colorWithRed:0.333f green:41.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
	return darkElectricBlue;
}

+ (NKFColor *)darkGoldenrod {
	NKFColor *darkGoldenrod = [NKFColor colorWithRed:72.0f/100.0f green:53.0f/100.0f blue:4.0f/100.0f alpha:1.0f];
	return darkGoldenrod;
}

+ (NKFColor *)darkGrayX11 {
	NKFColor *darkGrayX11 = [NKFColor colorWithRed:66.0f/100.0f green:66.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
	return darkGrayX11;
}

+ (NKFColor *)darkGreen {
	NKFColor *darkGreen = [NKFColor colorWithRed:0.0f green:2.0f/10.0f blue:13.0f/100.0f alpha:1.0f];
	return darkGreen;
}

+ (NKFColor *)darkGreenX11 {
	NKFColor *darkGreenX11 = [NKFColor colorWithRed:0.0f green:39.0f/100.0f blue:0.0f alpha:1.0f];
	return darkGreenX11;
}

+ (NKFColor *)darkImperialBlue {
	NKFColor *darkImperialBlue = [NKFColor colorWithRed:0.0f green:0.25f blue:42.0f/100.0f alpha:1.0f];
	return darkImperialBlue;
}

+ (NKFColor *)darkImperialBlue2 {
	NKFColor *darkImperialBlue = [NKFColor colorWithRed:0.0f green:8.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
	return darkImperialBlue;
}

+ (NKFColor *)darkJungleGreen {
	NKFColor *darkJungleGreen = [NKFColor colorWithRed:1.0f/10.0f green:14.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return darkJungleGreen;
}

+ (NKFColor *)darkKhaki {
	NKFColor *darkKhaki = [NKFColor colorWithRed:74.0f/100.0f green:72.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
	return darkKhaki;
}

+ (NKFColor *)darkLava {
	NKFColor *darkLava = [NKFColor colorWithRed:28.0f/100.0f green:24.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
	return darkLava;
}

+ (NKFColor *)darkLavender {
	NKFColor *darkLavender = [NKFColor colorWithRed:45.0f/100.0f green:31.0f/100.0f blue:59.0f/100.0f alpha:1.0f];
	return darkLavender;
}

+ (NKFColor *)darkLiver {
	NKFColor *darkLiver = [NKFColor colorWithRed:0.333f green:29.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
	return darkLiver;
}

+ (NKFColor *)darkLiverHorses {
	NKFColor *darkLiverHorses = [NKFColor colorWithRed:0.333f green:24.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
	return darkLiverHorses;
}

+ (NKFColor *)darkMagenta {
	NKFColor *darkMagenta = [NKFColor colorWithRed:55.0f/100.0f green:0.0f blue:55.0f/100.0f alpha:1.0f];
	return darkMagenta;
}

+ (NKFColor *)darkMediumGray {
	NKFColor *darkMediumGray = [NKFColor colorWithRed:66.0f/100.0f green:66.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
	return darkMediumGray;
}

+ (NKFColor *)darkMidnightBlue {
	NKFColor *darkMidnightBlue = [NKFColor colorWithRed:0.0f green:2.0f/10.0f blue:4.0f/10.0f alpha:1.0f];
	return darkMidnightBlue;
}

+ (NKFColor *)darkMossGreen {
	NKFColor *darkMossGreen = [NKFColor colorWithRed:29.0f/100.0f green:36.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
	return darkMossGreen;
}

+ (NKFColor *)darkOliveGreen {
	NKFColor *darkOliveGreen = [NKFColor colorWithRed:0.333f green:42.0f/100.0f blue:18.0f/100.0f alpha:1.0f];
	return darkOliveGreen;
}

+ (NKFColor *)darkOrange {
	NKFColor *darkOrange = [NKFColor colorWithRed:1.0f green:55.0f/100.0f blue:0.0f alpha:1.0f];
	return darkOrange;
}

+ (NKFColor *)darkOrchid {
	NKFColor *darkOrchid = [NKFColor colorWithRed:6.0f/10.0f green:2.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
	return darkOrchid;
}

+ (NKFColor *)darkPastelBlue {
	NKFColor *darkPastelBlue = [NKFColor colorWithRed:47.0f/100.0f green:62.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
	return darkPastelBlue;
}

+ (NKFColor *)darkPastelGreen {
	NKFColor *darkPastelGreen = [NKFColor colorWithRed:1.0f/100.0f green:0.75f blue:24.0f/100.0f alpha:1.0f];
	return darkPastelGreen;
}

+ (NKFColor *)darkPastelPurple {
	NKFColor *darkPastelPurple = [NKFColor colorWithRed:59.0f/100.0f green:44.0f/100.0f blue:84.0f/100.0f alpha:1.0f];
	return darkPastelPurple;
}

+ (NKFColor *)darkPastelRed {
	NKFColor *darkPastelRed = [NKFColor colorWithRed:76.0f/100.0f green:23.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return darkPastelRed;
}

+ (NKFColor *)darkPink {
	NKFColor *darkPink = [NKFColor colorWithRed:91.0f/100.0f green:0.333f blue:0.5f alpha:1.0f];
	return darkPink;
}

+ (NKFColor *)darkPowderBlue {
	NKFColor *darkPowderBlue = [NKFColor colorWithRed:0.0f green:2.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
	return darkPowderBlue;
}

+ (NKFColor *)darkPuce {
	NKFColor *darkPuce = [NKFColor colorWithRed:31.0f/100.0f green:23.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
	return darkPuce;
}

+ (NKFColor *)darkPurple {
	NKFColor *darkPurple = [NKFColor colorWithRed:19.0f/100.0f green:1.0f/10.0f blue:2.0f/10.0f alpha:1.0f];
	return darkPurple;
}

+ (NKFColor *)darkRaspberry {
	NKFColor *darkRaspberry = [NKFColor colorWithRed:53.0f/100.0f green:15.0f/100.0f blue:34.0f/100.0f alpha:1.0f];
	return darkRaspberry;
}

+ (NKFColor *)darkRed {
	NKFColor *darkRed = [NKFColor colorWithRed:55.0f/100.0f green:0.0f blue:0.0f alpha:1.0f];
	return darkRed;
}

+ (NKFColor *)darkSalmon {
	NKFColor *darkSalmon = [NKFColor colorWithRed:91.0f/100.0f green:59.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
	return darkSalmon;
}

+ (NKFColor *)darkScarlet {
	NKFColor *darkScarlet = [NKFColor colorWithRed:34.0f/100.0f green:1.0f/100.0f blue:1.0f/10.0f alpha:1.0f];
	return darkScarlet;
}

+ (NKFColor *)darkSeaGreen {
	NKFColor *darkSeaGreen = [NKFColor colorWithRed:56.0f/100.0f green:74.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
	return darkSeaGreen;
}

+ (NKFColor *)darkSienna {
	NKFColor *darkSienna = [NKFColor colorWithRed:24.0f/100.0f green:8.0f/100.0f blue:8.0f/100.0f alpha:1.0f];
	return darkSienna;
}

+ (NKFColor *)darkSkyBlue {
	NKFColor *darkSkyBlue = [NKFColor colorWithRed:55.0f/100.0f green:0.75f blue:84.0f/100.0f alpha:1.0f];
	return darkSkyBlue;
}

+ (NKFColor *)darkSlateBlue {
	NKFColor *darkSlateBlue = [NKFColor colorWithRed:28.0f/100.0f green:24.0f/100.0f blue:55.0f/100.0f alpha:1.0f];
	return darkSlateBlue;
}

+ (NKFColor *)darkSlateGray {
	NKFColor *darkSlateGray = [NKFColor colorWithRed:18.0f/100.0f green:31.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
	return darkSlateGray;
}

+ (NKFColor *)darkSpringGreen {
	NKFColor *darkSpringGreen = [NKFColor colorWithRed:9.0f/100.0f green:45.0f/100.0f blue:27.0f/100.0f alpha:1.0f];
	return darkSpringGreen;
}

+ (NKFColor *)darkTan {
	NKFColor *darkTan = [NKFColor colorWithRed:57.0f/100.0f green:51.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
	return darkTan;
}

+ (NKFColor *)darkTangerine {
	NKFColor *darkTangerine = [NKFColor colorWithRed:1.0f green:66.0f/100.0f blue:7.0f/100.0f alpha:1.0f];
	return darkTangerine;
}

+ (NKFColor *)darkTaupe {
	NKFColor *darkTaupe = [NKFColor colorWithRed:28.0f/100.0f green:24.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
	return darkTaupe;
}

+ (NKFColor *)darkTerraCotta {
	NKFColor *darkTerraCotta = [NKFColor colorWithRed:8.0f/10.0f green:31.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
	return darkTerraCotta;
}

+ (NKFColor *)darkTurquoise {
	NKFColor *darkTurquoise = [NKFColor colorWithRed:0.0f green:81.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
	return darkTurquoise;
}

+ (NKFColor *)darkVanilla {
	NKFColor *darkVanilla = [NKFColor colorWithRed:82.0f/100.0f green:0.75f blue:66.0f/100.0f alpha:1.0f];
	return darkVanilla;
}

+ (NKFColor *)darkViolet {
	NKFColor *darkViolet = [NKFColor colorWithRed:58.0f/100.0f green:0.0f blue:83.0f/100.0f alpha:1.0f];
	return darkViolet;
}

+ (NKFColor *)darkYellow {
	NKFColor *darkYellow = [NKFColor colorWithRed:61.0f/100.0f green:53.0f/100.0f blue:5.0f/100.0f alpha:1.0f];
	return darkYellow;
}

+ (NKFColor *)dartmouthGreen {
	NKFColor *dartmouthGreen = [NKFColor colorWithRed:0.0f green:44.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
	return dartmouthGreen;
}

+ (NKFColor *)davysGrey {
	NKFColor *davysGrey = [NKFColor colorWithRed:0.333f green:0.333f blue:0.333f alpha:1.0f];
	return davysGrey;
}

+ (NKFColor *)debianRed {
	NKFColor *debianRed = [NKFColor colorWithRed:84.0f/100.0f green:4.0f/100.0f blue:0.333f alpha:1.0f];
	return debianRed;
}

+ (NKFColor *)deepAquamarine {
	NKFColor *deepAquamarine = [NKFColor colorWithRed:0.25f green:51.0f/100.0f blue:43.0f/100.0f alpha:1.0f];
	return deepAquamarine;
}

+ (NKFColor *)deepCarmine {
	NKFColor *deepCarmine = [NKFColor colorWithRed:66.0f/100.0f green:13.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
	return deepCarmine;
}

+ (NKFColor *)deepCarminePink {
	NKFColor *deepCarminePink = [NKFColor colorWithRed:94.0f/100.0f green:19.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
	return deepCarminePink;
}

+ (NKFColor *)deepCarrotOrange {
	NKFColor *deepCarrotOrange = [NKFColor colorWithRed:91.0f/100.0f green:41.0f/100.0f blue:0.1667f alpha:1.0f];
	return deepCarrotOrange;
}

+ (NKFColor *)deepCerise {
	NKFColor *deepCerise = [NKFColor colorWithRed:85.0f/100.0f green:2.0f/10.0f blue:53.0f/100.0f alpha:1.0f];
	return deepCerise;
}

+ (NKFColor *)deepChampagne {
	NKFColor *deepChampagne = [NKFColor colorWithRed:98.0f/100.0f green:84.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
	return deepChampagne;
}

+ (NKFColor *)deepChestnut {
	NKFColor *deepChestnut = [NKFColor colorWithRed:73.0f/100.0f green:31.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
	return deepChestnut;
}

+ (NKFColor *)deepCoffee {
	NKFColor *deepCoffee = [NKFColor colorWithRed:44.0f/100.0f green:26.0f/100.0f blue:0.25f alpha:1.0f];
	return deepCoffee;
}

+ (NKFColor *)deepFuchsia {
	NKFColor *deepFuchsia = [NKFColor colorWithRed:76.0f/100.0f green:0.333f blue:76.0f/100.0f alpha:1.0f];
	return deepFuchsia;
}

+ (NKFColor *)deepGreen {
	NKFColor *deepGreen = [NKFColor colorWithRed:2.0f/100.0f green:4.0f/10.0f blue:3.0f/100.0f alpha:1.0f];
	return deepGreen;
}

+ (NKFColor *)deepGreenCyanTurquoise {
	NKFColor *deepGreenCyanTurquoise = [NKFColor colorWithRed:5.0f/100.0f green:49.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
	return deepGreenCyanTurquoise;
}

+ (NKFColor *)deepJungleGreen {
	NKFColor *deepJungleGreen = [NKFColor colorWithRed:0.0f green:29.0f/100.0f blue:29.0f/100.0f alpha:1.0f];
	return deepJungleGreen;
}

+ (NKFColor *)deepKoamaru {
	NKFColor *deepKoamaru = [NKFColor colorWithRed:2.0f/10.0f green:2.0f/10.0f blue:4.0f/10.0f alpha:1.0f];
	return deepKoamaru;
}

+ (NKFColor *)deepLemon {
	NKFColor *deepLemon = [NKFColor colorWithRed:96.0f/100.0f green:78.0f/100.0f blue:1.0f/10.0f alpha:1.0f];
	return deepLemon;
}

+ (NKFColor *)deepLilac {
	NKFColor *deepLilac = [NKFColor colorWithRed:6.0f/10.0f green:0.333f blue:73.0f/100.0f alpha:1.0f];
	return deepLilac;
}

+ (NKFColor *)deepMagenta {
	NKFColor *deepMagenta = [NKFColor colorWithRed:8.0f/10.0f green:0.0f blue:8.0f/10.0f alpha:1.0f];
	return deepMagenta;
}

+ (NKFColor *)deepMaroon {
	NKFColor *deepMaroon = [NKFColor colorWithRed:51.0f/100.0f green:0.0f blue:0.0f alpha:1.0f];
	return deepMaroon;
}

+ (NKFColor *)deepMauve {
	NKFColor *deepMauve = [NKFColor colorWithRed:83.0f/100.0f green:45.0f/100.0f blue:83.0f/100.0f alpha:1.0f];
	return deepMauve;
}

+ (NKFColor *)deepMossGreen {
	NKFColor *deepMossGreen = [NKFColor colorWithRed:21.0f/100.0f green:37.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
	return deepMossGreen;
}

+ (NKFColor *)deepPeach {
	NKFColor *deepPeach = [NKFColor colorWithRed:1.0f green:8.0f/10.0f blue:64.0f/100.0f alpha:1.0f];
	return deepPeach;
}

+ (NKFColor *)deepPink {
	NKFColor *deepPink = [NKFColor colorWithRed:1.0f green:8.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
	return deepPink;
}

+ (NKFColor *)deepPuce {
	NKFColor *deepPuce = [NKFColor colorWithRed:66.0f/100.0f green:36.0f/100.0f blue:41.0f/100.0f alpha:1.0f];
	return deepPuce;
}

+ (NKFColor *)deepRed {
	NKFColor *deepRed = [NKFColor colorWithRed:52.0f/100.0f green:0.0f blue:0.0f alpha:1.0f];
	return deepRed;
}

+ (NKFColor *)deepRuby {
	NKFColor *deepRuby = [NKFColor colorWithRed:52.0f/100.0f green:0.25f blue:36.0f/100.0f alpha:1.0f];
	return deepRuby;
}

+ (NKFColor *)deepSaffron {
	NKFColor *deepSaffron = [NKFColor colorWithRed:1.0f green:6.0f/10.0f blue:2.0f/10.0f alpha:1.0f];
	return deepSaffron;
}

+ (NKFColor *)deepSkyBlue {
	NKFColor *deepSkyBlue = [NKFColor colorWithRed:0.0f green:0.75f blue:1.0f alpha:1.0f];
	return deepSkyBlue;
}

+ (NKFColor *)deepSpaceSparkle {
	NKFColor *deepSpaceSparkle = [NKFColor colorWithRed:29.0f/100.0f green:39.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
	return deepSpaceSparkle;
}

+ (NKFColor *)deepSpringBud {
	NKFColor *deepSpringBud = [NKFColor colorWithRed:0.333f green:42.0f/100.0f blue:18.0f/100.0f alpha:1.0f];
	return deepSpringBud;
}

+ (NKFColor *)deepTaupe {
	NKFColor *deepTaupe = [NKFColor colorWithRed:49.0f/100.0f green:37.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
	return deepTaupe;
}

+ (NKFColor *)deepTuscanRed {
	NKFColor *deepTuscanRed = [NKFColor colorWithRed:4.0f/10.0f green:26.0f/100.0f blue:3.0f/10.0f alpha:1.0f];
	return deepTuscanRed;
}

+ (NKFColor *)deepViolet {
	NKFColor *deepViolet = [NKFColor colorWithRed:2.0f/10.0f green:0.0f blue:4.0f/10.0f alpha:1.0f];
	return deepViolet;
}

+ (NKFColor *)deer {
	NKFColor *deer = [NKFColor colorWithRed:73.0f/100.0f green:53.0f/100.0f blue:35.0f/100.0f alpha:1.0f];
	return deer;
}

+ (NKFColor *)denim {
	NKFColor *denim = [NKFColor colorWithRed:8.0f/100.0f green:38.0f/100.0f blue:74.0f/100.0f alpha:1.0f];
	return denim;
}

+ (NKFColor *)desaturatedCyan {
	NKFColor *desaturatedCyan = [NKFColor colorWithRed:4.0f/10.0f green:6.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
	return desaturatedCyan;
}

+ (NKFColor *)desert {
	NKFColor *desert = [NKFColor colorWithRed:76.0f/100.0f green:6.0f/10.0f blue:42.0f/100.0f alpha:1.0f];
	return desert;
}

+ (NKFColor *)desertSand {
	NKFColor *desertSand = [NKFColor colorWithRed:93.0f/100.0f green:79.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
	return desertSand;
}

+ (NKFColor *)desire {
	NKFColor *desire = [NKFColor colorWithRed:92.0f/100.0f green:24.0f/100.0f blue:0.333f alpha:1.0f];
	return desire;
}

+ (NKFColor *)diamond {
	NKFColor *diamond = [NKFColor colorWithRed:73.0f/100.0f green:95.0f/100.0f blue:1.0f alpha:1.0f];
	return diamond;
}

+ (NKFColor *)dimGray {
	NKFColor *dimGray = [NKFColor colorWithRed:41.0f/100.0f green:41.0f/100.0f blue:41.0f/100.0f alpha:1.0f];
	return dimGray;
}

+ (NKFColor *)dirt {
	NKFColor *dirt = [NKFColor colorWithRed:61.0f/100.0f green:46.0f/100.0f blue:0.333f alpha:1.0f];
	return dirt;
}

+ (NKFColor *)dodgerBlue {
	NKFColor *dodgerBlue = [NKFColor colorWithRed:12.0f/100.0f green:56.0f/100.0f blue:1.0f alpha:1.0f];
	return dodgerBlue;
}

+ (NKFColor *)dogwoodRose {
	NKFColor *dogwoodRose = [NKFColor colorWithRed:84.0f/100.0f green:9.0f/100.0f blue:41.0f/100.0f alpha:1.0f];
	return dogwoodRose;
}

+ (NKFColor *)dollarBill {
	NKFColor *dollarBill = [NKFColor colorWithRed:52.0f/100.0f green:73.0f/100.0f blue:4.0f/10.0f alpha:1.0f];
	return dollarBill;
}

+ (NKFColor *)donkeyBrown {
	NKFColor *donkeyBrown = [NKFColor colorWithRed:4.0f/10.0f green:3.0f/10.0f blue:16.0f/100.0f alpha:1.0f];
	return donkeyBrown;
}

+ (NKFColor *)drab {
	NKFColor *drab = [NKFColor colorWithRed:59.0f/100.0f green:44.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
	return drab;
}

+ (NKFColor *)dukeBlue {
	NKFColor *dukeBlue = [NKFColor colorWithRed:0.0f green:0.0f blue:61.0f/100.0f alpha:1.0f];
	return dukeBlue;
}

+ (NKFColor *)dustStorm {
	NKFColor *dustStorm = [NKFColor colorWithRed:9.0f/10.0f green:8.0f/10.0f blue:79.0f/100.0f alpha:1.0f];
	return dustStorm;
}

+ (NKFColor *)dutchWhite {
	NKFColor *dutchWhite = [NKFColor colorWithRed:94.0f/100.0f green:87.0f/100.0f blue:73.0f/100.0f alpha:1.0f];
	return dutchWhite;
}

+ (NKFColor *)earthYellow {
	NKFColor *earthYellow = [NKFColor colorWithRed:88.0f/100.0f green:66.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
	return earthYellow;
}

+ (NKFColor *)ebony {
	NKFColor *ebony = [NKFColor colorWithRed:0.333f green:36.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
	return ebony;
}

+ (NKFColor *)ecru {
	NKFColor *ecru = [NKFColor colorWithRed:76.0f/100.0f green:7.0f/10.0f blue:0.5f alpha:1.0f];
	return ecru;
}

+ (NKFColor *)eerieBlack {
	NKFColor *eerieBlack = [NKFColor colorWithRed:11.0f/100.0f green:11.0f/100.0f blue:11.0f/100.0f alpha:1.0f];
	return eerieBlack;
}

+ (NKFColor *)eggplant {
	NKFColor *eggplant = [NKFColor colorWithRed:38.0f/100.0f green:0.25f blue:32.0f/100.0f alpha:1.0f];
	return eggplant;
}

+ (NKFColor *)eggshell {
	NKFColor *eggshell = [NKFColor colorWithRed:94.0f/100.0f green:92.0f/100.0f blue:84.0f/100.0f alpha:1.0f];
	return eggshell;
}

+ (NKFColor *)egyptianBlue {
	NKFColor *egyptianBlue = [NKFColor colorWithRed:6.0f/100.0f green:2.0f/10.0f blue:65.0f/100.0f alpha:1.0f];
	return egyptianBlue;
}

+ (NKFColor *)electricBlue {
	NKFColor *electricBlue = [NKFColor colorWithRed:49.0f/100.0f green:98.0f/100.0f blue:1.0f alpha:1.0f];
	return electricBlue;
}

+ (NKFColor *)electricCrimson {
	NKFColor *electricCrimson = [NKFColor colorWithRed:1.0f green:0.0f blue:0.25f alpha:1.0f];
	return electricCrimson;
}

+ (NKFColor *)electricCyan {
	NKFColor *electricCyan = [NKFColor colorWithRed:0.0f green:1.0f blue:1.0f alpha:1.0f];
	return electricCyan;
}

+ (NKFColor *)electricGreen {
	NKFColor *electricGreen = [NKFColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:1.0f];
	return electricGreen;
}

+ (NKFColor *)electricIndigo {
	NKFColor *electricIndigo = [NKFColor colorWithRed:44.0f/100.0f green:0.0f blue:1.0f alpha:1.0f];
	return electricIndigo;
}

+ (NKFColor *)electricLavender {
	NKFColor *electricLavender = [NKFColor colorWithRed:96.0f/100.0f green:73.0f/100.0f blue:1.0f alpha:1.0f];
	return electricLavender;
}

+ (NKFColor *)electricLime {
	NKFColor *electricLime = [NKFColor colorWithRed:8.0f/10.0f green:1.0f blue:0.0f alpha:1.0f];
	return electricLime;
}

+ (NKFColor *)electricPurple {
	NKFColor *electricPurple = [NKFColor colorWithRed:0.75f green:0.0f blue:1.0f alpha:1.0f];
	return electricPurple;
}

+ (NKFColor *)electricUltramarine {
	NKFColor *electricUltramarine = [NKFColor colorWithRed:0.25f green:0.0f blue:1.0f alpha:1.0f];
	return electricUltramarine;
}

+ (NKFColor *)electricViolet {
	NKFColor *electricViolet = [NKFColor colorWithRed:56.0f/100.0f green:0.0f blue:1.0f alpha:1.0f];
	return electricViolet;
}

+ (NKFColor *)electricYellow {
	NKFColor *electricYellow = [NKFColor colorWithRed:1.0f green:1.0f blue:2.0f/10.0f alpha:1.0f];
	return electricYellow;
}

+ (NKFColor *)emerald {
	NKFColor *emerald = [NKFColor colorWithRed:31.0f/100.0f green:78.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
	return emerald;
}

+ (NKFColor *)eminence {
	NKFColor *eminence = [NKFColor colorWithRed:42.0f/100.0f green:19.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
	return eminence;
}

+ (NKFColor *)englishGreen {
	NKFColor *englishGreen = [NKFColor colorWithRed:11.0f/100.0f green:3.0f/10.0f blue:24.0f/100.0f alpha:1.0f];
	return englishGreen;
}

+ (NKFColor *)englishLavender {
	NKFColor *englishLavender = [NKFColor colorWithRed:71.0f/100.0f green:51.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
	return englishLavender;
}

+ (NKFColor *)englishRed {
	NKFColor *englishRed = [NKFColor colorWithRed:0.667f green:29.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
	return englishRed;
}

+ (NKFColor *)englishViolet {
	NKFColor *englishViolet = [NKFColor colorWithRed:34.0f/100.0f green:24.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
	return englishViolet;
}

+ (NKFColor *)etonBlue {
	NKFColor *etonBlue = [NKFColor colorWithRed:59.0f/100.0f green:78.0f/100.0f blue:64.0f/100.0f alpha:1.0f];
	return etonBlue;
}

+ (NKFColor *)eucalyptus {
	NKFColor *eucalyptus = [NKFColor colorWithRed:27.0f/100.0f green:84.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
	return eucalyptus;
}

+ (NKFColor *)fallow {
	NKFColor *fallow = [NKFColor colorWithRed:76.0f/100.0f green:6.0f/10.0f blue:42.0f/100.0f alpha:1.0f];
	return fallow;
}

+ (NKFColor *)faluRed {
	NKFColor *faluRed = [NKFColor colorWithRed:0.5f green:9.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
	return faluRed;
}

+ (NKFColor *)fandango {
	NKFColor *fandango = [NKFColor colorWithRed:71.0f/100.0f green:2.0f/10.0f blue:54.0f/100.0f alpha:1.0f];
	return fandango;
}

+ (NKFColor *)fandangoPink {
	NKFColor *fandangoPink = [NKFColor colorWithRed:87.0f/100.0f green:32.0f/100.0f blue:52.0f/100.0f alpha:1.0f];
	return fandangoPink;
}

+ (NKFColor *)fashionFuchsia {
	NKFColor *fashionFuchsia = [NKFColor colorWithRed:96.0f/100.0f green:0.0f blue:63.0f/100.0f alpha:1.0f];
	return fashionFuchsia;
}

+ (NKFColor *)fawn {
	NKFColor *fawn = [NKFColor colorWithRed:9.0f/10.0f green:0.667f blue:44.0f/100.0f alpha:1.0f];
	return fawn;
}

+ (NKFColor *)federalBlue {
	NKFColor *federalBlue = [NKFColor colorWithRed:29.0f/255.0f green:30.0f/255.0f blue:106.0f/255.0f alpha:1.0f];
	return federalBlue;
}

+ (NKFColor *)feldgrau {
	NKFColor *feldgrau = [NKFColor colorWithRed:3.0f/10.0f green:36.0f/100.0f blue:0.333f alpha:1.0f];
	return feldgrau;
}

+ (NKFColor *)feldspar {
	NKFColor *feldspar = [NKFColor colorWithRed:99.0f/100.0f green:84.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
	return feldspar;
}

+ (NKFColor *)fernGreen {
	NKFColor *fernGreen = [NKFColor colorWithRed:31.0f/100.0f green:47.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
	return fernGreen;
}

+ (NKFColor *)ferrariRed {
	NKFColor *ferrariRed = [NKFColor colorWithRed:1.0f green:16.0f/100.0f blue:0.0f alpha:1.0f];
	return ferrariRed;
}

+ (NKFColor *)fieldDrab {
	NKFColor *fieldDrab = [NKFColor colorWithRed:42.0f/100.0f green:0.333f blue:12.0f/100.0f alpha:1.0f];
	return fieldDrab;
}

+ (NKFColor *)firebrick {
	NKFColor *firebrick = [NKFColor colorWithRed:7.0f/10.0f green:13.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return firebrick;
}

+ (NKFColor *)fireEngineRed {
	NKFColor *fireEngineRed = [NKFColor colorWithRed:81.0f/100.0f green:13.0f/100.0f blue:16.0f/100.0f alpha:1.0f];
	return fireEngineRed;
}

+ (NKFColor *)flame {
	NKFColor *flame = [NKFColor colorWithRed:89.0f/100.0f green:35.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return flame;
}

+ (NKFColor *)flamingoPink {
	NKFColor *flamingoPink = [NKFColor colorWithRed:99.0f/100.0f green:56.0f/100.0f blue:0.667f alpha:1.0f];
	return flamingoPink;
}

+ (NKFColor *)flattery {
	NKFColor *flattery = [NKFColor colorWithRed:42.0f/100.0f green:27.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
	return flattery;
}

+ (NKFColor *)flavescent {
	NKFColor *flavescent = [NKFColor colorWithRed:97.0f/100.0f green:91.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
	return flavescent;
}

+ (NKFColor *)flax {
	NKFColor *flax = [NKFColor colorWithRed:93.0f/100.0f green:86.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
	return flax;
}

+ (NKFColor *)flirt {
	NKFColor *flirt = [NKFColor colorWithRed:64.0f/100.0f green:0.0f blue:43.0f/100.0f alpha:1.0f];
	return flirt;
}

+ (NKFColor *)floralWhite {
	NKFColor *floralWhite = [NKFColor colorWithRed:1.0f green:98.0f/100.0f blue:94.0f/100.0f alpha:1.0f];
	return floralWhite;
}

+ (NKFColor *)fluorescentOrange {
	NKFColor *fluorescentOrange = [NKFColor colorWithRed:1.0f green:0.75f blue:0.0f alpha:1.0f];
	return fluorescentOrange;
}

+ (NKFColor *)fluorescentPink {
	NKFColor *fluorescentPink = [NKFColor colorWithRed:1.0f green:8.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
	return fluorescentPink;
}

+ (NKFColor *)fluorescentYellow {
	NKFColor *fluorescentYellow = [NKFColor colorWithRed:8.0f/10.0f green:1.0f blue:0.0f alpha:1.0f];
	return fluorescentYellow;
}

+ (NKFColor *)folly {
	NKFColor *folly = [NKFColor colorWithRed:1.0f green:0.0f blue:31.0f/100.0f alpha:1.0f];
	return folly;
}

+ (NKFColor *)forestGreenTraditional {
	NKFColor *forestGreenTraditional = [NKFColor colorWithRed:0.0f green:27.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return forestGreenTraditional;
}

+ (NKFColor *)forestGreenWeb {
	NKFColor *forestGreenWeb = [NKFColor colorWithRed:13.0f/100.0f green:55.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return forestGreenWeb;
}

+ (NKFColor *)frenchBeige {
	NKFColor *frenchBeige = [NKFColor colorWithRed:65.0f/100.0f green:48.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
	return frenchBeige;
}

+ (NKFColor *)frenchBistre {
	NKFColor *frenchBistre = [NKFColor colorWithRed:52.0f/100.0f green:43.0f/100.0f blue:3.0f/10.0f alpha:1.0f];
	return frenchBistre;
}

+ (NKFColor *)frenchBlue {
	NKFColor *frenchBlue = [NKFColor colorWithRed:0.0f green:45.0f/100.0f blue:73.0f/100.0f alpha:1.0f];
	return frenchBlue;
}

+ (NKFColor *)frenchFuchsia {
	NKFColor *frenchFuchsia = [NKFColor colorWithRed:99.0f/100.0f green:0.25f blue:57.0f/100.0f alpha:1.0f];
	return frenchFuchsia;
}

+ (NKFColor *)frenchLilac {
	NKFColor *frenchLilac = [NKFColor colorWithRed:53.0f/100.0f green:38.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
	return frenchLilac;
}

+ (NKFColor *)frenchLime {
	NKFColor *frenchLime = [NKFColor colorWithRed:62.0f/100.0f green:99.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
	return frenchLime;
}

+ (NKFColor *)frenchMauve {
	NKFColor *frenchMauve = [NKFColor colorWithRed:83.0f/100.0f green:45.0f/100.0f blue:83.0f/100.0f alpha:1.0f];
	return frenchMauve;
}

+ (NKFColor *)frenchPink {
	NKFColor *frenchPink = [NKFColor colorWithRed:99.0f/100.0f green:42.0f/100.0f blue:62.0f/100.0f alpha:1.0f];
	return frenchPink;
}

+ (NKFColor *)frenchPlum {
	NKFColor *frenchPlum = [NKFColor colorWithRed:51.0f/100.0f green:8.0f/100.0f blue:0.333f alpha:1.0f];
	return frenchPlum;
}

+ (NKFColor *)frenchPuce {
	NKFColor *frenchPuce = [NKFColor colorWithRed:31.0f/100.0f green:9.0f/100.0f blue:4.0f/100.0f alpha:1.0f];
	return frenchPuce;
}

+ (NKFColor *)frenchRaspberry {
	NKFColor *frenchRaspberry = [NKFColor colorWithRed:78.0f/100.0f green:0.1667f blue:28.0f/100.0f alpha:1.0f];
	return frenchRaspberry;
}

+ (NKFColor *)frenchRose {
	NKFColor *frenchRose = [NKFColor colorWithRed:96.0f/100.0f green:29.0f/100.0f blue:54.0f/100.0f alpha:1.0f];
	return frenchRose;
}

+ (NKFColor *)frenchSkyBlue {
	NKFColor *frenchSkyBlue = [NKFColor colorWithRed:47.0f/100.0f green:71.0f/100.0f blue:1.0f alpha:1.0f];
	return frenchSkyBlue;
}

+ (NKFColor *)frenchViolet {
	NKFColor *frenchViolet = [NKFColor colorWithRed:53.0f/100.0f green:2.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
	return frenchViolet;
}

+ (NKFColor *)frenchWine {
	NKFColor *frenchWine = [NKFColor colorWithRed:0.667f green:12.0f/100.0f blue:27.0f/100.0f alpha:1.0f];
	return frenchWine;
}

+ (NKFColor *)freshAir {
	NKFColor *freshAir = [NKFColor colorWithRed:65.0f/100.0f green:91.0f/100.0f blue:1.0f alpha:1.0f];
	return freshAir;
}

+ (NKFColor *)fuchsia {
	NKFColor *fuchsia = [NKFColor colorWithRed:1.0f green:0.0f blue:1.0f alpha:1.0f];
	return fuchsia;
}

+ (NKFColor *)fuchsiaCrayola {
	NKFColor *fuchsiaCrayola = [NKFColor colorWithRed:76.0f/100.0f green:0.333f blue:76.0f/100.0f alpha:1.0f];
	return fuchsiaCrayola;
}

+ (NKFColor *)fuchsiaPink {
	NKFColor *fuchsiaPink = [NKFColor colorWithRed:1.0f green:47.0f/100.0f blue:1.0f alpha:1.0f];
	return fuchsiaPink;
}

+ (NKFColor *)fuchsiaPurple {
	NKFColor *fuchsiaPurple = [NKFColor colorWithRed:8.0f/10.0f green:22.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
	return fuchsiaPurple;
}

+ (NKFColor *)fuchsiaRose {
	NKFColor *fuchsiaRose = [NKFColor colorWithRed:78.0f/100.0f green:26.0f/100.0f blue:46.0f/100.0f alpha:1.0f];
	return fuchsiaRose;
}

+ (NKFColor *)fulvous {
	NKFColor *fulvous = [NKFColor colorWithRed:89.0f/100.0f green:52.0f/100.0f blue:0.0f alpha:1.0f];
	return fulvous;
}

+ (NKFColor *)fuzzyWuzzy {
	NKFColor *fuzzyWuzzy = [NKFColor colorWithRed:8.0f/10.0f green:4.0f/10.0f blue:4.0f/10.0f alpha:1.0f];
	return fuzzyWuzzy;
}

+ (NKFColor *)gamboge {
	NKFColor *gamboge = [NKFColor colorWithRed:89.0f/100.0f green:61.0f/100.0f blue:6.0f/100.0f alpha:1.0f];
	return gamboge;
}

+ (NKFColor *)gambogeOrangeBrown {
	NKFColor *gambogeOrangeBrown = [NKFColor colorWithRed:6.0f/10.0f green:4.0f/10.0f blue:0.0f alpha:1.0f];
	return gambogeOrangeBrown;
}

+ (NKFColor *)genericViridian {
	NKFColor *genericViridian = [NKFColor colorWithRed:0.0f green:0.5f blue:4.0f/10.0f alpha:1.0f];
	return genericViridian;
}

+ (NKFColor *)ghostWhite {
	NKFColor *ghostWhite = [NKFColor colorWithRed:97.0f/100.0f green:97.0f/100.0f blue:1.0f alpha:1.0f];
	return ghostWhite;
}

+ (NKFColor *)giantsOrange {
	NKFColor *giantsOrange = [NKFColor colorWithRed:1.0f green:35.0f/100.0f blue:11.0f/100.0f alpha:1.0f];
	return giantsOrange;
}

+ (NKFColor *)grussrel {
	NKFColor *grussrel = [NKFColor colorWithRed:69.0f/100.0f green:4.0f/10.0f blue:0.0f alpha:1.0f];
	return grussrel;
}

+ (NKFColor *)glaucous {
	NKFColor *glaucous = [NKFColor colorWithRed:38.0f/100.0f green:51.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
	return glaucous;
}

+ (NKFColor *)glitter {
	NKFColor *glitter = [NKFColor colorWithRed:9.0f/10.0f green:91.0f/100.0f blue:98.0f/100.0f alpha:1.0f];
	return glitter;
}

+ (NKFColor *)gOGreen {
	NKFColor *gOGreen = [NKFColor colorWithRed:0.0f green:0.667f blue:4.0f/10.0f alpha:1.0f];
	return gOGreen;
}

+ (NKFColor *)gold {
	NKFColor *gold = [NKFColor colorWithRed:83.0f/100.0f green:69.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
	return gold;
}

+ (NKFColor *)goldMetallic {
	NKFColor *goldMetallic = [NKFColor colorWithRed:83.0f/100.0f green:69.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
	return goldMetallic;
}

+ (NKFColor *)goldWebGolden {
	NKFColor *goldWebGolden = [NKFColor colorWithRed:1.0f green:84.0f/100.0f blue:0.0f alpha:1.0f];
	return goldWebGolden;
}

+ (NKFColor *)goldFusion {
	NKFColor *goldFusion = [NKFColor colorWithRed:52.0f/100.0f green:46.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
	return goldFusion;
}

+ (NKFColor *)goldenBrown {
	NKFColor *goldenBrown = [NKFColor colorWithRed:6.0f/10.0f green:4.0f/10.0f blue:8.0f/100.0f alpha:1.0f];
	return goldenBrown;
}

+ (NKFColor *)goldenPoppy {
	NKFColor *goldenPoppy = [NKFColor colorWithRed:99.0f/100.0f green:76.0f/100.0f blue:0.0f alpha:1.0f];
	return goldenPoppy;
}

+ (NKFColor *)goldenYellow {
	NKFColor *goldenYellow = [NKFColor colorWithRed:1.0f green:87.0f/100.0f blue:0.0f alpha:1.0f];
	return goldenYellow;
}

+ (NKFColor *)goldenrod {
	NKFColor *goldenrod = [NKFColor colorWithRed:85.0f/100.0f green:65.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return goldenrod;
}

+ (NKFColor *)grannySmithApple {
	NKFColor *grannySmithApple = [NKFColor colorWithRed:66.0f/100.0f green:89.0f/100.0f blue:63.0f/100.0f alpha:1.0f];
	return grannySmithApple;
}

+ (NKFColor *)grape {
	NKFColor *grape = [NKFColor colorWithRed:44.0f/100.0f green:18.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
	return grape;
}

+ (NKFColor *)gray {
	NKFColor *gray = [NKFColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:1.0f];
	return gray;
}

+ (NKFColor *)grayHTMLCSSGray {
	NKFColor *grayHTMLCSSGray = [NKFColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:1.0f];
	return grayHTMLCSSGray;
}

+ (NKFColor *)grayX11Gray {
	NKFColor *grayX11Gray = [NKFColor colorWithRed:0.75f green:0.75f blue:0.75f alpha:1.0f];
	return grayX11Gray;
}

+ (NKFColor *)grayAsparagus {
	NKFColor *grayAsparagus = [NKFColor colorWithRed:27.0f/100.0f green:35.0f/100.0f blue:27.0f/100.0f alpha:1.0f];
	return grayAsparagus;
}

+ (NKFColor *)grayBlue {
	NKFColor *grayBlue = [NKFColor colorWithRed:55.0f/100.0f green:57.0f/100.0f blue:0.667f alpha:1.0f];
	return grayBlue;
}

+ (NKFColor *)greenColorWheelX11Green {
	NKFColor *greenColorWheelX11Green = [NKFColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:1.0f];
	return greenColorWheelX11Green;
}

+ (NKFColor *)greenCrayola {
	NKFColor *greenCrayola = [NKFColor colorWithRed:11.0f/100.0f green:0.667f blue:47.0f/100.0f alpha:1.0f];
	return greenCrayola;
}

+ (NKFColor *)greenHTMLCSSColor {
	NKFColor *greenHTMLCSSColor = [NKFColor colorWithRed:0.0f green:0.5f blue:0.0f alpha:1.0f];
	return greenHTMLCSSColor;
}

+ (NKFColor *)greenMunsell {
	NKFColor *greenMunsell = [NKFColor colorWithRed:0.0f green:66.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
	return greenMunsell;
}

+ (NKFColor *)greenNCS {
	NKFColor *greenNCS = [NKFColor colorWithRed:0.0f green:62.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
	return greenNCS;
}

+ (NKFColor *)greenPantone {
	NKFColor *greenPantone = [NKFColor colorWithRed:0.0f green:68.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
	return greenPantone;
}

+ (NKFColor *)greenPigment {
	NKFColor *greenPigment = [NKFColor colorWithRed:0.0f green:65.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
	return greenPigment;
}

+ (NKFColor *)greenRYB {
	NKFColor *greenRYB = [NKFColor colorWithRed:4.0f/10.0f green:69.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
	return greenRYB;
}

+ (NKFColor *)greenBlue {
	NKFColor *greenBlue = [NKFColor colorWithRed:7.0f/100.0f green:39.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
	return greenBlue;
}

+ (NKFColor *)greenCyan {
	NKFColor *greenCyan = [NKFColor colorWithRed:0.0f green:6.0f/10.0f blue:4.0f/10.0f alpha:1.0f];
	return greenCyan;
}

+ (NKFColor *)greenYellow {
	NKFColor *greenYellow = [NKFColor colorWithRed:68.0f/100.0f green:1.0f blue:18.0f/100.0f alpha:1.0f];
	return greenYellow;
}

+ (NKFColor *)grizzly {
	NKFColor *grizzly = [NKFColor colorWithRed:53.0f/100.0f green:35.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
	return grizzly;
}

+ (NKFColor *)grullo {
	NKFColor *grullo = [NKFColor colorWithRed:66.0f/100.0f green:6.0f/10.0f blue:53.0f/100.0f alpha:1.0f];
	return grullo;
}

+ (NKFColor *)guppieGreen {
	NKFColor *guppieGreen = [NKFColor colorWithRed:0.0f green:1.0f blue:0.5f alpha:1.0f];
	return guppieGreen;
}

+ (NKFColor *)halayàÚbe {
	NKFColor *halayàÚbe = [NKFColor colorWithRed:4.0f/10.0f green:22.0f/100.0f blue:0.333f alpha:1.0f];
	return halayàÚbe;
}

+ (NKFColor *)hanBlue {
	NKFColor *hanBlue = [NKFColor colorWithRed:27.0f/100.0f green:42.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
	return hanBlue;
}

+ (NKFColor *)hanPurple {
	NKFColor *hanPurple = [NKFColor colorWithRed:32.0f/100.0f green:9.0f/100.0f blue:98.0f/100.0f alpha:1.0f];
	return hanPurple;
}

+ (NKFColor *)hansaYellow {
	NKFColor *hansaYellow = [NKFColor colorWithRed:91.0f/100.0f green:84.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
	return hansaYellow;
}

+ (NKFColor *)harlequin {
	NKFColor *harlequin = [NKFColor colorWithRed:0.25f green:1.0f blue:0.0f alpha:1.0f];
	return harlequin;
}

+ (NKFColor *)harlequinGreen {
	NKFColor *harlequinGreen = [NKFColor colorWithRed:27.0f/100.0f green:8.0f/10.0f blue:9.0f/100.0f alpha:1.0f];
	return harlequinGreen;
}

+ (NKFColor *)harvardCrimson {
	NKFColor *harvardCrimson = [NKFColor colorWithRed:79.0f/100.0f green:0.0f blue:9.0f/100.0f alpha:1.0f];
	return harvardCrimson;
}

+ (NKFColor *)harvestGold {
	NKFColor *harvestGold = [NKFColor colorWithRed:85.0f/100.0f green:57.0f/100.0f blue:0.0f alpha:1.0f];
	return harvestGold;
}

+ (NKFColor *)heartGold {
	NKFColor *heartGold = [NKFColor colorWithRed:0.5f green:0.5f blue:0.0f alpha:1.0f];
	return heartGold;
}

+ (NKFColor *)heliotrope {
	NKFColor *heliotrope = [NKFColor colorWithRed:87.0f/100.0f green:45.0f/100.0f blue:1.0f alpha:1.0f];
	return heliotrope;
}

+ (NKFColor *)heliotropeGray {
	NKFColor *heliotropeGray = [NKFColor colorWithRed:0.667f green:6.0f/10.0f blue:66.0f/100.0f alpha:1.0f];
	return heliotropeGray;
}

+ (NKFColor *)heliotropeMagenta {
	NKFColor *heliotropeMagenta = [NKFColor colorWithRed:0.667f green:0.0f blue:73.0f/100.0f alpha:1.0f];
	return heliotropeMagenta;
}

+ (NKFColor *)hollywoodCerise {
	NKFColor *hollywoodCerise = [NKFColor colorWithRed:96.0f/100.0f green:0.0f blue:63.0f/100.0f alpha:1.0f];
	return hollywoodCerise;
}

+ (NKFColor *)honeydew {
	NKFColor *honeydew = [NKFColor colorWithRed:94.0f/100.0f green:1.0f blue:94.0f/100.0f alpha:1.0f];
	return honeydew;
}

+ (NKFColor *)honoluluBlue {
	NKFColor *honoluluBlue = [NKFColor colorWithRed:0.0f green:43.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
	return honoluluBlue;
}

+ (NKFColor *)hookersGreen {
	NKFColor *hookersGreen = [NKFColor colorWithRed:29.0f/100.0f green:47.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
	return hookersGreen;
}

+ (NKFColor *)hotMagenta {
	NKFColor *hotMagenta = [NKFColor colorWithRed:1.0f green:11.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
	return hotMagenta;
}

+ (NKFColor *)hotPink {
	NKFColor *hotPink = [NKFColor colorWithRed:1.0f green:41.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
	return hotPink;
}

+ (NKFColor *)hunterGreen {
	NKFColor *hunterGreen = [NKFColor colorWithRed:21.0f/100.0f green:37.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
	return hunterGreen;
}

+ (NKFColor *)iceberg {
	NKFColor *iceberg = [NKFColor colorWithRed:44.0f/100.0f green:65.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
	return iceberg;
}

+ (NKFColor *)icterine {
	NKFColor *icterine = [NKFColor colorWithRed:99.0f/100.0f green:97.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
	return icterine;
}

+ (NKFColor *)illuminatingEmerald {
	NKFColor *illuminatingEmerald = [NKFColor colorWithRed:19.0f/100.0f green:57.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
	return illuminatingEmerald;
}

+ (NKFColor *)imperial {
	NKFColor *imperial = [NKFColor colorWithRed:38.0f/100.0f green:18.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
	return imperial;
}

+ (NKFColor *)imperialBlue {
	NKFColor *imperialBlue = [NKFColor colorWithRed:0.0f green:14.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
	return imperialBlue;
}

+ (NKFColor *)imperialPurple {
	NKFColor *imperialPurple = [NKFColor colorWithRed:4.0f/10.0f green:1.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
	return imperialPurple;
}

+ (NKFColor *)imperialRed {
	NKFColor *imperialRed = [NKFColor colorWithRed:93.0f/100.0f green:16.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
	return imperialRed;
}

+ (NKFColor *)inchworm {
	NKFColor *inchworm = [NKFColor colorWithRed:7.0f/10.0f green:93.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
	return inchworm;
}

+ (NKFColor *)independence {
	NKFColor *independence = [NKFColor colorWithRed:3.0f/10.0f green:32.0f/100.0f blue:43.0f/100.0f alpha:1.0f];
	return independence;
}

+ (NKFColor *)indiaGreen {
	NKFColor *indiaGreen = [NKFColor colorWithRed:7.0f/100.0f green:53.0f/100.0f blue:3.0f/100.0f alpha:1.0f];
	return indiaGreen;
}

+ (NKFColor *)indianRed {
	NKFColor *indianRed = [NKFColor colorWithRed:8.0f/10.0f green:36.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
	return indianRed;
}

+ (NKFColor *)indianYellow {
	NKFColor *indianYellow = [NKFColor colorWithRed:89.0f/100.0f green:66.0f/100.0f blue:34.0f/100.0f alpha:1.0f];
	return indianYellow;
}

+ (NKFColor *)indigo {
	NKFColor *indigo = [NKFColor colorWithRed:44.0f/100.0f green:0.0f blue:1.0f alpha:1.0f];
	return indigo;
}

+ (NKFColor *)indigoDye {
	NKFColor *indigoDye = [NKFColor colorWithRed:4.0f/100.0f green:12.0f/100.0f blue:57.0f/100.0f alpha:1.0f];
	return indigoDye;
}

+ (NKFColor *)indigoWeb {
	NKFColor *indigoWeb = [NKFColor colorWithRed:29.0f/100.0f green:0.0f blue:51.0f/100.0f alpha:1.0f];
	return indigoWeb;
}

+ (NKFColor *)internationalKleinBlue {
	NKFColor *internationalKleinBlue = [NKFColor colorWithRed:0.0f green:18.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
	return internationalKleinBlue;
}

+ (NKFColor *)internationalOrangeAerospace {
	NKFColor *internationalOrangeAerospace = [NKFColor colorWithRed:1.0f green:31.0f/100.0f blue:0.0f alpha:1.0f];
	return internationalOrangeAerospace;
}

+ (NKFColor *)internationalOrangeEngineering {
	NKFColor *internationalOrangeEngineering = [NKFColor colorWithRed:73.0f/100.0f green:9.0f/100.0f blue:5.0f/100.0f alpha:1.0f];
	return internationalOrangeEngineering;
}

+ (NKFColor *)internationalOrangeGoldenGateBridge {
	NKFColor *internationalOrangeGoldenGateBridge = [NKFColor colorWithRed:0.75f green:21.0f/100.0f blue:0.1667f alpha:1.0f];
	return internationalOrangeGoldenGateBridge;
}

+ (NKFColor *)iris {
	NKFColor *iris = [NKFColor colorWithRed:35.0f/100.0f green:31.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
	return iris;
}

+ (NKFColor *)irresistible {
	NKFColor *irresistible = [NKFColor colorWithRed:7.0f/10.0f green:27.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
	return irresistible;
}

+ (NKFColor *)isabelline {
	NKFColor *isabelline = [NKFColor colorWithRed:96.0f/100.0f green:94.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
	return isabelline;
}

+ (NKFColor *)islam {
	return [NKFColor islamicGreen];
}

+ (NKFColor *)islamicGreen {
	NKFColor *islamicGreen = [NKFColor colorWithRed:0.0f green:56.0f/100.0f blue:0.0f alpha:1.0f];
	return islamicGreen;
}

+ (NKFColor *)italianSkyBlue {
	NKFColor *italianSkyBlue = [NKFColor colorWithRed:7.0f/10.0f green:1.0f blue:1.0f alpha:1.0f];
	return italianSkyBlue;
}

+ (NKFColor *)ivory {
	NKFColor *ivory = [NKFColor colorWithRed:1.0f green:1.0f blue:94.0f/100.0f alpha:1.0f];
	return ivory;
}

+ (NKFColor *)jade {
	NKFColor *jade = [NKFColor colorWithRed:0.0f green:66.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
	return jade;
}

+ (NKFColor *)japaneseCarmine {
	NKFColor *japaneseCarmine = [NKFColor colorWithRed:62.0f/100.0f green:16.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
	return japaneseCarmine;
}

+ (NKFColor *)japaneseIndigo {
	NKFColor *japaneseIndigo = [NKFColor colorWithRed:15.0f/100.0f green:26.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
	return japaneseIndigo;
}

+ (NKFColor *)japaneseViolet {
	NKFColor *japaneseViolet = [NKFColor colorWithRed:36.0f/100.0f green:2.0f/10.0f blue:34.0f/100.0f alpha:1.0f];
	return japaneseViolet;
}

+ (NKFColor *)jasmine {
	NKFColor *jasmine = [NKFColor colorWithRed:97.0f/100.0f green:87.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
	return jasmine;
}

+ (NKFColor *)jasper {
	NKFColor *jasper = [NKFColor colorWithRed:84.0f/100.0f green:23.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
	return jasper;
}

+ (NKFColor *)jazzberryJam {
	NKFColor *jazzberryJam = [NKFColor colorWithRed:65.0f/100.0f green:4.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
	return jazzberryJam;
}

+ (NKFColor *)jellyBean {
	NKFColor *jellyBean = [NKFColor colorWithRed:85.0f/100.0f green:38.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
	return jellyBean;
}

+ (NKFColor *)jet {
	NKFColor *jet = [NKFColor colorWithRed:2.0f/10.0f green:2.0f/10.0f blue:2.0f/10.0f alpha:1.0f];
	return jet;
}


+ (NKFColor *)jewelosco {
	return [NKFColor colorWithRed:237.0f/255.0f green:58.0f/255.0f blue:53.0f/255.0f alpha:1.0f];
}


+ (NKFColor *)jonquil {
	NKFColor *jonquil = [NKFColor colorWithRed:96.0f/100.0f green:79.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
	return jonquil;
}

+ (NKFColor *)jordyBlue {
	NKFColor *jordyBlue = [NKFColor colorWithRed:54.0f/100.0f green:73.0f/100.0f blue:95.0f/100.0f alpha:1.0f];
	return jordyBlue;
}

+ (NKFColor *)juneBud {
	NKFColor *juneBud = [NKFColor colorWithRed:74.0f/100.0f green:85.0f/100.0f blue:34.0f/100.0f alpha:1.0f];
	return juneBud;
}

+ (NKFColor *)jungleGreen {
	NKFColor *jungleGreen = [NKFColor colorWithRed:16.0f/100.0f green:0.667f blue:53.0f/100.0f alpha:1.0f];
	return jungleGreen;
}

+ (NKFColor *)kellyGreen {
	NKFColor *kellyGreen = [NKFColor colorWithRed:3.0f/10.0f green:73.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
	return kellyGreen;
}

+ (NKFColor *)kenyanCopper {
	NKFColor *kenyanCopper = [NKFColor colorWithRed:49.0f/100.0f green:11.0f/100.0f blue:2.0f/100.0f alpha:1.0f];
	return kenyanCopper;
}

+ (NKFColor *)keppel {
	NKFColor *keppel = [NKFColor colorWithRed:23.0f/100.0f green:69.0f/100.0f blue:62.0f/100.0f alpha:1.0f];
	return keppel;
}

+ (NKFColor *)jawadChickenColorHTMLCSSKhaki {
	NKFColor *jawadChickenColorHTMLCSSKhaki = [NKFColor colorWithRed:76.0f/100.0f green:69.0f/100.0f blue:57.0f/100.0f alpha:1.0f];
	return jawadChickenColorHTMLCSSKhaki;
}

+ (NKFColor *)khakiX11LightKhaki {
	NKFColor *khakiX11LightKhaki = [NKFColor colorWithRed:94.0f/100.0f green:9.0f/10.0f blue:55.0f/100.0f alpha:1.0f];
	return khakiX11LightKhaki;
}

+ (NKFColor *)kobe {
	NKFColor *kobe = [NKFColor colorWithRed:53.0f/100.0f green:18.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
	return kobe;
}

+ (NKFColor *)kobi {
	NKFColor *kobi = [NKFColor colorWithRed:91.0f/100.0f green:62.0f/100.0f blue:77.0f/100.0f alpha:1.0f];
	return kobi;
}

+ (NKFColor *)kombuGreen {
	NKFColor *kombuGreen = [NKFColor colorWithRed:21.0f/100.0f green:26.0f/100.0f blue:19.0f/100.0f alpha:1.0f];
	return kombuGreen;
}

+ (NKFColor *)kUCrimson {
	NKFColor *kUCrimson = [NKFColor colorWithRed:91.0f/100.0f green:0.0f blue:5.0f/100.0f alpha:1.0f];
	return kUCrimson;
}

+ (NKFColor *)laSalleGreen {
	NKFColor *laSalleGreen = [NKFColor colorWithRed:3.0f/100.0f green:47.0f/100.0f blue:19.0f/100.0f alpha:1.0f];
	return laSalleGreen;
}

+ (NKFColor *)languidLavender {
	NKFColor *languidLavender = [NKFColor colorWithRed:84.0f/100.0f green:79.0f/100.0f blue:87.0f/100.0f alpha:1.0f];
	return languidLavender;
}

+ (NKFColor *)lapisLazuli {
	NKFColor *lapisLazuli = [NKFColor colorWithRed:15.0f/100.0f green:38.0f/100.0f blue:61.0f/100.0f alpha:1.0f];
	return lapisLazuli;
}

+ (NKFColor *)laserLemon {
	NKFColor *laserLemon = [NKFColor colorWithRed:1.0f green:1.0f blue:4.0f/10.0f alpha:1.0f];
	return laserLemon;
}

+ (NKFColor *)laurelGreen {
	NKFColor *laurelGreen = [NKFColor colorWithRed:66.0f/100.0f green:73.0f/100.0f blue:62.0f/100.0f alpha:1.0f];
	return laurelGreen;
}

+ (NKFColor *)lava {
	NKFColor *lava = [NKFColor colorWithRed:81.0f/100.0f green:6.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return lava;
}

+ (NKFColor *)lavenderFloral {
	NKFColor *lavenderFloral = [NKFColor colorWithRed:71.0f/100.0f green:49.0f/100.0f blue:86.0f/100.0f alpha:1.0f];
	return lavenderFloral;
}

+ (NKFColor *)lavenderWeb {
	NKFColor *lavenderWeb = [NKFColor colorWithRed:9.0f/10.0f green:9.0f/10.0f blue:98.0f/100.0f alpha:1.0f];
	return lavenderWeb;
}

+ (NKFColor *)lavenderBlue {
	NKFColor *lavenderBlue = [NKFColor colorWithRed:8.0f/10.0f green:8.0f/10.0f blue:1.0f alpha:1.0f];
	return lavenderBlue;
}

+ (NKFColor *)lavenderBlush {
	NKFColor *lavenderBlush = [NKFColor colorWithRed:1.0f green:94.0f/100.0f blue:96.0f/100.0f alpha:1.0f];
	return lavenderBlush;
}

+ (NKFColor *)lavenderGray {
	NKFColor *lavenderGray = [NKFColor colorWithRed:77.0f/100.0f green:76.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
	return lavenderGray;
}

+ (NKFColor *)lavenderIndigo {
	NKFColor *lavenderIndigo = [NKFColor colorWithRed:58.0f/100.0f green:34.0f/100.0f blue:92.0f/100.0f alpha:1.0f];
	return lavenderIndigo;
}

+ (NKFColor *)lavenderMagenta {
	NKFColor *lavenderMagenta = [NKFColor colorWithRed:93.0f/100.0f green:51.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
	return lavenderMagenta;
}

+ (NKFColor *)lavenderMist {
	NKFColor *lavenderMist = [NKFColor colorWithRed:9.0f/10.0f green:9.0f/10.0f blue:98.0f/100.0f alpha:1.0f];
	return lavenderMist;
}

+ (NKFColor *)lavenderPink {
	NKFColor *lavenderPink = [NKFColor colorWithRed:98.0f/100.0f green:68.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
	return lavenderPink;
}

+ (NKFColor *)lavenderPurple {
	NKFColor *lavenderPurple = [NKFColor colorWithRed:59.0f/100.0f green:48.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
	return lavenderPurple;
}

+ (NKFColor *)lavenderRose {
	NKFColor *lavenderRose = [NKFColor colorWithRed:98.0f/100.0f green:63.0f/100.0f blue:89.0f/100.0f alpha:1.0f];
	return lavenderRose;
}

+ (NKFColor *)lawnGreen {
	NKFColor *lawnGreen = [NKFColor colorWithRed:49.0f/100.0f green:99.0f/100.0f blue:0.0f alpha:1.0f];
	return lawnGreen;
}

+ (NKFColor *)lemon {
	NKFColor *lemon = [NKFColor colorWithRed:1.0f green:97.0f/100.0f blue:0.0f alpha:1.0f];
	return lemon;
}

+ (NKFColor *)lemonChiffon {
	NKFColor *lemonChiffon = [NKFColor colorWithRed:1.0f green:98.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
	return lemonChiffon;
}

+ (NKFColor *)lemonCurry {
	NKFColor *lemonCurry = [NKFColor colorWithRed:8.0f/10.0f green:63.0f/100.0f blue:11.0f/100.0f alpha:1.0f];
	return lemonCurry;
}

+ (NKFColor *)lemonGlacier {
	NKFColor *lemonGlacier = [NKFColor colorWithRed:99.0f/100.0f green:1.0f blue:0.0f alpha:1.0f];
	return lemonGlacier;
}

+ (NKFColor *)lemonLime {
	NKFColor *lemonLime = [NKFColor colorWithRed:89.0f/100.0f green:1.0f blue:0.0f alpha:1.0f];
	return lemonLime;
}

+ (NKFColor *)lemonMeringue {
	NKFColor *lemonMeringue = [NKFColor colorWithRed:96.0f/100.0f green:92.0f/100.0f blue:0.75f alpha:1.0f];
	return lemonMeringue;
}

+ (NKFColor *)lemonYellow {
	NKFColor *lemonYellow = [NKFColor colorWithRed:1.0f green:96.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
	return lemonYellow;
}

+ (NKFColor *)lenurple {
	NKFColor *lenurple = [NKFColor colorWithRed:73.0f/100.0f green:58.0f/100.0f blue:85.0f/100.0f alpha:1.0f];
	return lenurple;
}

+ (NKFColor *)licorice {
	NKFColor *licorice = [NKFColor colorWithRed:1.0f/10.0f green:7.0f/100.0f blue:6.0f/100.0f alpha:1.0f];
	return licorice;
}

+ (NKFColor *)liberty {
	NKFColor *liberty = [NKFColor colorWithRed:0.333f green:35.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
	return liberty;
}

+ (NKFColor *)lightApricot {
	NKFColor *lightApricot = [NKFColor colorWithRed:99.0f/100.0f green:84.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
	return lightApricot;
}

+ (NKFColor *)lightBlue {
	NKFColor *lightBlue = [NKFColor colorWithRed:68.0f/100.0f green:85.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
	return lightBlue;
}

+ (NKFColor *)lightBrilliantRed {
	NKFColor *lightBrilliantRed = [NKFColor colorWithRed:1.0f green:18.0f/100.0f blue:18.0f/100.0f alpha:1.0f];
	return lightBrilliantRed;
}

+ (NKFColor *)lightBrown {
	NKFColor *lightBrown = [NKFColor colorWithRed:71.0f/100.0f green:4.0f/10.0f blue:11.0f/100.0f alpha:1.0f];
	return lightBrown;
}

+ (NKFColor *)lightCarminePink {
	NKFColor *lightCarminePink = [NKFColor colorWithRed:9.0f/10.0f green:4.0f/10.0f blue:44.0f/100.0f alpha:1.0f];
	return lightCarminePink;
}

+ (NKFColor *)lightCobaltBlue {
	NKFColor *lightCobaltBlue = [NKFColor colorWithRed:53.0f/100.0f green:0.667f blue:88.0f/100.0f alpha:1.0f];
	return lightCobaltBlue;
}

+ (NKFColor *)lightCoral {
	NKFColor *lightCoral = [NKFColor colorWithRed:94.0f/100.0f green:0.5f blue:0.5f alpha:1.0f];
	return lightCoral;
}

+ (NKFColor *)lightCornflowerBlue {
	NKFColor *lightCornflowerBlue = [NKFColor colorWithRed:58.0f/100.0f green:8.0f/10.0f blue:92.0f/100.0f alpha:1.0f];
	return lightCornflowerBlue;
}

+ (NKFColor *)lightCrimson {
	NKFColor *lightCrimson = [NKFColor colorWithRed:96.0f/100.0f green:41.0f/100.0f blue:57.0f/100.0f alpha:1.0f];
	return lightCrimson;
}

+ (NKFColor *)lightCyan {
	NKFColor *lightCyan = [NKFColor colorWithRed:88.0f/100.0f green:1.0f blue:1.0f alpha:1.0f];
	return lightCyan;
}

+ (NKFColor *)lightDeepPink {
	NKFColor *lightDeepPink = [NKFColor colorWithRed:1.0f green:36.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
	return lightDeepPink;
}

+ (NKFColor *)lightFrenchBeige {
	NKFColor *lightFrenchBeige = [NKFColor colorWithRed:78.0f/100.0f green:68.0f/100.0f blue:0.5f alpha:1.0f];
	return lightFrenchBeige;
}

+ (NKFColor *)lightFuchsiaPink {
	NKFColor *lightFuchsiaPink = [NKFColor colorWithRed:98.0f/100.0f green:52.0f/100.0f blue:94.0f/100.0f alpha:1.0f];
	return lightFuchsiaPink;
}

+ (NKFColor *)lightGoldenrodYellow {
	NKFColor *lightGoldenrodYellow = [NKFColor colorWithRed:98.0f/100.0f green:98.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
	return lightGoldenrodYellow;
}

+ (NKFColor *)lightGray {
	NKFColor *lightGray = [NKFColor colorWithRed:83.0f/100.0f green:83.0f/100.0f blue:83.0f/100.0f alpha:1.0f];
	return lightGray;
}

+ (NKFColor *)lightGrayishMagenta {
	NKFColor *lightGrayishMagenta = [NKFColor colorWithRed:8.0f/10.0f green:6.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
	return lightGrayishMagenta;
}

+ (NKFColor *)lightGreen {
	NKFColor *lightGreen = [NKFColor colorWithRed:56.0f/100.0f green:93.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
	return lightGreen;
}

+ (NKFColor *)lightHotPink {
	NKFColor *lightHotPink = [NKFColor colorWithRed:1.0f green:7.0f/10.0f blue:87.0f/100.0f alpha:1.0f];
	return lightHotPink;
}

+ (NKFColor *)lightKhaki {
	NKFColor *lightKhaki = [NKFColor colorWithRed:94.0f/100.0f green:9.0f/10.0f blue:55.0f/100.0f alpha:1.0f];
	return lightKhaki;
}

+ (NKFColor *)lightMediumOrchid {
	NKFColor *lightMediumOrchid = [NKFColor colorWithRed:83.0f/100.0f green:61.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
	return lightMediumOrchid;
}

+ (NKFColor *)lightMossGreen {
	NKFColor *lightMossGreen = [NKFColor colorWithRed:68.0f/100.0f green:87.0f/100.0f blue:68.0f/100.0f alpha:1.0f];
	return lightMossGreen;
}

+ (NKFColor *)lightOrchid {
	NKFColor *lightOrchid = [NKFColor colorWithRed:9.0f/10.0f green:66.0f/100.0f blue:84.0f/100.0f alpha:1.0f];
	return lightOrchid;
}

+ (NKFColor *)lightPastelPurple {
	NKFColor *lightPastelPurple = [NKFColor colorWithRed:69.0f/100.0f green:61.0f/100.0f blue:85.0f/100.0f alpha:1.0f];
	return lightPastelPurple;
}

+ (NKFColor *)lightPink {
	NKFColor *lightPink = [NKFColor colorWithRed:1.0f green:71.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
	return lightPink;
}

+ (NKFColor *)lightRedOchre {
	NKFColor *lightRedOchre = [NKFColor colorWithRed:91.0f/100.0f green:45.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
	return lightRedOchre;
}

+ (NKFColor *)lightSalmon {
	NKFColor *lightSalmon = [NKFColor colorWithRed:1.0f green:63.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
	return lightSalmon;
}

+ (NKFColor *)lightSalmonPink {
	NKFColor *lightSalmonPink = [NKFColor colorWithRed:1.0f green:6.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
	return lightSalmonPink;
}

+ (NKFColor *)lightSeaGreen {
	NKFColor *lightSeaGreen = [NKFColor colorWithRed:13.0f/100.0f green:7.0f/10.0f blue:0.667f alpha:1.0f];
	return lightSeaGreen;
}

+ (NKFColor *)lightSkyBlue {
	NKFColor *lightSkyBlue = [NKFColor colorWithRed:53.0f/100.0f green:81.0f/100.0f blue:98.0f/100.0f alpha:1.0f];
	return lightSkyBlue;
}

+ (NKFColor *)lightSlateGray {
	NKFColor *lightSlateGray = [NKFColor colorWithRed:47.0f/100.0f green:53.0f/100.0f blue:6.0f/10.0f alpha:1.0f];
	return lightSlateGray;
}

+ (NKFColor *)lightSteelBlue {
	NKFColor *lightSteelBlue = [NKFColor colorWithRed:69.0f/100.0f green:77.0f/100.0f blue:87.0f/100.0f alpha:1.0f];
	return lightSteelBlue;
}

+ (NKFColor *)lightTaupe {
	NKFColor *lightTaupe = [NKFColor colorWithRed:7.0f/10.0f green:55.0f/100.0f blue:43.0f/100.0f alpha:1.0f];
	return lightTaupe;
}

+ (NKFColor *)lightThulianPink {
	NKFColor *lightThulianPink = [NKFColor colorWithRed:9.0f/10.0f green:56.0f/100.0f blue:0.667f alpha:1.0f];
	return lightThulianPink;
}

+ (NKFColor *)lightYellow {
	NKFColor *lightYellow = [NKFColor colorWithRed:1.0f green:1.0f blue:88.0f/100.0f alpha:1.0f];
	return lightYellow;
}

+ (NKFColor *)lilac {
	NKFColor *lilac = [NKFColor colorWithRed:78.0f/100.0f green:64.0f/100.0f blue:78.0f/100.0f alpha:1.0f];
	return lilac;
}

+ (NKFColor *)limeColorWheel {
	NKFColor *limeColorWheel = [NKFColor colorWithRed:0.75f green:1.0f blue:0.0f alpha:1.0f];
	return limeColorWheel;
}

+ (NKFColor *)limeWebX11Green {
	NKFColor *limeWebX11Green = [NKFColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:1.0f];
	return limeWebX11Green;
}

+ (NKFColor *)limeGreen {
	NKFColor *limeGreen = [NKFColor colorWithRed:2.0f/10.0f green:8.0f/10.0f blue:2.0f/10.0f alpha:1.0f];
	return limeGreen;
}

+ (NKFColor *)limerick {
	NKFColor *limerick = [NKFColor colorWithRed:62.0f/100.0f green:76.0f/100.0f blue:4.0f/100.0f alpha:1.0f];
	return limerick;
}

+ (NKFColor *)lincolnGreen {
	NKFColor *lincolnGreen = [NKFColor colorWithRed:1.0f/10.0f green:35.0f/100.0f blue:2.0f/100.0f alpha:1.0f];
	return lincolnGreen;
}

+ (NKFColor *)linen {
	NKFColor *linen = [NKFColor colorWithRed:98.0f/100.0f green:94.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
	return linen;
}

+ (NKFColor *)lion {
	NKFColor *lion = [NKFColor colorWithRed:76.0f/100.0f green:6.0f/10.0f blue:42.0f/100.0f alpha:1.0f];
	return lion;
}

+ (NKFColor *)liseranPurple {
	NKFColor *liseranPurple = [NKFColor colorWithRed:87.0f/100.0f green:44.0f/100.0f blue:63.0f/100.0f alpha:1.0f];
	return liseranPurple;
}

+ (NKFColor *)littleBoyBlue {
	NKFColor *littleBoyBlue = [NKFColor colorWithRed:42.0f/100.0f green:63.0f/100.0f blue:86.0f/100.0f alpha:1.0f];
	return littleBoyBlue;
}

+ (NKFColor *)liver {
	NKFColor *liver = [NKFColor colorWithRed:4.0f/10.0f green:3.0f/10.0f blue:28.0f/100.0f alpha:1.0f];
	return liver;
}

+ (NKFColor *)liverDogs {
	NKFColor *liverDogs = [NKFColor colorWithRed:72.0f/100.0f green:43.0f/100.0f blue:16.0f/100.0f alpha:1.0f];
	return liverDogs;
}

+ (NKFColor *)liverOrgan {
	NKFColor *liverOrgan = [NKFColor colorWithRed:42.0f/100.0f green:18.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
	return liverOrgan;
}

+ (NKFColor *)liverChestnut {
	NKFColor *liverChestnut = [NKFColor colorWithRed:6.0f/10.0f green:45.0f/100.0f blue:34.0f/100.0f alpha:1.0f];
	return liverChestnut;
}

+ (NKFColor *)livid {
	NKFColor *livid = [NKFColor colorWithRed:4.0f/10.0f green:6.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
	return livid;
}

+ (NKFColor *)luckys {
	return [NKFColor colorWithRed:227.0f/255.0f green:21.0f/255.0f blue:39.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)lumber {
	NKFColor *lumber = [NKFColor colorWithRed:1.0f green:89.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
	return lumber;
}

+ (NKFColor *)lust {
	NKFColor *lust = [NKFColor colorWithRed:9.0f/10.0f green:13.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return lust;
}

+ (NKFColor *)magenta {
	NKFColor *magenta = [NKFColor colorWithRed:1.0f green:0.0f blue:1.0f alpha:1.0f];
	return magenta;
}

+ (NKFColor *)magentaCrayola {
	NKFColor *magentaCrayola = [NKFColor colorWithRed:1.0f green:0.333f blue:64.0f/100.0f alpha:1.0f];
	return magentaCrayola;
}

+ (NKFColor *)magentaDye {
	NKFColor *magentaDye = [NKFColor colorWithRed:79.0f/100.0f green:12.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
	return magentaDye;
}

+ (NKFColor *)magentaPantone {
	NKFColor *magentaPantone = [NKFColor colorWithRed:82.0f/100.0f green:0.25f blue:49.0f/100.0f alpha:1.0f];
	return magentaPantone;
}

+ (NKFColor *)magentaProcess {
	NKFColor *magentaProcess = [NKFColor colorWithRed:1.0f green:0.0f blue:56.0f/100.0f alpha:1.0f];
	return magentaProcess;
}

+ (NKFColor *)magentaHaze {
	NKFColor *magentaHaze = [NKFColor colorWithRed:62.0f/100.0f green:27.0f/100.0f blue:46.0f/100.0f alpha:1.0f];
	return magentaHaze;
}

+ (NKFColor *)magentaPink {
	NKFColor *magentaPink = [NKFColor colorWithRed:8.0f/10.0f green:2.0f/10.0f blue:55.0f/100.0f alpha:1.0f];
	return magentaPink;
}

+ (NKFColor *)magicMint {
	NKFColor *magicMint = [NKFColor colorWithRed:0.667f green:94.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
	return magicMint;
}

+ (NKFColor *)magnolia {
	NKFColor *magnolia = [NKFColor colorWithRed:97.0f/100.0f green:96.0f/100.0f blue:1.0f alpha:1.0f];
	return magnolia;
}

+ (NKFColor *)mahogany {
	NKFColor *mahogany = [NKFColor colorWithRed:0.75f green:0.25f blue:0.0f alpha:1.0f];
	return mahogany;
}

+ (NKFColor *)maize {
	NKFColor *maize = [NKFColor colorWithRed:98.0f/100.0f green:93.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
	return maize;
}

+ (NKFColor *)majorelleBlue {
	NKFColor *majorelleBlue = [NKFColor colorWithRed:38.0f/100.0f green:31.0f/100.0f blue:86.0f/100.0f alpha:1.0f];
	return majorelleBlue;
}

+ (NKFColor *)malachite {
	NKFColor *malachite = [NKFColor colorWithRed:4.0f/100.0f green:85.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
	return malachite;
}

+ (NKFColor *)manatee {
	NKFColor *manatee = [NKFColor colorWithRed:59.0f/100.0f green:6.0f/10.0f blue:0.667f alpha:1.0f];
	return manatee;
}

+ (NKFColor *)mangoTango {
	NKFColor *mangoTango = [NKFColor colorWithRed:1.0f green:51.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
	return mangoTango;
}

+ (NKFColor *)mantis {
	NKFColor *mantis = [NKFColor colorWithRed:45.0f/100.0f green:76.0f/100.0f blue:4.0f/10.0f alpha:1.0f];
	return mantis;
}

+ (NKFColor *)mardiGras {
	NKFColor *mardiGras = [NKFColor colorWithRed:53.0f/100.0f green:0.0f blue:52.0f/100.0f alpha:1.0f];
	return mardiGras;
}

+ (NKFColor *)marigold {
	NKFColor *marigold = [NKFColor colorWithRed:92.0f/100.0f green:64.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return marigold;
}

+ (NKFColor *)maroonCrayola {
	NKFColor *maroonCrayola = [NKFColor colorWithRed:76.0f/100.0f green:13.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
	return maroonCrayola;
}

+ (NKFColor *)maroonHTMLCSS {
	NKFColor *maroonHTMLCSS = [NKFColor colorWithRed:0.5f green:0.0f blue:0.0f alpha:1.0f];
	return maroonHTMLCSS;
}

+ (NKFColor *)maroonX11 {
	NKFColor *maroonX11 = [NKFColor colorWithRed:69.0f/100.0f green:19.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
	return maroonX11;
}

+ (NKFColor *)mauve {
	NKFColor *mauve = [NKFColor colorWithRed:88.0f/100.0f green:69.0f/100.0f blue:1.0f alpha:1.0f];
	return mauve;
}

+ (NKFColor *)mauveTaupe {
	NKFColor *mauveTaupe = [NKFColor colorWithRed:57.0f/100.0f green:37.0f/100.0f blue:43.0f/100.0f alpha:1.0f];
	return mauveTaupe;
}

+ (NKFColor *)mauvelous {
	NKFColor *mauvelous = [NKFColor colorWithRed:94.0f/100.0f green:6.0f/10.0f blue:0.667f alpha:1.0f];
	return mauvelous;
}

+ (NKFColor *)mayGreen {
	NKFColor *mayGreen = [NKFColor colorWithRed:3.0f/10.0f green:57.0f/100.0f blue:0.25f alpha:1.0f];
	return mayGreen;
}

+ (NKFColor *)mayaBlue {
	NKFColor *mayaBlue = [NKFColor colorWithRed:45.0f/100.0f green:76.0f/100.0f blue:98.0f/100.0f alpha:1.0f];
	return mayaBlue;
}

+ (NKFColor *)meatBrown {
	NKFColor *meatBrown = [NKFColor colorWithRed:9.0f/10.0f green:72.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
	return meatBrown;
}

+ (NKFColor *)mediumAquamarine {
	NKFColor *mediumAquamarine = [NKFColor colorWithRed:4.0f/10.0f green:87.0f/100.0f blue:0.667f alpha:1.0f];
	return mediumAquamarine;
}

+ (NKFColor *)mediumBlue {
	NKFColor *mediumBlue = [NKFColor colorWithRed:0.0f green:0.0f blue:8.0f/10.0f alpha:1.0f];
	return mediumBlue;
}

+ (NKFColor *)mediumCandyAppleRed {
	NKFColor *mediumCandyAppleRed = [NKFColor colorWithRed:89.0f/100.0f green:2.0f/100.0f blue:0.1667f alpha:1.0f];
	return mediumCandyAppleRed;
}

+ (NKFColor *)mediumCarmine {
	NKFColor *mediumCarmine = [NKFColor colorWithRed:69.0f/100.0f green:0.25f blue:21.0f/100.0f alpha:1.0f];
	return mediumCarmine;
}

+ (NKFColor *)mediumChampagne {
	NKFColor *mediumChampagne = [NKFColor colorWithRed:95.0f/100.0f green:9.0f/10.0f blue:0.667f alpha:1.0f];
	return mediumChampagne;
}

+ (NKFColor *)mediumElectricBlue {
	NKFColor *mediumElectricBlue = [NKFColor colorWithRed:1.0f/100.0f green:31.0f/100.0f blue:59.0f/100.0f alpha:1.0f];
	return mediumElectricBlue;
}

+ (NKFColor *)mediumJungleGreen {
	NKFColor *mediumJungleGreen = [NKFColor colorWithRed:11.0f/100.0f green:21.0f/100.0f blue:18.0f/100.0f alpha:1.0f];
	return mediumJungleGreen;
}

+ (NKFColor *)mediumLavenderMagenta {
	NKFColor *mediumLavenderMagenta = [NKFColor colorWithRed:87.0f/100.0f green:63.0f/100.0f blue:87.0f/100.0f alpha:1.0f];
	return mediumLavenderMagenta;
}

+ (NKFColor *)mediumOrchid {
	NKFColor *mediumOrchid = [NKFColor colorWithRed:73.0f/100.0f green:0.333f blue:83.0f/100.0f alpha:1.0f];
	return mediumOrchid;
}

+ (NKFColor *)mediumPersianBlue {
	NKFColor *mediumPersianBlue = [NKFColor colorWithRed:0.0f green:4.0f/10.0f blue:65.0f/100.0f alpha:1.0f];
	return mediumPersianBlue;
}

+ (NKFColor *)mediumPurple {
	NKFColor *mediumPurple = [NKFColor colorWithRed:58.0f/100.0f green:44.0f/100.0f blue:86.0f/100.0f alpha:1.0f];
	return mediumPurple;
}

+ (NKFColor *)mediumRedViolet {
	NKFColor *mediumRedViolet = [NKFColor colorWithRed:73.0f/100.0f green:2.0f/10.0f blue:52.0f/100.0f alpha:1.0f];
	return mediumRedViolet;
}

+ (NKFColor *)mediumRuby {
	NKFColor *mediumRuby = [NKFColor colorWithRed:0.667f green:0.25f blue:41.0f/100.0f alpha:1.0f];
	return mediumRuby;
}

+ (NKFColor *)mediumSeaGreen {
	NKFColor *mediumSeaGreen = [NKFColor colorWithRed:24.0f/100.0f green:7.0f/10.0f blue:44.0f/100.0f alpha:1.0f];
	return mediumSeaGreen;
}

+ (NKFColor *)mediumSkyBlue {
	NKFColor *mediumSkyBlue = [NKFColor colorWithRed:0.5f green:85.0f/100.0f blue:92.0f/100.0f alpha:1.0f];
	return mediumSkyBlue;
}

+ (NKFColor *)mediumSlateBlue {
	NKFColor *mediumSlateBlue = [NKFColor colorWithRed:48.0f/100.0f green:41.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
	return mediumSlateBlue;
}

+ (NKFColor *)mediumSpringBud {
	NKFColor *mediumSpringBud = [NKFColor colorWithRed:79.0f/100.0f green:86.0f/100.0f blue:53.0f/100.0f alpha:1.0f];
	return mediumSpringBud;
}

+ (NKFColor *)mediumSpringGreen {
	NKFColor *mediumSpringGreen = [NKFColor colorWithRed:0.0f green:98.0f/100.0f blue:6.0f/10.0f alpha:1.0f];
	return mediumSpringGreen;
}

+ (NKFColor *)mediumTaupe {
	NKFColor *mediumTaupe = [NKFColor colorWithRed:4.0f/10.0f green:3.0f/10.0f blue:28.0f/100.0f alpha:1.0f];
	return mediumTaupe;
}

+ (NKFColor *)mediumTurquoise {
	NKFColor *mediumTurquoise = [NKFColor colorWithRed:28.0f/100.0f green:82.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
	return mediumTurquoise;
}

+ (NKFColor *)mediumTuscanRed {
	NKFColor *mediumTuscanRed = [NKFColor colorWithRed:47.0f/100.0f green:27.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
	return mediumTuscanRed;
}

+ (NKFColor *)mediumVermilion {
	NKFColor *mediumVermilion = [NKFColor colorWithRed:85.0f/100.0f green:38.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
	return mediumVermilion;
}

+ (NKFColor *)mediumVioletRed {
	NKFColor *mediumVioletRed = [NKFColor colorWithRed:78.0f/100.0f green:8.0f/100.0f blue:52.0f/100.0f alpha:1.0f];
	return mediumVioletRed;
}

+ (NKFColor *)mellowApricot {
	NKFColor *mellowApricot = [NKFColor colorWithRed:97.0f/100.0f green:72.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
	return mellowApricot;
}

+ (NKFColor *)mellowYellow {
	NKFColor *mellowYellow = [NKFColor colorWithRed:97.0f/100.0f green:87.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
	return mellowYellow;
}

+ (NKFColor *)melon {
	NKFColor *melon = [NKFColor colorWithRed:99.0f/100.0f green:74.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
	return melon;
}

+ (NKFColor *)metallicSeaweed {
	NKFColor *metallicSeaweed = [NKFColor colorWithRed:4.0f/100.0f green:49.0f/100.0f blue:55.0f/100.0f alpha:1.0f];
	return metallicSeaweed;
}

+ (NKFColor *)metallicSunburst {
	NKFColor *metallicSunburst = [NKFColor colorWithRed:61.0f/100.0f green:49.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
	return metallicSunburst;
}

+ (NKFColor *)mexicanPink {
	NKFColor *mexicanPink = [NKFColor colorWithRed:89.0f/100.0f green:0.0f blue:49.0f/100.0f alpha:1.0f];
	return mexicanPink;
}

+ (NKFColor *)midnightBlue {
	NKFColor *midnightBlue = [NKFColor colorWithRed:1.0f/10.0f green:1.0f/10.0f blue:44.0f/100.0f alpha:1.0f];
	return midnightBlue;
}

+ (NKFColor *)midnightGreenEagleGreen {
	NKFColor *midnightGreenEagleGreen = [NKFColor colorWithRed:0.0f green:29.0f/100.0f blue:0.333f alpha:1.0f];
	return midnightGreenEagleGreen;
}

+ (NKFColor *)mikadoYellow {
	NKFColor *mikadoYellow = [NKFColor colorWithRed:1.0f green:77.0f/100.0f blue:5.0f/100.0f alpha:1.0f];
	return mikadoYellow;
}

+ (NKFColor *)milk {
	NKFColor *milk = [NKFColor cream];
	return milk;
}

+ (NKFColor *)mindaro {
	NKFColor *mindaro = [NKFColor colorWithRed:89.0f/100.0f green:98.0f/100.0f blue:53.0f/100.0f alpha:1.0f];
	return mindaro;
}

+ (NKFColor *)ming {
	NKFColor *ming = [NKFColor colorWithRed:21.0f/100.0f green:45.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
	return ming;
}

+ (NKFColor *)mint {
	NKFColor *mint = [NKFColor colorWithRed:24.0f/100.0f green:71.0f/100.0f blue:54.0f/100.0f alpha:1.0f];
	return mint;
}

+ (NKFColor *)mintCream {
	NKFColor *mintCream = [NKFColor colorWithRed:96.0f/100.0f green:1.0f blue:98.0f/100.0f alpha:1.0f];
	return mintCream;
}

+ (NKFColor *)mintGreen {
	NKFColor *mintGreen = [NKFColor colorWithRed:6.0f/10.0f green:1.0f blue:6.0f/10.0f alpha:1.0f];
	return mintGreen;
}

+ (NKFColor *)mistyRose {
	NKFColor *mistyRose = [NKFColor colorWithRed:1.0f green:89.0f/100.0f blue:88.0f/100.0f alpha:1.0f];
	return mistyRose;
}

+ (NKFColor *)moccasin {
	NKFColor *moccasin = [NKFColor colorWithRed:98.0f/100.0f green:92.0f/100.0f blue:84.0f/100.0f alpha:1.0f];
	return moccasin;
}

+ (NKFColor *)modeBeige {
	NKFColor *modeBeige = [NKFColor colorWithRed:59.0f/100.0f green:44.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
	return modeBeige;
}

+ (NKFColor *)moonstoneBlue {
	NKFColor *moonstoneBlue = [NKFColor colorWithRed:45.0f/100.0f green:66.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
	return moonstoneBlue;
}

+ (NKFColor *)mordantRed19 {
	NKFColor *mordantRed19 = [NKFColor colorWithRed:68.0f/100.0f green:5.0f/100.0f blue:0.0f alpha:1.0f];
	return mordantRed19;
}

+ (NKFColor *)mossGreen {
	NKFColor *mossGreen = [NKFColor colorWithRed:54.0f/100.0f green:6.0f/10.0f blue:36.0f/100.0f alpha:1.0f];
	return mossGreen;
}

+ (NKFColor *)mountainMeadow {
	NKFColor *mountainMeadow = [NKFColor colorWithRed:19.0f/100.0f green:73.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
	return mountainMeadow;
}

+ (NKFColor *)mountbattenPink {
	NKFColor *mountbattenPink = [NKFColor colorWithRed:6.0f/10.0f green:48.0f/100.0f blue:55.0f/100.0f alpha:1.0f];
	return mountbattenPink;
}

+ (NKFColor *)mSUGreen {
	NKFColor *mSUGreen = [NKFColor colorWithRed:9.0f/100.0f green:27.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
	return mSUGreen;
}

+ (NKFColor *)mughalGreen {
	NKFColor *mughalGreen = [NKFColor colorWithRed:19.0f/100.0f green:38.0f/100.0f blue:19.0f/100.0f alpha:1.0f];
	return mughalGreen;
}

+ (NKFColor *)mulberry {
	NKFColor *mulberry = [NKFColor colorWithRed:77.0f/100.0f green:29.0f/100.0f blue:55.0f/100.0f alpha:1.0f];
	return mulberry;
}

+ (NKFColor *)mustard {
	NKFColor *mustard = [NKFColor colorWithRed:1.0f green:86.0f/100.0f blue:35.0f/100.0f alpha:1.0f];
	return mustard;
}

+ (NKFColor *)myrtleGreen {
	NKFColor *myrtleGreen = [NKFColor colorWithRed:19.0f/100.0f green:47.0f/100.0f blue:45.0f/100.0f alpha:1.0f];
	return myrtleGreen;
}

+ (NKFColor *)nadeshikoPink {
	NKFColor *nadeshikoPink = [NKFColor colorWithRed:96.0f/100.0f green:68.0f/100.0f blue:78.0f/100.0f alpha:1.0f];
	return nadeshikoPink;
}

+ (NKFColor *)napierGreen {
	NKFColor *napierGreen = [NKFColor colorWithRed:16.0f/100.0f green:0.5f blue:0.0f alpha:1.0f];
	return napierGreen;
}

+ (NKFColor *)naplesYellow {
	NKFColor *naplesYellow = [NKFColor colorWithRed:98.0f/100.0f green:85.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
	return naplesYellow;
}

+ (NKFColor *)navajoWhite {
	NKFColor *navajoWhite = [NKFColor colorWithRed:1.0f green:87.0f/100.0f blue:68.0f/100.0f alpha:1.0f];
	return navajoWhite;
}

+ (NKFColor *)navy {
	NKFColor *navy = [NKFColor colorWithRed:0.0f green:0.0f blue:0.5f alpha:1.0f];
	return navy;
}

+ (NKFColor *)navyPurple {
	NKFColor *navyPurple = [NKFColor colorWithRed:58.0f/100.0f green:34.0f/100.0f blue:92.0f/100.0f alpha:1.0f];
	return navyPurple;
}

+ (NKFColor *)neonCarrot {
	NKFColor *neonCarrot = [NKFColor colorWithRed:1.0f green:64.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
	return neonCarrot;
}

+ (NKFColor *)neonFuchsia {
	NKFColor *neonFuchsia = [NKFColor colorWithRed:1.0f green:0.25f blue:39.0f/100.0f alpha:1.0f];
	return neonFuchsia;
}

+ (NKFColor *)neonGreen {
	NKFColor *neonGreen = [NKFColor colorWithRed:22.0f/100.0f green:1.0f blue:8.0f/100.0f alpha:1.0f];
	return neonGreen;
}

+ (NKFColor *)car {
	NKFColor *car = [NKFColor colorWithRed:13.0f/100.0f green:31.0f/100.0f blue:78.0f/100.0f alpha:1.0f];
	return car;
}

+ (NKFColor *)yorkPink {
	NKFColor *yorkPink = [NKFColor colorWithRed:84.0f/100.0f green:51.0f/100.0f blue:0.5f alpha:1.0f];
	return yorkPink;
}

+ (NKFColor *)nonPhotoBlue {
	NKFColor *nonPhotoBlue = [NKFColor colorWithRed:64.0f/100.0f green:87.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
	return nonPhotoBlue;
}

+ (NKFColor *)northTexasGreen {
	NKFColor *northTexasGreen = [NKFColor colorWithRed:2.0f/100.0f green:56.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
	return northTexasGreen;
}

+ (NKFColor *)nyanza {
	NKFColor *nyanza = [NKFColor colorWithRed:91.0f/100.0f green:1.0f blue:86.0f/100.0f alpha:1.0f];
	return nyanza;
}

+ (NKFColor *)oceanBoatBlue {
	NKFColor *oceanBoatBlue = [NKFColor colorWithRed:0.0f green:47.0f/100.0f blue:0.75f alpha:1.0f];
	return oceanBoatBlue;
}

+ (NKFColor *)ochre {
	NKFColor *ochre = [NKFColor colorWithRed:8.0f/10.0f green:47.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return ochre;
}

+ (NKFColor *)officeGreen {
	NKFColor *officeGreen = [NKFColor colorWithRed:0.0f green:0.5f blue:0.0f alpha:1.0f];
	return officeGreen;
}

+ (NKFColor *)oldBurgundy {
	NKFColor *oldBurgundy = [NKFColor colorWithRed:26.0f/100.0f green:19.0f/100.0f blue:18.0f/100.0f alpha:1.0f];
	return oldBurgundy;
}

+ (NKFColor *)oldGold {
	NKFColor *oldGold = [NKFColor colorWithRed:81.0f/100.0f green:71.0f/100.0f blue:23.0f/100.0f alpha:1.0f];
	return oldGold;
}

+ (NKFColor *)oldHeliotrope {
	NKFColor *oldHeliotrope = [NKFColor colorWithRed:34.0f/100.0f green:24.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
	return oldHeliotrope;
}

+ (NKFColor *)oldLace {
	NKFColor *oldLace = [NKFColor colorWithRed:99.0f/100.0f green:96.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
	return oldLace;
}

+ (NKFColor *)oldLavender {
	NKFColor *oldLavender = [NKFColor colorWithRed:47.0f/100.0f green:41.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
	return oldLavender;
}

+ (NKFColor *)oldMauve {
	NKFColor *oldMauve = [NKFColor colorWithRed:4.0f/10.0f green:19.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
	return oldMauve;
}

+ (NKFColor *)oldMossGreen {
	NKFColor *oldMossGreen = [NKFColor colorWithRed:53.0f/100.0f green:49.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
	return oldMossGreen;
}

+ (NKFColor *)oldRose {
	NKFColor *oldRose = [NKFColor colorWithRed:0.75f green:0.5f blue:51.0f/100.0f alpha:1.0f];
	return oldRose;
}

+ (NKFColor *)oldSilver {
	NKFColor *oldSilver = [NKFColor colorWithRed:52.0f/100.0f green:52.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
	return oldSilver;
}

+ (NKFColor *)olive {
	NKFColor *olive = [NKFColor colorWithRed:0.5f green:0.5f blue:0.0f alpha:1.0f];
	return olive;
}

+ (NKFColor *)oliveDrab3 {
	NKFColor *oliveDrab3 = [NKFColor colorWithRed:42.0f/100.0f green:56.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
	return oliveDrab3;
}

+ (NKFColor *)oliveDrab7 {
	NKFColor *oliveDrab7 = [NKFColor colorWithRed:24.0f/100.0f green:2.0f/10.0f blue:12.0f/100.0f alpha:1.0f];
	return oliveDrab7;
}

+ (NKFColor *)olivine {
	NKFColor *olivine = [NKFColor colorWithRed:6.0f/10.0f green:73.0f/100.0f blue:45.0f/100.0f alpha:1.0f];
	return olivine;
}

+ (NKFColor *)onyx {
	NKFColor *onyx = [NKFColor colorWithRed:21.0f/100.0f green:22.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
	return onyx;
}

+ (NKFColor *)operaMauve {
	NKFColor *operaMauve = [NKFColor colorWithRed:72.0f/100.0f green:52.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
	return operaMauve;
}

+ (NKFColor *)orangeColorWheel {
	NKFColor *orangeColorWheel = [NKFColor colorWithRed:1.0f green:0.5f blue:0.0f alpha:1.0f];
	return orangeColorWheel;
}

+ (NKFColor *)orangeCrayola {
	NKFColor *orangeCrayola = [NKFColor colorWithRed:1.0f green:46.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
	return orangeCrayola;
}

+ (NKFColor *)orangePantone {
	NKFColor *orangePantone = [NKFColor colorWithRed:1.0f green:35.0f/100.0f blue:0.0f alpha:1.0f];
	return orangePantone;
}

+ (NKFColor *)orangeRYB {
	NKFColor *orangeRYB = [NKFColor colorWithRed:98.0f/100.0f green:6.0f/10.0f blue:1.0f/100.0f alpha:1.0f];
	return orangeRYB;
}

+ (NKFColor *)orangeWeb {
	NKFColor *orangeWeb = [NKFColor colorWithRed:1.0f green:65.0f/100.0f blue:0.0f alpha:1.0f];
	return orangeWeb;
}

+ (NKFColor *)orangePeel {
	NKFColor *orangePeel = [NKFColor colorWithRed:1.0f green:62.0f/100.0f blue:0.0f alpha:1.0f];
	return orangePeel;
}

+ (NKFColor *)orangeRed {
	NKFColor *orangeRed = [NKFColor colorWithRed:1.0f green:27.0f/100.0f blue:0.0f alpha:1.0f];
	return orangeRed;
}

+ (NKFColor *)orangeYellow {
	NKFColor *orangeYellow = [NKFColor colorWithRed:97.0f/100.0f green:84.0f/100.0f blue:41.0f/100.0f alpha:1.0f];
	return orangeYellow;
}

+ (NKFColor *)orchid {
	NKFColor *orchid = [NKFColor colorWithRed:85.0f/100.0f green:44.0f/100.0f blue:84.0f/100.0f alpha:1.0f];
	return orchid;
}

+ (NKFColor *)orchidPink {
	NKFColor *orchidPink = [NKFColor colorWithRed:95.0f/100.0f green:74.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
	return orchidPink;
}

+ (NKFColor *)oriolesOrange {
	NKFColor *oriolesOrange = [NKFColor colorWithRed:98.0f/100.0f green:31.0f/100.0f blue:8.0f/100.0f alpha:1.0f];
	return oriolesOrange;
}

+ (NKFColor *)otterBrown {
	NKFColor *otterBrown = [NKFColor colorWithRed:4.0f/10.0f green:26.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return otterBrown;
}

+ (NKFColor *)outerSpace {
	NKFColor *outerSpace = [NKFColor colorWithRed:0.25f green:29.0f/100.0f blue:3.0f/10.0f alpha:1.0f];
	return outerSpace;
}

+ (NKFColor *)outrageousOrange {
	NKFColor *outrageousOrange = [NKFColor colorWithRed:1.0f green:43.0f/100.0f blue:29.0f/100.0f alpha:1.0f];
	return outrageousOrange;
}

+ (NKFColor *)oxfordBlue {
	NKFColor *oxfordBlue = [NKFColor colorWithRed:0.0f green:13.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
	return oxfordBlue;
}

+ (NKFColor *)oUCrimsonRed {
	NKFColor *oUCrimsonRed = [NKFColor colorWithRed:6.0f/10.0f green:0.0f blue:0.0f alpha:1.0f];
	return oUCrimsonRed;
}

+ (NKFColor *)pakistanGreen {
	NKFColor *pakistanGreen = [NKFColor colorWithRed:0.0f green:4.0f/10.0f blue:0.0f alpha:1.0f];
	return pakistanGreen;
}

+ (NKFColor *)palatinateBlue {
	NKFColor *palatinateBlue = [NKFColor colorWithRed:15.0f/100.0f green:23.0f/100.0f blue:89.0f/100.0f alpha:1.0f];
	return palatinateBlue;
}

+ (NKFColor *)palatinatePurple {
	NKFColor *palatinatePurple = [NKFColor colorWithRed:41.0f/100.0f green:16.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
	return palatinatePurple;
}

+ (NKFColor *)paleAqua {
	NKFColor *paleAqua = [NKFColor colorWithRed:74.0f/100.0f green:83.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
	return paleAqua;
}

+ (NKFColor *)paleBlue {
	NKFColor *paleBlue = [NKFColor colorWithRed:69.0f/100.0f green:93.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
	return paleBlue;
}

+ (NKFColor *)paleBrown {
	NKFColor *paleBrown = [NKFColor colorWithRed:6.0f/10.0f green:46.0f/100.0f blue:0.333f alpha:1.0f];
	return paleBrown;
}

+ (NKFColor *)paleCarmine {
	NKFColor *paleCarmine = [NKFColor colorWithRed:69.0f/100.0f green:0.25f blue:21.0f/100.0f alpha:1.0f];
	return paleCarmine;
}

+ (NKFColor *)paleCerulean {
	NKFColor *paleCerulean = [NKFColor colorWithRed:61.0f/100.0f green:77.0f/100.0f blue:89.0f/100.0f alpha:1.0f];
	return paleCerulean;
}

+ (NKFColor *)paleChestnut {
	NKFColor *paleChestnut = [NKFColor colorWithRed:87.0f/100.0f green:68.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
	return paleChestnut;
}

+ (NKFColor *)paleCopper {
	NKFColor *paleCopper = [NKFColor colorWithRed:85.0f/100.0f green:54.0f/100.0f blue:4.0f/10.0f alpha:1.0f];
	return paleCopper;
}

+ (NKFColor *)paleCornflowerBlue {
	NKFColor *paleCornflowerBlue = [NKFColor colorWithRed:0.667f green:8.0f/10.0f blue:94.0f/100.0f alpha:1.0f];
	return paleCornflowerBlue;
}

+ (NKFColor *)paleCyan {
	NKFColor *paleCyan = [NKFColor colorWithRed:53.0f/100.0f green:83.0f/100.0f blue:97.0f/100.0f alpha:1.0f];
	return paleCyan;
}

+ (NKFColor *)paleGold {
	NKFColor *paleGold = [NKFColor colorWithRed:9.0f/10.0f green:0.75f blue:54.0f/100.0f alpha:1.0f];
	return paleGold;
}

+ (NKFColor *)paleGoldenrod {
	NKFColor *paleGoldenrod = [NKFColor colorWithRed:93.0f/100.0f green:91.0f/100.0f blue:0.667f alpha:1.0f];
	return paleGoldenrod;
}

+ (NKFColor *)paleGreen {
	NKFColor *paleGreen = [NKFColor colorWithRed:6.0f/10.0f green:98.0f/100.0f blue:6.0f/10.0f alpha:1.0f];
	return paleGreen;
}

+ (NKFColor *)paleLavender {
	NKFColor *paleLavender = [NKFColor colorWithRed:86.0f/100.0f green:82.0f/100.0f blue:1.0f alpha:1.0f];
	return paleLavender;
}

+ (NKFColor *)paleMagenta {
	NKFColor *paleMagenta = [NKFColor colorWithRed:98.0f/100.0f green:52.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
	return paleMagenta;
}

+ (NKFColor *)paleMagentaPink {
	NKFColor *paleMagentaPink = [NKFColor colorWithRed:1.0f green:6.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
	return paleMagentaPink;
}

+ (NKFColor *)palePink {
	NKFColor *palePink = [NKFColor colorWithRed:98.0f/100.0f green:85.0f/100.0f blue:87.0f/100.0f alpha:1.0f];
	return palePink;
}

+ (NKFColor *)palePlum {
	NKFColor *palePlum = [NKFColor colorWithRed:87.0f/100.0f green:63.0f/100.0f blue:87.0f/100.0f alpha:1.0f];
	return palePlum;
}

+ (NKFColor *)paleRedViolet {
	NKFColor *paleRedViolet = [NKFColor colorWithRed:86.0f/100.0f green:44.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
	return paleRedViolet;
}

+ (NKFColor *)paleRobinEggBlue {
	NKFColor *paleRobinEggBlue = [NKFColor colorWithRed:59.0f/100.0f green:87.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
	return paleRobinEggBlue;
}

+ (NKFColor *)paleSilver {
	NKFColor *paleSilver = [NKFColor colorWithRed:79.0f/100.0f green:0.75f blue:73.0f/100.0f alpha:1.0f];
	return paleSilver;
}

+ (NKFColor *)paleSpringBud {
	NKFColor *paleSpringBud = [NKFColor colorWithRed:93.0f/100.0f green:92.0f/100.0f blue:74.0f/100.0f alpha:1.0f];
	return paleSpringBud;
}

+ (NKFColor *)paleTaupe {
	NKFColor *paleTaupe = [NKFColor colorWithRed:74.0f/100.0f green:6.0f/10.0f blue:49.0f/100.0f alpha:1.0f];
	return paleTaupe;
}

+ (NKFColor *)paleTurquoise {
	NKFColor *paleTurquoise = [NKFColor colorWithRed:69.0f/100.0f green:93.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
	return paleTurquoise;
}

+ (NKFColor *)paleViolet {
	NKFColor *paleViolet = [NKFColor colorWithRed:8.0f/10.0f green:6.0f/10.0f blue:1.0f alpha:1.0f];
	return paleViolet;
}

+ (NKFColor *)paleVioletRed {
	NKFColor *paleVioletRed = [NKFColor colorWithRed:86.0f/100.0f green:44.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
	return paleVioletRed;
}

+ (NKFColor *)pansyPurple {
	NKFColor *pansyPurple = [NKFColor colorWithRed:47.0f/100.0f green:9.0f/100.0f blue:29.0f/100.0f alpha:1.0f];
	return pansyPurple;
}

+ (NKFColor *)paoloVeroneseGreen {
	NKFColor *paoloVeroneseGreen = [NKFColor colorWithRed:0.0f green:61.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
	return paoloVeroneseGreen;
}

+ (NKFColor *)papayaWhip {
	NKFColor *papayaWhip = [NKFColor colorWithRed:1.0f green:94.0f/100.0f blue:84.0f/100.0f alpha:1.0f];
	return papayaWhip;
}

+ (NKFColor *)paradisePink {
	NKFColor *paradisePink = [NKFColor colorWithRed:9.0f/10.0f green:24.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
	return paradisePink;
}

+ (NKFColor *)parisGreen {
	NKFColor *parisGreen = [NKFColor colorWithRed:31.0f/100.0f green:78.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
	return parisGreen;
}

+ (NKFColor *)pastelBlue {
	NKFColor *pastelBlue = [NKFColor colorWithRed:68.0f/100.0f green:78.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
	return pastelBlue;
}

+ (NKFColor *)pastelBrown {
	NKFColor *pastelBrown = [NKFColor colorWithRed:51.0f/100.0f green:41.0f/100.0f blue:0.333f alpha:1.0f];
	return pastelBrown;
}

+ (NKFColor *)pastelGray {
	NKFColor *pastelGray = [NKFColor colorWithRed:81.0f/100.0f green:81.0f/100.0f blue:77.0f/100.0f alpha:1.0f];
	return pastelGray;
}

+ (NKFColor *)pastelGreen {
	NKFColor *pastelGreen = [NKFColor colorWithRed:47.0f/100.0f green:87.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
	return pastelGreen;
}

+ (NKFColor *)pastelMagenta {
	NKFColor *pastelMagenta = [NKFColor colorWithRed:96.0f/100.0f green:6.0f/10.0f blue:76.0f/100.0f alpha:1.0f];
	return pastelMagenta;
}

+ (NKFColor *)pastelOrange {
	NKFColor *pastelOrange = [NKFColor colorWithRed:1.0f green:7.0f/10.0f blue:28.0f/100.0f alpha:1.0f];
	return pastelOrange;
}

+ (NKFColor *)pastelPink {
	NKFColor *pastelPink = [NKFColor colorWithRed:87.0f/100.0f green:65.0f/100.0f blue:64.0f/100.0f alpha:1.0f];
	return pastelPink;
}

+ (NKFColor *)pastelPurple {
	NKFColor *pastelPurple = [NKFColor colorWithRed:7.0f/10.0f green:62.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
	return pastelPurple;
}

+ (NKFColor *)pastelRed {
	NKFColor *pastelRed = [NKFColor colorWithRed:1.0f green:41.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
	return pastelRed;
}

+ (NKFColor *)pastelViolet {
	NKFColor *pastelViolet = [NKFColor colorWithRed:8.0f/10.0f green:6.0f/10.0f blue:79.0f/100.0f alpha:1.0f];
	return pastelViolet;
}

+ (NKFColor *)pastelYellow {
	NKFColor *pastelYellow = [NKFColor colorWithRed:99.0f/100.0f green:99.0f/100.0f blue:59.0f/100.0f alpha:1.0f];
	return pastelYellow;
}

+ (NKFColor *)patriarch {
	NKFColor *patriarch = [NKFColor colorWithRed:0.5f green:0.0f blue:0.5f alpha:1.0f];
	return patriarch;
}

+ (NKFColor *)paynesGrey {
	NKFColor *paynesGrey = [NKFColor colorWithRed:0.333f green:41.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
	return paynesGrey;
}

+ (NKFColor *)peach {
	NKFColor *peach = [NKFColor colorWithRed:1.0f green:9.0f/10.0f blue:71.0f/100.0f alpha:1.0f];
	return peach;
}


+ (NKFColor *)pedicure {
	return [NKFColor fuchsia];
}


+ (NKFColor *)peach2 {
	NKFColor *peach2 = [NKFColor colorWithRed:1.0f green:8.0f/10.0f blue:64.0f/100.0f alpha:1.0f];
	return peach2;
}

+ (NKFColor *)peachOrange {
	NKFColor *peachOrange = [NKFColor colorWithRed:1.0f green:8.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
	return peachOrange;
}

+ (NKFColor *)peachPuff {
	NKFColor *peachPuff = [NKFColor colorWithRed:1.0f green:85.0f/100.0f blue:73.0f/100.0f alpha:1.0f];
	return peachPuff;
}

+ (NKFColor *)peachYellow {
	NKFColor *peachYellow = [NKFColor colorWithRed:98.0f/100.0f green:87.0f/100.0f blue:68.0f/100.0f alpha:1.0f];
	return peachYellow;
}

+ (NKFColor *)pear {
	NKFColor *pear = [NKFColor colorWithRed:82.0f/100.0f green:89.0f/100.0f blue:19.0f/100.0f alpha:1.0f];
	return pear;
}

+ (NKFColor *)pearl {
	NKFColor *pearl = [NKFColor colorWithRed:92.0f/100.0f green:88.0f/100.0f blue:78.0f/100.0f alpha:1.0f];
	return pearl;
}

+ (NKFColor *)pearlAqua {
	NKFColor *pearlAqua = [NKFColor colorWithRed:53.0f/100.0f green:85.0f/100.0f blue:0.75f alpha:1.0f];
	return pearlAqua;
}

+ (NKFColor *)pearlyPurple {
	NKFColor *pearlyPurple = [NKFColor colorWithRed:72.0f/100.0f green:41.0f/100.0f blue:64.0f/100.0f alpha:1.0f];
	return pearlyPurple;
}

+ (NKFColor *)peridot {
	NKFColor *peridot = [NKFColor colorWithRed:9.0f/10.0f green:89.0f/100.0f blue:0.0f alpha:1.0f];
	return peridot;
}

+ (NKFColor *)periwinkle {
	NKFColor *periwinkle = [NKFColor colorWithRed:8.0f/10.0f green:8.0f/10.0f blue:1.0f alpha:1.0f];
	return periwinkle;
}

+ (NKFColor *)persianBlue {
	NKFColor *persianBlue = [NKFColor colorWithRed:11.0f/100.0f green:22.0f/100.0f blue:73.0f/100.0f alpha:1.0f];
	return persianBlue;
}

+ (NKFColor *)persianGreen {
	NKFColor *persianGreen = [NKFColor colorWithRed:0.0f green:65.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
	return persianGreen;
}

+ (NKFColor *)persianIndigo {
	NKFColor *persianIndigo = [NKFColor colorWithRed:2.0f/10.0f green:7.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
	return persianIndigo;
}

+ (NKFColor *)persianOrange {
	NKFColor *persianOrange = [NKFColor colorWithRed:85.0f/100.0f green:56.0f/100.0f blue:35.0f/100.0f alpha:1.0f];
	return persianOrange;
}

+ (NKFColor *)persianPink {
	NKFColor *persianPink = [NKFColor colorWithRed:97.0f/100.0f green:0.5f blue:0.75f alpha:1.0f];
	return persianPink;
}

+ (NKFColor *)persianPlum {
	NKFColor *persianPlum = [NKFColor colorWithRed:44.0f/100.0f green:11.0f/100.0f blue:11.0f/100.0f alpha:1.0f];
	return persianPlum;
}

+ (NKFColor *)persianRed {
	NKFColor *persianRed = [NKFColor colorWithRed:8.0f/10.0f green:2.0f/10.0f blue:2.0f/10.0f alpha:1.0f];
	return persianRed;
}

+ (NKFColor *)persianRose {
	NKFColor *persianRose = [NKFColor colorWithRed:1.0f green:16.0f/100.0f blue:64.0f/100.0f alpha:1.0f];
	return persianRose;
}

+ (NKFColor *)persimmon {
	NKFColor *persimmon = [NKFColor colorWithRed:93.0f/100.0f green:35.0f/100.0f blue:0.0f alpha:1.0f];
	return persimmon;
}

+ (NKFColor *)peru {
	NKFColor *peru = [NKFColor colorWithRed:8.0f/10.0f green:52.0f/100.0f blue:0.25f alpha:1.0f];
	return peru;
}

+ (NKFColor *)phlox {
	NKFColor *phlox = [NKFColor colorWithRed:87.0f/100.0f green:0.0f blue:1.0f alpha:1.0f];
	return phlox;
}

+ (NKFColor *)phthaloBlue {
	NKFColor *phthaloBlue = [NKFColor colorWithRed:0.0f green:6.0f/100.0f blue:54.0f/100.0f alpha:1.0f];
	return phthaloBlue;
}

+ (NKFColor *)phthaloGreen {
	NKFColor *phthaloGreen = [NKFColor colorWithRed:7.0f/100.0f green:21.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
	return phthaloGreen;
}

+ (NKFColor *)pictonBlue {
	NKFColor *pictonBlue = [NKFColor colorWithRed:27.0f/100.0f green:69.0f/100.0f blue:91.0f/100.0f alpha:1.0f];
	return pictonBlue;
}

+ (NKFColor *)pictorialCarmine {
	NKFColor *pictorialCarmine = [NKFColor colorWithRed:76.0f/100.0f green:4.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
	return pictorialCarmine;
}

+ (NKFColor *)piggyPink {
	NKFColor *piggyPink = [NKFColor colorWithRed:99.0f/100.0f green:87.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
	return piggyPink;
}

+ (NKFColor *)pineGreen {
	NKFColor *pineGreen = [NKFColor colorWithRed:0.0f green:47.0f/100.0f blue:44.0f/100.0f alpha:1.0f];
	return pineGreen;
}

+ (NKFColor *)pineapple {
	NKFColor *pineapple = [NKFColor colorWithRed:34.0f/100.0f green:24.0f/100.0f blue:5.0f/100.0f alpha:1.0f];
	return pineapple;
}

+ (NKFColor *)pink {
	NKFColor *pink = [NKFColor colorWithRed:1.0f green:0.75f blue:8.0f/10.0f alpha:1.0f];
	return pink;
}

+ (NKFColor *)pinkPantone {
	NKFColor *pinkPantone = [NKFColor colorWithRed:84.0f/100.0f green:28.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
	return pinkPantone;
}

+ (NKFColor *)pinkLace {
	NKFColor *pinkLace = [NKFColor colorWithRed:1.0f green:87.0f/100.0f blue:96.0f/100.0f alpha:1.0f];
	return pinkLace;
}

+ (NKFColor *)pinkLavender {
	NKFColor *pinkLavender = [NKFColor colorWithRed:85.0f/100.0f green:7.0f/10.0f blue:82.0f/100.0f alpha:1.0f];
	return pinkLavender;
}

+ (NKFColor *)pinkOrange {
	NKFColor *pinkOrange = [NKFColor colorWithRed:1.0f green:6.0f/10.0f blue:4.0f/10.0f alpha:1.0f];
	return pinkOrange;
}

+ (NKFColor *)pinkPearl {
	NKFColor *pinkPearl = [NKFColor colorWithRed:91.0f/100.0f green:0.667f blue:81.0f/100.0f alpha:1.0f];
	return pinkPearl;
}

+ (NKFColor *)pinkRaspberry {
	NKFColor *pinkRaspberry = [NKFColor colorWithRed:6.0f/10.0f green:0.0f blue:21.0f/100.0f alpha:1.0f];
	return pinkRaspberry;
}

+ (NKFColor *)pinkSherbet {
	NKFColor *pinkSherbet = [NKFColor colorWithRed:97.0f/100.0f green:56.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
	return pinkSherbet;
}

+ (NKFColor *)pistachio {
	NKFColor *pistachio = [NKFColor colorWithRed:58.0f/100.0f green:77.0f/100.0f blue:45.0f/100.0f alpha:1.0f];
	return pistachio;
}

+ (NKFColor *)pizza {
    return [NKFColor colorWithRed:0.85f green:0.1f blue:0.15f alpha:1.0f];
}

+ (NKFColor *)platinum {
	NKFColor *platinum = [NKFColor colorWithRed:9.0f/10.0f green:89.0f/100.0f blue:89.0f/100.0f alpha:1.0f];
	return platinum;
}

+ (NKFColor *)plum {
	NKFColor *plum = [NKFColor colorWithRed:56.0f/100.0f green:27.0f/100.0f blue:52.0f/100.0f alpha:1.0f];
	return plum;
}

+ (NKFColor *)plumWeb {
	NKFColor *plumWeb = [NKFColor colorWithRed:87.0f/100.0f green:63.0f/100.0f blue:87.0f/100.0f alpha:1.0f];
	return plumWeb;
}

+ (NKFColor *)pompAndPower {
	NKFColor *pompAndPower = [NKFColor colorWithRed:53.0f/100.0f green:38.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
	return pompAndPower;
}

+ (NKFColor *)popstar {
	NKFColor *popstar = [NKFColor colorWithRed:0.75f green:31.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
	return popstar;
}

+ (NKFColor *)portlandOrange {
	NKFColor *portlandOrange = [NKFColor colorWithRed:1.0f green:35.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
	return portlandOrange;
}

+ (NKFColor *)powderBlue {
	NKFColor *powderBlue = [NKFColor colorWithRed:69.0f/100.0f green:88.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
	return powderBlue;
}

+ (NKFColor *)princetonOrange {
	NKFColor *princetonOrange = [NKFColor colorWithRed:96.0f/100.0f green:0.5f blue:15.0f/100.0f alpha:1.0f];
	return princetonOrange;
}

+ (NKFColor *)prune {
	NKFColor *prune = [NKFColor colorWithRed:44.0f/100.0f green:11.0f/100.0f blue:11.0f/100.0f alpha:1.0f];
	return prune;
}

+ (NKFColor *)prussianBlue {
	NKFColor *prussianBlue = [NKFColor colorWithRed:0.0f green:19.0f/100.0f blue:0.333f alpha:1.0f];
	return prussianBlue;
}

+ (NKFColor *)psychedelicPurple {
	NKFColor *psychedelicPurple = [NKFColor colorWithRed:87.0f/100.0f green:0.0f blue:1.0f alpha:1.0f];
	return psychedelicPurple;
}

+ (NKFColor *)puce {
	NKFColor *puce = [NKFColor colorWithRed:8.0f/10.0f green:53.0f/100.0f blue:6.0f/10.0f alpha:1.0f];
	return puce;
}

+ (NKFColor *)puceRed {
	NKFColor *puceRed = [NKFColor colorWithRed:45.0f/100.0f green:18.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
	return puceRed;
}

+ (NKFColor *)pullmanBrownUPSBrown {
	NKFColor *pullmanBrownUPSBrown = [NKFColor colorWithRed:39.0f/100.0f green:0.25f blue:9.0f/100.0f alpha:1.0f];
	return pullmanBrownUPSBrown;
}

+ (NKFColor *)pullmanGreen {
	NKFColor *pullmanGreen = [NKFColor colorWithRed:23.0f/100.0f green:2.0f/10.0f blue:11.0f/100.0f alpha:1.0f];
	return pullmanGreen;
}

+ (NKFColor *)pumpkin {
	NKFColor *pumpkin = [NKFColor colorWithRed:1.0f green:46.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
	return pumpkin;
}

+ (NKFColor *)purpleHTML {
	NKFColor *purpleHTML = [NKFColor colorWithRed:0.5f green:0.0f blue:0.5f alpha:1.0f];
	return purpleHTML;
}

+ (NKFColor *)purpleMunsell {
	NKFColor *purpleMunsell = [NKFColor colorWithRed:62.0f/100.0f green:0.0f blue:77.0f/100.0f alpha:1.0f];
	return purpleMunsell;
}

+ (NKFColor *)purpleX11 {
	NKFColor *purpleX11 = [NKFColor colorWithRed:63.0f/100.0f green:13.0f/100.0f blue:94.0f/100.0f alpha:1.0f];
	return purpleX11;
}

+ (NKFColor *)purpleHeart {
	NKFColor *purpleHeart = [NKFColor colorWithRed:41.0f/100.0f green:21.0f/100.0f blue:61.0f/100.0f alpha:1.0f];
	return purpleHeart;
}

+ (NKFColor *)purpleMountainMajesty {
	NKFColor *purpleMountainMajesty = [NKFColor colorWithRed:59.0f/100.0f green:47.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
	return purpleMountainMajesty;
}

+ (NKFColor *)purpleNavy {
	NKFColor *purpleNavy = [NKFColor colorWithRed:31.0f/100.0f green:32.0f/100.0f blue:0.5f alpha:1.0f];
	return purpleNavy;
}

+ (NKFColor *)purplePizzazz {
	NKFColor *purplePizzazz = [NKFColor colorWithRed:1.0f green:31.0f/100.0f blue:85.0f/100.0f alpha:1.0f];
	return purplePizzazz;
}

+ (NKFColor *)purpleTaupe {
	NKFColor *purpleTaupe = [NKFColor colorWithRed:31.0f/100.0f green:0.25f blue:3.0f/10.0f alpha:1.0f];
	return purpleTaupe;
}

+ (NKFColor *)purpureus {
	NKFColor *purpureus = [NKFColor colorWithRed:6.0f/10.0f green:31.0f/100.0f blue:68.0f/100.0f alpha:1.0f];
	return purpureus;
}

+ (NKFColor *)quartz {
	NKFColor *quartz = [NKFColor colorWithRed:32.0f/100.0f green:28.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
	return quartz;
}

+ (NKFColor *)queenBlue {
	NKFColor *queenBlue = [NKFColor colorWithRed:26.0f/100.0f green:42.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
	return queenBlue;
}

+ (NKFColor *)queenPink {
	NKFColor *queenPink = [NKFColor colorWithRed:91.0f/100.0f green:8.0f/10.0f blue:84.0f/100.0f alpha:1.0f];
	return queenPink;
}

+ (NKFColor *)quinacridoneMagenta {
	NKFColor *quinacridoneMagenta = [NKFColor colorWithRed:56.0f/100.0f green:23.0f/100.0f blue:35.0f/100.0f alpha:1.0f];
	return quinacridoneMagenta;
}

+ (NKFColor *)rackley {
	NKFColor *rackley = [NKFColor colorWithRed:36.0f/100.0f green:54.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
	return rackley;
}

+ (NKFColor *)radicalRed {
	NKFColor *radicalRed = [NKFColor colorWithRed:1.0f green:21.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
	return radicalRed;
}

+ (NKFColor *)rajah {
	NKFColor *rajah = [NKFColor colorWithRed:98.0f/100.0f green:0.667f blue:38.0f/100.0f alpha:1.0f];
	return rajah;
}

+ (NKFColor *)raspberry {
	NKFColor *raspberry = [NKFColor colorWithRed:89.0f/100.0f green:4.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
	return raspberry;
}

+ (NKFColor *)raspberryGlace {
	NKFColor *raspberryGlace = [NKFColor colorWithRed:57.0f/100.0f green:37.0f/100.0f blue:43.0f/100.0f alpha:1.0f];
	return raspberryGlace;
}

+ (NKFColor *)raspberryPink {
	NKFColor *raspberryPink = [NKFColor colorWithRed:89.0f/100.0f green:31.0f/100.0f blue:6.0f/10.0f alpha:1.0f];
	return raspberryPink;
}

+ (NKFColor *)raspberryRose {
	NKFColor *raspberryRose = [NKFColor colorWithRed:7.0f/10.0f green:27.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
	return raspberryRose;
}

+ (NKFColor *)rawUmber {
	NKFColor *rawUmber = [NKFColor colorWithRed:51.0f/100.0f green:4.0f/10.0f blue:27.0f/100.0f alpha:1.0f];
	return rawUmber;
}

+ (NKFColor *)razzleDazzleRose {
	NKFColor *razzleDazzleRose = [NKFColor colorWithRed:1.0f green:2.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
	return razzleDazzleRose;
}

+ (NKFColor *)razzmatazz {
	NKFColor *razzmatazz = [NKFColor colorWithRed:89.0f/100.0f green:15.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
	return razzmatazz;
}

+ (NKFColor *)razzmicBerry {
	NKFColor *razzmicBerry = [NKFColor colorWithRed:55.0f/100.0f green:31.0f/100.0f blue:52.0f/100.0f alpha:1.0f];
	return razzmicBerry;
}

+ (NKFColor *)rebeccaPurple {
	NKFColor *rebeccaPurple = [NKFColor colorWithRed:4.0f/10.0f green:2.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
	return rebeccaPurple;
}

+ (NKFColor *)red {
	NKFColor *red = [NKFColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
	return red;
}

+ (NKFColor *)redCrayola {
	NKFColor *redCrayola = [NKFColor colorWithRed:93.0f/100.0f green:13.0f/100.0f blue:3.0f/10.0f alpha:1.0f];
	return redCrayola;
}

+ (NKFColor *)redMunsell {
	NKFColor *redMunsell = [NKFColor colorWithRed:95.0f/100.0f green:0.0f blue:24.0f/100.0f alpha:1.0f];
	return redMunsell;
}

+ (NKFColor *)redNCS {
	NKFColor *redNCS = [NKFColor colorWithRed:77.0f/100.0f green:1.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
	return redNCS;
}

+ (NKFColor *)redPantone {
	NKFColor *redPantone = [NKFColor colorWithRed:93.0f/100.0f green:16.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
	return redPantone;
}

+ (NKFColor *)redPigment {
	NKFColor *redPigment = [NKFColor colorWithRed:93.0f/100.0f green:11.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
	return redPigment;
}

+ (NKFColor *)redRYB {
	NKFColor *redRYB = [NKFColor colorWithRed:1.0f green:15.0f/100.0f blue:7.0f/100.0f alpha:1.0f];
	return redRYB;
}

+ (NKFColor *)redBrown {
	NKFColor *redBrown = [NKFColor colorWithRed:65.0f/100.0f green:16.0f/100.0f blue:16.0f/100.0f alpha:1.0f];
	return redBrown;
}

+ (NKFColor *)redDevil {
	NKFColor *redDevil = [NKFColor colorWithRed:53.0f/100.0f green:0.0f blue:7.0f/100.0f alpha:1.0f];
	return redDevil;
}

+ (NKFColor *)redOrange {
	NKFColor *redOrange = [NKFColor colorWithRed:1.0f green:0.333f blue:29.0f/100.0f alpha:1.0f];
	return redOrange;
}

+ (NKFColor *)redPurple {
	NKFColor *redPurple = [NKFColor colorWithRed:89.0f/100.0f green:0.0f blue:47.0f/100.0f alpha:1.0f];
	return redPurple;
}

+ (NKFColor *)redViolet {
	NKFColor *redViolet = [NKFColor colorWithRed:78.0f/100.0f green:8.0f/100.0f blue:52.0f/100.0f alpha:1.0f];
	return redViolet;
}

+ (NKFColor *)redwood {
	NKFColor *redwood = [NKFColor colorWithRed:64.0f/100.0f green:35.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
	return redwood;
}

+ (NKFColor *)regalia {
	NKFColor *regalia = [NKFColor colorWithRed:32.0f/100.0f green:18.0f/100.0f blue:0.5f alpha:1.0f];
	return regalia;
}

+ (NKFColor *)registrationBlack {
	NKFColor *registrationBlack = [NKFColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
	return registrationBlack;
}

+ (NKFColor *)resolutionBlue {
	NKFColor *resolutionBlue = [NKFColor colorWithRed:0.0f green:14.0f/100.0f blue:53.0f/100.0f alpha:1.0f];
	return resolutionBlue;
}

+ (NKFColor *)rhythm {
	NKFColor *rhythm = [NKFColor colorWithRed:47.0f/100.0f green:46.0f/100.0f blue:59.0f/100.0f alpha:1.0f];
	return rhythm;
}

+ (NKFColor *)richBlack {
	NKFColor *richBlack = [NKFColor colorWithRed:0.0f green:0.25f blue:0.25f alpha:1.0f];
	return richBlack;
}

+ (NKFColor *)richBlackFOGRA29 {
	NKFColor *richBlackFOGRA29 = [NKFColor colorWithRed:0.0f green:4.0f/100.0f blue:7.0f/100.0f alpha:1.0f];
	return richBlackFOGRA29;
}

+ (NKFColor *)richBlackFOGRA39 {
	NKFColor *richBlackFOGRA39 = [NKFColor colorWithRed:0.0f green:1.0f/100.0f blue:1.0f/100.0f alpha:1.0f];
	return richBlackFOGRA39;
}

+ (NKFColor *)richBrilliantLavender {
	NKFColor *richBrilliantLavender = [NKFColor colorWithRed:95.0f/100.0f green:65.0f/100.0f blue:1.0f alpha:1.0f];
	return richBrilliantLavender;
}

+ (NKFColor *)richCarmine {
	NKFColor *richCarmine = [NKFColor colorWithRed:84.0f/100.0f green:0.0f blue:0.25f alpha:1.0f];
	return richCarmine;
}

+ (NKFColor *)richElectricBlue {
	NKFColor *richElectricBlue = [NKFColor colorWithRed:3.0f/100.0f green:57.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
	return richElectricBlue;
}

+ (NKFColor *)richLavender {
	NKFColor *richLavender = [NKFColor colorWithRed:65.0f/100.0f green:42.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
	return richLavender;
}

+ (NKFColor *)richLilac {
	NKFColor *richLilac = [NKFColor colorWithRed:71.0f/100.0f green:4.0f/10.0f blue:82.0f/100.0f alpha:1.0f];
	return richLilac;
}

+ (NKFColor *)richMaroon {
	NKFColor *richMaroon = [NKFColor colorWithRed:69.0f/100.0f green:19.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
	return richMaroon;
}

+ (NKFColor *)rifleGreen {
	NKFColor *rifleGreen = [NKFColor colorWithRed:27.0f/100.0f green:3.0f/10.0f blue:22.0f/100.0f alpha:1.0f];
	return rifleGreen;
}

+ (NKFColor *)roastCoffee {
	NKFColor *roastCoffee = [NKFColor colorWithRed:44.0f/100.0f green:26.0f/100.0f blue:0.25f alpha:1.0f];
	return roastCoffee;
}

+ (NKFColor *)robinEggBlue {
	NKFColor *robinEggBlue = [NKFColor colorWithRed:0.0f green:8.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
	return robinEggBlue;
}

+ (NKFColor *)rocketMetallic {
	NKFColor *rocketMetallic = [NKFColor colorWithRed:54.0f/100.0f green:0.5f blue:0.5f alpha:1.0f];
	return rocketMetallic;
}

+ (NKFColor *)romanSilver {
	NKFColor *romanSilver = [NKFColor colorWithRed:51.0f/100.0f green:54.0f/100.0f blue:59.0f/100.0f alpha:1.0f];
	return romanSilver;
}

+ (NKFColor *)rose {
	NKFColor *rose = [NKFColor colorWithRed:1.0f green:0.0f blue:0.5f alpha:1.0f];
	return rose;
}

+ (NKFColor *)roseBonbon {
	NKFColor *roseBonbon = [NKFColor colorWithRed:98.0f/100.0f green:26.0f/100.0f blue:62.0f/100.0f alpha:1.0f];
	return roseBonbon;
}

+ (NKFColor *)roseEbony {
	NKFColor *roseEbony = [NKFColor colorWithRed:4.0f/10.0f green:28.0f/100.0f blue:27.0f/100.0f alpha:1.0f];
	return roseEbony;
}

+ (NKFColor *)roseGold {
	NKFColor *roseGold = [NKFColor colorWithRed:72.0f/100.0f green:43.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
	return roseGold;
}

+ (NKFColor *)roseMadder {
	NKFColor *roseMadder = [NKFColor colorWithRed:89.0f/100.0f green:15.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
	return roseMadder;
}

+ (NKFColor *)rosePink {
	NKFColor *rosePink = [NKFColor colorWithRed:1.0f green:4.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
	return rosePink;
}

+ (NKFColor *)roseQuartz {
	NKFColor *roseQuartz = [NKFColor colorWithRed:0.667f green:6.0f/10.0f blue:66.0f/100.0f alpha:1.0f];
	return roseQuartz;
}

+ (NKFColor *)roseRed {
	NKFColor *roseRed = [NKFColor colorWithRed:76.0f/100.0f green:12.0f/100.0f blue:34.0f/100.0f alpha:1.0f];
	return roseRed;
}

+ (NKFColor *)roseTaupe {
	NKFColor *roseTaupe = [NKFColor colorWithRed:56.0f/100.0f green:36.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
	return roseTaupe;
}

+ (NKFColor *)roseVale {
	NKFColor *roseVale = [NKFColor colorWithRed:0.667f green:31.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
	return roseVale;
}

+ (NKFColor *)rosewood {
	NKFColor *rosewood = [NKFColor colorWithRed:4.0f/10.0f green:0.0f blue:4.0f/100.0f alpha:1.0f];
	return rosewood;
}

+ (NKFColor *)rossoCorsa {
	NKFColor *rossoCorsa = [NKFColor colorWithRed:83.0f/100.0f green:0.0f blue:0.0f alpha:1.0f];
	return rossoCorsa;
}

+ (NKFColor *)rosyBrown {
	NKFColor *rosyBrown = [NKFColor colorWithRed:74.0f/100.0f green:56.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
	return rosyBrown;
}

+ (NKFColor *)royalAzure {
	NKFColor *royalAzure = [NKFColor colorWithRed:0.0f green:22.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
	return royalAzure;
}

+ (NKFColor *)royalBlue {
	NKFColor *royalBlue = [NKFColor colorWithRed:0.0f green:14.0f/100.0f blue:4.0f/10.0f alpha:1.0f];
	return royalBlue;
}

+ (NKFColor *)royalBlue2 {
	NKFColor *royalBlue = [NKFColor colorWithRed:0.25f green:41.0f/100.0f blue:88.0f/100.0f alpha:1.0f];
	return royalBlue;
}

+ (NKFColor *)royalFuchsia {
	NKFColor *royalFuchsia = [NKFColor colorWithRed:79.0f/100.0f green:0.1667f blue:57.0f/100.0f alpha:1.0f];
	return royalFuchsia;
}

+ (NKFColor *)royalPurple {
	NKFColor *royalPurple = [NKFColor colorWithRed:47.0f/100.0f green:32.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
	return royalPurple;
}

+ (NKFColor *)royalYellow {
	NKFColor *royalYellow = [NKFColor colorWithRed:98.0f/100.0f green:85.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
	return royalYellow;
}

+ (NKFColor *)ruber {
	NKFColor *ruber = [NKFColor colorWithRed:81.0f/100.0f green:27.0f/100.0f blue:46.0f/100.0f alpha:1.0f];
	return ruber;
}

+ (NKFColor *)rubineRed {
	NKFColor *rubineRed = [NKFColor colorWithRed:82.0f/100.0f green:0.0f blue:34.0f/100.0f alpha:1.0f];
	return rubineRed;
}

+ (NKFColor *)ruby {
	NKFColor *ruby = [NKFColor colorWithRed:88.0f/100.0f green:7.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
	return ruby;
}

+ (NKFColor *)rubyRed {
	NKFColor *rubyRed = [NKFColor colorWithRed:61.0f/100.0f green:7.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
	return rubyRed;
}

+ (NKFColor *)ruddy {
	NKFColor *ruddy = [NKFColor colorWithRed:1.0f green:0.0f blue:16.0f/100.0f alpha:1.0f];
	return ruddy;
}

+ (NKFColor *)ruddyBrown {
	NKFColor *ruddyBrown = [NKFColor colorWithRed:73.0f/100.0f green:4.0f/10.0f blue:16.0f/100.0f alpha:1.0f];
	return ruddyBrown;
}

+ (NKFColor *)ruddyPink {
	NKFColor *ruddyPink = [NKFColor colorWithRed:88.0f/100.0f green:56.0f/100.0f blue:59.0f/100.0f alpha:1.0f];
	return ruddyPink;
}

+ (NKFColor *)rufous {
	NKFColor *rufous = [NKFColor colorWithRed:66.0f/100.0f green:11.0f/100.0f blue:3.0f/100.0f alpha:1.0f];
	return rufous;
}

+ (NKFColor *)russet {
	NKFColor *russet = [NKFColor colorWithRed:0.5f green:27.0f/100.0f blue:11.0f/100.0f alpha:1.0f];
	return russet;
}

+ (NKFColor *)russianGreen {
	NKFColor *russianGreen = [NKFColor colorWithRed:4.0f/10.0f green:57.0f/100.0f blue:4.0f/10.0f alpha:1.0f];
	return russianGreen;
}

+ (NKFColor *)russianViolet {
	NKFColor *russianViolet = [NKFColor colorWithRed:2.0f/10.0f green:9.0f/100.0f blue:3.0f/10.0f alpha:1.0f];
	return russianViolet;
}

+ (NKFColor *)rust {
	NKFColor *rust = [NKFColor colorWithRed:72.0f/100.0f green:0.25f blue:5.0f/100.0f alpha:1.0f];
	return rust;
}

+ (NKFColor *)rustyRed {
	NKFColor *rustyRed = [NKFColor colorWithRed:85.0f/100.0f green:0.1667f blue:26.0f/100.0f alpha:1.0f];
	return rustyRed;
}

+ (NKFColor *)sacramentoStateGreen {
	NKFColor *sacramentoStateGreen = [NKFColor colorWithRed:0.0f green:34.0f/100.0f blue:0.25f alpha:1.0f];
	return sacramentoStateGreen;
}

+ (NKFColor *)saddleBrown {
	NKFColor *saddleBrown = [NKFColor colorWithRed:55.0f/100.0f green:27.0f/100.0f blue:7.0f/100.0f alpha:1.0f];
	return saddleBrown;
}

+ (NKFColor *)safetyOrange {
	NKFColor *safetyOrange = [NKFColor colorWithRed:1.0f green:47.0f/100.0f blue:0.0f alpha:1.0f];
	return safetyOrange;
}

+ (NKFColor *)safetyOrangeBlazeOrange {
	NKFColor *safetyOrangeBlazeOrange = [NKFColor colorWithRed:1.0f green:4.0f/10.0f blue:0.0f alpha:1.0f];
	return safetyOrangeBlazeOrange;
}

+ (NKFColor *)safetyYellow {
	NKFColor *safetyYellow = [NKFColor colorWithRed:93.0f/100.0f green:82.0f/100.0f blue:1.0f/100.0f alpha:1.0f];
	return safetyYellow;
}

+ (NKFColor *)saffron {
	NKFColor *saffron = [NKFColor colorWithRed:96.0f/100.0f green:77.0f/100.0f blue:19.0f/100.0f alpha:1.0f];
	return saffron;
}

+ (NKFColor *)sage {
	NKFColor *sage = [NKFColor colorWithRed:74.0f/100.0f green:72.0f/100.0f blue:54.0f/100.0f alpha:1.0f];
	return sage;
}

+ (NKFColor *)stPatricksBlue {
	NKFColor *stPatricksBlue = [NKFColor colorWithRed:14.0f/100.0f green:16.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
	return stPatricksBlue;
}

+ (NKFColor *)salmon {
	NKFColor *salmon = [NKFColor colorWithRed:98.0f/100.0f green:0.5f blue:45.0f/100.0f alpha:1.0f];
	return salmon;
}

+ (NKFColor *)salmonPink {
	NKFColor *salmonPink = [NKFColor colorWithRed:1.0f green:57.0f/100.0f blue:64.0f/100.0f alpha:1.0f];
	return salmonPink;
}

+ (NKFColor *)sand {
	NKFColor *sand = [NKFColor colorWithRed:76.0f/100.0f green:7.0f/10.0f blue:0.5f alpha:1.0f];
	return sand;
}

+ (NKFColor *)sandDune {
	NKFColor *sandDune = [NKFColor colorWithRed:59.0f/100.0f green:44.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
	return sandDune;
}

+ (NKFColor *)sandstorm {
	NKFColor *sandstorm = [NKFColor colorWithRed:93.0f/100.0f green:84.0f/100.0f blue:0.25f alpha:1.0f];
	return sandstorm;
}

+ (NKFColor *)sandyBrown {
	NKFColor *sandyBrown = [NKFColor colorWithRed:96.0f/100.0f green:64.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
	return sandyBrown;
}

+ (NKFColor *)sandyTaupe {
	NKFColor *sandyTaupe = [NKFColor colorWithRed:59.0f/100.0f green:44.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
	return sandyTaupe;
}

+ (NKFColor *)sangria {
	NKFColor *sangria = [NKFColor colorWithRed:57.0f/100.0f green:0.0f blue:4.0f/100.0f alpha:1.0f];
	return sangria;
}

+ (NKFColor *)sapGreen {
	NKFColor *sapGreen = [NKFColor colorWithRed:31.0f/100.0f green:49.0f/100.0f blue:16.0f/100.0f alpha:1.0f];
	return sapGreen;
}

+ (NKFColor *)sapphire {
	NKFColor *sapphire = [NKFColor colorWithRed:6.0f/100.0f green:32.0f/100.0f blue:73.0f/100.0f alpha:1.0f];
	return sapphire;
}

+ (NKFColor *)sapphireBlue {
	NKFColor *sapphireBlue = [NKFColor colorWithRed:0.0f green:4.0f/10.0f blue:65.0f/100.0f alpha:1.0f];
	return sapphireBlue;
}

+ (NKFColor *)satinSheenGold {
	NKFColor *satinSheenGold = [NKFColor colorWithRed:8.0f/10.0f green:63.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
	return satinSheenGold;
}

+ (NKFColor *)scarlet {
	NKFColor *scarlet = [NKFColor colorWithRed:1.0f green:14.0f/100.0f blue:0.0f alpha:1.0f];
	return scarlet;
}

+ (NKFColor *)scarlet2 {
	NKFColor *scarlet2 = [NKFColor colorWithRed:99.0f/100.0f green:5.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
	return scarlet2;
}

+ (NKFColor *)schaussPink {
	NKFColor *schaussPink = [NKFColor colorWithRed:1.0f green:57.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
	return schaussPink;
}

+ (NKFColor *)schoolBusYellow {
	NKFColor *schoolBusYellow = [NKFColor colorWithRed:1.0f green:85.0f/100.0f blue:0.0f alpha:1.0f];
	return schoolBusYellow;
}

+ (NKFColor *)screaminGreen {
	NKFColor *screaminGreen = [NKFColor colorWithRed:46.0f/100.0f green:1.0f blue:48.0f/100.0f alpha:1.0f];
	return screaminGreen;
}

+ (NKFColor *)seaBlue {
	NKFColor *seaBlue = [NKFColor colorWithRed:0.0f green:41.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
	return seaBlue;
}

+ (NKFColor *)seaGreen {
	NKFColor *seaGreen = [NKFColor colorWithRed:18.0f/100.0f green:55.0f/100.0f blue:34.0f/100.0f alpha:1.0f];
	return seaGreen;
}

+ (NKFColor *)sealBrown {
	NKFColor *sealBrown = [NKFColor colorWithRed:2.0f/10.0f green:8.0f/100.0f blue:8.0f/100.0f alpha:1.0f];
	return sealBrown;
}

+ (NKFColor *)seashell {
	NKFColor *seashell = [NKFColor colorWithRed:1.0f green:96.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
	return seashell;
}

+ (NKFColor *)selectiveYellow {
	NKFColor *selectiveYellow = [NKFColor colorWithRed:1.0f green:73.0f/100.0f blue:0.0f alpha:1.0f];
	return selectiveYellow;
}

+ (NKFColor *)sepia {
	NKFColor *sepia = [NKFColor colorWithRed:44.0f/100.0f green:26.0f/100.0f blue:8.0f/100.0f alpha:1.0f];
	return sepia;
}

+ (NKFColor *)shadow {
	NKFColor *shadow = [NKFColor colorWithRed:54.0f/100.0f green:47.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
	return shadow;
}

+ (NKFColor *)shadowBlue {
	NKFColor *shadowBlue = [NKFColor colorWithRed:47.0f/100.0f green:55.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
	return shadowBlue;
}

+ (NKFColor *)shampoo {
	NKFColor *shampoo = [NKFColor colorWithRed:1.0f green:81.0f/100.0f blue:95.0f/100.0f alpha:1.0f];
	return shampoo;
}

+ (NKFColor *)shamrockGreen {
	NKFColor *shamrockGreen = [NKFColor colorWithRed:0.0f green:62.0f/100.0f blue:38.0f/100.0f alpha:1.0f];
	return shamrockGreen;
}

+ (NKFColor *)sheenGreen {
	NKFColor *sheenGreen = [NKFColor colorWithRed:56.0f/100.0f green:83.0f/100.0f blue:0.0f alpha:1.0f];
	return sheenGreen;
}

+ (NKFColor *)shimmeringBlush {
	NKFColor *shimmeringBlush = [NKFColor colorWithRed:85.0f/100.0f green:53.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
	return shimmeringBlush;
}

+ (NKFColor *)shockingPink {
	NKFColor *shockingPink = [NKFColor colorWithRed:99.0f/100.0f green:6.0f/100.0f blue:0.75f alpha:1.0f];
	return shockingPink;
}

+ (NKFColor *)shockingPinkCrayola {
	NKFColor *shockingPinkCrayola = [NKFColor colorWithRed:1.0f green:44.0f/100.0f blue:1.0f alpha:1.0f];
	return shockingPinkCrayola;
}

+ (NKFColor *)sienna {
	NKFColor *sienna = [NKFColor colorWithRed:53.0f/100.0f green:18.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
	return sienna;
}

+ (NKFColor *)silver {
	NKFColor *silver = [NKFColor colorWithRed:0.75f green:0.75f blue:0.75f alpha:1.0f];
	return silver;
}

+ (NKFColor *)silverChalice {
	NKFColor *silverChalice = [NKFColor colorWithRed:0.667f green:0.667f blue:0.667f alpha:1.0f];
	return silverChalice;
}

+ (NKFColor *)silverLakeBlue {
	NKFColor *silverLakeBlue = [NKFColor colorWithRed:36.0f/100.0f green:54.0f/100.0f blue:73.0f/100.0f alpha:1.0f];
	return silverLakeBlue;
}

+ (NKFColor *)silverPink {
	NKFColor *silverPink = [NKFColor colorWithRed:77.0f/100.0f green:68.0f/100.0f blue:68.0f/100.0f alpha:1.0f];
	return silverPink;
}

+ (NKFColor *)silverSand {
	NKFColor *silverSand = [NKFColor colorWithRed:0.75f green:76.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
	return silverSand;
}

+ (NKFColor *)sinopia {
	NKFColor *sinopia = [NKFColor colorWithRed:8.0f/10.0f green:0.25f blue:4.0f/100.0f alpha:1.0f];
	return sinopia;
}

+ (NKFColor *)skobeloff {
	NKFColor *skobeloff = [NKFColor colorWithRed:0.0f green:45.0f/100.0f blue:45.0f/100.0f alpha:1.0f];
	return skobeloff;
}

+ (NKFColor *)skyBlue {
	NKFColor *skyBlue = [NKFColor colorWithRed:53.0f/100.0f green:81.0f/100.0f blue:92.0f/100.0f alpha:1.0f];
	return skyBlue;
}

+ (NKFColor *)skyMagenta {
	NKFColor *skyMagenta = [NKFColor colorWithRed:81.0f/100.0f green:44.0f/100.0f blue:69.0f/100.0f alpha:1.0f];
	return skyMagenta;
}

+ (NKFColor *)slateBlue {
	NKFColor *slateBlue = [NKFColor colorWithRed:42.0f/100.0f green:35.0f/100.0f blue:8.0f/10.0f alpha:1.0f];
	return slateBlue;
}

+ (NKFColor *)slateGray {
	NKFColor *slateGray = [NKFColor colorWithRed:44.0f/100.0f green:0.5f blue:56.0f/100.0f alpha:1.0f];
	return slateGray;
}

+ (NKFColor *)smaltDarkPowderBlue {
	NKFColor *smaltDarkPowderBlue = [NKFColor colorWithRed:0.0f green:2.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
	return smaltDarkPowderBlue;
}

+ (NKFColor *)smitten {
	NKFColor *smitten = [NKFColor colorWithRed:78.0f/100.0f green:0.25f blue:53.0f/100.0f alpha:1.0f];
	return smitten;
}

+ (NKFColor *)smoke {
	NKFColor *smoke = [NKFColor colorWithRed:45.0f/100.0f green:51.0f/100.0f blue:46.0f/100.0f alpha:1.0f];
	return smoke;
}

+ (NKFColor *)smokyBlack {
	NKFColor *smokyBlack = [NKFColor colorWithRed:6.0f/100.0f green:5.0f/100.0f blue:3.0f/100.0f alpha:1.0f];
	return smokyBlack;
}

+ (NKFColor *)smokyTopaz {
	NKFColor *smokyTopaz = [NKFColor colorWithRed:58.0f/100.0f green:24.0f/100.0f blue:0.25f alpha:1.0f];
	return smokyTopaz;
}

+ (NKFColor *)snow {
	NKFColor *snow = [NKFColor colorWithRed:1.0f green:98.0f/100.0f blue:98.0f/100.0f alpha:1.0f];
	return snow;
}

+ (NKFColor *)soap {
	NKFColor *soap = [NKFColor colorWithRed:81.0f/100.0f green:78.0f/100.0f blue:94.0f/100.0f alpha:1.0f];
	return soap;
}

+ (NKFColor *)solidPink {
	NKFColor *solidPink = [NKFColor colorWithRed:54.0f/100.0f green:22.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
	return solidPink;
}

+ (NKFColor *)sonicSilver {
	NKFColor *sonicSilver = [NKFColor colorWithRed:46.0f/100.0f green:46.0f/100.0f blue:46.0f/100.0f alpha:1.0f];
	return sonicSilver;
}

+ (NKFColor *)spartanCrimson {
	NKFColor *spartanCrimson = [NKFColor colorWithRed:62.0f/100.0f green:7.0f/100.0f blue:9.0f/100.0f alpha:1.0f];
	return spartanCrimson;
}

+ (NKFColor *)spartannash {
	return [NKFColor colorWithRed:0.0f/255.0f green:112.0f/255.0f blue:84.0f/255.0f alpha:1.0f];
}

+ (NKFColor *)spaceCadet {
	NKFColor *spaceCadet = [NKFColor colorWithRed:11.0f/100.0f green:16.0f/100.0f blue:32.0f/100.0f alpha:1.0f];
	return spaceCadet;
}

+ (NKFColor *)spanishBistre {
	NKFColor *spanishBistre = [NKFColor colorWithRed:0.5f green:46.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
	return spanishBistre;
}

+ (NKFColor *)spanishBlue {
	NKFColor *spanishBlue = [NKFColor colorWithRed:0.0f green:44.0f/100.0f blue:72.0f/100.0f alpha:1.0f];
	return spanishBlue;
}

+ (NKFColor *)spanishCarmine {
	NKFColor *spanishCarmine = [NKFColor colorWithRed:82.0f/100.0f green:0.0f blue:28.0f/100.0f alpha:1.0f];
	return spanishCarmine;
}

+ (NKFColor *)spanishCrimson {
	NKFColor *spanishCrimson = [NKFColor colorWithRed:9.0f/10.0f green:1.0f/10.0f blue:3.0f/10.0f alpha:1.0f];
	return spanishCrimson;
}

+ (NKFColor *)spanishGray {
	NKFColor *spanishGray = [NKFColor colorWithRed:6.0f/10.0f green:6.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
	return spanishGray;
}

+ (NKFColor *)spanishGreen {
	NKFColor *spanishGreen = [NKFColor colorWithRed:0.0f green:57.0f/100.0f blue:31.0f/100.0f alpha:1.0f];
	return spanishGreen;
}

+ (NKFColor *)spanishOrange {
	NKFColor *spanishOrange = [NKFColor colorWithRed:91.0f/100.0f green:38.0f/100.0f blue:0.0f alpha:1.0f];
	return spanishOrange;
}

+ (NKFColor *)spanishPink {
	NKFColor *spanishPink = [NKFColor colorWithRed:97.0f/100.0f green:0.75f blue:0.75f alpha:1.0f];
	return spanishPink;
}

+ (NKFColor *)spanishRed {
	NKFColor *spanishRed = [NKFColor colorWithRed:9.0f/10.0f green:0.0f blue:15.0f/100.0f alpha:1.0f];
	return spanishRed;
}

+ (NKFColor *)spanishSkyBlue {
	NKFColor *spanishSkyBlue = [NKFColor colorWithRed:0.0f green:1.0f blue:1.0f alpha:1.0f];
	return spanishSkyBlue;
}

+ (NKFColor *)spanishViolet {
	NKFColor *spanishViolet = [NKFColor colorWithRed:3.0f/10.0f green:16.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
	return spanishViolet;
}

+ (NKFColor *)spanishViridian {
	NKFColor *spanishViridian = [NKFColor colorWithRed:0.0f green:0.5f blue:36.0f/100.0f alpha:1.0f];
	return spanishViridian;
}

+ (NKFColor *)spicyMix {
	NKFColor *spicyMix = [NKFColor colorWithRed:55.0f/100.0f green:37.0f/100.0f blue:3.0f/10.0f alpha:1.0f];
	return spicyMix;
}

+ (NKFColor *)spiroDiscoBall {
	NKFColor *spiroDiscoBall = [NKFColor colorWithRed:6.0f/100.0f green:0.75f blue:99.0f/100.0f alpha:1.0f];
	return spiroDiscoBall;
}

+ (NKFColor *)springBud {
	NKFColor *springBud = [NKFColor colorWithRed:65.0f/100.0f green:99.0f/100.0f blue:0.0f alpha:1.0f];
	return springBud;
}

+ (NKFColor *)springGreen {
	NKFColor *springGreen = [NKFColor colorWithRed:0.0f green:1.0f blue:0.5f alpha:1.0f];
	return springGreen;
}

+ (NKFColor *)starCommandBlue {
	NKFColor *starCommandBlue = [NKFColor colorWithRed:0.0f green:48.0f/100.0f blue:72.0f/100.0f alpha:1.0f];
	return starCommandBlue;
}

+ (NKFColor *)steelBlue {
	NKFColor *steelBlue = [NKFColor colorWithRed:27.0f/100.0f green:51.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
	return steelBlue;
}

+ (NKFColor *)steelPink {
	NKFColor *steelPink = [NKFColor colorWithRed:8.0f/10.0f green:2.0f/10.0f blue:8.0f/10.0f alpha:1.0f];
	return steelPink;
}

+ (NKFColor *)stilDeGrainYellow {
	NKFColor *stilDeGrainYellow = [NKFColor colorWithRed:98.0f/100.0f green:85.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
	return stilDeGrainYellow;
}

+ (NKFColor *)stizza {
	NKFColor *stizza = [NKFColor colorWithRed:6.0f/10.0f green:0.0f blue:0.0f alpha:1.0f];
	return stizza;
}

+ (NKFColor *)stormcloud {
	NKFColor *stormcloud = [NKFColor colorWithRed:31.0f/100.0f green:4.0f/10.0f blue:42.0f/100.0f alpha:1.0f];
	return stormcloud;
}

+ (NKFColor *)straw {
	NKFColor *straw = [NKFColor colorWithRed:89.0f/100.0f green:85.0f/100.0f blue:44.0f/100.0f alpha:1.0f];
	return straw;
}

+ (NKFColor *)strawberry {
	NKFColor *strawberry = [NKFColor colorWithRed:99.0f/100.0f green:35.0f/100.0f blue:55.0f/100.0f alpha:1.0f];
	return strawberry;
}

+ (NKFColor *)sunglow {
	NKFColor *sunglow = [NKFColor colorWithRed:1.0f green:8.0f/10.0f blue:2.0f/10.0f alpha:1.0f];
	return sunglow;
}

+ (NKFColor *)sunray {
	NKFColor *sunray = [NKFColor colorWithRed:89.0f/100.0f green:0.667f blue:34.0f/100.0f alpha:1.0f];
	return sunray;
}

+ (NKFColor *)sunset {
	NKFColor *sunset = [NKFColor colorWithRed:98.0f/100.0f green:84.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
	return sunset;
}

+ (NKFColor *)sunsetOrange {
	NKFColor *sunsetOrange = [NKFColor colorWithRed:99.0f/100.0f green:37.0f/100.0f blue:0.333f alpha:1.0f];
	return sunsetOrange;
}

+ (NKFColor *)superPink {
	NKFColor *superPink = [NKFColor colorWithRed:81.0f/100.0f green:42.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
	return superPink;
}

+ (NKFColor *)tan {
	NKFColor *tan = [NKFColor colorWithRed:82.0f/100.0f green:71.0f/100.0f blue:55.0f/100.0f alpha:1.0f];
	return tan;
}

+ (NKFColor *)tangelo {
	NKFColor *tangelo = [NKFColor colorWithRed:98.0f/100.0f green:3.0f/10.0f blue:0.0f alpha:1.0f];
	return tangelo;
}

+ (NKFColor *)tangerine {
	NKFColor *tangerine = [NKFColor colorWithRed:95.0f/100.0f green:52.0f/100.0f blue:0.0f alpha:1.0f];
	return tangerine;
}

+ (NKFColor *)tangerineYellow {
	NKFColor *tangerineYellow = [NKFColor colorWithRed:1.0f green:8.0f/10.0f blue:0.0f alpha:1.0f];
	return tangerineYellow;
}

+ (NKFColor *)tangoPink {
	NKFColor *tangoPink = [NKFColor colorWithRed:89.0f/100.0f green:44.0f/100.0f blue:48.0f/100.0f alpha:1.0f];
	return tangoPink;
}

+ (NKFColor *)taupe {
	NKFColor *taupe = [NKFColor colorWithRed:28.0f/100.0f green:24.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
	return taupe;
}

+ (NKFColor *)taupeGray {
	NKFColor *taupeGray = [NKFColor colorWithRed:55.0f/100.0f green:52.0f/100.0f blue:54.0f/100.0f alpha:1.0f];
	return taupeGray;
}

+ (NKFColor *)teaGreen {
	NKFColor *teaGreen = [NKFColor colorWithRed:82.0f/100.0f green:94.0f/100.0f blue:0.75f alpha:1.0f];
	return teaGreen;
}

+ (NKFColor *)teaRose {
	NKFColor *teaRose = [NKFColor colorWithRed:97.0f/100.0f green:51.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
	return teaRose;
}

+ (NKFColor *)teaRose2 {
	NKFColor *teaRose = [NKFColor colorWithRed:96.0f/100.0f green:76.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
	return teaRose;
}

+ (NKFColor *)teal {
	NKFColor *teal = [NKFColor colorWithRed:0.0f green:0.5f blue:0.5f alpha:1.0f];
	return teal;
}

+ (NKFColor *)tealBlue {
	NKFColor *tealBlue = [NKFColor colorWithRed:21.0f/100.0f green:46.0f/100.0f blue:53.0f/100.0f alpha:1.0f];
	return tealBlue;
}

+ (NKFColor *)tealDeer {
	NKFColor *tealDeer = [NKFColor colorWithRed:6.0f/10.0f green:9.0f/10.0f blue:7.0f/10.0f alpha:1.0f];
	return tealDeer;
}

+ (NKFColor *)tealGreen {
	NKFColor *tealGreen = [NKFColor colorWithRed:0.0f green:51.0f/100.0f blue:0.5f alpha:1.0f];
	return tealGreen;
}

+ (NKFColor *)telemagenta {
	NKFColor *telemagenta = [NKFColor colorWithRed:81.0f/100.0f green:2.0f/10.0f blue:46.0f/100.0f alpha:1.0f];
	return telemagenta;
}

+ (NKFColor *)tenne {
	NKFColor *tenne = [NKFColor colorWithRed:8.0f/10.0f green:34.0f/100.0f blue:0.0f alpha:1.0f];
	return tenne;
}

+ (NKFColor *)terraCotta {
	NKFColor *terraCotta = [NKFColor colorWithRed:89.0f/100.0f green:45.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
	return terraCotta;
}

+ (NKFColor *)thistle {
	NKFColor *thistle = [NKFColor colorWithRed:85.0f/100.0f green:0.75f blue:85.0f/100.0f alpha:1.0f];
	return thistle;
}

+ (NKFColor *)thulianPink {
	NKFColor *thulianPink = [NKFColor colorWithRed:87.0f/100.0f green:44.0f/100.0f blue:63.0f/100.0f alpha:1.0f];
	return thulianPink;
}

+ (NKFColor *)tickleMePink {
	NKFColor *tickleMePink = [NKFColor colorWithRed:99.0f/100.0f green:54.0f/100.0f blue:0.667f alpha:1.0f];
	return tickleMePink;
}

+ (NKFColor *)tiffanyBlue {
	NKFColor *tiffanyBlue = [NKFColor colorWithRed:4.0f/100.0f green:73.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
	return tiffanyBlue;
}

+ (NKFColor *)tigersEye {
	NKFColor *tigersEye = [NKFColor colorWithRed:88.0f/100.0f green:55.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
	return tigersEye;
}

+ (NKFColor *)timberwolf {
	NKFColor *timberwolf = [NKFColor colorWithRed:86.0f/100.0f green:84.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
	return timberwolf;
}

+ (NKFColor *)titaniumYellow {
	NKFColor *titaniumYellow = [NKFColor colorWithRed:93.0f/100.0f green:9.0f/10.0f blue:0.0f alpha:1.0f];
	return titaniumYellow;
}

+ (NKFColor *)tomato {
	NKFColor *tomato = [NKFColor colorWithRed:1.0f green:39.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
	return tomato;
}

+ (NKFColor *)toolbox {
	NKFColor *toolbox = [NKFColor colorWithRed:45.0f/100.0f green:42.0f/100.0f blue:0.75f alpha:1.0f];
	return toolbox;
}

+ (NKFColor *)topaz {
	NKFColor *topaz = [NKFColor colorWithRed:1.0f green:78.0f/100.0f blue:49.0f/100.0f alpha:1.0f];
	return topaz;
}

+ (NKFColor *)tractorRed {
	NKFColor *tractorRed = [NKFColor colorWithRed:99.0f/100.0f green:5.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
	return tractorRed;
}

+ (NKFColor *)trolleyGrey {
	NKFColor *trolleyGrey = [NKFColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:1.0f];
	return trolleyGrey;
}

+ (NKFColor *)tropicalRainForest {
	NKFColor *tropicalRainForest = [NKFColor colorWithRed:0.0f green:46.0f/100.0f blue:37.0f/100.0f alpha:1.0f];
	return tropicalRainForest;
}

+ (NKFColor *)trueBlue {
	NKFColor *trueBlue = [NKFColor colorWithRed:0.0f green:45.0f/100.0f blue:81.0f/100.0f alpha:1.0f];
	return trueBlue;
}

+ (NKFColor *)tuftsBlue {
	NKFColor *tuftsBlue = [NKFColor colorWithRed:0.25f green:49.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
	return tuftsBlue;
}

+ (NKFColor *)tulip {
	NKFColor *tulip = [NKFColor colorWithRed:1.0f green:53.0f/100.0f blue:55.0f/100.0f alpha:1.0f];
	return tulip;
}

+ (NKFColor *)tumbleweed {
	NKFColor *tumbleweed = [NKFColor colorWithRed:87.0f/100.0f green:0.667f blue:53.0f/100.0f alpha:1.0f];
	return tumbleweed;
}

+ (NKFColor *)turkishRose {
	NKFColor *turkishRose = [NKFColor colorWithRed:71.0f/100.0f green:45.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
	return turkishRose;
}

+ (NKFColor *)turquoise {
	NKFColor *turquoise = [NKFColor colorWithRed:0.25f green:88.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
	return turquoise;
}

+ (NKFColor *)turquoiseBlue {
	NKFColor *turquoiseBlue = [NKFColor colorWithRed:0.0f green:1.0f blue:94.0f/100.0f alpha:1.0f];
	return turquoiseBlue;
}

+ (NKFColor *)turquoiseGreen {
	NKFColor *turquoiseGreen = [NKFColor colorWithRed:63.0f/100.0f green:84.0f/100.0f blue:71.0f/100.0f alpha:1.0f];
	return turquoiseGreen;
}

+ (NKFColor *)tuscan {
	NKFColor *tuscan = [NKFColor colorWithRed:98.0f/100.0f green:84.0f/100.0f blue:65.0f/100.0f alpha:1.0f];
	return tuscan;
}

+ (NKFColor *)tuscanBrown {
	NKFColor *tuscanBrown = [NKFColor colorWithRed:44.0f/100.0f green:31.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
	return tuscanBrown;
}

+ (NKFColor *)tuscanRed {
	NKFColor *tuscanRed = [NKFColor colorWithRed:49.0f/100.0f green:28.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
	return tuscanRed;
}

+ (NKFColor *)tuscanTan {
	NKFColor *tuscanTan = [NKFColor colorWithRed:65.0f/100.0f green:48.0f/100.0f blue:36.0f/100.0f alpha:1.0f];
	return tuscanTan;
}

+ (NKFColor *)tuscany {
	NKFColor *tuscany = [NKFColor colorWithRed:0.75f green:6.0f/10.0f blue:6.0f/10.0f alpha:1.0f];
	return tuscany;
}

+ (NKFColor *)twilightLavender {
	NKFColor *twilightLavender = [NKFColor colorWithRed:54.0f/100.0f green:29.0f/100.0f blue:42.0f/100.0f alpha:1.0f];
	return twilightLavender;
}

+ (NKFColor *)tyrianPurple {
	NKFColor *tyrianPurple = [NKFColor colorWithRed:4.0f/10.0f green:1.0f/100.0f blue:24.0f/100.0f alpha:1.0f];
	return tyrianPurple;
}

+ (NKFColor *)uABlue {
	NKFColor *uABlue = [NKFColor colorWithRed:0.0f green:2.0f/10.0f blue:0.667f alpha:1.0f];
	return uABlue;
}

+ (NKFColor *)uARed {
	NKFColor *uARed = [NKFColor colorWithRed:85.0f/100.0f green:0.0f blue:3.0f/10.0f alpha:1.0f];
	return uARed;
}

+ (NKFColor *)ube {
	NKFColor *ube = [NKFColor colorWithRed:53.0f/100.0f green:47.0f/100.0f blue:76.0f/100.0f alpha:1.0f];
	return ube;
}

+ (NKFColor *)uCLABlue {
	NKFColor *uCLABlue = [NKFColor colorWithRed:0.333f green:41.0f/100.0f blue:58.0f/100.0f alpha:1.0f];
	return uCLABlue;
}

+ (NKFColor *)uCLAGold {
	NKFColor *uCLAGold = [NKFColor colorWithRed:1.0f green:7.0f/10.0f blue:0.0f alpha:1.0f];
	return uCLAGold;
}

+ (NKFColor *)uFOGreen {
	NKFColor *uFOGreen = [NKFColor colorWithRed:24.0f/100.0f green:82.0f/100.0f blue:44.0f/100.0f alpha:1.0f];
	return uFOGreen;
}

+ (NKFColor *)ultramarine {
	NKFColor *ultramarine = [NKFColor colorWithRed:7.0f/100.0f green:4.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
	return ultramarine;
}

+ (NKFColor *)ultramarineBlue {
	NKFColor *ultramarineBlue = [NKFColor colorWithRed:0.25f green:4.0f/10.0f blue:96.0f/100.0f alpha:1.0f];
	return ultramarineBlue;
}

+ (NKFColor *)ultraPink {
	NKFColor *ultraPink = [NKFColor colorWithRed:1.0f green:44.0f/100.0f blue:1.0f alpha:1.0f];
	return ultraPink;
}

+ (NKFColor *)ultraRed {
	NKFColor *ultraRed = [NKFColor colorWithRed:99.0f/100.0f green:42.0f/100.0f blue:52.0f/100.0f alpha:1.0f];
	return ultraRed;
}

+ (NKFColor *)umber {
	NKFColor *umber = [NKFColor colorWithRed:39.0f/100.0f green:32.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
	return umber;
}

+ (NKFColor *)unbleachedSilk {
	NKFColor *unbleachedSilk = [NKFColor colorWithRed:1.0f green:87.0f/100.0f blue:79.0f/100.0f alpha:1.0f];
	return unbleachedSilk;
}

+ (NKFColor *)unitedNationsBlue {
	NKFColor *unitedNationsBlue = [NKFColor colorWithRed:36.0f/100.0f green:57.0f/100.0f blue:9.0f/10.0f alpha:1.0f];
	return unitedNationsBlue;
}

+ (NKFColor *)universityOfCaliforniaGold {
	NKFColor *universityOfCaliforniaGold = [NKFColor colorWithRed:72.0f/100.0f green:53.0f/100.0f blue:15.0f/100.0f alpha:1.0f];
	return universityOfCaliforniaGold;
}

+ (NKFColor *)unmellowYellow {
	NKFColor *unmellowYellow = [NKFColor colorWithRed:1.0f green:1.0f blue:4.0f/10.0f alpha:1.0f];
	return unmellowYellow;
}

+ (NKFColor *)uPForestGreen {
	NKFColor *uPForestGreen = [NKFColor colorWithRed:0.0f green:27.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return uPForestGreen;
}

+ (NKFColor *)uPMaroon {
	NKFColor *uPMaroon = [NKFColor colorWithRed:48.0f/100.0f green:7.0f/100.0f blue:7.0f/100.0f alpha:1.0f];
	return uPMaroon;
}

+ (NKFColor *)upsdellRed {
	NKFColor *upsdellRed = [NKFColor colorWithRed:68.0f/100.0f green:13.0f/100.0f blue:16.0f/100.0f alpha:1.0f];
	return upsdellRed;
}

+ (NKFColor *)urobilin {
	NKFColor *urobilin = [NKFColor colorWithRed:88.0f/100.0f green:68.0f/100.0f blue:13.0f/100.0f alpha:1.0f];
	return urobilin;
}

+ (NKFColor *)uSAFABlue {
	NKFColor *uSAFABlue = [NKFColor colorWithRed:0.0f green:31.0f/100.0f blue:6.0f/10.0f alpha:1.0f];
	return uSAFABlue;
}

+ (NKFColor *)uSCCardinal {
	NKFColor *uSCCardinal = [NKFColor colorWithRed:6.0f/10.0f green:0.0f blue:0.0f alpha:1.0f];
	return uSCCardinal;
}

+ (NKFColor *)uSCGold {
	NKFColor *uSCGold = [NKFColor colorWithRed:1.0f green:8.0f/10.0f blue:0.0f alpha:1.0f];
	return uSCGold;
}

+ (NKFColor *)universityOfTennesseeOrange {
	NKFColor *universityOfTennesseeOrange = [NKFColor colorWithRed:97.0f/100.0f green:0.5f blue:0.0f alpha:1.0f];
	return universityOfTennesseeOrange;
}

+ (NKFColor *)utahCrimson {
	NKFColor *utahCrimson = [NKFColor colorWithRed:83.0f/100.0f green:0.0f blue:0.25f alpha:1.0f];
	return utahCrimson;
}

+ (NKFColor *)vanilla {
	NKFColor *vanilla = [NKFColor colorWithRed:95.0f/100.0f green:9.0f/10.0f blue:0.667f alpha:1.0f];
	return vanilla;
}

+ (NKFColor *)vanillaIce {
	NKFColor *vanillaIce = [NKFColor colorWithRed:95.0f/100.0f green:56.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
	return vanillaIce;
}

+ (NKFColor *)vegasGold {
	NKFColor *vegasGold = [NKFColor colorWithRed:77.0f/100.0f green:7.0f/10.0f blue:35.0f/100.0f alpha:1.0f];
	return vegasGold;
}

+ (NKFColor *)venetianRed {
	NKFColor *venetianRed = [NKFColor colorWithRed:78.0f/100.0f green:3.0f/100.0f blue:8.0f/100.0f alpha:1.0f];
	return venetianRed;
}

+ (NKFColor *)verdigris {
	NKFColor *verdigris = [NKFColor colorWithRed:26.0f/100.0f green:7.0f/10.0f blue:68.0f/100.0f alpha:1.0f];
	return verdigris;
}

+ (NKFColor *)vermilion {
	NKFColor *vermilion = [NKFColor colorWithRed:89.0f/100.0f green:26.0f/100.0f blue:2.0f/10.0f alpha:1.0f];
	return vermilion;
}

+ (NKFColor *)vermilion2 {
	NKFColor *vermilion2 = [NKFColor colorWithRed:85.0f/100.0f green:22.0f/100.0f blue:12.0f/100.0f alpha:1.0f];
	return vermilion2;
}

+ (NKFColor *)veronica {
	NKFColor *veronica = [NKFColor colorWithRed:63.0f/100.0f green:13.0f/100.0f blue:94.0f/100.0f alpha:1.0f];
	return veronica;
}

+ (NKFColor *)veryLightAzure {
	NKFColor *veryLightAzure = [NKFColor colorWithRed:45.0f/100.0f green:73.0f/100.0f blue:98.0f/100.0f alpha:1.0f];
	return veryLightAzure;
}

+ (NKFColor *)veryLightBlue {
	NKFColor *veryLightBlue = [NKFColor colorWithRed:4.0f/10.0f green:4.0f/10.0f blue:1.0f alpha:1.0f];
	return veryLightBlue;
}

+ (NKFColor *)veryLightMalachiteGreen {
	NKFColor *veryLightMalachiteGreen = [NKFColor colorWithRed:39.0f/100.0f green:91.0f/100.0f blue:53.0f/100.0f alpha:1.0f];
	return veryLightMalachiteGreen;
}

+ (NKFColor *)veryLightTangelo {
	NKFColor *veryLightTangelo = [NKFColor colorWithRed:1.0f green:69.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
	return veryLightTangelo;
}

+ (NKFColor *)veryPaleOrange {
	NKFColor *veryPaleOrange = [NKFColor colorWithRed:1.0f green:87.0f/100.0f blue:0.75f alpha:1.0f];
	return veryPaleOrange;
}

+ (NKFColor *)veryPaleYellow {
	NKFColor *veryPaleYellow = [NKFColor colorWithRed:1.0f green:1.0f blue:0.75f alpha:1.0f];
	return veryPaleYellow;
}

+ (NKFColor *)violet {
	NKFColor *violet = [NKFColor colorWithRed:56.0f/100.0f green:0.0f blue:1.0f alpha:1.0f];
	return violet;
}

+ (NKFColor *)violetColorWheel {
	NKFColor *violetColorWheel = [NKFColor colorWithRed:0.5f green:0.0f blue:1.0f alpha:1.0f];
	return violetColorWheel;
}

+ (NKFColor *)violetRYB {
	NKFColor *violetRYB = [NKFColor colorWithRed:53.0f/100.0f green:0.0f blue:69.0f/100.0f alpha:1.0f];
	return violetRYB;
}

+ (NKFColor *)violetWeb {
	NKFColor *violetWeb = [NKFColor colorWithRed:93.0f/100.0f green:51.0f/100.0f blue:93.0f/100.0f alpha:1.0f];
	return violetWeb;
}

+ (NKFColor *)violetBlue {
	NKFColor *violetBlue = [NKFColor colorWithRed:2.0f/10.0f green:29.0f/100.0f blue:7.0f/10.0f alpha:1.0f];
	return violetBlue;
}

+ (NKFColor *)violetRed {
	NKFColor *violetRed = [NKFColor colorWithRed:97.0f/100.0f green:0.333f blue:58.0f/100.0f alpha:1.0f];
	return violetRed;
}

+ (NKFColor *)viridian {
	NKFColor *viridian = [NKFColor colorWithRed:0.25f green:51.0f/100.0f blue:43.0f/100.0f alpha:1.0f];
	return viridian;
}

+ (NKFColor *)viridianGreen {
	NKFColor *viridianGreen = [NKFColor colorWithRed:0.0f green:59.0f/100.0f blue:6.0f/10.0f alpha:1.0f];
	return viridianGreen;
}

+ (NKFColor *)vistaBlue {
	NKFColor *vistaBlue = [NKFColor colorWithRed:49.0f/100.0f green:62.0f/100.0f blue:85.0f/100.0f alpha:1.0f];
	return vistaBlue;
}

+ (NKFColor *)vividAmber {
	NKFColor *vividAmber = [NKFColor colorWithRed:8.0f/10.0f green:6.0f/10.0f blue:0.0f alpha:1.0f];
	return vividAmber;
}

+ (NKFColor *)vividAuburn {
	NKFColor *vividAuburn = [NKFColor colorWithRed:57.0f/100.0f green:15.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
	return vividAuburn;
}

+ (NKFColor *)vividBurgundy {
	NKFColor *vividBurgundy = [NKFColor colorWithRed:62.0f/100.0f green:11.0f/100.0f blue:21.0f/100.0f alpha:1.0f];
	return vividBurgundy;
}

+ (NKFColor *)vividCerise {
	NKFColor *vividCerise = [NKFColor colorWithRed:85.0f/100.0f green:11.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
	return vividCerise;
}

+ (NKFColor *)vividCerulean {
	NKFColor *vividCerulean = [NKFColor colorWithRed:0.0f green:0.667f blue:93.0f/100.0f alpha:1.0f];
	return vividCerulean;
}

+ (NKFColor *)vividCrimson {
	NKFColor *vividCrimson = [NKFColor colorWithRed:8.0f/10.0f green:0.0f blue:2.0f/10.0f alpha:1.0f];
	return vividCrimson;
}

+ (NKFColor *)vividGamboge {
	NKFColor *vividGamboge = [NKFColor colorWithRed:1.0f green:6.0f/10.0f blue:0.0f alpha:1.0f];
	return vividGamboge;
}

+ (NKFColor *)vividLimeGreen {
	NKFColor *vividLimeGreen = [NKFColor colorWithRed:65.0f/100.0f green:84.0f/100.0f blue:3.0f/100.0f alpha:1.0f];
	return vividLimeGreen;
}

+ (NKFColor *)vividMalachite {
	NKFColor *vividMalachite = [NKFColor colorWithRed:0.0f green:8.0f/10.0f blue:2.0f/10.0f alpha:1.0f];
	return vividMalachite;
}

+ (NKFColor *)vividMulberry {
	NKFColor *vividMulberry = [NKFColor colorWithRed:72.0f/100.0f green:5.0f/100.0f blue:89.0f/100.0f alpha:1.0f];
	return vividMulberry;
}

+ (NKFColor *)vividOrange {
	NKFColor *vividOrange = [NKFColor colorWithRed:1.0f green:37.0f/100.0f blue:0.0f alpha:1.0f];
	return vividOrange;
}

+ (NKFColor *)vividOrangePeel {
	NKFColor *vividOrangePeel = [NKFColor colorWithRed:1.0f green:63.0f/100.0f blue:0.0f alpha:1.0f];
	return vividOrangePeel;
}

+ (NKFColor *)vividOrchid {
	NKFColor *vividOrchid = [NKFColor colorWithRed:8.0f/10.0f green:0.0f blue:1.0f alpha:1.0f];
	return vividOrchid;
}

+ (NKFColor *)vividRaspberry {
	NKFColor *vividRaspberry = [NKFColor colorWithRed:1.0f green:0.0f blue:42.0f/100.0f alpha:1.0f];
	return vividRaspberry;
}

+ (NKFColor *)vividRed {
	NKFColor *vividRed = [NKFColor colorWithRed:97.0f/100.0f green:5.0f/100.0f blue:1.0f/10.0f alpha:1.0f];
	return vividRed;
}

+ (NKFColor *)vividRedTangelo {
	NKFColor *vividRedTangelo = [NKFColor colorWithRed:87.0f/100.0f green:38.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
	return vividRedTangelo;
}

+ (NKFColor *)vividSkyBlue {
	NKFColor *vividSkyBlue = [NKFColor colorWithRed:0.0f green:8.0f/10.0f blue:1.0f alpha:1.0f];
	return vividSkyBlue;
}

+ (NKFColor *)vividTangelo {
	NKFColor *vividTangelo = [NKFColor colorWithRed:94.0f/100.0f green:45.0f/100.0f blue:15.0f/100.0f alpha:1.0f];
	return vividTangelo;
}

+ (NKFColor *)vividTangerine {
	NKFColor *vividTangerine = [NKFColor colorWithRed:1.0f green:63.0f/100.0f blue:54.0f/100.0f alpha:1.0f];
	return vividTangerine;
}

+ (NKFColor *)vividVermilion {
	NKFColor *vividVermilion = [NKFColor colorWithRed:9.0f/10.0f green:38.0f/100.0f blue:14.0f/100.0f alpha:1.0f];
	return vividVermilion;
}

+ (NKFColor *)vividViolet {
	NKFColor *vividViolet = [NKFColor colorWithRed:62.0f/100.0f green:0.0f blue:1.0f alpha:1.0f];
	return vividViolet;
}

+ (NKFColor *)vividYellow {
	NKFColor *vividYellow = [NKFColor colorWithRed:1.0f green:89.0f/100.0f blue:1.0f/100.0f alpha:1.0f];
	return vividYellow;
}

+ (NKFColor *)warmBlack {
	NKFColor *warmBlack = [NKFColor colorWithRed:0.0f green:26.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
	return warmBlack;
}

+ (NKFColor *)waterspout {
	NKFColor *waterspout = [NKFColor colorWithRed:64.0f/100.0f green:96.0f/100.0f blue:98.0f/100.0f alpha:1.0f];
	return waterspout;
}

+ (NKFColor *)wenge {
	NKFColor *wenge = [NKFColor colorWithRed:39.0f/100.0f green:0.333f blue:32.0f/100.0f alpha:1.0f];
	return wenge;
}

+ (NKFColor *)wheat {
	NKFColor *wheat = [NKFColor colorWithRed:96.0f/100.0f green:87.0f/100.0f blue:7.0f/10.0f alpha:1.0f];
	return wheat;
}

+ (NKFColor *)white {
	NKFColor *white = [NKFColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f];
	return white;
}

+ (NKFColor *)whiteSmoke {
	NKFColor *whiteSmoke = [NKFColor colorWithRed:96.0f/100.0f green:96.0f/100.0f blue:96.0f/100.0f alpha:1.0f];
	return whiteSmoke;
}

+ (NKFColor *)wildBlueYonder {
	NKFColor *wildBlueYonder = [NKFColor colorWithRed:64.0f/100.0f green:68.0f/100.0f blue:82.0f/100.0f alpha:1.0f];
	return wildBlueYonder;
}

+ (NKFColor *)wildOrchid {
	NKFColor *wildOrchid = [NKFColor colorWithRed:83.0f/100.0f green:44.0f/100.0f blue:64.0f/100.0f alpha:1.0f];
	return wildOrchid;
}

+ (NKFColor *)wildStrawberry {
	NKFColor *wildStrawberry = [NKFColor colorWithRed:1.0f green:26.0f/100.0f blue:64.0f/100.0f alpha:1.0f];
	return wildStrawberry;
}

+ (NKFColor *)wildWatermelon {
	NKFColor *wildWatermelon = [NKFColor colorWithRed:99.0f/100.0f green:42.0f/100.0f blue:52.0f/100.0f alpha:1.0f];
	return wildWatermelon;
}

+ (NKFColor *)willpowerOrange {
	NKFColor *willpowerOrange = [NKFColor colorWithRed:99.0f/100.0f green:35.0f/100.0f blue:0.0f alpha:1.0f];
	return willpowerOrange;
}

+ (NKFColor *)windsorTan {
	NKFColor *windsorTan = [NKFColor colorWithRed:65.0f/100.0f green:0.333f blue:1.0f/100.0f alpha:1.0f];
	return windsorTan;
}

+ (NKFColor *)wine {
	NKFColor *wine = [NKFColor colorWithRed:45.0f/100.0f green:18.0f/100.0f blue:22.0f/100.0f alpha:1.0f];
	return wine;
}

+ (NKFColor *)wineDregs {
	NKFColor *wineDregs = [NKFColor colorWithRed:4.0f/10.0f green:19.0f/100.0f blue:28.0f/100.0f alpha:1.0f];
	return wineDregs;
}

+ (NKFColor *)wisteria {
	NKFColor *wisteria = [NKFColor colorWithRed:79.0f/100.0f green:63.0f/100.0f blue:86.0f/100.0f alpha:1.0f];
	return wisteria;
}

+ (NKFColor *)woodBrown {
	NKFColor *woodBrown = [NKFColor colorWithRed:76.0f/100.0f green:6.0f/10.0f blue:42.0f/100.0f alpha:1.0f];
	return woodBrown;
}

+ (NKFColor *)xanadu {
	NKFColor *xanadu = [NKFColor colorWithRed:45.0f/100.0f green:53.0f/100.0f blue:47.0f/100.0f alpha:1.0f];
	return xanadu;
}

+ (NKFColor *)yaleBlue {
	NKFColor *yaleBlue = [NKFColor colorWithRed:6.0f/100.0f green:3.0f/10.0f blue:57.0f/100.0f alpha:1.0f];
	return yaleBlue;
}

+ (NKFColor *)yankeesBlue {
	NKFColor *yankeesBlue = [NKFColor colorWithRed:11.0f/100.0f green:16.0f/100.0f blue:0.25f alpha:1.0f];
	return yankeesBlue;
}

+ (NKFColor *)yellow {
	NKFColor *yellow = [NKFColor colorWithRed:1.0f green:1.0f blue:0.0f alpha:1.0f];
	return yellow;
}

+ (NKFColor *)yellowCrayola {
	NKFColor *yellowCrayola = [NKFColor colorWithRed:99.0f/100.0f green:91.0f/100.0f blue:51.0f/100.0f alpha:1.0f];
	return yellowCrayola;
}

+ (NKFColor *)yellowMunsell {
	NKFColor *yellowMunsell = [NKFColor colorWithRed:94.0f/100.0f green:8.0f/10.0f blue:0.0f alpha:1.0f];
	return yellowMunsell;
}

+ (NKFColor *)yellowNCS {
	NKFColor *yellowNCS = [NKFColor colorWithRed:1.0f green:83.0f/100.0f blue:0.0f alpha:1.0f];
	return yellowNCS;
}

+ (NKFColor *)yellowPantone {
	NKFColor *yellowPantone = [NKFColor colorWithRed:1.0f green:87.0f/100.0f blue:0.0f alpha:1.0f];
	return yellowPantone;
}

+ (NKFColor *)yellowProcess {
	NKFColor *yellowProcess = [NKFColor colorWithRed:1.0f green:94.0f/100.0f blue:0.0f alpha:1.0f];
	return yellowProcess;
}

+ (NKFColor *)yellowRYB {
	NKFColor *yellowRYB = [NKFColor colorWithRed:1.0f green:1.0f blue:2.0f/10.0f alpha:1.0f];
	return yellowRYB;
}

+ (NKFColor *)yellowGreen {
	NKFColor *yellowGreen = [NKFColor colorWithRed:6.0f/10.0f green:8.0f/10.0f blue:2.0f/10.0f alpha:1.0f];
	return yellowGreen;
}

+ (NKFColor *)yellowOrange {
	NKFColor *yellowOrange = [NKFColor colorWithRed:1.0f green:68.0f/100.0f blue:26.0f/100.0f alpha:1.0f];
	return yellowOrange;
}

+ (NKFColor *)yellowRose {
	NKFColor *yellowRose = [NKFColor colorWithRed:1.0f green:94.0f/100.0f blue:0.0f alpha:1.0f];
	return yellowRose;
}

+ (NKFColor *)zaffre {
	NKFColor *zaffre = [NKFColor colorWithRed:0.0f green:8.0f/100.0f blue:66.0f/100.0f alpha:1.0f];
	return zaffre;
}

+ (NKFColor *)zinnwalditeBrown {
	NKFColor *zinnwalditeBrown = [NKFColor colorWithRed:0.1667f green:9.0f/100.0f blue:3.0f/100.0f alpha:1.0f];
	return zinnwalditeBrown;
}

+ (NKFColor *)zomp {
	NKFColor *zomp = [NKFColor colorWithRed:22.0f/100.0f green:65.0f/100.0f blue:56.0f/100.0f alpha:1.0f];
	return zomp;
}

#pragma mark - Custom colors

// custom colors that I just happen to like and are based off of no actual standard

+ (NKFColor *)parchment {
	return [NKFColor colorWithRed:0.985f green:0.955f blue:0.905f alpha:1.0f];
}

@end
