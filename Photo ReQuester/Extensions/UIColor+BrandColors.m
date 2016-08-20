//
//  UIColor+BrandColors.m
//  Alphabetical List Utility
//
//  Created by HAI on 7/6/15.
//  Copyright © 2015 HAI. All rights reserved.
//

#import "UIColor+BrandColors.h"
#import "UIColor+AppColors.h"

@implementation UIColor (BrandColors)


+ (UIColor *)colorWithHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

+ (instancetype)colorManager {
    static UIColor *colorManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        colorManager = [UIColor white];
    });
    
    return colorManager;
}


+ (UIColor *)colorForCompanyName:(NSString *)companyName {
    return [UIColor.colorManager colorForCompanyName:companyName];
}

- (UIColor *)colorForCompanyName:(NSString *)companyName {
	NSString *formattedCompanyName = [[[[companyName stringByReplacingOccurrencesOfString:@"&" withString:@"and"] componentsSeparatedByCharactersInSet :[[NSCharacterSet alphanumericCharacterSet] invertedSet]] componentsJoinedByString:@""] lowercaseString];
	
	if ([self respondsToSelector:NSSelectorFromString(formattedCompanyName)]) {
		return [self performSelector:NSSelectorFromString(formattedCompanyName) withObject:nil];
	}
	
	return [UIColor randomDarkColorFromString:companyName];
}

- (UIColor *)fourormat{
	return [UIColor colorWithHexString:@"#fb0a2a"];
}


- (UIColor *)fivehundredpx{
	return [UIColor colorWithHexString:@"#0099e5"];
}

- (UIColor *)fivehundredpx2{
	return [UIColor colorWithHexString:@"#ff4c4c"];
}

- (UIColor *)fivehundredpx3{
	return [UIColor colorWithHexString:@"#34bf49"];
}


- (UIColor *)aboutme{
	return [UIColor colorWithHexString:@"#00405d"];
}

- (UIColor *)aboutme2{
	return [UIColor colorWithHexString:@"#062f3c"];
}

- (UIColor *)aboutme3{
	return [UIColor colorWithHexString:@"#2b82ad"];
}

- (UIColor *)aboutme4{
	return [UIColor colorWithHexString:@"#cc7a00"];
}

- (UIColor *)aboutme5{
	return [UIColor colorWithHexString:@"#ffcc33"];
}


- (UIColor *)ace {
	return [UIColor colorWithRed:230.0f/255.0f green:25.0f/255.0f blue:56.0f/255.0f alpha:1.0f];
}

- (UIColor *)acehardware {
	return [self ace];
}

- (UIColor *)acehardwear {
	return [self ace];
}


- (UIColor *)acmoore {
	return [UIColor colorWithRed:227.0f/255.0f green:25.0f/255.0f blue:55.0f/255.0f alpha:1.0f];
}

- (UIColor *)acmooreartsandcrafts {
	return [self acmoore];
}

- (UIColor *)artsandcrafts {
	return [self acmoore];
}


- (UIColor *)addvocate{
	return [UIColor colorWithHexString:@"#ff3322"];
}


- (UIColor *)advancedautoparts {
	return [UIColor colorWithRed:235.0f/255.0f green:27.0f/255.0f blue:42.0f/255.0f alpha:1.0f];
}


- (UIColor *)adobe{
	return [UIColor colorWithHexString:@"#ff0000"];
}

- (UIColor *)adobe2{
	return [UIColor colorWithHexString:@"#fbb034"];
}

- (UIColor *)adobe3{
	return [UIColor colorWithHexString:@"#ffdd00"];
}

- (UIColor *)adobe4{
	return [UIColor colorWithHexString:@"#c1d82f"];
}

- (UIColor *)adobe5{
	return [UIColor colorWithHexString:@"#00a4e4"];
}

- (UIColor *)adobe6{
	return [UIColor colorWithHexString:@"#8a7967"];
}

- (UIColor *)adobe7{
	return [UIColor colorWithHexString:@"#6a737b"];
}


- (UIColor *)aetna{
	return [UIColor colorWithHexString:@"#d20962"];
}

- (UIColor *)aetna2{
	return [UIColor colorWithHexString:@"#f47721"];
}

- (UIColor *)aetna3{
	return [UIColor colorWithHexString:@"#7ac143"];
}

- (UIColor *)aetna4{
	return [UIColor colorWithHexString:@"#00a78e"];
}

- (UIColor *)aetna5{
	return [UIColor colorWithHexString:@"#00bce4"];
}

- (UIColor *)aetna6{
	return [UIColor colorWithHexString:@"#7d3f98"];
}


- (UIColor *)aim{
	return [UIColor colorWithHexString:@"#ffd900"];
}


- (UIColor *)airbnb{
	return [UIColor colorWithHexString:@"#fd5c63"];
}


- (UIColor *)ajwright {
	return [UIColor colorWithRed:235.0f/255.0f green:131.0f/255.0f blue:22.0f/255.0f alpha:1.0f];
}


- (UIColor *)albertsons {
	return [UIColor colorWithRed:20.0f/255.0f green:29.0f/255.0f blue:106.0f/255.0f alpha:1.0f];
}

- (UIColor *)albertson {
	return [self albertsons];
}

- (UIColor *)albertsons2 {
	return [UIColor colorWithRed:0.0f green:161.0f/255.0f blue:213.0f/255.0f alpha:1.0f];
}

- (UIColor *)albertson2 {
	return [self albertsons2];
}


- (UIColor *)alcon{
	return [UIColor colorWithHexString:@"#0079c1"];
}

- (UIColor *)alcon2{
	return [UIColor colorWithHexString:@"#49176d"];
}

- (UIColor *)alcon3{
	return [UIColor colorWithHexString:@"#00a0af"];
}

- (UIColor *)alcon4{
	return [UIColor colorWithHexString:@"#49a942"];
}


- (UIColor *)alienware{
	return [UIColor colorWithHexString:@"#020202"];
}

- (UIColor *)alienware2{
	return [UIColor colorWithHexString:@"#2ad2c9"];
}

- (UIColor *)alienware3{
	return [UIColor colorWithHexString:@"#d0e100"];
}

- (UIColor *)alienware4{
	return [UIColor colorWithHexString:@"#00f0f0"];
}

- (UIColor *)alienware5{
	return [UIColor colorWithHexString:@"#00f000"];
}

- (UIColor *)alienware6{
	return [UIColor colorWithHexString:@"#f0e000"];
}

- (UIColor *)alienware7{
	return [UIColor colorWithHexString:@"#00a0f0"];
}

- (UIColor *)alienware8{
	return [UIColor colorWithHexString:@"#9000f0"];
}

- (UIColor *)alienware9{
	return [UIColor colorWithHexString:@"#f00000"];
}


- (UIColor *)amazon{
	return [UIColor colorWithHexString:@"#ff9900"];
}

- (UIColor *)amazon2{
	return [UIColor colorWithHexString:@"#146eb4"];
}


- (UIColor *)americanredcross{
	return [UIColor colorWithHexString:@"#ed1b2e"];
}

- (UIColor *)americanredcross2{
	return [UIColor colorWithHexString:@"#6d6e70"];
}

- (UIColor *)americanredcross3{
	return [UIColor colorWithHexString:@"#d7d7d8"];
}

- (UIColor *)americanredcross4{
	return [UIColor colorWithHexString:@"#b4a996"];
}

- (UIColor *)americanredcross5{
	return [UIColor colorWithHexString:@"#ecb731"];
}

- (UIColor *)americanredcross6{
	return [UIColor colorWithHexString:@"#8ec06c"];
}

- (UIColor *)americanredcross7{
	return [UIColor colorWithHexString:@"#537b35"];
}

- (UIColor *)americanredcross8{
	return [UIColor colorWithHexString:@"#c4dff6"];
}

- (UIColor *)americanredcross9{
	return [UIColor colorWithHexString:@"#56a0d3"];
}

- (UIColor *)americanredcross10{
	return [UIColor colorWithHexString:@"#0091cd"];
}

- (UIColor *)americanredcross11{
	return [UIColor colorWithHexString:@"#004b79"];
}

- (UIColor *)americanredcross12{
	return [UIColor colorWithHexString:@"#7f181b"];
}

- (UIColor *)americanredcross13{
	return [UIColor colorWithHexString:@"#d7d7d8"];
}

- (UIColor *)americanredcross14{
	return [UIColor colorWithHexString:@"#9f9fa3"];
}

- (UIColor *)americanredcross15{
	return [UIColor colorWithHexString:@"#000000"];
}

- (UIColor *)redcross {
	return [self americanredcross];
}


- (UIColor *)riteaid {
	return [UIColor colorWithRed:9.0f/255.0f green:17.0f/255.0f blue:144.0f/255.0f alpha:1.0f];
}

- (UIColor *)riteaid2 {
	return [UIColor colorWithRed:255.0f/255.0f green:1.0f/255.0f blue:3.0f/255.0f alpha:1.0f];
}


- (UIColor *)android{
	return [UIColor colorWithHexString:@"#a4c639"];
}


- (UIColor *)angieslist{
	return [UIColor colorWithHexString:@"#7fbb00"];
}


- (UIColor *)answers{
	return [UIColor colorWithHexString:@"#136ad5"];
}

- (UIColor *)answers2{
	return [UIColor colorWithHexString:@"#fb8a2e"];
}


- (UIColor *)aol{
	return [UIColor colorWithHexString:@"#ff0b00"];
}

- (UIColor *)aol2{
	return [UIColor colorWithHexString:@"#00c4ff"];
}


- (UIColor *)archlinux{
	return [UIColor colorWithHexString:@"#1793d1"];
}

- (UIColor *)archlinux2{
	return [UIColor colorWithHexString:@"#333333"];
}


- (UIColor *)asana{
	return [UIColor colorWithHexString:@"#1f8dd6"];
}

- (UIColor *)asana2{
	return [UIColor colorWithHexString:@"#34ad00"];
}


- (UIColor *)associatedpress{
	return [UIColor colorWithHexString:@"#ff322e"];
}


- (UIColor *)att{
	return [UIColor colorWithHexString:@"#ff7200"];
}

- (UIColor *)att2{
	return [UIColor colorWithHexString:@"#fcb314"];
}

- (UIColor *)att3{
	return [UIColor colorWithHexString:@"#067ab4"];
}

- (UIColor *)att4{
	return [UIColor colorWithHexString:@"#3aa5dc"];
}


- (UIColor *)atlantafalcons{
	return [UIColor colorWithHexString:@"#000000"];
}

- (UIColor *)atlantafalcons2{
	return [UIColor colorWithHexString:@"#a71930"];
}

- (UIColor *)atlantafalcons3{
	return [UIColor colorWithHexString:@"#a5acaf"];
}


- (UIColor *)atlanticcoastconferenceacc{
	return [UIColor colorWithHexString:@"#013ca6"];
}

- (UIColor *)atlanticcoastconferenceacc2{
	return [UIColor colorWithHexString:@"#a5a9ab"];
}


- (UIColor *)atlassian{
	return [UIColor colorWithHexString:@"#003366"];
}


- (UIColor *)auth0{
	return [UIColor colorWithHexString:@"#16214d"];
}

- (UIColor *)auth02{
	return [UIColor colorWithHexString:@"#44c7f4"];
}

- (UIColor *)auth03{
	return [UIColor colorWithHexString:@"#eb5424"];
}

- (UIColor *)auth04{
	return [UIColor colorWithHexString:@"#d0d2d3"];
}


- (UIColor *)autozone {
	return [UIColor colorWithRed:253.0f/255.0f green:2.0f/255.0f blue:27.0f/255.0f alpha:1.0f];
}

- (UIColor *)autozone2 {
	return [UIColor colorWithRed:255.0f/255.0f green:102.0f/255.0f blue:0.0f alpha:1.0f];
}


- (UIColor *)baidu{
	return [UIColor colorWithHexString:@"#de0f17"];
}

- (UIColor *)baidu2{
	return [UIColor colorWithHexString:@"#2529d8"];
}


- (UIColor *)bananarepublic {
	return [UIColor colorWithRed:119.0f/255.0f green:79.0f/255.0f blue:46.0f/255.0f alpha:1.0f];
}


- (UIColor *)bandcamp{
	return [UIColor colorWithHexString:@"#629aa9"];
}


- (UIColor *)barnesnoble{
	return [UIColor colorWithHexString:@"#2a5934"];
}


- (UIColor *)bebo{
	return [UIColor colorWithHexString:@"#e04646"];
}


- (UIColor *)bedbathandbeyond {
	return [UIColor colorWithRed:57.0f/255.0f green:75.0f/255.0f blue:157.0f/255.0f alpha:1.0f];
}

- (UIColor *)bedbathbeyond {
	return [self bedbathandbeyond];
}


- (UIColor *)behance{
	return [UIColor colorWithHexString:@"#1769ff"];
}


- (UIColor *)belk {
	return [UIColor colorWithRed:0.0f green:143.0f/255.0f blue:213.0f/255.0f alpha:1.0f];
}

- (UIColor *)belk2 {
	return [UIColor colorWithRed:36.0f/255.0f green:64.0f/255.0f blue:143.0f/255.0f alpha:1.0f];
}


- (UIColor *)bestbuy{
	return [UIColor colorWithHexString:@"#003b64"];
}

- (UIColor *)bestbuy2{
	return [UIColor colorWithHexString:@"#fff200"];
}


- (UIColor *)bigcartel{
	return [UIColor colorWithHexString:@"#a0ac48"];
}

- (UIColor *)bigcartel2{
	return [UIColor colorWithHexString:@"#70b29c"];
}


- (UIColor *)biglots {
	return [UIColor colorWithRed:255.0f/255.0f green:121.0f/255.0f blue:0.0f alpha:1.0f];
}


- (UIColor *)bing2{
	return [UIColor colorWithHexString:@"#ffb900"];
}

- (UIColor *)bing22{
	return [UIColor colorWithHexString:@"#505050"];
}

- (UIColor *)bing23{
	return [UIColor colorWithHexString:@"#a3a3a3"];
}


- (UIColor *)bitbucket{
	return [UIColor colorWithHexString:@"#205081"];
}


- (UIColor *)bitly{
	return [UIColor colorWithHexString:@"#ee6123"];
}

- (UIColor *)bitly2{
	return [UIColor colorWithHexString:@"#61b3de"];
}


- (UIColor *)blackberry{
	return [UIColor colorWithHexString:@"#005387"];
}

- (UIColor *)blackberry2{
	return [UIColor colorWithHexString:@"#8cb811"];
}

- (UIColor *)blackberry3{
	return [UIColor colorWithHexString:@"#fdb813"];
}

- (UIColor *)blackberry4{
	return [UIColor colorWithHexString:@"#88aca1"];
}

- (UIColor *)blackberry5{
	return [UIColor colorWithHexString:@"#000000"];
}

- (UIColor *)blackberry6{
	return [UIColor colorWithHexString:@"#788cb6"];
}

- (UIColor *)blackberry7{
	return [UIColor colorWithHexString:@"#a1a1a4"];
}

- (UIColor *)blackberry8{
	return [UIColor colorWithHexString:@"#8f8f8c"];
}


- (UIColor *)blogger{
	return [UIColor colorWithHexString:@"#f57d00"];
}


- (UIColor *)boeing{
	return [UIColor colorWithHexString:@"#0039a6"];
}


- (UIColor *)bookingcom{
	return [UIColor colorWithHexString:@"#003580"];
}


- (UIColor *)boyscoutsofamerica{
	return [UIColor colorWithHexString:@"#ce1126"];
}

- (UIColor *)boyscoutsofamerica2{
	return [UIColor colorWithHexString:@"#003f87"];
}


- (UIColor *)britishairways{
	return [UIColor colorWithHexString:@"#075aaa"];
}

- (UIColor *)britishairways2{
	return [UIColor colorWithHexString:@"#eb2226"];
}

- (UIColor *)britishairways3{
	return [UIColor colorWithHexString:@"#01295c"];
}

- (UIColor *)britishairways4{
	return [UIColor colorWithHexString:@"#efe9e5"];
}

- (UIColor *)britishairways5{
	return [UIColor colorWithHexString:@"#aca095"];
}

- (UIColor *)britishairways6{
	return [UIColor colorWithHexString:@"#b9cfed"];
}

- (UIColor *)britishairways7{
	return [UIColor colorWithHexString:@"#a7a9ac"];
}


- (UIColor *)bt{
	return [UIColor colorWithHexString:@"#d52685"];
}

- (UIColor *)bt2{
	return [UIColor colorWithHexString:@"#553a99"];
}

- (UIColor *)bt3{
	return [UIColor colorWithHexString:@"#6cbc35"];
}

- (UIColor *)bt4{
	return [UIColor colorWithHexString:@"#fd9f3e"];
}

- (UIColor *)bt5{
	return [UIColor colorWithHexString:@"#08538c"];
}


- (UIColor *)buffer{
	return [UIColor colorWithHexString:@"#168eea"];
}

- (UIColor *)buffer2{
	return [UIColor colorWithHexString:@"#ee4f4f"];
}

- (UIColor *)buffer3{
	return [UIColor colorWithHexString:@"#fff9ea"];
}

- (UIColor *)buffer4{
	return [UIColor colorWithHexString:@"#76b852"];
}

- (UIColor *)buffer5{
	return [UIColor colorWithHexString:@"#323b43"];
}

- (UIColor *)buffer6{
	return [UIColor colorWithHexString:@"#59626a"];
}

- (UIColor *)buffer7{
	return [UIColor colorWithHexString:@"#ced7df"];
}

- (UIColor *)buffer8{
	return [UIColor colorWithHexString:@"#eff3f6"];
}

- (UIColor *)buffer9{
	return [UIColor colorWithHexString:@"#f4f7f9"];
}


- (UIColor *)burgerking{
	return [UIColor colorWithHexString:@"#ec1c24"];
}

- (UIColor *)burgerking2{
	return [UIColor colorWithHexString:@"#fdbd10"];
}

- (UIColor *)burgerking3{
	return [UIColor colorWithHexString:@"#0066b2"];
}

- (UIColor *)burgerking4{
	return [UIColor colorWithHexString:@"#ed7902"];
}


- (UIColor *)burlington {
	return [self burlingtoncoatfactory];
}

- (UIColor *)burlingtoncoatfactory {
	return [UIColor colorWithRed:171.0f/255.0f green:29.0f/255.0f blue:56.0f/255.0f alpha:1.0f];
}


- (UIColor *)bynder{
	return [UIColor colorWithHexString:@"#1ca0de"];
}

- (UIColor *)bynder2{
	return [UIColor colorWithHexString:@"#343a4e"];
}


- (UIColor *)canon{
	return [UIColor colorWithHexString:@"#bc0024"];
}

- (UIColor *)canon2{
	return [UIColor colorWithHexString:@"#000000"];
}


- (UIColor *)carbonmade{
	return [UIColor colorWithHexString:@"#613854"];
}


- (UIColor *)carrefour{
	return [UIColor colorWithHexString:@"#00387b"];
}

- (UIColor *)carrefour2{
	return [UIColor colorWithHexString:@"#bb1e10"];
}

- (UIColor *)carrefour3{
	return [UIColor colorWithHexString:@"#f67828"];
}

- (UIColor *)carrefour4{
	return [UIColor colorWithHexString:@"#237f52"];
}


- (UIColor *)casemate{
	return [UIColor colorWithHexString:@"#84754e"];
}

- (UIColor *)casemate2{
	return [UIColor colorWithHexString:@"#a6192e"];
}

- (UIColor *)casemate3{
	return [UIColor colorWithHexString:@"#decba5"];
}

- (UIColor *)casemate4{
	return [UIColor colorWithHexString:@"#000000"];
}


- (UIColor *)charitywater{
	return [UIColor colorWithHexString:@"#ffc907"];
}

- (UIColor *)charitywater2{
	return [UIColor colorWithHexString:@"#2e9df7"];
}

- (UIColor *)charitywater3{
	return [UIColor colorWithHexString:@"#231f20"];
}


- (UIColor *)cheddar{
	return [UIColor colorWithHexString:@"#ff7243"];
}


- (UIColor *)cocacola{
	return [UIColor colorWithHexString:@"#ed1c16"];
}


- (UIColor *)codeschool{
	return [UIColor colorWithHexString:@"#616f67"];
}

- (UIColor *)codeschool2{
	return [UIColor colorWithHexString:@"#c68143"];
}


- (UIColor *)codecademy{
	return [UIColor colorWithHexString:@"#f65a5b"];
}

- (UIColor *)codecademy2{
	return [UIColor colorWithHexString:@"#204056"];
}

- (UIColor *)costco {
	return [UIColor colorWithRed:227.0f/255.0f green:24.0f/255.0f blue:55.0f/255.0f alpha:1.0f];
}

- (UIColor *)costco2 {
	return [UIColor colorWithRed:0.0f green:93.0f/255.0f blue:170.0f/255.0f alpha:1.0f];
}

- (UIColor *)craftcms{
	return [UIColor colorWithHexString:@"#da5a47"];
}


- (UIColor *)creativemarket{
	return [UIColor colorWithHexString:@"#8ba753"];
}


- (UIColor *)crunchbase{
	return [UIColor colorWithHexString:@"#2292a7"];
}


- (UIColor *)cunard{
	return [UIColor colorWithHexString:@"#1d1d1b"];
}

- (UIColor *)cunard2{
	return [UIColor colorWithHexString:@"#ae9a64"];
}

- (UIColor *)cunard3{
	return [UIColor colorWithHexString:@"#e42313"];
}

- (UIColor *)cunard4{
	return [UIColor colorWithHexString:@"#8b8c8d"];
}


- (UIColor *)cvs {
	return [UIColor colorWithRed:222.0f/255.0f green:0.0f blue:0.0f alpha:1.0f];
}


- (UIColor *)daimler{
	return [UIColor colorWithHexString:@"#263f6a"];
}

- (UIColor *)daimler2{
	return [UIColor colorWithHexString:@"#182b45"];
}

- (UIColor *)daimler3{
	return [UIColor colorWithHexString:@"#6b0f24"];
}

- (UIColor *)daimler4{
	return [UIColor colorWithHexString:@"#193725"];
}

- (UIColor *)daimler5{
	return [UIColor colorWithHexString:@"#606061"];
}


- (UIColor *)delectable{
	return [UIColor colorWithHexString:@"#334858"];
}

- (UIColor *)delectable2{
	return [UIColor colorWithHexString:@"#cd595a"];
}

- (UIColor *)delectable3{
	return [UIColor colorWithHexString:@"#94938f"];
}

- (UIColor *)delectable4{
	return [UIColor colorWithHexString:@"#a3a7a6"];
}

- (UIColor *)delectable5{
	return [UIColor colorWithHexString:@"#dbc5b0"];
}

- (UIColor *)delectable6{
	return [UIColor colorWithHexString:@"#f8dfc2"];
}

- (UIColor *)delectable7{
	return [UIColor colorWithHexString:@"#f9ebdf"];
}


- (UIColor *)delicious{
	return [UIColor colorWithHexString:@"#3399ff"];
}

- (UIColor *)delicious2{
	return [UIColor colorWithHexString:@"#222222"];
}

- (UIColor *)delicious3{
	return [UIColor colorWithHexString:@"#eeeeee"];
}


- (UIColor *)dell{
	return [UIColor colorWithHexString:@"#0085c3"];
}

- (UIColor *)dell2{
	return [UIColor colorWithHexString:@"#7ab800"];
}

- (UIColor *)dell3{
	return [UIColor colorWithHexString:@"#f2af00"];
}

- (UIColor *)dell4{
	return [UIColor colorWithHexString:@"#dc5034"];
}

- (UIColor *)dell5{
	return [UIColor colorWithHexString:@"#ce1126"];
}

- (UIColor *)dell6{
	return [UIColor colorWithHexString:@"#b7295a"];
}

- (UIColor *)dell7{
	return [UIColor colorWithHexString:@"#6e2585"];
}

- (UIColor *)dell8{
	return [UIColor colorWithHexString:@"#71c6c1"];
}

- (UIColor *)dell9{
	return [UIColor colorWithHexString:@"#5482ab"];
}

- (UIColor *)dell10{
	return [UIColor colorWithHexString:@"#009bbb"];
}

- (UIColor *)dell11{
	return [UIColor colorWithHexString:@"#444444"];
}

- (UIColor *)dell12{
	return [UIColor colorWithHexString:@"#eeeeee"];
}


- (UIColor *)dentalplans{
	return [UIColor colorWithHexString:@"#f99104"];
}

- (UIColor *)dentalplans2{
	return [UIColor colorWithHexString:@"#00b7c9"];
}


- (UIColor *)designernews{
	return [UIColor colorWithHexString:@"#2d72d9"];
}


- (UIColor *)designmoo{
	return [UIColor colorWithHexString:@"#e64b50"];
}

- (UIColor *)designmoo2{
	return [UIColor colorWithHexString:@"#dbc65d"];
}


- (UIColor *)deviantart{
	return [UIColor colorWithHexString:@"#05cc47"];
}

- (UIColor *)deviantart2{
	return [UIColor colorWithHexString:@"#4dc47d"];
}

- (UIColor *)deviantart3{
	return [UIColor colorWithHexString:@"#181a1b"];
}


- (UIColor *)devour{
	return [UIColor colorWithHexString:@"#ff0000"];
}


- (UIColor *)dewalt{
	return [UIColor colorWithHexString:@"#febd17"];
}


- (UIColor *)dhl{
	return [UIColor colorWithHexString:@"#ba0c2f"];
}

- (UIColor *)dhl2{
	return [UIColor colorWithHexString:@"#ffcd00"];
}

- (UIColor *)dhl3{
	return [UIColor colorWithHexString:@"#c9c9c9"];
}


- (UIColor *)digg{
	return [UIColor colorWithHexString:@"#000000"];
}


- (UIColor *)directv{
	return [UIColor colorWithHexString:@"#00a6d6"];
}

- (UIColor *)directv2{
	return [UIColor colorWithHexString:@"#00629b"];
}

- (UIColor *)directv3{
	return [UIColor colorWithHexString:@"#003865"];
}


- (UIColor *)disqus{
	return [UIColor colorWithHexString:@"#2e9fff"];
}


- (UIColor *)django{
	return [UIColor colorWithHexString:@"#092e20"];
}


- (UIColor *)dollartree {
	return [UIColor colorWithHexString:@"41aa51"];
}

- (UIColor *)dollarstore {
	return [self dollartree];
}


- (UIColor *)dollargeneral {
	return [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:1.0f/255.0f alpha:1.0f];
}


- (UIColor *)dominos{
	return [UIColor colorWithHexString:@"#0b648f"];
}

- (UIColor *)dominos2{
	return [UIColor colorWithHexString:@"#e21737"];
}


- (UIColor *)dow{
	return [UIColor colorWithHexString:@"#e80033"];
}

- (UIColor *)dow2{
	return [UIColor colorWithHexString:@"#fdbb30"];
}

- (UIColor *)dow3{
	return [UIColor colorWithHexString:@"#ed8b00"];
}

- (UIColor *)dow4{
	return [UIColor colorWithHexString:@"#f15d22"];
}

- (UIColor *)dow5{
	return [UIColor colorWithHexString:@"#bf0d3e"];
}

- (UIColor *)dow6{
	return [UIColor colorWithHexString:@"#910048"];
}

- (UIColor *)dow7{
	return [UIColor colorWithHexString:@"#d0006f"];
}


- (UIColor *)dribbble{
	return [UIColor colorWithHexString:@"#444444"];
}

- (UIColor *)dribbble2{
	return [UIColor colorWithHexString:@"#ea4c89"];
}

- (UIColor *)dribbble3{
	return [UIColor colorWithHexString:@"#8aba56"];
}

- (UIColor *)dribbble4{
	return [UIColor colorWithHexString:@"#ff8833"];
}

- (UIColor *)dribbble5{
	return [UIColor colorWithHexString:@"#00b6e3"];
}

- (UIColor *)dribbble6{
	return [UIColor colorWithHexString:@"#9ba5a8"];
}


- (UIColor *)dropbox{
	return [UIColor colorWithHexString:@"#007ee5"];
}

- (UIColor *)dropbox2{
	return [UIColor colorWithHexString:@"#7b8994"];
}

- (UIColor *)dropbox3{
	return [UIColor colorWithHexString:@"#47525d"];
}

- (UIColor *)dropbox4{
	return [UIColor colorWithHexString:@"#3d464d"];
}


- (UIColor *)droplr{
	return [UIColor colorWithHexString:@"#5654a4"];
}


- (UIColor *)drupal{
	return [UIColor colorWithHexString:@"#0077c0"];
}

- (UIColor *)drupal2{
	return [UIColor colorWithHexString:@"#81ceff"];
}

- (UIColor *)drupal3{
	return [UIColor colorWithHexString:@"#00598e"];
}


- (UIColor *)dunked{
	return [UIColor colorWithHexString:@"#2da9d7"];
}

- (UIColor *)dunked2{
	return [UIColor colorWithHexString:@"#212a3e"];
}


- (UIColor *)etrade{
	return [UIColor colorWithHexString:@"#6633cc"];
}

- (UIColor *)etrade2{
	return [UIColor colorWithHexString:@"#99cc00"];
}


- (UIColor *)easyjet{
	return [UIColor colorWithHexString:@"#ff6600"];
}

- (UIColor *)easyjet2{
	return [UIColor colorWithHexString:@"#000000"];
}

- (UIColor *)easyjet3{
	return [UIColor colorWithHexString:@"#58595b"];
}


- (UIColor *)ebay{
	return [UIColor colorWithHexString:@"#e53238"];
}

- (UIColor *)ebay2{
	return [UIColor colorWithHexString:@"#0064d2"];
}

- (UIColor *)ebay3{
	return [UIColor colorWithHexString:@"#f5af02"];
}

- (UIColor *)ebay4{
	return [UIColor colorWithHexString:@"#86b817"];
}


- (UIColor *)elance{
	return [UIColor colorWithHexString:@"#0d69af"];
}


- (UIColor *)ello{
	return [UIColor colorWithHexString:@"#000000"];
}


- (UIColor *)ember{
	return [UIColor colorWithHexString:@"#f23819"];
}


- (UIColor *)engadget{
	return [UIColor colorWithHexString:@"#40b3ff"];
}


- (UIColor *)envato{
	return [UIColor colorWithHexString:@"#82b541"];
}


- (UIColor *)ericsson{
	return [UIColor colorWithHexString:@"#002561"];
}


- (UIColor *)esl{
	return [UIColor colorWithHexString:@"#0d9ddb"];
}

- (UIColor *)esl2{
	return [UIColor colorWithHexString:@"#48b8e7"];
}

- (UIColor *)esl3{
	return [UIColor colorWithHexString:@"#efecea"];
}

- (UIColor *)esl4{
	return [UIColor colorWithHexString:@"#2c2b2b"];
}


- (UIColor *)espn{
	return [UIColor colorWithHexString:@"#ff0033"];
}


- (UIColor *)etsy{
	return [UIColor colorWithHexString:@"#d5641c"];
}


- (UIColor *)evernote{
	return [UIColor colorWithHexString:@"#7ac142"];
}

- (UIColor *)evernote2{
	return [UIColor colorWithHexString:@"#808084"];
}


- (UIColor *)fabcom{
	return [UIColor colorWithHexString:@"#dd0017"];
}

- (UIColor *)fabcom2{
	return [UIColor colorWithHexString:@"#000000"];
}


- (UIColor *)facebook{
	return [UIColor colorWithHexString:@"#3b5998"];
}


- (UIColor *)familydollar {
	return [UIColor colorWithRed:253.0f/255.0f green:72.0f/255.0f blue:55.0f/255.0f alpha:1.0f];
}

- (UIColor *)familydollar2 {
	return [UIColor colorWithRed:255.0f/255.0f green:173.0f/255.0f blue:63.0f/255.0f alpha:1.0f];
}


- (UIColor *)famous{
	return [UIColor colorWithHexString:@"#fa5c4f"];
}

- (UIColor *)famous2{
	return [UIColor colorWithHexString:@"#333333"];
}


- (UIColor *)fancy{
	return [UIColor colorWithHexString:@"#3098dc"];
}

- (UIColor *)fancy2{
	return [UIColor colorWithHexString:@"#494e58"];
}


- (UIColor *)fedex{
	return [UIColor colorWithHexString:@"#660099"];
}

- (UIColor *)fedex2{
	return [UIColor colorWithHexString:@"#ff6600"];
}

- (UIColor *)fedex3{
	return [UIColor colorWithHexString:@"#00cc00"];
}

- (UIColor *)fedex4{
	return [UIColor colorWithHexString:@"#0099cc"];
}

- (UIColor *)fedex5{
	return [UIColor colorWithHexString:@"#ff0033"];
}

- (UIColor *)fedex6{
	return [UIColor colorWithHexString:@"#ffcc00"];
}

- (UIColor *)fedex7{
	return [UIColor colorWithHexString:@"#999999"];
}


- (UIColor *)fiat{
	return [UIColor colorWithHexString:@"#96172e"];
}

- (UIColor *)fiat2{
	return [UIColor colorWithHexString:@"#6d2d41"];
}


- (UIColor *)firefox{
	return [UIColor colorWithHexString:@"#e66000"];
}

- (UIColor *)firefox2{
	return [UIColor colorWithHexString:@"#ff9500"];
}

- (UIColor *)firefox3{
	return [UIColor colorWithHexString:@"#ffcb00"];
}

- (UIColor *)firefox4{
	return [UIColor colorWithHexString:@"#00539f"];
}

- (UIColor *)firefox5{
	return [UIColor colorWithHexString:@"#0095dd"];
}

- (UIColor *)firefox6{
	return [UIColor colorWithHexString:@"#331e54"];
}

- (UIColor *)firefox7{
	return [UIColor colorWithHexString:@"#002147"];
}


- (UIColor *)fitbit{
	return [UIColor colorWithHexString:@"#4cc2c4"];
}

- (UIColor *)fitbit2{
	return [UIColor colorWithHexString:@"#f54785"];
}

- (UIColor *)fitbit3{
	return [UIColor colorWithHexString:@"#343434"];
}


- (UIColor *)fiveguys{
	return [UIColor colorWithHexString:@"#ed174f"];
}

- (UIColor *)fiveguys2{
	return [UIColor colorWithHexString:@"#fbb040"];
}

- (UIColor *)fiveguys3{
	return [UIColor colorWithHexString:@"#efc402"];
}

- (UIColor *)fiveguys4{
	return [UIColor colorWithHexString:@"#d4891c"];
}


- (UIColor *)flattr{
	return [UIColor colorWithHexString:@"#f67c1a"];
}

- (UIColor *)flattr2{
	return [UIColor colorWithHexString:@"#338d11"];
}


- (UIColor *)flavorsme{
	return [UIColor colorWithHexString:@"#f10087"];
}

- (UIColor *)flavorsme2{
	return [UIColor colorWithHexString:@"#009ae7"];
}


- (UIColor *)flickr{
	return [UIColor colorWithHexString:@"#0063dc"];
}

- (UIColor *)flickr2{
	return [UIColor colorWithHexString:@"#ff0084"];
}


- (UIColor *)flipboard{
	return [UIColor colorWithHexString:@"#e12828"];
}


- (UIColor *)flixster{
	return [UIColor colorWithHexString:@"#2971b2"];
}


- (UIColor *)follr{
	return [UIColor colorWithHexString:@"#4dc9f6"];
}

- (UIColor *)follr2{
	return [UIColor colorWithHexString:@"#f67019"];
}

- (UIColor *)follr3{
	return [UIColor colorWithHexString:@"#f53794"];
}

- (UIColor *)follr4{
	return [UIColor colorWithHexString:@"#537bc4"];
}

- (UIColor *)follr5{
	return [UIColor colorWithHexString:@"#acc236"];
}


- (UIColor *)footlocker {
	return [UIColor colorWithRed:204.0f/255.0f green:37.0f/255.0f blue:39.0f/255.0f alpha:1.0f];
}


- (UIColor *)forever21 {
	return [UIColor colorWithRed:255.0f/255.0f green:233.0f/255.0f blue:26.0f/255.0f alpha:1.0f];
}


- (UIColor *)forrst{
	return [UIColor colorWithHexString:@"#5b9a68"];
}


- (UIColor *)foursquare{
	return [UIColor colorWithHexString:@"#f94877"];
}

- (UIColor *)foursquare2{
	return [UIColor colorWithHexString:@"#0732a2"];
}

- (UIColor *)foursquare3{
	return [UIColor colorWithHexString:@"#2d5be3"];
}


- (UIColor *)gap {
	return [UIColor colorWithRed:0.0f green:42.0f/255.0f blue:95.0f/255.0f alpha:1.0f];
}




- (UIColor *)garmin{
	return [UIColor colorWithHexString:@"#007cc3"];
}


- (UIColor *)geocaching{
	return [UIColor colorWithHexString:@"#4a742c"];
}


- (UIColor *)ghost{
	return [UIColor colorWithHexString:@"#212425"];
}

- (UIColor *)ghost2{
	return [UIColor colorWithHexString:@"#718087"];
}

- (UIColor *)ghost3{
	return [UIColor colorWithHexString:@"#5ba4e5"];
}

- (UIColor *)ghost4{
	return [UIColor colorWithHexString:@"#9fbb58"];
}

- (UIColor *)ghost5{
	return [UIColor colorWithHexString:@"#e9e8dd"];
}


- (UIColor *)gibson{
	return [UIColor colorWithHexString:@"#000000"];
}

- (UIColor *)gibson2{
	return [UIColor colorWithHexString:@"#436f8e"];
}

- (UIColor *)gibson3{
	return [UIColor colorWithHexString:@"#887d59"];
}

- (UIColor *)gibson4{
	return [UIColor colorWithHexString:@"#8f9696"];
}


- (UIColor *)gimmebar{
	return [UIColor colorWithHexString:@"#d6156c"];
}


- (UIColor *)github{
	return [UIColor colorWithHexString:@"#4183c4"];
}

- (UIColor *)github2{
	return [UIColor colorWithHexString:@"#999999"];
}

- (UIColor *)github3{
	return [UIColor colorWithHexString:@"#666666"];
}

- (UIColor *)github4{
	return [UIColor colorWithHexString:@"#333333"];
}

- (UIColor *)github5{
	return [UIColor colorWithHexString:@"#6cc644"];
}

- (UIColor *)github6{
	return [UIColor colorWithHexString:@"#bd2c00"];
}

- (UIColor *)github7{
	return [UIColor colorWithHexString:@"#ff9933"];
}


- (UIColor *)gittip{
	return [UIColor colorWithHexString:@"#663300"];
}

- (UIColor *)gittip2{
	return [UIColor colorWithHexString:@"#339966"];
}


- (UIColor *)godaddy{
	return [UIColor colorWithHexString:@"#7db701"];
}

- (UIColor *)godaddy2{
	return [UIColor colorWithHexString:@"#ff8a00"];
}


- (UIColor *)goodreads{
	return [UIColor colorWithHexString:@"#553b08"];
}


- (UIColor *)google{
	return [UIColor colorWithHexString:@"#4285f4"];
}

- (UIColor *)google2{
	return [UIColor colorWithHexString:@"#db4437"];
}

- (UIColor *)google3{
	return [UIColor colorWithHexString:@"#f4b400"];
}

- (UIColor *)google4{
	return [UIColor colorWithHexString:@"#0f9d58"];
}

- (UIColor *)google5{
	return [UIColor colorWithHexString:@"#e7e6dd"];
}


- (UIColor *)googleplus{
	return [UIColor colorWithHexString:@"#dd4b39"];
}


- (UIColor *)guitarcenter {
	return [UIColor colorWithRed:245.0f/255.0f green:33.0f/255.0f blue:50.0f/255.0f alpha:1.0f];
}


- (UIColor *)gravatar{
	return [UIColor colorWithHexString:@"#1e8cbe"];
}


- (UIColor *)grocery{
	return [UIColor forestGreenTraditional];
}

- (UIColor *)groceries {
	return [self grocery];
}

- (UIColor *)grocerystore {
	return [self grocery];
}

- (UIColor *)store {
	return [self grocery];
}


- (UIColor *)groupon{
	return [UIColor colorWithHexString:@"#82b548"];
}


- (UIColor *)hackernews{
	return [UIColor colorWithHexString:@"#ff6600"];
}


- (UIColor *)handm {
	return [UIColor colorWithRed:254.0f/255.0f green:0.0f blue:2.0f/255.0f alpha:1.0f];
}


- (UIColor *)heineken{
	return [UIColor colorWithHexString:@"#00a100"];
}

- (UIColor *)heineken2{
	return [UIColor colorWithHexString:@"#ff2b00"];
}

- (UIColor *)heineken3{
	return [UIColor colorWithHexString:@"#999999"];
}


- (UIColor *)hellowallet{
	return [UIColor colorWithHexString:@"#0093d0"];
}


- (UIColor *)heroku{
	return [UIColor colorWithHexString:@"#c9c3e6"];
}

- (UIColor *)heroku2{
	return [UIColor colorWithHexString:@"#6762a6"];
}


- (UIColor *)hi5{
	return [UIColor colorWithHexString:@"#fd9827"];
}


- (UIColor *)hobbylobby {
	return [UIColor colorWithRed:222.0f/255.0f green:104.0f/255.0f blue:32.0f/255.0f alpha:1.0f];
}


- (UIColor *)homedepot{
	return [UIColor colorWithHexString:@"#f96305"];
}


- (UIColor *)homegoods {
	return [UIColor colorWithRed:211.0f/255.0f green:18.0f/255.0f blue:65.0f/255.0f alpha:1.0f];
}


- (UIColor *)hootsuite{
	return [UIColor colorWithHexString:@"#003265"];
}

- (UIColor *)hootsuite2{
	return [UIColor colorWithHexString:@"#f7e8d5"];
}

- (UIColor *)hootsuite3{
	return [UIColor colorWithHexString:@"#ffbd0a"];
}

- (UIColor *)hootsuite4{
	return [UIColor colorWithHexString:@"#c6af92"];
}

- (UIColor *)hootsuite5{
	return [UIColor colorWithHexString:@"#71685f"];
}

- (UIColor *)hootsuite6{
	return [UIColor colorWithHexString:@"#54493f"];
}

- (UIColor *)hootsuite7{
	return [UIColor colorWithHexString:@"#38322d"];
}


- (UIColor *)houzz{
	return [UIColor colorWithHexString:@"#7ac142"];
}

- (UIColor *)houzz2{
	return [UIColor colorWithHexString:@"#000000"];
}


- (UIColor *)hp{
	return [UIColor colorWithHexString:@"#0096d6"];
}

- (UIColor *)hp2{
	return [UIColor colorWithHexString:@"#d7410b"];
}


- (UIColor *)hsbc{
	return [UIColor colorWithHexString:@"#db0011"];
}


- (UIColor *)html5{
	return [UIColor colorWithHexString:@"#e34f26"];
}


- (UIColor *)hulu{
	return [UIColor colorWithHexString:@"#a5cd39"];
}

- (UIColor *)hulu2{
	return [UIColor colorWithHexString:@"#6bb03e"];
}


- (UIColor *)ibm{
	return [UIColor colorWithHexString:@"#006699"];
}


- (UIColor *)identica{
	return [UIColor colorWithHexString:@"#789240"];
}

- (UIColor *)identica2{
	return [UIColor colorWithHexString:@"#7d0100"];
}

- (UIColor *)identica3{
	return [UIColor colorWithHexString:@"#8baaff"];
}


- (UIColor *)ifttt{
	return [UIColor colorWithHexString:@"#33ccff"];
}

- (UIColor *)ifttt2{
	return [UIColor colorWithHexString:@"#ff4400"];
}

- (UIColor *)ifttt3{
	return [UIColor colorWithHexString:@"#000000"];
}


- (UIColor *)iheartradio{
	return [UIColor colorWithHexString:@"#c6002b"];
}


- (UIColor *)ikea{
	return [UIColor colorWithHexString:@"#ffcc00"];
}

- (UIColor *)ikea2{
	return [UIColor colorWithHexString:@"#003399"];
}


- (UIColor *)imdb{
	return [UIColor colorWithHexString:@"#f5de50"];
}


- (UIColor *)imgur{
	return [UIColor colorWithHexString:@"#85bf25"];
}


- (UIColor *)indiegogo{
	return [UIColor colorWithHexString:@"#eb1478"];
}


- (UIColor *)instacart{
	return [UIColor colorWithHexString:@"#60ab59"];
}


- (UIColor *)instagram{
	return [UIColor colorWithHexString:@"#3f729b"];
}


- (UIColor *)instapaper{
	return [UIColor colorWithHexString:@"#000000"];
}

- (UIColor *)instapaper2{
	return [UIColor colorWithHexString:@"#428bca"];
}


- (UIColor *)intel{
	return [UIColor colorWithHexString:@"#0f7dc2"];
}


- (UIColor *)intuit{
	return [UIColor colorWithHexString:@"#365ebf"];
}


- (UIColor *)ios{
	return [UIColor colorWithHexString:@"#5fc9f8"];
}

- (UIColor *)ios2{
	return [UIColor colorWithHexString:@"#fecb2e"];
}

- (UIColor *)ios3{
	return [UIColor colorWithHexString:@"#fd9426"];
}

- (UIColor *)ios4{
	return [UIColor colorWithHexString:@"#fc3158"];
}

- (UIColor *)ios5{
	return [UIColor colorWithHexString:@"#147efb"];
}

- (UIColor *)ios6{
	return [UIColor colorWithHexString:@"#53d769"];
}

- (UIColor *)ios7{
	return [UIColor colorWithHexString:@"#fc3d39"];
}

- (UIColor *)ios8{
	return [UIColor colorWithHexString:@"#8e8e93"];
}


- (UIColor *)jawbone{
	return [UIColor colorWithHexString:@"#000000"];
}


- (UIColor *)jcpenney {
	return [UIColor colorWithRed:237.0f/255.0f green:29.0f/255.0f blue:37.0f/255.0f alpha:1.0f];
}

- (UIColor *)jcpenny {
	return [self jcpenney];
}

- (UIColor *)jcpenneys {
	return [UIColor colorWithRed:46.0f/255.0f green:48.0f/255.0f blue:148.0f/255.0f alpha:1.0f];
}


- (UIColor *)joann {
	return [UIColor colorWithRed:11.0f/255.0f green:59.0f/255.0f blue:49.0f/255.0f alpha:1.0f];
}

- (UIColor *)joannfabric {
	return [self joann];
}

- (UIColor *)joannfabrics {
	return [self joann];
}


- (UIColor *)joyent{
	return [UIColor colorWithHexString:@"#ff6600"];
}


- (UIColor *)keeeb{
	return [UIColor colorWithHexString:@"#00a9c0"];
}

- (UIColor *)kohls {
	return [UIColor colorWithRed:135.0f/255.0f green:35.0f/255.0f blue:61.0f/255.0f alpha:1.0f];
}


- (UIColor *)khanacademy{
	return [UIColor colorWithHexString:@"#9cb443"];
}

- (UIColor *)khanacademy2{
	return [UIColor colorWithHexString:@"#242f3a"];
}


- (UIColor *)kia{
	return [UIColor colorWithHexString:@"#c21a30"];
}


- (UIColor *)kickstarter{
	return [UIColor colorWithHexString:@"#2bde73"];
}

- (UIColor *)kickstarter2{
	return [UIColor colorWithHexString:@"#0f2105"];
}


- (UIColor *)kippt{
	return [UIColor colorWithHexString:@"#d51007"];
}


- (UIColor *)kitkat{
	return [UIColor colorWithHexString:@"#d70021"];
}


- (UIColor *)kiwipay{
	return [UIColor colorWithHexString:@"#00b0df"];
}


- (UIColor *)laravel{
	return [UIColor colorWithHexString:@"#f55247"];
}


- (UIColor *)lastfm{
	return [UIColor colorWithHexString:@"#d51007"];
}


- (UIColor *)linkedin{
	return [UIColor colorWithHexString:@"#0077b5"];
}

- (UIColor *)linkedin2{
	return [UIColor colorWithHexString:@"#000000"];
}

- (UIColor *)linkedin3{
	return [UIColor colorWithHexString:@"#313335"];
}

- (UIColor *)linkedin4{
	return [UIColor colorWithHexString:@"#86888a"];
}

- (UIColor *)linkedin5{
	return [UIColor colorWithHexString:@"#caccce"];
}

- (UIColor *)linkedin6{
	return [UIColor colorWithHexString:@"#00a0dc"];
}

- (UIColor *)linkedin7{
	return [UIColor colorWithHexString:@"#8d6cab"];
}

- (UIColor *)linkedin8{
	return [UIColor colorWithHexString:@"#dd5143"];
}

- (UIColor *)linkedin9{
	return [UIColor colorWithHexString:@"#e68523"];
}


- (UIColor *)livestream{
	return [UIColor colorWithHexString:@"#cf202e"];
}

- (UIColor *)livestream2{
	return [UIColor colorWithHexString:@"#232121"];
}

- (UIColor *)livestream3{
	return [UIColor colorWithHexString:@"#f78822"];
}

- (UIColor *)livestream4{
	return [UIColor colorWithHexString:@"#f6db35"];
}

- (UIColor *)livestream5{
	return [UIColor colorWithHexString:@"#6dc067"];
}

- (UIColor *)livestream6{
	return [UIColor colorWithHexString:@"#4185be"];
}

- (UIColor *)livestream7{
	return [UIColor colorWithHexString:@"#8f499c"];
}


- (UIColor *)lloyds{
	return [UIColor colorWithHexString:@"#d81f2a"];
}

- (UIColor *)lloyds2{
	return [UIColor colorWithHexString:@"#ff9900"];
}

- (UIColor *)lloyds3{
	return [UIColor colorWithHexString:@"#e0d86e"];
}

- (UIColor *)lloyds4{
	return [UIColor colorWithHexString:@"#9ea900"];
}

- (UIColor *)lloyds5{
	return [UIColor colorWithHexString:@"#6ec9e0"];
}

- (UIColor *)lloyds6{
	return [UIColor colorWithHexString:@"#007ea3"];
}

- (UIColor *)lloyds7{
	return [UIColor colorWithHexString:@"#9e4770"];
}

- (UIColor *)lloyds8{
	return [UIColor colorWithHexString:@"#631d76"];
}

- (UIColor *)lloyds9{
	return [UIColor colorWithHexString:@"#1e1e1e"];
}


- (UIColor *)lomo{
	return [UIColor colorWithHexString:@"#eb0028"];
}

- (UIColor *)lomo2{
	return [UIColor colorWithHexString:@"#00a0df"];
}


- (UIColor *)lowes {
	return [UIColor colorWithRed:0.0f green:72.0f/255.0f blue:144.0f/255.0f alpha:1.0f];
}


- (UIColor *)lumo{
	return [UIColor colorWithHexString:@"#576396"];
}


- (UIColor *)lyft{
	return [UIColor colorWithHexString:@"#d71472"];
}

- (UIColor *)lyft2{
	return [UIColor colorWithHexString:@"#333e48"];
}

- (UIColor *)lyft3{
	return [UIColor colorWithHexString:@"#c2bcb5"];
}

- (UIColor *)lyft4{
	return [UIColor colorWithHexString:@"#fcdcf0"];
}

- (UIColor *)lyft5{
	return [UIColor colorWithHexString:@"#85a6c7"];
}

- (UIColor *)lyft6{
	return [UIColor colorWithHexString:@"#00b2a9"];
}

- (UIColor *)lyft7{
	return [UIColor colorWithHexString:@"#9bd9d9"];
}


- (UIColor *)macys {
	return [UIColor colorWithRed:232.0f/255.0f green:1.0f/255.0f blue:1.0f/255.0f alpha:1.0f];
}


- (UIColor *)mailchimp{
	return [UIColor colorWithHexString:@"#2c9ab7"];
}

- (UIColor *)mailchimp2{
	return [UIColor colorWithHexString:@"#449a88"];
}

- (UIColor *)mailchimp3{
	return [UIColor colorWithHexString:@"#febe12"];
}

- (UIColor *)mailchimp4{
	return [UIColor colorWithHexString:@"#db3a1b"];
}

- (UIColor *)mailchimp5{
	return [UIColor colorWithHexString:@"#373737"];
}


- (UIColor *)marketbasket {
	return [UIColor colorWithRed:204.0f/255.0f green:0.0f blue:27.0f/255.0f alpha:1.0f];
}

- (UIColor *)marketbasket2 {
	return [UIColor colorWithRed:4.0f/255.0f green:115.0f/255.0f blue:204.0f/255.0f alpha:1.0f];
}


- (UIColor *)marshalls {
	return [UIColor colorWithRed:0.0f green:48.0f/255.0f blue:153.0f/255.0f alpha:1.0f];
}


- (UIColor *)massygroup{
	return [UIColor colorWithHexString:@"#004a77"];
}

- (UIColor *)massygroup2{
	return [UIColor colorWithHexString:@"#00adee"];
}

- (UIColor *)massygroup3{
	return [UIColor colorWithHexString:@"#ff8100"];
}

- (UIColor *)massygroup4{
	return [UIColor colorWithHexString:@"#ffd200"];
}


- (UIColor *)mastercard{
	return [UIColor colorWithHexString:@"#cc0000"];
}

- (UIColor *)mastercard2{
	return [UIColor colorWithHexString:@"#ff9900"];
}

- (UIColor *)mastercard3{
	return [UIColor colorWithHexString:@"#000066"];
}


- (UIColor *)meetup{
	return [UIColor colorWithHexString:@"#e0393e"];
}


- (UIColor *)microsoft{
	return [UIColor colorWithHexString:@"#f65314"];
}

- (UIColor *)microsoft2{
	return [UIColor colorWithHexString:@"#7cbb00"];
}

- (UIColor *)microsoft3{
	return [UIColor colorWithHexString:@"#00a1f1"];
}

- (UIColor *)microsoft4{
	return [UIColor colorWithHexString:@"#ffbb00"];
}


- (UIColor *)microsoftoffice{
	return [UIColor colorWithHexString:@"#ea3e23"];
}


- (UIColor *)mixpanel{
	return [UIColor colorWithHexString:@"#a086d3"];
}


- (UIColor *)motorola{
	return [UIColor colorWithHexString:@"#5c92fa"];
}


- (UIColor *)muut{
	return [UIColor colorWithHexString:@"#1fadc5"];
}

- (UIColor *)muut2{
	return [UIColor colorWithHexString:@"#ff8000"];
}


- (UIColor *)myspace{
	return [UIColor colorWithHexString:@"#000000"];
}


- (UIColor *)nbc{
	return [UIColor colorWithHexString:@"#e1ac26"];
}

- (UIColor *)nbc2{
	return [UIColor colorWithHexString:@"#dc380f"];
}

- (UIColor *)nbc3{
	return [UIColor colorWithHexString:@"#9f0812"];
}

- (UIColor *)nbc4{
	return [UIColor colorWithHexString:@"#6347b2"];
}

- (UIColor *)nbc5{
	return [UIColor colorWithHexString:@"#368dd5"];
}

- (UIColor *)nbc6{
	return [UIColor colorWithHexString:@"#70af1e"];
}

- (UIColor *)nbc7{
	return [UIColor colorWithHexString:@"#7e887a"];
}


- (UIColor *)nest{
	return [UIColor colorWithHexString:@"#00afd8"];
}

- (UIColor *)nest2{
	return [UIColor colorWithHexString:@"#7b858e"];
}


- (UIColor *)netflix{
	return [UIColor colorWithHexString:@"#e50914"];
}

- (UIColor *)netflix2{
	return [UIColor colorWithHexString:@"#221f1f"];
}

- (UIColor *)netflix3{
	return [UIColor colorWithHexString:@"#f5f5f1"];
}


- (UIColor *)netvibes{
	return [UIColor colorWithHexString:@"#39bd00"];
}


- (UIColor *)newbalance{
	return [UIColor colorWithHexString:@"#ce2724"];
}

- (UIColor *)newbalance2{
	return [UIColor colorWithHexString:@"#f3ec19"];
}

- (UIColor *)newbalance3{
	return [UIColor colorWithHexString:@"#207c88"];
}

- (UIColor *)newbalance4{
	return [UIColor colorWithHexString:@"#aac1bf"];
}

- (UIColor *)newbalance5{
	return [UIColor colorWithHexString:@"#e8e9d7"];
}

- (UIColor *)newbalance6{
	return [UIColor colorWithHexString:@"#4c4d4f"];
}

- (UIColor *)newbalance7{
	return [UIColor colorWithHexString:@"#231f20"];
}


- (UIColor *)nextdoor{
	return [UIColor colorWithHexString:@"#19975d"];
}


- (UIColor *)nikefootball{
	return [UIColor colorWithHexString:@"#504847"];
}

- (UIColor *)nikefootball2{
	return [UIColor colorWithHexString:@"#27a770"];
}


- (UIColor *)nikefuel{
	return [UIColor colorWithHexString:@"#4bad31"];
}

- (UIColor *)nikefuel2{
	return [UIColor colorWithHexString:@"#f5dc00"];
}

- (UIColor *)nikefuel3{
	return [UIColor colorWithHexString:@"#e95814"];
}

- (UIColor *)nikefuel4{
	return [UIColor colorWithHexString:@"#e2142d"];
}


- (UIColor *)nokia{
	return [UIColor colorWithHexString:@"#124191"];
}


- (UIColor *)novartis{
	return [UIColor colorWithHexString:@"#765438"];
}

- (UIColor *)novartis2{
	return [UIColor colorWithHexString:@"#a13323"];
}

- (UIColor *)novartis3{
	return [UIColor colorWithHexString:@"#e65124"];
}

- (UIColor *)novartis4{
	return [UIColor colorWithHexString:@"#ec7f22"];
}

- (UIColor *)novartis5{
	return [UIColor colorWithHexString:@"#f8b22a"];
}

- (UIColor *)novartis6{
	return [UIColor colorWithHexString:@"#ffd430"];
}


- (UIColor *)npm{
	return [UIColor colorWithHexString:@"#cb3837"];
}


- (UIColor *)nvidia{
	return [UIColor colorWithHexString:@"#76b900"];
}


- (UIColor *)odnoklassniki{
	return [UIColor colorWithHexString:@"#ed812b"];
}


- (UIColor *)oldnavy {
	return [UIColor colorWithRed:12.0f/255.0f green:68.0f/255.0f blue:116.0f/255.0f alpha:1.0f];
}


- (UIColor *)olympus{
	return [UIColor colorWithHexString:@"#08107b"];
}

- (UIColor *)olympus2{
	return [UIColor colorWithHexString:@"#dfb226"];
}

- (UIColor *)olympus3{
	return [UIColor colorWithHexString:@"#777777"];
}


- (UIColor *)opera{
	return [UIColor colorWithHexString:@"#cc0f16"];
}

- (UIColor *)opera2{
	return [UIColor colorWithHexString:@"#9c9e9f"];
}


- (UIColor *)oracle{
	return [UIColor colorWithHexString:@"#ff0000"];
}

- (UIColor *)oracle2{
	return [UIColor colorWithHexString:@"#000000"];
}

- (UIColor *)oracle3{
	return [UIColor colorWithHexString:@"#7f7f7f"];
}


- (UIColor *)oreilly {
	return [UIColor colorWithRed:1.0f/255.0f green:173.0f/255.0f blue:107.0f/255.0f alpha:1.0f];
}


- (UIColor *)oxforduniversitypress{
	return [UIColor colorWithHexString:@"#002147"];
}

- (UIColor *)oxforduniversitypress2{
	return [UIColor colorWithHexString:@"#000000"];
}

- (UIColor *)oxforduniversitypress3{
	return [UIColor colorWithHexString:@"#666666"];
}


- (UIColor *)panasonic{
	return [UIColor colorWithHexString:@"#0f58a8"];
}

- (UIColor *)panasonic2{
	return [UIColor colorWithHexString:@"#000000"];
}


- (UIColor *)pandora{
	return [UIColor colorWithHexString:@"#005483"];
}


- (UIColor *)partycity {
	return [UIColor colorWithHexString:@"6c76be"];
}

- (UIColor *)path{
	return [UIColor colorWithHexString:@"#ee3423"];
}


- (UIColor *)paymill{
	return [UIColor colorWithHexString:@"#f05000"];
}


- (UIColor *)paypal{
	return [UIColor colorWithHexString:@"#003087"];
}

- (UIColor *)paypal2{
	return [UIColor colorWithHexString:@"#009cde"];
}

- (UIColor *)paypal3{
	return [UIColor colorWithHexString:@"#012169"];
}


- (UIColor *)pearson{
	return [UIColor colorWithHexString:@"#ed6b06"];
}

- (UIColor *)pearson2{
	return [UIColor colorWithHexString:@"#9d1348"];
}

- (UIColor *)pearson3{
	return [UIColor colorWithHexString:@"#008b5d"];
}

- (UIColor *)pearson4{
	return [UIColor colorWithHexString:@"#364395"];
}


- (UIColor *)penguinbooks{
	return [UIColor colorWithHexString:@"#ff6900"];
}


- (UIColor *)pepboys {
	return [UIColor colorWithRed:203.0f/255.0f green:13.0f/255.0f blue:39.0f/255.0f alpha:1.0f];
}


- (UIColor *)pepsi{
	return [UIColor colorWithHexString:@"#e32934"];
}

- (UIColor *)pepsi2{
	return [UIColor colorWithHexString:@"#004883"];
}


- (UIColor *)pfizer{
	return [UIColor colorWithHexString:@"#0093d0"];
}

- (UIColor *)pfizer2{
	return [UIColor colorWithHexString:@"#000000"];
}

- (UIColor *)pfizer3{
	return [UIColor colorWithHexString:@"#616365"];
}

- (UIColor *)pfizer4{
	return [UIColor colorWithHexString:@"#00aeef"];
}

- (UIColor *)pfizer5{
	return [UIColor colorWithHexString:@"#d6006e"];
}

- (UIColor *)pfizer6{
	return [UIColor colorWithHexString:@"#75d1e0"];
}

- (UIColor *)pfizer7{
	return [UIColor colorWithHexString:@"#7dba00"];
}

- (UIColor *)pfizer8{
	return [UIColor colorWithHexString:@"#cc292b"];
}

- (UIColor *)pfizer9{
	return [UIColor colorWithHexString:@"#00a950"];
}

- (UIColor *)pfizer10{
	return [UIColor colorWithHexString:@"#f8971d"];
}

- (UIColor *)pfizer11{
	return [UIColor colorWithHexString:@"#f7d417"];
}

- (UIColor *)pfizer12{
	return [UIColor colorWithHexString:@"#4a245e"];
}

- (UIColor *)pfizer13{
	return [UIColor colorWithHexString:@"#f26649"];
}


- (UIColor *)philips{
	return [UIColor colorWithHexString:@"#0e5fd8"];
}


- (UIColor *)photobucket{
	return [UIColor colorWithHexString:@"#0ea0db"];
}

- (UIColor *)photobucket2{
	return [UIColor colorWithHexString:@"#000000"];
}

- (UIColor *)pier1 {
	return [UIColor colorWithRed:0.0f green:114.0f/255.0f blue:188.0f/255.0f alpha:1.0f];
}

- (UIColor *)pierone {
	return [self pier1];
}

- (UIColor *)pier1imports {
	return [self pier1];
}

- (UIColor *)pieroneimports {
	return [self pier1];
}


- (UIColor *)pinboard{
	return [UIColor colorWithHexString:@"#0000e6"];
}


- (UIColor *)pinterest{
	return [UIColor colorWithHexString:@"#cc2127"];
}


- (UIColor *)pizzahut{
	return [UIColor colorWithHexString:@"#ee3124"];
}

- (UIColor *)pizzahut2{
	return [UIColor colorWithHexString:@"#00a160"];
}

- (UIColor *)pizzahut3{
	return [UIColor colorWithHexString:@"#ffc425"];
}


- (UIColor *)plasso{
	return [UIColor colorWithHexString:@"#6585ed"];
}

- (UIColor *)plasso2{
	return [UIColor colorWithHexString:@"#f5756c"];
}

- (UIColor *)plasso3{
	return [UIColor colorWithHexString:@"#98afc0"];
}

- (UIColor *)plasso4{
	return [UIColor colorWithHexString:@"#2f3148"];
}


- (UIColor *)plaxo{
	return [UIColor colorWithHexString:@"#414f5a"];
}


- (UIColor *)playstation{
	return [UIColor colorWithHexString:@"#003087"];
}


- (UIColor *)pocket{
	return [UIColor colorWithHexString:@"#d3505a"];
}

- (UIColor *)pocket2{
	return [UIColor colorWithHexString:@"#478f8f"];
}


- (UIColor *)portfolium{
	return [UIColor colorWithHexString:@"#0099ff"];
}

- (UIColor *)portfolium2{
	return [UIColor colorWithHexString:@"#fb0a2a"];
}

- (UIColor *)portfolium3{
	return [UIColor colorWithHexString:@"#17ad49"];
}

- (UIColor *)portfolium4{
	return [UIColor colorWithHexString:@"#333333"];
}


- (UIColor *)postmates{
	return [UIColor colorWithHexString:@"#000000"];
}

- (UIColor *)postmates2{
	return [UIColor colorWithHexString:@"#36454f"];
}


- (UIColor *)prezi{
	return [UIColor colorWithHexString:@"#318bff"];
}


- (UIColor *)priceline{
	return [UIColor colorWithHexString:@"#1885bf"];
}


- (UIColor *)producthunt{
	return [UIColor colorWithHexString:@"#da552f"];
}

- (UIColor *)producthunt2{
	return [UIColor colorWithHexString:@"#534540"];
}

- (UIColor *)producthunt3{
	return [UIColor colorWithHexString:@"#988f8c"];
}

- (UIColor *)producthunt4{
	return [UIColor colorWithHexString:@"#00b27f"];
}


- (UIColor *)quora{
	return [UIColor colorWithHexString:@"#a82400"];
}


- (UIColor *)quotefm{
	return [UIColor colorWithHexString:@"#66ceff"];
}


- (UIColor *)ralphlauren {
	return [UIColor colorWithRed:28.0f/255.0f green:28.0f/255.0f blue:28.0f/255.0f alpha:1.0f];
}


- (UIColor *)razer{
	return [UIColor colorWithHexString:@"#00ff00"];
}


- (UIColor *)rdio{
	return [UIColor colorWithHexString:@"#007dc3"];
}


- (UIColor *)readability{
	return [UIColor colorWithHexString:@"#990000"];
}


- (UIColor *)redhat{
	return [UIColor colorWithHexString:@"#cc0000"];
}


- (UIColor *)reddit{
	return [UIColor colorWithHexString:@"#ff4500"];
}

- (UIColor *)reddit2{
	return [UIColor colorWithHexString:@"#5f99cf"];
}

- (UIColor *)reddit3{
	return [UIColor colorWithHexString:@"#cee3f8"];
}


- (UIColor *)redfin{
	return [UIColor colorWithHexString:@"#a02021"];
}


- (UIColor *)rentler{
	return [UIColor colorWithHexString:@"#ed1c27"];
}


- (UIColor *)reverbnation{
	return [UIColor colorWithHexString:@"#e43526"];
}


- (UIColor *)rockpack{
	return [UIColor colorWithHexString:@"#0ba6ab"];
}


- (UIColor *)roku{
	return [UIColor colorWithHexString:@"#6f1ab1"];
}


- (UIColor *)rollsroyce{
	return [UIColor colorWithHexString:@"#680021"];
}

- (UIColor *)rollsroyce2{
	return [UIColor colorWithHexString:@"#fffaec"];
}

- (UIColor *)rollsroyce3{
	return [UIColor colorWithHexString:@"#939598"];
}

- (UIColor *)rollsroyce4{
	return [UIColor colorWithHexString:@"#000000"];
}


- (UIColor *)ross {
	return [UIColor colorWithRed:0.0f green:102.0f/255.0f blue:178.0f/255.0f alpha:1.0f];
}


- (UIColor *)rookids{
	return [UIColor colorWithHexString:@"#e22027"];
}

- (UIColor *)rookids2{
	return [UIColor colorWithHexString:@"#a1cd3d"];
}

- (UIColor *)rookids3{
	return [UIColor colorWithHexString:@"#003e70"];
}


- (UIColor *)roon{
	return [UIColor colorWithHexString:@"#62b0d9"];
}


- (UIColor *)rounds{
	return [UIColor colorWithHexString:@"#fdd800"];
}


- (UIColor *)rss2{
	return [UIColor colorWithHexString:@"#f26522"];
}

- (UIColor *)safeway{
	return [UIColor colorWithRed:226.0f/255.0f green:55.0f/255.0f blue:63.0f/255.0f alpha:1.0f];
}


- (UIColor *)sainsburys{
	return [UIColor colorWithHexString:@"#ec8a00"];
}


- (UIColor *)salesforce{
	return [UIColor colorWithHexString:@"#1798c1"];
}

- (UIColor *)salesforce2{
	return [UIColor colorWithHexString:@"#ff1100"];
}


- (UIColor *)samsclub {
	return [UIColor colorWithRed:0.0f green:75.0f/255.0f blue:141.0f/255.0f alpha:1.0f];
}

- (UIColor *)samsclub2 {
	return [UIColor colorWithRed:93.0f/255.0f green:151.0f/255.0f blue:50.0f/255.0f alpha:1.0f];
}


- (UIColor *)samsung{
	return [UIColor colorWithHexString:@"#1428a0"];
}

- (UIColor *)samsung2{
	return [UIColor colorWithHexString:@"#75787b"];
}

- (UIColor *)samsung3{
	return [UIColor colorWithHexString:@"#0689d8"];
}

- (UIColor *)samsung4{
	return [UIColor colorWithHexString:@"#ffc600"];
}

- (UIColor *)samsung5{
	return [UIColor colorWithHexString:@"#ff6900"];
}

- (UIColor *)samsung6{
	return [UIColor colorWithHexString:@"#e4002b"];
}

- (UIColor *)samsung7{
	return [UIColor colorWithHexString:@"#c800a1"];
}

- (UIColor *)samsung8{
	return [UIColor colorWithHexString:@"#685bc7"];
}

- (UIColor *)samsung9{
	return [UIColor colorWithHexString:@"#0057b8"];
}

- (UIColor *)samsung10{
	return [UIColor colorWithHexString:@"#00a9e0"];
}

- (UIColor *)samsung11{
	return [UIColor colorWithHexString:@"#009ca6"];
}

- (UIColor *)samsung12{
	return [UIColor colorWithHexString:@"#00b140"];
}


- (UIColor *)sap{
	return [UIColor colorWithHexString:@"#003366"];
}

- (UIColor *)sap2{
	return [UIColor colorWithHexString:@"#999999"];
}


- (UIColor *)scribd{
	return [UIColor colorWithHexString:@"#1a7bba"];
}


- (UIColor *)sears {
	return [UIColor colorWithRed:20.0f/255.0f green:37.0f/255.0f blue:145.0f/255.0f alpha:1.0f];
}

- (UIColor *)sears2 {
	return [UIColor colorWithRed:242.0f/255.0f green:35.0f/255.0f blue:39.0f/255.0f alpha:1.0f];
}


- (UIColor *)sherwinwilliams{
	return [UIColor colorWithHexString:@"#0168b3"];
}

- (UIColor *)sherwinwilliams2{
	return [UIColor colorWithHexString:@"#ee3e34"];
}


- (UIColor *)shopify{
	return [UIColor colorWithHexString:@"#96bf48"];
}

- (UIColor *)shopify2{
	return [UIColor colorWithHexString:@"#479ccf"];
}

- (UIColor *)shopify3{
	return [UIColor colorWithHexString:@"#2d3538"];
}

- (UIColor *)shopify4{
	return [UIColor colorWithHexString:@"#f5f5f5"];
}

- (UIColor *)shopify5{
	return [UIColor colorWithHexString:@"#f2f7fa"];
}

- (UIColor *)shopify6{
	return [UIColor colorWithHexString:@"#666666"];
}


- (UIColor *)skype{
	return [UIColor colorWithHexString:@"#00aff0"];
}


- (UIColor *)slack{
	return [UIColor colorWithHexString:@"#6ecadc"];
}

- (UIColor *)slack2{
	return [UIColor colorWithHexString:@"#e9a820"];
}

- (UIColor *)slack3{
	return [UIColor colorWithHexString:@"#e01563"];
}

- (UIColor *)slack4{
	return [UIColor colorWithHexString:@"#3eb991"];
}


- (UIColor *)smashingmagazine{
	return [UIColor colorWithHexString:@"#e53b2c"];
}

- (UIColor *)smashingmagazine2{
	return [UIColor colorWithHexString:@"#41b7d8"];
}


- (UIColor *)snagajob{
	return [UIColor colorWithHexString:@"#f47a20"];
}


- (UIColor *)socialbro{
	return [UIColor colorWithHexString:@"#29c4d0"];
}

- (UIColor *)socialbro2{
	return [UIColor colorWithHexString:@"#f29556"];
}

- (UIColor *)socialbro3{
	return [UIColor colorWithHexString:@"#84afa2"];
}

- (UIColor *)socialbro4{
	return [UIColor colorWithHexString:@"#72c427"];
}

- (UIColor *)socialbro5{
	return [UIColor colorWithHexString:@"#f24c7c"];
}

- (UIColor *)socialbro6{
	return [UIColor colorWithHexString:@"#00aaf2"];
}


- (UIColor *)softonic{
	return [UIColor colorWithHexString:@"#008ace"];
}


- (UIColor *)songkick{
	return [UIColor colorWithHexString:@"#f80046"];
}


- (UIColor *)sonicbids{
	return [UIColor colorWithHexString:@"#ff6600"];
}

- (UIColor *)sonicbids2{
	return [UIColor colorWithHexString:@"#0c88b1"];
}


- (UIColor *)soundcloud{
	return [UIColor colorWithHexString:@"#ff8800"];
}

- (UIColor *)soundcloud2{
	return [UIColor colorWithHexString:@"#ff3300"];
}


- (UIColor *)spoken{
	return [UIColor colorWithHexString:@"#fc00c1"];
}

- (UIColor *)spoken2{
	return [UIColor colorWithHexString:@"#000000"];
}


- (UIColor *)spotify{
	return [UIColor colorWithHexString:@"#2ebd59"];
}


- (UIColor *)sprint{
	return [UIColor colorWithHexString:@"#ffe100"];
}


- (UIColor *)squarecash{
	return [UIColor colorWithHexString:@"#28c101"];
}


- (UIColor *)squarespace{
	return [UIColor colorWithHexString:@"#222222"];
}


- (UIColor *)stackoverflow{
	return [UIColor colorWithHexString:@"#fe7a15"];
}


- (UIColor *)staples{
	return [UIColor colorWithHexString:@"#cc0000"];
}

- (UIColor *)staples2{
	return [UIColor colorWithHexString:@"#2c8aec"];
}

- (UIColor *)staples3{
	return [UIColor colorWithHexString:@"#ffcc00"];
}


- (UIColor *)starbucks{
	return [UIColor colorWithHexString:@"#00704a"];
}

- (UIColor *)starbucks2{
	return [UIColor colorWithHexString:@"#000000"];
}

- (UIColor *)staterbrothers {
	return [UIColor colorWithHexString:@"1644b3"];
}

- (UIColor *)staterbros {
	return [self staterbrothers];
}


- (UIColor *)statuschart{
	return [UIColor colorWithHexString:@"#d7584f"];
}


- (UIColor *)sterlinghotels{
	return [UIColor colorWithHexString:@"#3b5a6f"];
}

- (UIColor *)sterlinghotels2{
	return [UIColor colorWithHexString:@"#828a87"];
}

- (UIColor *)sterlinghotels3{
	return [UIColor colorWithHexString:@"#000000"];
}

- (UIColor *)sterlinghotels4{
	return [UIColor colorWithHexString:@"#9db7c4"];
}

- (UIColor *)sterlinghotels5{
	return [UIColor colorWithHexString:@"#ccd7dd"];
}

- (UIColor *)sterlinghotels6{
	return [UIColor colorWithHexString:@"#838f97"];
}

- (UIColor *)sterlinghotels7{
	return [UIColor colorWithHexString:@"#002054"];
}


- (UIColor *)stopandshop {
	return [UIColor colorWithRed:121.0f/255.0f green:31.0f/255.0f blue:128.0f/255.0f alpha:1.0f];
}

- (UIColor *)stopandshop2 {
	return [UIColor colorWithRed:252.0f/255.0f green:182.0f/255.0f blue:24.0f/255.0f alpha:1.0f];
}

- (UIColor *)stopandshop3 {
	return [UIColor colorWithRed:237.0f/255.0f green:50.0f/255.0f blue:33.0f/255.0f alpha:1.0f];
}

- (UIColor *)stopandshop4 {
	return [UIColor colorWithRed:139.0f/255.0f green:195.0f/255.0f blue:68.0f/255.0f alpha:1.0f];
}


- (UIColor *)storyful{
	return [UIColor colorWithHexString:@"#f97200"];
}

- (UIColor *)storyful2{
	return [UIColor colorWithHexString:@"#010101"];
}

- (UIColor *)storyful3{
	return [UIColor colorWithHexString:@"#8b8b64"];
}

- (UIColor *)storyful4{
	return [UIColor colorWithHexString:@"#bbbdc0"];
}


- (UIColor *)strava{
	return [UIColor colorWithHexString:@"#fc4c02"];
}


- (UIColor *)stripe{
	return [UIColor colorWithHexString:@"#00afe1"];
}


- (UIColor *)studyblue{
	return [UIColor colorWithHexString:@"#00afe1"];
}


- (UIColor *)stumbleupon{
	return [UIColor colorWithHexString:@"#eb4924"];
}


- (UIColor *)subway2{
	return [UIColor colorWithHexString:@"#00543d"];
}

- (UIColor *)subway3{
	return [UIColor colorWithHexString:@"#fef035"];
}


- (UIColor *)subway{
	return [UIColor colorWithHexString:@"#489e3b"];
}

- (UIColor *)subway4{
	return [UIColor colorWithHexString:@"#fabd42"];
}

- (UIColor *)subway5{
	return [UIColor colorWithHexString:@"#cd0a20"];
}


- (UIColor *)sugarcrm{
	return [UIColor colorWithHexString:@"#e61718"];
}

- (UIColor *)sugarcrm2{
	return [UIColor colorWithHexString:@"#e8e9ea"];
}

- (UIColor *)sugarcrm3{
	return [UIColor colorWithHexString:@"#595a5c"];
}

- (UIColor *)sugarcrm4{
	return [UIColor colorWithHexString:@"#282828"];
}


- (UIColor *)swarm{
	return [UIColor colorWithHexString:@"#f06d1f"];
}

- (UIColor *)swarm2{
	return [UIColor colorWithHexString:@"#ffa633"];
}


- (UIColor *)tjmaxx {
	return [UIColor colorWithRed:171.0f/255.0f green:25.0f/255.0f blue:44.0f/255.0f alpha:1.0f];
}

- (UIColor *)tjmax {
	return [self tjmaxx];
}


- (UIColor *)tmobile{
	return [UIColor colorWithHexString:@"#e20074"];
}


- (UIColor *)toysrus {
	return [UIColor colorWithRed:0.0f green:84.0f/255.0f blue:166.0f/255.0f alpha:1.0f];
}




- (UIColor *)tagstr{
	return [UIColor colorWithHexString:@"#e74635"];
}


- (UIColor *)tagstr2{
	return [UIColor colorWithHexString:@"#e74635"];
}

- (UIColor *)target {
	return [UIColor colorWithHexString:@"#e90022"];
}


- (UIColor *)technorati{
	return [UIColor colorWithHexString:@"#339900"];
}


- (UIColor *)tesla{
	return [UIColor colorWithHexString:@"#cc0000"];
}


- (UIColor *)theaudienceawards{
	return [UIColor colorWithHexString:@"#ee8421"];
}

- (UIColor *)theaudienceawards2{
	return [UIColor colorWithHexString:@"#8c8a8a"];
}

- (UIColor *)theaudienceawards3{
	return [UIColor colorWithHexString:@"#222222"];
}


- (UIColor *)thenextweb{
	return [UIColor colorWithHexString:@"#ff3c1f"];
}

- (UIColor *)thenextweb2{
	return [UIColor colorWithHexString:@"#26313b"];
}

- (UIColor *)thenextweb3{
	return [UIColor colorWithHexString:@"#4e5860"];
}

- (UIColor *)thenextweb4{
	return [UIColor colorWithHexString:@"#a6abaf"];
}

- (UIColor *)thenextweb5{
	return [UIColor colorWithHexString:@"#d9e0e2"];
}

- (UIColor *)thenextweb6{
	return [UIColor colorWithHexString:@"#fafbfc"];
}


- (UIColor *)thomsonreuters{
	return [UIColor colorWithHexString:@"#ff8000"];
}

- (UIColor *)thomsonreuters2{
	return [UIColor colorWithHexString:@"#555555"];
}

- (UIColor *)thomsonreuters3{
	return [UIColor colorWithHexString:@"#444444"];
}

- (UIColor *)thomsonreuters4{
	return [UIColor colorWithHexString:@"#666666"];
}

- (UIColor *)thomsonreuters5{
	return [UIColor colorWithHexString:@"#cccccc"];
}

- (UIColor *)thomsonreuters6{
	return [UIColor colorWithHexString:@"#e9e9e9"];
}

- (UIColor *)thomsonreuters7{
	return [UIColor colorWithHexString:@"#f7f7f7"];
}


- (UIColor *)tiffany {
	return [UIColor colorWithRed:136.0f/255.0f green:204.0f/255.0f blue:207.0f/255.0f alpha:1.0f];
}

- (UIColor *)tiffanys {
	return [self tiffany];
}

- (UIColor *)tiffanies {
	return [self tiffany];
}

- (UIColor *)tiffanyandco {
	return [self tiffany];
}

- (UIColor *)tiffanyandcompany {
	return [self tiffany];
}


- (UIColor *)tivo{
	return [UIColor colorWithHexString:@"#da3d34"];
}

- (UIColor *)tivo2{
	return [UIColor colorWithHexString:@"#00a480"];
}

- (UIColor *)tivo3{
	return [UIColor colorWithHexString:@"#ed9f40"];
}

- (UIColor *)tivo4{
	return [UIColor colorWithHexString:@"#6a76ac"];
}

- (UIColor *)tivo5{
	return [UIColor colorWithHexString:@"#17170e"];
}

- (UIColor *)tivo6{
	return [UIColor colorWithHexString:@"#534b38"];
}

- (UIColor *)tivo7{
	return [UIColor colorWithHexString:@"#a6a480"];
}


- (UIColor *)traderjoes {
	return [UIColor colorWithRed:227.0f/255.0f green:25.0f/255.0f blue:54.0f/255.0f alpha:1.0f];
}

- (UIColor *)traderjoe {
	return [self traderjoes];
}


- (UIColor *)treehouse{
	return [UIColor colorWithHexString:@"#6fbc6d"];
}

- (UIColor *)treehouse2{
	return [UIColor colorWithHexString:@"#47535b"];
}


- (UIColor *)trello{
	return [UIColor colorWithHexString:@"#0079bf"];
}

- (UIColor *)trello2{
	return [UIColor colorWithHexString:@"#70b500"];
}

- (UIColor *)trello3{
	return [UIColor colorWithHexString:@"#ff9f1a"];
}

- (UIColor *)trello4{
	return [UIColor colorWithHexString:@"#eb5a46"];
}

- (UIColor *)trello5{
	return [UIColor colorWithHexString:@"#f2d600"];
}

- (UIColor *)trello6{
	return [UIColor colorWithHexString:@"#c377e0"];
}

- (UIColor *)trello7{
	return [UIColor colorWithHexString:@"#ff78cb"];
}

- (UIColor *)trello8{
	return [UIColor colorWithHexString:@"#00c2e0"];
}

- (UIColor *)trello9{
	return [UIColor colorWithHexString:@"#51e898"];
}

- (UIColor *)trello10{
	return [UIColor colorWithHexString:@"#c4c9cc"];
}


- (UIColor *)tripadvisor{
	return [UIColor colorWithHexString:@"#589442"];
}


- (UIColor *)trulia{
	return [UIColor colorWithHexString:@"#5eab1f"];
}


- (UIColor *)tumblr{
	return [UIColor colorWithHexString:@"#35465c"];
}


- (UIColor *)tunngle{
	return [UIColor colorWithHexString:@"#c30f24"];
}


- (UIColor *)tvtag{
	return [UIColor colorWithHexString:@"#f24e4e"];
}


- (UIColor *)twitchtv{
	return [UIColor colorWithHexString:@"#6441a5"];
}


- (UIColor *)twitter{
	return [UIColor colorWithHexString:@"#55acee"];
}


- (UIColor *)typekit{
	return [UIColor colorWithHexString:@"#98ce1e"];
}


- (UIColor *)typepad{
	return [UIColor colorWithHexString:@"#d2de61"];
}


- (UIColor *)typo3{
	return [UIColor colorWithHexString:@"#ff8600"];
}


- (UIColor *)ubuntu{
	return [UIColor colorWithHexString:@"#dd4814"];
}

- (UIColor *)ubuntu2{
	return [UIColor colorWithHexString:@"#77216f"];
}

- (UIColor *)ubuntu3{
	return [UIColor colorWithHexString:@"#5e2750"];
}

- (UIColor *)ubuntu4{
	return [UIColor colorWithHexString:@"#2c001e"];
}

- (UIColor *)ubuntu5{
	return [UIColor colorWithHexString:@"#aea79f"];
}

- (UIColor *)ubuntu6{
	return [UIColor colorWithHexString:@"#333333"];
}


- (UIColor *)unitedway{
	return [UIColor colorWithHexString:@"#10167f"];
}

- (UIColor *)unitedway2{
	return [UIColor colorWithHexString:@"#fe230a"];
}

- (UIColor *)unitedway3{
	return [UIColor colorWithHexString:@"#ff9600"];
}

- (UIColor *)unitedway4{
	return [UIColor colorWithHexString:@"#000064"];
}

- (UIColor *)unitedway5{
	return [UIColor colorWithHexString:@"#b41428"];
}

- (UIColor *)unitedway6{
	return [UIColor colorWithHexString:@"#f57814"];
}

- (UIColor *)unitedway7{
	return [UIColor colorWithHexString:@"#e6d7aa"];
}

- (UIColor *)unitedway8{
	return [UIColor colorWithHexString:@"#505050"];
}

- (UIColor *)unitedway9{
	return [UIColor colorWithHexString:@"#f0e6c8"];
}

- (UIColor *)unitedway10{
	return [UIColor colorWithHexString:@"#969696"];
}

- (UIColor *)unitedway11{
	return [UIColor colorWithHexString:@"#7c81b8"];
}

- (UIColor *)unitedway12{
	return [UIColor colorWithHexString:@"#ff967d"];
}

- (UIColor *)unitedway13{
	return [UIColor colorWithHexString:@"#ffc87d"];
}


- (UIColor *)unity{
	return [UIColor colorWithHexString:@"#222c37"];
}

- (UIColor *)unity2{
	return [UIColor colorWithHexString:@"#00cccc"];
}

- (UIColor *)unity3{
	return [UIColor colorWithHexString:@"#fff600"];
}

- (UIColor *)unity4{
	return [UIColor colorWithHexString:@"#ff0066"];
}

- (UIColor *)unity5{
	return [UIColor colorWithHexString:@"#19e3b1"];
}

- (UIColor *)unity6{
	return [UIColor colorWithHexString:@"#ff7f33"];
}

- (UIColor *)unity7{
	return [UIColor colorWithHexString:@"#b83c82"];
}


- (UIColor *)universityoforegon{
	return [UIColor colorWithHexString:@"#fce122"];
}

- (UIColor *)universityoforegon2{
	return [UIColor colorWithHexString:@"#18453b"];
}


- (UIColor *)univision{
	return [UIColor colorWithHexString:@"#c822b0"];
}


- (UIColor *)ustream{
	return [UIColor colorWithHexString:@"#3388ff"];
}

- (UIColor *)vons {
	return [self safeway];
}


- (UIColor *)verizon{
	return [UIColor colorWithHexString:@"#ff0000"];
}

- (UIColor *)verizon2{
	return [UIColor colorWithHexString:@"#f2f2f2"];
}

- (UIColor *)verizon3{
	return [UIColor colorWithHexString:@"#3285dc"];
}


- (UIColor *)viadeo{
	return [UIColor colorWithHexString:@"#f07355"];
}


- (UIColor *)victoriassecret {
	return [UIColor colorWithRed:208.0f/255.0f green:17.0f/255.0f blue:112.0f/255.0f alpha:1.0f];
}


- (UIColor *)viki{
	return [UIColor colorWithHexString:@"#3c9cd7"];
}

- (UIColor *)viki2{
	return [UIColor colorWithHexString:@"#d24663"];
}


- (UIColor *)vimeo{
	return [UIColor colorWithHexString:@"#162221"];
}

- (UIColor *)vimeo2{
	return [UIColor colorWithHexString:@"#1ab7ea"];
}


- (UIColor *)vine{
	return [UIColor colorWithHexString:@"#00b488"];
}


- (UIColor *)virb{
	return [UIColor colorWithHexString:@"#1e91d0"];
}


- (UIColor *)virginmedia{
	return [UIColor colorWithHexString:@"#c3092d"];
}

- (UIColor *)virginmedia2{
	return [UIColor colorWithHexString:@"#222221"];
}


- (UIColor *)vkontakte{
	return [UIColor colorWithHexString:@"#45668e"];
}

- (UIColor *)volcano {
	return [UIColor colorWithHexString:@"1d488e"];
}

- (UIColor *)volvo{
	return [UIColor colorWithHexString:@"#003057"];
}

- (UIColor *)volvo2{
	return [UIColor colorWithHexString:@"#115740"];
}

- (UIColor *)volvo3{
	return [UIColor colorWithHexString:@"#65665c"];
}

- (UIColor *)volvo4{
	return [UIColor colorWithHexString:@"#425563"];
}

- (UIColor *)volvo5{
	return [UIColor colorWithHexString:@"#517891"];
}

- (UIColor *)volvo6{
	return [UIColor colorWithHexString:@"#212721"];
}


- (UIColor *)walgreens{
	return [UIColor colorWithHexString:@"#e31837"];
}

- (UIColor *)walgreens2{
	return [UIColor colorWithHexString:@"#f37520"];
}

- (UIColor *)walgreens3{
	return [UIColor colorWithHexString:@"#489cd4"];
}

- (UIColor *)walgreens4{
	return [UIColor colorWithHexString:@"#2774a6"];
}

- (UIColor *)walgreens5{
	return [UIColor colorWithHexString:@"#35393d"];
}


- (UIColor *)walmart{
	return [UIColor colorWithHexString:@"#0e7bc3"];
}

- (UIColor *)walmart2{
	return [UIColor colorWithHexString:@"#05509b"];
}

- (UIColor *)walmart3{
	return [UIColor colorWithHexString:@"#6eaddf"];
}

- (UIColor *)walmart4{
	return [UIColor colorWithHexString:@"#f27922"];
}

- (UIColor *)walmart5{
	return [UIColor colorWithHexString:@"#fcbc32"];
}

- (UIColor *)walmart6{
	return [UIColor colorWithHexString:@"#3b7f2c"];
}

- (UIColor *)walmart7{
	return [UIColor colorWithHexString:@"#7ec544"];
}


- (UIColor *)wechat{
	return [UIColor colorWithHexString:@"#7bb32e"];
}


- (UIColor *)wendys{
	return [UIColor colorWithHexString:@"#e2203d"];
}

- (UIColor *)wendys2{
	return [UIColor colorWithHexString:@"#199fda"];
}


- (UIColor *)westerndigital{
	return [UIColor colorWithHexString:@"#005195"];
}

- (UIColor *)westerndigital2{
	return [UIColor colorWithHexString:@"#028948"];
}

- (UIColor *)westerndigital3{
	return [UIColor colorWithHexString:@"#ffd400"];
}

- (UIColor *)westerndigital4{
	return [UIColor colorWithHexString:@"#0067b3"];
}

- (UIColor *)westerndigital5{
	return [UIColor colorWithHexString:@"#9d0a0e"];
}

- (UIColor *)westerndigital6{
	return [UIColor colorWithHexString:@"#003369"];
}


- (UIColor *)whatsapp{
	return [UIColor colorWithHexString:@"#4dc247"];
}


- (UIColor *)wholefoods {
	return [UIColor colorWithRed:2.0f/255.0f green:145.0f/255.0f blue:45.0f/255.0f alpha:1.0f];
}


- (UIColor *)whoosnapdesigner{
	return [UIColor colorWithHexString:@"#2fa5d6"];
}

- (UIColor *)whoosnapdesigner2{
	return [UIColor colorWithHexString:@"#b52f2c"];
}


- (UIColor *)williamssonoma {
	return [UIColor colorWithRed:0.0f green:72.0f/255.0f blue:17.0f/255.0f alpha:1.0f];
}

- (UIColor *)williamsonoma {
	return [self williamssonoma];
}


- (UIColor *)windows{
	return [UIColor colorWithHexString:@"#00bcf2"];
}


- (UIColor *)windowsphone{
	return [UIColor colorWithHexString:@"#68217a"];
}


- (UIColor *)wooga{
	return [UIColor colorWithHexString:@"#5b009c"];
}


- (UIColor *)wordpress{
	return [UIColor colorWithHexString:@"#21759b"];
}

- (UIColor *)wordpress2{
	return [UIColor colorWithHexString:@"#d54e21"];
}

- (UIColor *)wordpress3{
	return [UIColor colorWithHexString:@"#464646"];
}


- (UIColor *)wordpresscom{
	return [UIColor colorWithHexString:@"#0087be"];
}

- (UIColor *)wordpresscom2{
	return [UIColor colorWithHexString:@"#78dcfa"];
}

- (UIColor *)wordpresscom3{
	return [UIColor colorWithHexString:@"#00aadc"];
}

- (UIColor *)wordpresscom4{
	return [UIColor colorWithHexString:@"#005082"];
}

- (UIColor *)wordpresscom5{
	return [UIColor colorWithHexString:@"#87a6bc"];
}

- (UIColor *)wordpresscom6{
	return [UIColor colorWithHexString:@"#f3f6f8"];
}

- (UIColor *)wordpresscom7{
	return [UIColor colorWithHexString:@"#e9eff3"];
}

- (UIColor *)wordpresscom8{
	return [UIColor colorWithHexString:@"#e9eff3"];
}

- (UIColor *)wordpresscom9{
	return [UIColor colorWithHexString:@"#a8bece"];
}

- (UIColor *)wordpresscom10{
	return [UIColor colorWithHexString:@"#668eaa"];
}

- (UIColor *)wordpresscom11{
	return [UIColor colorWithHexString:@"#4f748e"];
}

- (UIColor *)wordpresscom12{
	return [UIColor colorWithHexString:@"#3d596d"];
}

- (UIColor *)wordpresscom13{
	return [UIColor colorWithHexString:@"#2e4453"];
}

- (UIColor *)wordpresscom14{
	return [UIColor colorWithHexString:@"#d54e21"];
}

- (UIColor *)wordpresscom15{
	return [UIColor colorWithHexString:@"#f0821e"];
}

- (UIColor *)wordpresscom16{
	return [UIColor colorWithHexString:@"#4ab866"];
}

- (UIColor *)wordpresscom17{
	return [UIColor colorWithHexString:@"#f0b849"];
}

- (UIColor *)wordpresscom18{
	return [UIColor colorWithHexString:@"#d94f4f"];
}


- (UIColor *)worldline{
	return [UIColor colorWithHexString:@"#0066a1"];
}


- (UIColor *)wunderlist{
	return [UIColor colorWithHexString:@"#2b96f1"];
}


- (UIColor *)xbox{
	return [UIColor colorWithHexString:@"#52b043"];
}


- (UIColor *)xing{
	return [UIColor colorWithHexString:@"#026466"];
}

- (UIColor *)xing2{
	return [UIColor colorWithHexString:@"#cfdc00"];
}


- (UIColor *)yahoo{
	return [UIColor colorWithHexString:@"#400191"];
}


- (UIColor *)yandex{
	return [UIColor colorWithHexString:@"#ffcc00"];
}


- (UIColor *)yelp{
	return [UIColor colorWithHexString:@"#af0606"];
}


- (UIColor *)yo{
	return [UIColor colorWithHexString:@"#9b59b6"];
}

- (UIColor *)yo2{
	return [UIColor colorWithHexString:@"#e74c3c"];
}

- (UIColor *)yo3{
	return [UIColor colorWithHexString:@"#8e44ad"];
}

- (UIColor *)yo4{
	return [UIColor colorWithHexString:@"#2980b9"];
}

- (UIColor *)yo5{
	return [UIColor colorWithHexString:@"#f1c40f"];
}

- (UIColor *)yo6{
	return [UIColor colorWithHexString:@"#16a085"];
}

- (UIColor *)yo7{
	return [UIColor colorWithHexString:@"#34495e"];
}

- (UIColor *)yo8{
	return [UIColor colorWithHexString:@"#3498db"];
}

- (UIColor *)yo9{
	return [UIColor colorWithHexString:@"#2ecc71"];
}

- (UIColor *)yo10{
	return [UIColor colorWithHexString:@"#1abc9c"];
}


- (UIColor *)youtube{
	return [UIColor colorWithHexString:@"#cd201f"];
}


- (UIColor *)zendesk{
	return [UIColor colorWithHexString:@"#78a300"];
}

- (UIColor *)zendesk2{
	return [UIColor colorWithHexString:@"#f1f1f1"];
}

- (UIColor *)zendesk3{
	return [UIColor colorWithHexString:@"#444444"];
}


- (UIColor *)zerply{
	return [UIColor colorWithHexString:@"#9dbc7a"];
}


- (UIColor *)zillow{
	return [UIColor colorWithHexString:@"#1277e1"];
}


- (UIColor *)zopim{
	return [UIColor colorWithHexString:@"#ff9d3b"];
}

@end
