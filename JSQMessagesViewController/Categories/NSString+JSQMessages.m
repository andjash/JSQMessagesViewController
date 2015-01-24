//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "NSString+JSQMessages.h"

@implementation NSString (JSQMessages)

- (NSString *)jsq_stringByTrimingWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (instancetype)jsq_localizedStringForKey:(NSString *)key
{
	static NSBundle *bundle = nil;
	if (bundle == nil) {
		NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"JSQMessagesAssets" ofType:@"bundle"];
		bundle = [NSBundle bundleWithPath:bundlePath];
		NSString *language = [[NSLocale preferredLanguages] count] ? [NSLocale preferredLanguages][0]: @"en";
		if (![[bundle localizations] containsObject:language]) {
			language = [language componentsSeparatedByString:@"-"][0];
		}
		if ([[bundle localizations] containsObject:language]) {
			bundlePath = [bundle pathForResource:language ofType:@"lproj"];
		}
		bundle = [NSBundle bundleWithPath:bundlePath] ?: [NSBundle mainBundle];
	}
	key = [bundle localizedStringForKey:key value:key table:nil];
	return [[NSBundle mainBundle] localizedStringForKey:key value:key table:nil];
}

@end