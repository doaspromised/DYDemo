//
//  AppDelegate.m
//  DouyinDemo
//
//  Created by Abakus on 2021/3/27.
//

#import "AppDelegate.h"
#import "DYUserHomePageController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.rootViewController = [DYUserHomePageController new];
    [_window makeKeyAndVisible];
    
    return YES;
}

@end

