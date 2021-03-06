//
//  NSString+DTFormatNumbers.m
//  DTFoundation
//
//  Created by Oliver Drobnik on 11/25/11.
//  Copyright (c) 2011 Cocoanetics. All rights reserved.
//

#import "NSString+DTFormatNumbers.h"


// force this category to be loaded by linker
MAKE_CATEGORIES_LOADABLE(NSString_DTFormatNumbers);

@implementation NSString (DTFormatNumbers)

+ (NSString *)stringByFormattingBytes:(long long)bytes
{
	NSArray *units = [NSArray arrayWithObjects:@"%1.0f Bytes", @"%1.1f kB", @"%1.1f MB", @"%1.1f GB", @"%1.1f TB", nil];
	
	long long value = bytes * 10;
	for (int i=0; i<[units count]; i++)
	{
		if (i > 0)
		{
			value = value/1024;
		}
		if (value < 10000)
		{
			return [NSString stringWithFormat:[units objectAtIndex:i], value/10.0];
		}
	}
	
	return [NSString stringWithFormat:[units objectAtIndex:[units count]-1], value/10.0];
}
@end
