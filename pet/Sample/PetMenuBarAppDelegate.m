//
//  LightMenuBarAppDelegate.m
//  LightMenuBar
//
//  Created by Haoxiang on 6/9/11.
//  Copyright 2011 DEV. All rights reserved.
//

#import "PetMenuBarAppDelegate.h"
#import "PetMenuBar.h"

//< Set this to 1 to use customized display
#define USE_CUSTOM_DISPLAY 0

@implementation PetMenuBarAppDelegate

@synthesize window = _window;
@synthesize petViewController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    WaterFlowLayout *layout = [[WaterFlowLayout alloc]init];
    self.petViewController = [[PetViewController alloc]initWithCollectionViewLayout:layout];
    self.window.rootViewController = self.petViewController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
 
}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {
   
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    
}


@end
