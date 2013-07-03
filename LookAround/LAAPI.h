//
//  LAAPI.h
//  LookAround
//
//  Created by Vitaly Berg on 7/3/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LAAPIResponseHandler)(id response, NSError *error);

@interface LAAPI : NSObject

- (NSOperation *)logInWithFacebookToken:(NSString *)token responseHandler:(LAAPIResponseHandler)handler;

@end
