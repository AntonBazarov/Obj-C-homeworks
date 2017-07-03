//
//  AppDelegate.m
//  day5_homework_13_Threads
//
//  Created by Predki on 25.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"
#import "StudentTwo.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    StudentTwo* student1 = [[StudentTwo alloc] init];
    student1.name = @"Petya";
    StudentTwo* student2 = [[StudentTwo alloc] init];
    student2.name = @"Vasya";
    StudentTwo* student3 = [[StudentTwo alloc] init];
    student3.name = @"Misha";
    StudentTwo* student4 = [[StudentTwo alloc] init];
    student4.name = @"Kolya";
    StudentTwo* student5 = [[StudentTwo alloc] init];
    student5.name = @"Zoya";
    NSMutableArray* students = [[NSMutableArray alloc] initWithObjects:student1, student2, student3, student4, student5, nil];
    
    for (id anyStudent in students) {
        __weak Student* weakSelf = anyStudent;
        [anyStudent guessNumber:45 range:100 block:^{
            NSLog(@"The student %@ finished. Time: %f",weakSelf.name, weakSelf.finishTime);
        }];
    }
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
