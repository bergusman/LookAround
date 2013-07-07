//
//  LAImageStubs.m
//  LookAround
//
//  Created by Vitaly Berg on 7/7/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAImageStubs.h"

@implementation LAImageStubs {
    NSArray *_photos;
    NSArray *_avatars;
}

- (id)init {
    self = [super init];
    if (self) {
        _photos = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"photos.plist" withExtension:@""]];
        _avatars = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"avatars.plist" withExtension:@""]];
    }
    return self;
}

- (NSArray *)photos {
    return _photos;
}

- (NSArray *)avatars {
    return _avatars;
}

+ (LAImageStubs *)sharedImageStubs {
    static LAImageStubs *_sharedImageStubs;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedImageStubs = [[LAImageStubs alloc] init];
    });
    return _sharedImageStubs;
}

@end
