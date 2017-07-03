//
//  AppDelegate.m
//  day4_homework_10_Notifications
//
//  Created by Predki on 24.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "AppDelegate.h"
#import "Government.h"
#import "Doctor.h"
#import "Pensioner.h"
#import "Businessman.h"
#import "BazAppDelegate.h"

@interface AppDelegate ()
@property (strong, nonatomic) Government* government;
@property (strong, nonatomic) BazAppDelegate* bazAppDelegate;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.government = [[Government alloc] init];
    self.bazAppDelegate = [[BazAppDelegate alloc] init];
    Doctor* doctor = [[Doctor alloc] init];
    doctor.salary = self.government.salary;
    doctor.averagePrice = self.government.averagePrice;
    
    Pensioner* pensioner = [[Pensioner alloc] init];
    pensioner.pension = self.government.salary;
    pensioner.averagePrice = self.government.averagePrice;
    
    Businessman* businessman = [[Businessman alloc] init];
    businessman.taxLevel = self.government.salary;
    businessman.averagePrice = self.government.averagePrice;
    
    
    self.government.taxLevel = 10.5f;
    self.government.pension = 600;
    self.government.salary = 1100;
    self.government.averagePrice = 9.f;
    NSLog(@"**********************************");
    self.government.taxLevel = 2.5f;
    self.government.pension = 9000;
    self.government.salary = 200;
    self.government.averagePrice = 170.f;
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
