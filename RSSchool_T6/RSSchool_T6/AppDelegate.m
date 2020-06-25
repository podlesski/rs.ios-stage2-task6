//
//  AppDelegate.m
//  RSSchool_T6
//
//  Created by Artemy Podlessky on 6/21/20.
//  Copyright © 2020 Artemy Podlessky. All rights reserved.
//

#import "AppDelegate.h"
#import "StartVC.h"
#import "RSNavigationViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [[RSNavigationViewController alloc] initWithRootViewController:[[StartVC alloc] init]];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
