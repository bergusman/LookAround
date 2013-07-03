//
//  LAClient.m
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "LAClient.h"

#import <FacebookSDK/FacebookSDK.h>

@implementation LAClient

#pragma mark - NSObject

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - Public Interface

- (NSOperation *)logInWithFacebookToken:(NSString *)token responseHandler:(LAAPIResponseHandler)handler {
    return nil;
}

#pragma mark - Singleton

+ (LAClient *)sharedClient {
    static LAClient *_sharedClient;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[LAClient alloc] init];
    });
    return _sharedClient;
}

@end
