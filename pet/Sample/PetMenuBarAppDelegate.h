//
//  LightMenuBarAppDelegate.h
//  LightMenuBar
//
//  Created by Haoxiang on 6/9/11.
//  Copyright 2011 DEV. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PetViewController.h"
@class ViewController;

@interface PetMenuBarAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, strong)  UIWindow *window;

@property (strong, nonatomic) PetViewController *petViewController;

@end

