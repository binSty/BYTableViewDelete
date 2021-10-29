//
//  AppDelegate.m
//  BYTableViewDelete
//
//  Created by YD_Dev_BinY on 2021/10/28.
//

#import "AppDelegate.h"
#import "BYMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    BYMainViewController *mainVC = [[BYMainViewController alloc] init];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:mainVC];
    self.window.rootViewController = navVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
