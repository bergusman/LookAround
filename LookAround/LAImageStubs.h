//
//  LAImageStubs.h
//  LookAround
//
//  Created by Vitaly Berg on 7/7/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LAImageStubs : NSObject

- (NSArray *)photos;
- (NSArray *)avatars;

+ (LAImageStubs *)sharedImageStubs;

@end
