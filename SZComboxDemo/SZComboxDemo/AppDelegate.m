//
//  AppDelegate.m
//  SZComboxDemo
//
//  Created by styshy on 16/6/8.
//  Copyright © 2016年 styshy. All rights reserved.
//

#import "AppDelegate.h"
#import "SZViewControllerOne.h"
#import "SZViewControllerTwo.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor lightGrayColor];
    
    UITabBarController *tabVc =[[UITabBarController alloc] init];
    tabVc.view.backgroundColor = [UIColor darkGrayColor];
    
    SZViewControllerOne *oneVc = [SZViewControllerOne new];
    oneVc.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:100/255.0 alpha:0.6];
    oneVc.tabBarItem.title = @"代码方式";
    oneVc.tabBarItem.image = [UIImage imageNamed:@"comboxCode"];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"SZViewControllerTwo" bundle:nil];
    SZViewControllerTwo *twoVc = [sb instantiateInitialViewController];
    twoVc.view.backgroundColor = [UIColor colorWithRed:100/255.0 green:0 blue:0 alpha:0.6];
    twoVc.tabBarItem.title = @"storyboard方式";
    twoVc.tabBarItem.image = [UIImage imageNamed:@"comboxSB"];
    
    [tabVc addChildViewController:oneVc];
    [tabVc addChildViewController:twoVc];
    
    self.window.rootViewController = tabVc;
    
    [self.window makeKeyAndVisible];
    return YES;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
