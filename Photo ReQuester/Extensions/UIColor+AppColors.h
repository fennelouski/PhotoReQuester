//
//  UIColor+AppColors.h
//  Simon Says
//
//  Created by Developer Nathan on 12/14/14.
//  Copyright (c) 2014 Nathan Fennel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+AppFunctions.h"

@interface UIColor (AppColors)

// used to parse through and create .m and .h documentation for colors
+ (void)parseColors;

// lists of primary colors to use for the app that can be easily referenced across the entire app
+ (UIColor *)appColor;
+ (UIColor *)appColor1;
+ (UIColor *)appColor2;
+ (UIColor *)appColor3;
+ (UIColor *)appColor4;
+ (NSArray *)appColors;

+ (UIColor *)redAppColor;

// modify colors
- (UIColor *)lightenColor;
- (UIColor *)lightenColorBy:(float)lightenAmount;
- (UIColor *)darkenColor;
- (UIColor *)darkenColorBy:(float)darkenAmount;
- (UIColor *)makeBrightnessOf:(float)brightness;

// random colors
+ (UIColor *)randomPastelColor;
+ (UIColor *)randomDarkColor;
+ (UIColor *)randomColor;
+ (NSString *)randomColorName;
- (NSString *)randomColorName;
+ (NSString *)randomColorNameWithColor:(UIColor *)color;
+ (UIColor *)randomDarkColorFromString:(NSString *)string;

// shades of colors
+ (NSDictionary *)whiteShades;
+ (NSDictionary *)grayShades;
+ (NSDictionary *)greyShades;
+ (NSDictionary *)pinkShades;
+ (NSDictionary *)redShades;
+ (NSDictionary *)brownShades;
+ (NSDictionary *)orangeShades;
+ (NSDictionary *)yellowShades;
+ (NSDictionary *)greenShades;
+ (NSDictionary *)cyanShades;
+ (NSDictionary *)blueShades;
+ (NSDictionary *)violetShades;

// Holiday Colors
+ (NSArray *)holidayColorsForToday;
+ (NSArray *)holidayColorsForDate:(NSDate *)date;
+ (NSArray *)strictHolidayColorsForToday;
+ (NSArray *)strictHolidayColorsForDate:(NSDate *)date;

// color for time of day
+ (UIColor *)colorForTimeOfDay:(NSDate *)date;
+ (UIColor *)colorForCurrentTime;

// sets of colors that are different for two players
+ (NSArray *)player1Colors;
+ (NSArray *)player2Colors;

// iOS Colors

+ (UIColor *)uiSwitchGreen;

// a list of usable colors
+ (NSArray *)allColorsArray;
+ (NSDictionary *)allColorsDictionary;
+ (NSDictionary *)allColorsProperNamesDictionary;

//Basic Colors that should have been there in the beginning
+ (UIColor *)acidGreen;

+ (UIColor *)aero;

+ (UIColor *)aeroBlue;

+ (UIColor *)africanViolet;

+ (UIColor *)airForceBlueRAF;

+ (UIColor *)airForceBlueUSAF;

+ (UIColor *)airSuperiorityBlue;

+ (UIColor *)alabamaCrimson;

+ (UIColor *)aliceBlue;

+ (UIColor *)alizarinCrimson;

+ (UIColor *)alloyOrange;

+ (UIColor *)almond;

+ (UIColor *)amaranth;

+ (UIColor *)amaranthDeepPurple;

+ (UIColor *)amaranthPink;

+ (UIColor *)amaranthPurple;

+ (UIColor *)amaranthRed;

+ (UIColor *)amazon;

+ (UIColor *)amber;

+ (UIColor *)amberSAEECE;

+ (UIColor *)americanRose;

+ (UIColor *)amethyst;

+ (UIColor *)androidGreen;

+ (UIColor *)antiFlashWhite;

+ (UIColor *)antiqueBrass;

+ (UIColor *)antiqueBronze;

+ (UIColor *)antiqueFuchsia;

+ (UIColor *)antiqueRuby;

+ (UIColor *)antiqueWhite;

+ (UIColor *)aoEnglish;

+ (UIColor *)appleGreen;

+ (UIColor *)apricot;

+ (UIColor *)aqua;

+ (UIColor *)aquamarine;

+ (UIColor *)armyGreen;

+ (UIColor *)arsenic;

+ (UIColor *)artichoke;

+ (UIColor *)arylideYellow;

+ (UIColor *)ashGrey;

+ (UIColor *)asparagus;

+ (UIColor *)atomicTangerine;

+ (UIColor *)auburn;

+ (UIColor *)aureolin;

+ (UIColor *)auroMetalSaurus;

+ (UIColor *)avocado;

+ (UIColor *)azure;

+ (UIColor *)azureWebColor;

+ (UIColor *)azureMist;

+ (UIColor *)azureishWhite;

+ (UIColor *)babyBlue;

+ (UIColor *)babyBlueEyes;

+ (UIColor *)babyPink;

+ (UIColor *)babyPowder;

+ (UIColor *)bakerMillerPink;

+ (UIColor *)ballBlue;

+ (UIColor *)bananaMania;

+ (UIColor *)bananaYellow;

+ (UIColor *)bangladeshGreen;

+ (UIColor *)barbiePink;

+ (UIColor *)barnRed;

+ (UIColor *)battleshipGrey;

+ (UIColor *)bazaar;

+ (UIColor *)beauBlue;

+ (UIColor *)beaver;

+ (UIColor *)beige;

+ (UIColor *)bdazzledBlue;

+ (UIColor *)bigDipOruby;

+ (UIColor *)bisque;

+ (UIColor *)bistre;

+ (UIColor *)bistreBrown;

+ (UIColor *)bitterLemon;

+ (UIColor *)bitterLime;

+ (UIColor *)bittersweet;

+ (UIColor *)bittersweetShimmer;

+ (UIColor *)black;

+ (UIColor *)blackBean;

+ (UIColor *)blackLeatherJacket;

+ (UIColor *)blackOlive;

+ (UIColor *)blanchedAlmond;

+ (UIColor *)blastOffBronze;

+ (UIColor *)bleuDeFrance;

+ (UIColor *)blizzardBlue;

+ (UIColor *)blond;

+ (UIColor *)blue;

+ (UIColor *)blueCrayola;

+ (UIColor *)blueMunsell;

+ (UIColor *)blueNCS;

+ (UIColor *)bluePantone;

+ (UIColor *)bluePigment;

+ (UIColor *)blueRYB;

+ (UIColor *)blueBell;

+ (UIColor *)blueGray;

+ (UIColor *)blueGreen;

+ (UIColor *)blueLagoon;

+ (UIColor *)blueMagentaViolet;

+ (UIColor *)blueSapphire;

+ (UIColor *)blueViolet;

+ (UIColor *)blueYonder;

+ (UIColor *)blueberry;

+ (UIColor *)bluebonnet;

+ (UIColor *)blush;

+ (UIColor *)bole;

+ (UIColor *)bondiBlue;

+ (UIColor *)bone;

+ (UIColor *)bostonUniversityRed;

+ (UIColor *)bottleGreen;

+ (UIColor *)boysenberry;

+ (UIColor *)brandeisBlue;

+ (UIColor *)brass;

+ (UIColor *)brickRed;

+ (UIColor *)brightCerulean;

+ (UIColor *)brightGreen;

+ (UIColor *)brightLavender;

+ (UIColor *)brightLilac;

+ (UIColor *)brightMaroon;

+ (UIColor *)brightNavyBlue;

+ (UIColor *)brightPink;

+ (UIColor *)brightTurquoise;

+ (UIColor *)brightUbe;

+ (UIColor *)brilliantAzure;

+ (UIColor *)brilliantLavender;

+ (UIColor *)brilliantRose;

+ (UIColor *)brinkPink;

+ (UIColor *)britishRacingGreen;

+ (UIColor *)bronze;

+ (UIColor *)bronzeYellow;

+ (UIColor *)brownTraditional;

+ (UIColor *)brownWeb;

+ (UIColor *)brownNose;

+ (UIColor *)brownYellow;

+ (UIColor *)brunswickGreen;

+ (UIColor *)bubbleGum;

+ (UIColor *)bubbles;

+ (UIColor *)buff;

+ (UIColor *)budGreen;

+ (UIColor *)bulgarianRose;

+ (UIColor *)burgundy;

+ (UIColor *)burlywood;

+ (UIColor *)burntOrange;

+ (UIColor *)burntSienna;

+ (UIColor *)burntUmber;

+ (UIColor *)byzantine;

+ (UIColor *)byzantium;

+ (UIColor *)cadet;

+ (UIColor *)cadetBlue;

+ (UIColor *)cadetGrey;

+ (UIColor *)cadmiumGreen;

+ (UIColor *)cadmiumOrange;

+ (UIColor *)cadmiumRed;

+ (UIColor *)cadmiumYellow;

+ (UIColor *)caféAuLait;

+ (UIColor *)caféNoir;

+ (UIColor *)calPolyGreen;

+ (UIColor *)cambridgeBlue;

+ (UIColor *)camel;

+ (UIColor *)cameoPink;

+ (UIColor *)camouflageGreen;

+ (UIColor *)canaryYellow;

+ (UIColor *)candyAppleRed;

+ (UIColor *)candyPink;

+ (UIColor *)capri;

+ (UIColor *)caputMortuum;

+ (UIColor *)cardinal;

+ (UIColor *)caribbeanGreen;

+ (UIColor *)carmine;

+ (UIColor *)carmineMP;

+ (UIColor *)carminePink;

+ (UIColor *)carmineRed;

+ (UIColor *)carnationPink;

+ (UIColor *)carnelian;

+ (UIColor *)carolinaBlue;

+ (UIColor *)carrotOrange;

+ (UIColor *)castletonGreen;

+ (UIColor *)catalinaBlue;

+ (UIColor *)catawba;

+ (UIColor *)cedarChest;

+ (UIColor *)ceil;

+ (UIColor *)celadon;

+ (UIColor *)celadonBlue;

+ (UIColor *)celadonGreen;

+ (UIColor *)celeste;

+ (UIColor *)celestialBlue;

+ (UIColor *)cerise;

+ (UIColor *)cerisePink;

+ (UIColor *)cerulean;

+ (UIColor *)ceruleanBlue;

+ (UIColor *)ceruleanFrost;

+ (UIColor *)cGBlue;

+ (UIColor *)cGRed;

+ (UIColor *)chamoisee;

+ (UIColor *)champagne;

+ (UIColor *)charcoal;

+ (UIColor *)charlestonGreen;

+ (UIColor *)charmPink;

+ (UIColor *)chartreuseTraditional;

+ (UIColor *)chartreuseWeb;

+ (UIColor *)cherry;

+ (UIColor *)cherryBlossomPink;

+ (UIColor *)chestnut;

+ (UIColor *)chinaPink;

+ (UIColor *)chinaRose;

+ (UIColor *)chineseRed;

+ (UIColor *)chineseViolet;

+ (UIColor *)chocolateTraditional;

+ (UIColor *)chocolateWeb;

+ (UIColor *)chromeYellow;

+ (UIColor *)cinereous;

+ (UIColor *)cinnabar;

+ (UIColor *)cinnamonCitationNeeded;

+ (UIColor *)citrine;

+ (UIColor *)citron;

+ (UIColor *)claret;

+ (UIColor *)classicRose;

+ (UIColor *)cobaltBlue;

+ (UIColor *)cocoaBrown;

+ (UIColor *)coconut;

+ (UIColor *)coffee;

+ (UIColor *)columbiaBlue;

+ (UIColor *)congoPink;

+ (UIColor *)coolBlack;

+ (UIColor *)coolGrey;

+ (UIColor *)copper;

+ (UIColor *)copperCrayola;

+ (UIColor *)copperPenny;

+ (UIColor *)copperRed;

+ (UIColor *)copperRose;

+ (UIColor *)coquelicot;

+ (UIColor *)coral;

+ (UIColor *)coralPink;

+ (UIColor *)coralRed;

+ (UIColor *)cordovan;

+ (UIColor *)corn;

+ (UIColor *)cornellRed;

+ (UIColor *)cornflowerBlue;

+ (UIColor *)cornsilk;

+ (UIColor *)cosmicLatte;

+ (UIColor *)coyoteBrown;

+ (UIColor *)cottonCandy;

+ (UIColor *)cream;

+ (UIColor *)crimson;

+ (UIColor *)crimsonGlory;

+ (UIColor *)crimsonRed;

+ (UIColor *)cyan;

+ (UIColor *)cyanAzure;

+ (UIColor *)cyanBlueAzure;

+ (UIColor *)cyanCobaltBlue;

+ (UIColor *)cyanCornflowerBlue;

+ (UIColor *)cyanProcess;

+ (UIColor *)cyberGrape;

+ (UIColor *)cyberYellow;

+ (UIColor *)daffodil;

+ (UIColor *)dandelion;

+ (UIColor *)darkBlue;

+ (UIColor *)darkBlueGray;

+ (UIColor *)darkBrown;

+ (UIColor *)darkBrownTangelo;

+ (UIColor *)darkByzantium;

+ (UIColor *)darkCandyAppleRed;

+ (UIColor *)darkCerulean;

+ (UIColor *)darkChestnut;

+ (UIColor *)darkCoral;

+ (UIColor *)darkCyan;

+ (UIColor *)darkElectricBlue;

+ (UIColor *)darkGoldenrod;

+ (UIColor *)darkGrayX11;

+ (UIColor *)darkGreen;

+ (UIColor *)darkGreenX11;

+ (UIColor *)darkImperialBlue;

+ (UIColor *)darkImperialBlue2;

+ (UIColor *)darkJungleGreen;

+ (UIColor *)darkKhaki;

+ (UIColor *)darkLava;

+ (UIColor *)darkLavender;

+ (UIColor *)darkLiver;

+ (UIColor *)darkLiverHorses;

+ (UIColor *)darkMagenta;

+ (UIColor *)darkMediumGray;

+ (UIColor *)darkMidnightBlue;

+ (UIColor *)darkMossGreen;

+ (UIColor *)darkOliveGreen;

+ (UIColor *)darkOrange;

+ (UIColor *)darkOrchid;

+ (UIColor *)darkPastelBlue;

+ (UIColor *)darkPastelGreen;

+ (UIColor *)darkPastelPurple;

+ (UIColor *)darkPastelRed;

+ (UIColor *)darkPink;

+ (UIColor *)darkPowderBlue;

+ (UIColor *)darkPuce;

+ (UIColor *)darkPurple;

+ (UIColor *)darkRaspberry;

+ (UIColor *)darkRed;

+ (UIColor *)darkSalmon;

+ (UIColor *)darkScarlet;

+ (UIColor *)darkSeaGreen;

+ (UIColor *)darkSienna;

+ (UIColor *)darkSkyBlue;

+ (UIColor *)darkSlateBlue;

+ (UIColor *)darkSlateGray;

+ (UIColor *)darkSpringGreen;

+ (UIColor *)darkTan;

+ (UIColor *)darkTangerine;

+ (UIColor *)darkTaupe;

+ (UIColor *)darkTerraCotta;

+ (UIColor *)darkTurquoise;

+ (UIColor *)darkVanilla;

+ (UIColor *)darkViolet;

+ (UIColor *)darkYellow;

+ (UIColor *)dartmouthGreen;

+ (UIColor *)davysGrey;

+ (UIColor *)debianRed;

+ (UIColor *)deepAquamarine;

+ (UIColor *)deepCarmine;

+ (UIColor *)deepCarminePink;

+ (UIColor *)deepCarrotOrange;

+ (UIColor *)deepCerise;

+ (UIColor *)deepChampagne;

+ (UIColor *)deepChestnut;

+ (UIColor *)deepCoffee;

+ (UIColor *)deepFuchsia;

+ (UIColor *)deepGreen;

+ (UIColor *)deepGreenCyanTurquoise;

+ (UIColor *)deepJungleGreen;

+ (UIColor *)deepKoamaru;

+ (UIColor *)deepLemon;

+ (UIColor *)deepLilac;

+ (UIColor *)deepMagenta;

+ (UIColor *)deepMaroon;

+ (UIColor *)deepMauve;

+ (UIColor *)deepMossGreen;

+ (UIColor *)deepPeach;

+ (UIColor *)deepPink;

+ (UIColor *)deepPuce;

+ (UIColor *)deepRed;

+ (UIColor *)deepRuby;

+ (UIColor *)deepSaffron;

+ (UIColor *)deepSkyBlue;

+ (UIColor *)deepSpaceSparkle;

+ (UIColor *)deepSpringBud;

+ (UIColor *)deepTaupe;

+ (UIColor *)deepTuscanRed;

+ (UIColor *)deepViolet;

+ (UIColor *)deer;

+ (UIColor *)denim;

+ (UIColor *)desaturatedCyan;

+ (UIColor *)desert;

+ (UIColor *)desertSand;

+ (UIColor *)desire;

+ (UIColor *)diamond;

+ (UIColor *)dimGray;

+ (UIColor *)dirt;

+ (UIColor *)dodgerBlue;

+ (UIColor *)dogwoodRose;

+ (UIColor *)dollarBill;

+ (UIColor *)donkeyBrown;

+ (UIColor *)drab;

+ (UIColor *)dukeBlue;

+ (UIColor *)dustStorm;

+ (UIColor *)dutchWhite;

+ (UIColor *)earthYellow;

+ (UIColor *)ebony;

+ (UIColor *)ecru;

+ (UIColor *)eerieBlack;

+ (UIColor *)eggplant;

+ (UIColor *)eggshell;

+ (UIColor *)egyptianBlue;

+ (UIColor *)electricBlue;

+ (UIColor *)electricCrimson;

+ (UIColor *)electricCyan;

+ (UIColor *)electricGreen;

+ (UIColor *)electricIndigo;

+ (UIColor *)electricLavender;

+ (UIColor *)electricLime;

+ (UIColor *)electricPurple;

+ (UIColor *)electricUltramarine;

+ (UIColor *)electricViolet;

+ (UIColor *)electricYellow;

+ (UIColor *)emerald;

+ (UIColor *)eminence;

+ (UIColor *)englishGreen;

+ (UIColor *)englishLavender;

+ (UIColor *)englishRed;

+ (UIColor *)englishViolet;

+ (UIColor *)etonBlue;

+ (UIColor *)eucalyptus;

+ (UIColor *)fallow;

+ (UIColor *)faluRed;

+ (UIColor *)fandango;

+ (UIColor *)fandangoPink;

+ (UIColor *)fashionFuchsia;

+ (UIColor *)fawn;

+ (UIColor *)feldgrau;

+ (UIColor *)feldspar;

+ (UIColor *)fernGreen;

+ (UIColor *)ferrariRed;

+ (UIColor *)fieldDrab;

+ (UIColor *)firebrick;

+ (UIColor *)fireEngineRed;

+ (UIColor *)flame;

+ (UIColor *)flamingoPink;

+ (UIColor *)flattery;

+ (UIColor *)flavescent;

+ (UIColor *)flax;

+ (UIColor *)flirt;

+ (UIColor *)floralWhite;

+ (UIColor *)fluorescentOrange;

+ (UIColor *)fluorescentPink;

+ (UIColor *)fluorescentYellow;

+ (UIColor *)folly;

+ (UIColor *)forestGreenTraditional;

+ (UIColor *)forestGreenWeb;

+ (UIColor *)frenchBeige;

+ (UIColor *)frenchBistre;

+ (UIColor *)frenchBlue;

+ (UIColor *)frenchFuchsia;

+ (UIColor *)frenchLilac;

+ (UIColor *)frenchLime;

+ (UIColor *)frenchMauve;

+ (UIColor *)frenchPink;

+ (UIColor *)frenchPlum;

+ (UIColor *)frenchPuce;

+ (UIColor *)frenchRaspberry;

+ (UIColor *)frenchRose;

+ (UIColor *)frenchSkyBlue;

+ (UIColor *)frenchViolet;

+ (UIColor *)frenchWine;

+ (UIColor *)freshAir;

+ (UIColor *)fuchsia;

+ (UIColor *)fuchsiaCrayola;

+ (UIColor *)fuchsiaPink;

+ (UIColor *)fuchsiaPurple;

+ (UIColor *)fuchsiaRose;

+ (UIColor *)fulvous;

+ (UIColor *)fuzzyWuzzy;

+ (UIColor *)gamboge;

+ (UIColor *)gambogeOrangeBrown;

+ (UIColor *)genericViridian;

+ (UIColor *)ghostWhite;

+ (UIColor *)giantsOrange;

+ (UIColor *)grussrel;

+ (UIColor *)glaucous;

+ (UIColor *)glitter;

+ (UIColor *)gOGreen;

+ (UIColor *)goldMetallic;

+ (UIColor *)goldWebGolden;

+ (UIColor *)goldFusion;

+ (UIColor *)goldenBrown;

+ (UIColor *)goldenPoppy;

+ (UIColor *)goldenYellow;

+ (UIColor *)goldenrod;

+ (UIColor *)grannySmithApple;

+ (UIColor *)grape;

+ (UIColor *)gray;

+ (UIColor *)grayHTMLCSSGray;

+ (UIColor *)grayX11Gray;

+ (UIColor *)grayAsparagus;

+ (UIColor *)grayBlue;

+ (UIColor *)greenColorWheelX11Green;

+ (UIColor *)greenCrayola;

+ (UIColor *)greenHTMLCSSColor;

+ (UIColor *)greenMunsell;

+ (UIColor *)greenNCS;

+ (UIColor *)greenPantone;

+ (UIColor *)greenPigment;

+ (UIColor *)greenRYB;

+ (UIColor *)greenBlue;

+ (UIColor *)greenCyan;

+ (UIColor *)greenYellow;

+ (UIColor *)grizzly;

+ (UIColor *)grullo;

+ (UIColor *)guppieGreen;

+ (UIColor *)halayàÚbe;

+ (UIColor *)hanBlue;

+ (UIColor *)hanPurple;

+ (UIColor *)hansaYellow;

+ (UIColor *)harlequin;

+ (UIColor *)harlequinGreen;

+ (UIColor *)harvardCrimson;

+ (UIColor *)harvestGold;

+ (UIColor *)heartGold;

+ (UIColor *)heliotrope;

+ (UIColor *)heliotropeGray;

+ (UIColor *)heliotropeMagenta;

+ (UIColor *)hollywoodCerise;

+ (UIColor *)honeydew;

+ (UIColor *)honoluluBlue;

+ (UIColor *)hookersGreen;

+ (UIColor *)hotMagenta;

+ (UIColor *)hotPink;

+ (UIColor *)hunterGreen;

+ (UIColor *)iceberg;

+ (UIColor *)icterine;

+ (UIColor *)illuminatingEmerald;

+ (UIColor *)imperial;

+ (UIColor *)imperialBlue;

+ (UIColor *)imperialPurple;

+ (UIColor *)imperialRed;

+ (UIColor *)inchworm;

+ (UIColor *)independence;


+ (UIColor *)indiaGreen;

+ (UIColor *)indianRed;

+ (UIColor *)indianYellow;

+ (UIColor *)indigo;

+ (UIColor *)indigoDye;

+ (UIColor *)indigoWeb;

+ (UIColor *)internationalKleinBlue;

+ (UIColor *)internationalOrangeAerospace;

+ (UIColor *)internationalOrangeEngineering;

+ (UIColor *)internationalOrangeGoldenGateBridge;

+ (UIColor *)iris;

+ (UIColor *)irresistible;

+ (UIColor *)isabelline;

+ (UIColor *)islamicGreen;

+ (UIColor *)italianSkyBlue;

+ (UIColor *)ivory;

+ (UIColor *)jade;

+ (UIColor *)japaneseCarmine;

+ (UIColor *)japaneseIndigo;

+ (UIColor *)japaneseViolet;

+ (UIColor *)jasmine;

+ (UIColor *)jasper;

+ (UIColor *)jazzberryJam;

+ (UIColor *)jellyBean;

+ (UIColor *)jet;

+ (UIColor *)jonquil;

+ (UIColor *)jordyBlue;

+ (UIColor *)juneBud;

+ (UIColor *)jungleGreen;

+ (UIColor *)kellyGreen;

+ (UIColor *)kenyanCopper;

+ (UIColor *)keppel;

+ (UIColor *)jawadChickenColorHTMLCSSKhaki;

+ (UIColor *)khakiX11LightKhaki;

+ (UIColor *)kobe;

+ (UIColor *)kobi;

+ (UIColor *)kombuGreen;

+ (UIColor *)kUCrimson;

+ (UIColor *)laSalleGreen;

+ (UIColor *)languidLavender;

+ (UIColor *)lapisLazuli;

+ (UIColor *)laserLemon;

+ (UIColor *)laurelGreen;

+ (UIColor *)lava;

+ (UIColor *)lavenderFloral;

+ (UIColor *)lavenderWeb;

+ (UIColor *)lavenderBlue;

+ (UIColor *)lavenderBlush;

+ (UIColor *)lavenderGray;

+ (UIColor *)lavenderIndigo;

+ (UIColor *)lavenderMagenta;

+ (UIColor *)lavenderMist;

+ (UIColor *)lavenderPink;

+ (UIColor *)lavenderPurple;

+ (UIColor *)lavenderRose;

+ (UIColor *)lawnGreen;

+ (UIColor *)lemon;

+ (UIColor *)lemonChiffon;

+ (UIColor *)lemonCurry;

+ (UIColor *)lemonGlacier;

+ (UIColor *)lemonLime;

+ (UIColor *)lemonMeringue;

+ (UIColor *)lemonYellow;

+ (UIColor *)lenurple;

+ (UIColor *)licorice;

+ (UIColor *)liberty;

+ (UIColor *)lightApricot;

+ (UIColor *)lightBlue;

+ (UIColor *)lightBrilliantRed;

+ (UIColor *)lightBrown;

+ (UIColor *)lightCarminePink;

+ (UIColor *)lightCobaltBlue;

+ (UIColor *)lightCoral;

+ (UIColor *)lightCornflowerBlue;

+ (UIColor *)lightCrimson;

+ (UIColor *)lightCyan;

+ (UIColor *)lightDeepPink;

+ (UIColor *)lightFrenchBeige;

+ (UIColor *)lightFuchsiaPink;

+ (UIColor *)lightGoldenrodYellow;

+ (UIColor *)lightGray;

+ (UIColor *)lightGrayishMagenta;

+ (UIColor *)lightGreen;

+ (UIColor *)lightHotPink;

+ (UIColor *)lightKhaki;

+ (UIColor *)lightMediumOrchid;

+ (UIColor *)lightMossGreen;

+ (UIColor *)lightOrchid;

+ (UIColor *)lightPastelPurple;

+ (UIColor *)lightPink;

+ (UIColor *)lightRedOchre;

+ (UIColor *)lightSalmon;

+ (UIColor *)lightSalmonPink;

+ (UIColor *)lightSeaGreen;

+ (UIColor *)lightSkyBlue;

+ (UIColor *)lightSlateGray;

+ (UIColor *)lightSteelBlue;

+ (UIColor *)lightTaupe;

+ (UIColor *)lightThulianPink;

+ (UIColor *)lightYellow;

+ (UIColor *)lilac;

+ (UIColor *)limeColorWheel;

+ (UIColor *)limeWebX11Green;

+ (UIColor *)limeGreen;

+ (UIColor *)limerick;

+ (UIColor *)lincolnGreen;

+ (UIColor *)linen;

+ (UIColor *)lion;

+ (UIColor *)liseranPurple;

+ (UIColor *)littleBoyBlue;

+ (UIColor *)liver;

+ (UIColor *)liverDogs;

+ (UIColor *)liverOrgan;

+ (UIColor *)liverChestnut;

+ (UIColor *)livid;

+ (UIColor *)lumber;

+ (UIColor *)lust;

+ (UIColor *)magenta;

+ (UIColor *)magentaCrayola;

+ (UIColor *)magentaDye;

+ (UIColor *)magentaPantone;

+ (UIColor *)magentaProcess;

+ (UIColor *)magentaHaze;

+ (UIColor *)magentaPink;

+ (UIColor *)magicMint;

+ (UIColor *)magnolia;

+ (UIColor *)mahogany;

+ (UIColor *)maize;

+ (UIColor *)majorelleBlue;

+ (UIColor *)malachite;

+ (UIColor *)manatee;

+ (UIColor *)mangoTango;

+ (UIColor *)mantis;

+ (UIColor *)mardiGras;

+ (UIColor *)marigold;

+ (UIColor *)maroonCrayola;

+ (UIColor *)maroonHTMLCSS;

+ (UIColor *)maroonX11;

+ (UIColor *)mauve;

+ (UIColor *)mauveTaupe;

+ (UIColor *)mauvelous;

+ (UIColor *)mayGreen;

+ (UIColor *)mayaBlue;

+ (UIColor *)meatBrown;

+ (UIColor *)mediumAquamarine;

+ (UIColor *)mediumBlue;

+ (UIColor *)mediumCandyAppleRed;

+ (UIColor *)mediumCarmine;

+ (UIColor *)mediumChampagne;

+ (UIColor *)mediumElectricBlue;

+ (UIColor *)mediumJungleGreen;

+ (UIColor *)mediumLavenderMagenta;

+ (UIColor *)mediumOrchid;

+ (UIColor *)mediumPersianBlue;

+ (UIColor *)mediumPurple;

+ (UIColor *)mediumRedViolet;

+ (UIColor *)mediumRuby;

+ (UIColor *)mediumSeaGreen;

+ (UIColor *)mediumSkyBlue;

+ (UIColor *)mediumSlateBlue;

+ (UIColor *)mediumSpringBud;

+ (UIColor *)mediumSpringGreen;

+ (UIColor *)mediumTaupe;

+ (UIColor *)mediumTurquoise;

+ (UIColor *)mediumTuscanRed;

+ (UIColor *)mediumVermilion;

+ (UIColor *)mediumVioletRed;

+ (UIColor *)mellowApricot;

+ (UIColor *)mellowYellow;

+ (UIColor *)melon;

+ (UIColor *)metallicSeaweed;

+ (UIColor *)metallicSunburst;

+ (UIColor *)mexicanPink;

+ (UIColor *)midnightBlue;

+ (UIColor *)midnightGreenEagleGreen;

+ (UIColor *)mikadoYellow;

+ (UIColor *)mindaro;

+ (UIColor *)ming;

+ (UIColor *)mint;

+ (UIColor *)mintCream;

+ (UIColor *)mintGreen;

+ (UIColor *)mistyRose;

+ (UIColor *)moccasin;

+ (UIColor *)modeBeige;

+ (UIColor *)moonstoneBlue;

+ (UIColor *)mordantRed19;

+ (UIColor *)mossGreen;

+ (UIColor *)mountainMeadow;

+ (UIColor *)mountbattenPink;

+ (UIColor *)mSUGreen;

+ (UIColor *)mughalGreen;

+ (UIColor *)mulberry;

+ (UIColor *)mustard;

+ (UIColor *)myrtleGreen;

+ (UIColor *)nadeshikoPink;

+ (UIColor *)napierGreen;

+ (UIColor *)naplesYellow;

+ (UIColor *)navajoWhite;

+ (UIColor *)navy;

+ (UIColor *)navyPurple;

+ (UIColor *)neonCarrot;

+ (UIColor *)neonFuchsia;

+ (UIColor *)neonGreen;

+ (UIColor *)newCar;

+ (UIColor *)newYorkPink;

+ (UIColor *)nonPhotoBlue;

+ (UIColor *)northTexasGreen;

+ (UIColor *)nyanza;

+ (UIColor *)oceanBoatBlue;

+ (UIColor *)ochre;

+ (UIColor *)officeGreen;

+ (UIColor *)oldBurgundy;

+ (UIColor *)oldGold;

+ (UIColor *)oldHeliotrope;

+ (UIColor *)oldLace;

+ (UIColor *)oldLavender;

+ (UIColor *)oldMauve;

+ (UIColor *)oldMossGreen;

+ (UIColor *)oldRose;

+ (UIColor *)oldSilver;

+ (UIColor *)olive;

+ (UIColor *)oliveDrab3;

+ (UIColor *)oliveDrab7;

+ (UIColor *)olivine;

+ (UIColor *)onyx;

+ (UIColor *)operaMauve;

+ (UIColor *)orangeColorWheel;

+ (UIColor *)orangeCrayola;

+ (UIColor *)orangePantone;

+ (UIColor *)orangeRYB;

+ (UIColor *)orangeWeb;

+ (UIColor *)orangePeel;

+ (UIColor *)orangeRed;

+ (UIColor *)orangeYellow;

+ (UIColor *)orchid;

+ (UIColor *)orchidPink;

+ (UIColor *)oriolesOrange;

+ (UIColor *)otterBrown;

+ (UIColor *)outerSpace;

+ (UIColor *)outrageousOrange;

+ (UIColor *)oxfordBlue;

+ (UIColor *)oUCrimsonRed;

+ (UIColor *)pakistanGreen;

+ (UIColor *)palatinateBlue;

+ (UIColor *)palatinatePurple;

+ (UIColor *)paleAqua;

+ (UIColor *)paleBlue;

+ (UIColor *)paleBrown;

+ (UIColor *)paleCarmine;

+ (UIColor *)paleCerulean;

+ (UIColor *)paleChestnut;

+ (UIColor *)paleCopper;

+ (UIColor *)paleCornflowerBlue;

+ (UIColor *)paleCyan;

+ (UIColor *)paleGold;

+ (UIColor *)paleGoldenrod;

+ (UIColor *)paleGreen;

+ (UIColor *)paleLavender;

+ (UIColor *)paleMagenta;

+ (UIColor *)paleMagentaPink;

+ (UIColor *)palePink;

+ (UIColor *)palePlum;

+ (UIColor *)paleRedViolet;

+ (UIColor *)paleRobinEggBlue;

+ (UIColor *)paleSilver;

+ (UIColor *)paleSpringBud;

+ (UIColor *)paleTaupe;

+ (UIColor *)paleTurquoise;

+ (UIColor *)paleViolet;

+ (UIColor *)paleVioletRed;

+ (UIColor *)pansyPurple;

+ (UIColor *)paoloVeroneseGreen;

+ (UIColor *)papayaWhip;

+ (UIColor *)paradisePink;

+ (UIColor *)parisGreen;

+ (UIColor *)pastelBlue;

+ (UIColor *)pastelBrown;

+ (UIColor *)pastelGray;

+ (UIColor *)pastelGreen;

+ (UIColor *)pastelMagenta;

+ (UIColor *)pastelOrange;

+ (UIColor *)pastelPink;

+ (UIColor *)pastelPurple;

+ (UIColor *)pastelRed;

+ (UIColor *)pastelViolet;

+ (UIColor *)pastelYellow;

+ (UIColor *)patriarch;

+ (UIColor *)paynesGrey;

+ (UIColor *)peach;

+ (UIColor *)peach2;

+ (UIColor *)peachOrange;

+ (UIColor *)peachPuff;

+ (UIColor *)peachYellow;

+ (UIColor *)pear;

+ (UIColor *)pearl;

+ (UIColor *)pearlAqua;

+ (UIColor *)pearlyPurple;

+ (UIColor *)peridot;

+ (UIColor *)periwinkle;

+ (UIColor *)persianBlue;

+ (UIColor *)persianGreen;

+ (UIColor *)persianIndigo;

+ (UIColor *)persianOrange;

+ (UIColor *)persianPink;

+ (UIColor *)persianPlum;

+ (UIColor *)persianRed;

+ (UIColor *)persianRose;

+ (UIColor *)persimmon;

+ (UIColor *)peru;

+ (UIColor *)phlox;

+ (UIColor *)phthaloBlue;

+ (UIColor *)phthaloGreen;

+ (UIColor *)pictonBlue;

+ (UIColor *)pictorialCarmine;

+ (UIColor *)piggyPink;

+ (UIColor *)pineGreen;

+ (UIColor *)pineapple;

+ (UIColor *)pink;

+ (UIColor *)pinkPantone;

+ (UIColor *)pinkLace;

+ (UIColor *)pinkLavender;

+ (UIColor *)pinkOrange;

+ (UIColor *)pinkPearl;

+ (UIColor *)pinkRaspberry;

+ (UIColor *)pinkSherbet;

+ (UIColor *)pistachio;

+ (UIColor *)platinum;

+ (UIColor *)plum;

+ (UIColor *)plumWeb;

+ (UIColor *)pompAndPower;

+ (UIColor *)popstar;

+ (UIColor *)portlandOrange;

+ (UIColor *)powderBlue;

+ (UIColor *)princetonOrange;

+ (UIColor *)prune;

+ (UIColor *)prussianBlue;

+ (UIColor *)psychedelicPurple;

+ (UIColor *)puce;

+ (UIColor *)puceRed;

+ (UIColor *)pullmanBrownUPSBrown;

+ (UIColor *)pullmanGreen;

+ (UIColor *)pumpkin;

+ (UIColor *)purpleHTML;

+ (UIColor *)purpleMunsell;

+ (UIColor *)purpleX11;

+ (UIColor *)purpleHeart;

+ (UIColor *)purpleMountainMajesty;

+ (UIColor *)purpleNavy;

+ (UIColor *)purplePizzazz;

+ (UIColor *)purpleTaupe;

+ (UIColor *)purpureus;

+ (UIColor *)quartz;

+ (UIColor *)queenBlue;

+ (UIColor *)queenPink;

+ (UIColor *)quinacridoneMagenta;

+ (UIColor *)rackley;

+ (UIColor *)radicalRed;

+ (UIColor *)rajah;

+ (UIColor *)raspberry;

+ (UIColor *)raspberryGlace;

+ (UIColor *)raspberryPink;

+ (UIColor *)raspberryRose;

+ (UIColor *)rawUmber;

+ (UIColor *)razzleDazzleRose;

+ (UIColor *)razzmatazz;

+ (UIColor *)razzmicBerry;

+ (UIColor *)rebeccaPurple;

+ (UIColor *)red;

+ (UIColor *)redCrayola;

+ (UIColor *)redMunsell;

+ (UIColor *)redNCS;

+ (UIColor *)redPantone;

+ (UIColor *)redPigment;

+ (UIColor *)redRYB;

+ (UIColor *)redBrown;

+ (UIColor *)redDevil;

+ (UIColor *)redOrange;

+ (UIColor *)redPurple;

+ (UIColor *)redViolet;

+ (UIColor *)redwood;

+ (UIColor *)regalia;

+ (UIColor *)registrationBlack;

+ (UIColor *)resolutionBlue;

+ (UIColor *)rhythm;

+ (UIColor *)richBlack;

+ (UIColor *)richBlackFOGRA29;

+ (UIColor *)richBlackFOGRA39;

+ (UIColor *)richBrilliantLavender;

+ (UIColor *)richCarmine;

+ (UIColor *)richElectricBlue;

+ (UIColor *)richLavender;

+ (UIColor *)richLilac;

+ (UIColor *)richMaroon;

+ (UIColor *)rifleGreen;

+ (UIColor *)roastCoffee;

+ (UIColor *)robinEggBlue;

+ (UIColor *)rocketMetallic;

+ (UIColor *)romanSilver;

+ (UIColor *)rose;

+ (UIColor *)roseBonbon;

+ (UIColor *)roseEbony;

+ (UIColor *)roseGold;

+ (UIColor *)roseMadder;

+ (UIColor *)rosePink;

+ (UIColor *)roseQuartz;

+ (UIColor *)roseRed;

+ (UIColor *)roseTaupe;

+ (UIColor *)roseVale;

+ (UIColor *)rosewood;

+ (UIColor *)rossoCorsa;

+ (UIColor *)rosyBrown;

+ (UIColor *)royalAzure;

+ (UIColor *)royalBlue;

+ (UIColor *)royalBlue2;

+ (UIColor *)royalFuchsia;

+ (UIColor *)royalPurple;

+ (UIColor *)royalYellow;

+ (UIColor *)ruber;

+ (UIColor *)rubineRed;

+ (UIColor *)ruby;

+ (UIColor *)rubyRed;

+ (UIColor *)ruddy;

+ (UIColor *)ruddyBrown;

+ (UIColor *)ruddyPink;

+ (UIColor *)rufous;

+ (UIColor *)russet;

+ (UIColor *)russianGreen;

+ (UIColor *)russianViolet;

+ (UIColor *)rust;

+ (UIColor *)rustyRed;

+ (UIColor *)sacramentoStateGreen;

+ (UIColor *)saddleBrown;

+ (UIColor *)safetyOrange;

+ (UIColor *)safetyOrangeBlazeOrange;

+ (UIColor *)safetyYellow;

+ (UIColor *)saffron;

+ (UIColor *)sage;

+ (UIColor *)stPatricksBlue;

+ (UIColor *)salmon;

+ (UIColor *)salmonPink;

+ (UIColor *)sand;

+ (UIColor *)sandDune;

+ (UIColor *)sandstorm;

+ (UIColor *)sandyBrown;

+ (UIColor *)sandyTaupe;

+ (UIColor *)sangria;

+ (UIColor *)sapGreen;

+ (UIColor *)sapphire;

+ (UIColor *)sapphireBlue;

+ (UIColor *)satinSheenGold;

+ (UIColor *)scarlet;

+ (UIColor *)scarlet2;

+ (UIColor *)schaussPink;

+ (UIColor *)schoolBusYellow;

+ (UIColor *)screaminGreen;

+ (UIColor *)seaBlue;

+ (UIColor *)seaGreen;

+ (UIColor *)sealBrown;

+ (UIColor *)seashell;

+ (UIColor *)selectiveYellow;

+ (UIColor *)sepia;

+ (UIColor *)shadow;

+ (UIColor *)shadowBlue;

+ (UIColor *)shampoo;

+ (UIColor *)shamrockGreen;

+ (UIColor *)sheenGreen;

+ (UIColor *)shimmeringBlush;

+ (UIColor *)shockingPink;

+ (UIColor *)shockingPinkCrayola;

+ (UIColor *)sienna;

+ (UIColor *)silver;

+ (UIColor *)silverChalice;

+ (UIColor *)silverLakeBlue;

+ (UIColor *)silverPink;

+ (UIColor *)silverSand;

+ (UIColor *)sinopia;

+ (UIColor *)skobeloff;

+ (UIColor *)skyBlue;

+ (UIColor *)skyMagenta;

+ (UIColor *)slateBlue;

+ (UIColor *)slateGray;

+ (UIColor *)smaltDarkPowderBlue;

+ (UIColor *)smitten;

+ (UIColor *)smoke;

+ (UIColor *)smokyBlack;

+ (UIColor *)smokyTopaz;

+ (UIColor *)snow;

+ (UIColor *)soap;

+ (UIColor *)solidPink;

+ (UIColor *)sonicSilver;

+ (UIColor *)spartanCrimson;

+ (UIColor *)spaceCadet;

+ (UIColor *)spanishBistre;

+ (UIColor *)spanishBlue;

+ (UIColor *)spanishCarmine;

+ (UIColor *)spanishCrimson;

+ (UIColor *)spanishGray;

+ (UIColor *)spanishGreen;

+ (UIColor *)spanishOrange;

+ (UIColor *)spanishPink;

+ (UIColor *)spanishRed;

+ (UIColor *)spanishSkyBlue;

+ (UIColor *)spanishViolet;

+ (UIColor *)spanishViridian;

+ (UIColor *)spicyMix;

+ (UIColor *)spiroDiscoBall;

+ (UIColor *)springBud;

+ (UIColor *)springGreen;

+ (UIColor *)starCommandBlue;

+ (UIColor *)steelBlue;

+ (UIColor *)steelPink;

+ (UIColor *)stilDeGrainYellow;

+ (UIColor *)stizza;

+ (UIColor *)stormcloud;

+ (UIColor *)straw;

+ (UIColor *)strawberry;

+ (UIColor *)sunglow;

+ (UIColor *)sunray;

+ (UIColor *)sunset;

+ (UIColor *)sunsetOrange;

+ (UIColor *)superPink;

+ (UIColor *)tan;

+ (UIColor *)tangelo;

+ (UIColor *)tangerine;

+ (UIColor *)tangerineYellow;

+ (UIColor *)tangoPink;

+ (UIColor *)taupe;

+ (UIColor *)taupeGray;

+ (UIColor *)teaGreen;

+ (UIColor *)teaRose;

+ (UIColor *)teaRose2;

+ (UIColor *)teal;

+ (UIColor *)tealBlue;

+ (UIColor *)tealDeer;

+ (UIColor *)tealGreen;

+ (UIColor *)telemagenta;

+ (UIColor *)tenne;

+ (UIColor *)terraCotta;

+ (UIColor *)thistle;

+ (UIColor *)thulianPink;

+ (UIColor *)tickleMePink;

+ (UIColor *)tiffanyBlue;

+ (UIColor *)tigersEye;

+ (UIColor *)timberwolf;

+ (UIColor *)titaniumYellow;

+ (UIColor *)tomato;

+ (UIColor *)toolbox;

+ (UIColor *)topaz;

+ (UIColor *)tractorRed;

+ (UIColor *)trolleyGrey;

+ (UIColor *)tropicalRainForest;

+ (UIColor *)trueBlue;

+ (UIColor *)tuftsBlue;

+ (UIColor *)tulip;

+ (UIColor *)tumbleweed;

+ (UIColor *)turkishRose;

+ (UIColor *)turquoise;

+ (UIColor *)turquoiseBlue;

+ (UIColor *)turquoiseGreen;

+ (UIColor *)tuscan;

+ (UIColor *)tuscanBrown;

+ (UIColor *)tuscanRed;

+ (UIColor *)tuscanTan;

+ (UIColor *)tuscany;

+ (UIColor *)twilightLavender;

+ (UIColor *)tyrianPurple;

+ (UIColor *)uABlue;

+ (UIColor *)uARed;

+ (UIColor *)ube;

+ (UIColor *)uCLABlue;

+ (UIColor *)uCLAGold;

+ (UIColor *)uFOGreen;

+ (UIColor *)ultramarine;

+ (UIColor *)ultramarineBlue;

+ (UIColor *)ultraPink;

+ (UIColor *)ultraRed;

+ (UIColor *)umber;

+ (UIColor *)unbleachedSilk;

+ (UIColor *)unitedNationsBlue;

+ (UIColor *)universityOfCaliforniaGold;

+ (UIColor *)unmellowYellow;

+ (UIColor *)uPForestGreen;

+ (UIColor *)uPMaroon;

+ (UIColor *)upsdellRed;

+ (UIColor *)urobilin;

+ (UIColor *)uSAFABlue;

+ (UIColor *)uSCCardinal;

+ (UIColor *)uSCGold;

+ (UIColor *)universityOfTennesseeOrange;

+ (UIColor *)utahCrimson;

+ (UIColor *)vanilla;

+ (UIColor *)vanillaIce;

+ (UIColor *)vegasGold;

+ (UIColor *)venetianRed;

+ (UIColor *)verdigris;

+ (UIColor *)vermilion;

+ (UIColor *)vermilion2;

+ (UIColor *)veronica;

+ (UIColor *)veryLightAzure;

+ (UIColor *)veryLightBlue;

+ (UIColor *)veryLightMalachiteGreen;

+ (UIColor *)veryLightTangelo;

+ (UIColor *)veryPaleOrange;

+ (UIColor *)veryPaleYellow;

+ (UIColor *)violet;

+ (UIColor *)violetColorWheel;

+ (UIColor *)violetRYB;

+ (UIColor *)violetWeb;

+ (UIColor *)violetBlue;

+ (UIColor *)violetRed;

+ (UIColor *)viridian;

+ (UIColor *)viridianGreen;

+ (UIColor *)vistaBlue;

+ (UIColor *)vividAmber;

+ (UIColor *)vividAuburn;

+ (UIColor *)vividBurgundy;

+ (UIColor *)vividCerise;

+ (UIColor *)vividCerulean;

+ (UIColor *)vividCrimson;

+ (UIColor *)vividGamboge;

+ (UIColor *)vividLimeGreen;

+ (UIColor *)vividMalachite;

+ (UIColor *)vividMulberry;

+ (UIColor *)vividOrange;

+ (UIColor *)vividOrangePeel;

+ (UIColor *)vividOrchid;

+ (UIColor *)vividRaspberry;

+ (UIColor *)vividRed;

+ (UIColor *)vividRedTangelo;

+ (UIColor *)vividSkyBlue;

+ (UIColor *)vividTangelo;

+ (UIColor *)vividTangerine;

+ (UIColor *)vividVermilion;

+ (UIColor *)vividViolet;

+ (UIColor *)vividYellow;

+ (UIColor *)warmBlack;

+ (UIColor *)waterspout;

+ (UIColor *)wenge;

+ (UIColor *)wheat;

+ (UIColor *)white;

+ (UIColor *)whiteSmoke;

+ (UIColor *)wildBlueYonder;

+ (UIColor *)wildOrchid;

+ (UIColor *)wildStrawberry;

+ (UIColor *)wildWatermelon;

+ (UIColor *)willpowerOrange;

+ (UIColor *)windsorTan;

+ (UIColor *)wine;

+ (UIColor *)wineDregs;

+ (UIColor *)wisteria;

+ (UIColor *)woodBrown;

+ (UIColor *)xanadu;

+ (UIColor *)yaleBlue;

+ (UIColor *)yankeesBlue;

+ (UIColor *)yellow;

+ (UIColor *)yellowCrayola;

+ (UIColor *)yellowMunsell;

+ (UIColor *)yellowNCS;

+ (UIColor *)yellowPantone;

+ (UIColor *)yellowProcess;

+ (UIColor *)yellowRYB;

+ (UIColor *)yellowGreen;

+ (UIColor *)yellowOrange;

+ (UIColor *)yellowRose;

+ (UIColor *)zaffre;

+ (UIColor *)zinnwalditeBrown;

+ (UIColor *)zomp;


+ (UIColor *)parchment;



@end
