//
//  LAClient.h
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LAAPI.h"

@interface LAClient : NSObject

- (NSOperation *)logInWithFacebookToken:(NSString *)token responseHandler:(LAAPIResponseHandler)handler;

@end
