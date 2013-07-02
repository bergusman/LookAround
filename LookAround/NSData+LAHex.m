//
//  NSData+LAHex.m
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "NSData+LAHex.h"

@implementation NSData (LAHex)

- (NSString *)hexString {
	NSUInteger capacity = [self length] * 2;
	NSMutableString *stringBuffer = [NSMutableString stringWithCapacity:capacity];
	const unsigned char *dataBuffer = [self bytes];
    
	for (NSUInteger i = 0; i < [self length]; ++i) {
		[stringBuffer appendFormat:@"%02x", (unsigned int)dataBuffer[i]];
	}
    
	return stringBuffer;
}

@end
