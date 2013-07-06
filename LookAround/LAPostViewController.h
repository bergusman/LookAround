//
//  LAPostViewController.h
//  LookAround
//
//  Created by Vitaly Berg on 06.07.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LAPostCloseHandler)();

@interface LAPostViewController : UIViewController

@property (strong, nonatomic) UIImageView *photoImageView;

@property (copy, nonatomic) LAPostCloseHandler closeHandler;

- (void)go;

@end
