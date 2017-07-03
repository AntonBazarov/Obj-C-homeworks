//
//  AppDelegate.m
//  day1_homework_06_DataTypes
//
//  Created by Predki on 21.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "AppDelegate.h"
#import "Enum.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    CGPoint point1 = [self pointMake];
    CGPoint point2 = [self pointMake];
    CGPoint point3 = [self pointMake];
    CGPoint point4 = [self pointMake];
    CGPoint point5 = [self pointMake];
    CGPoint point6 = [self pointMake];
    CGPoint point7 = [self pointMake];
    CGPoint point8 = [self pointMake];
    NSArray* points = [NSArray arrayWithObjects:
                      [NSValue valueWithCGPoint:(point1)],
                      [NSValue valueWithCGPoint:(point2)],
                      [NSValue valueWithCGPoint:(point3)],
                      [NSValue valueWithCGPoint:(point4)],
                      [NSValue valueWithCGPoint:(point5)],
                      [NSValue valueWithCGPoint:(point6)],
                      [NSValue valueWithCGPoint:(point7)],
                      [NSValue valueWithCGPoint:(point8)],nil];
    
    int pointNumber = 1;
    for (NSValue* value in points) {
        CGPoint atack = [value CGPointValue];
        if ((atack.x > 3 && atack.x < 7) && (atack.y > 3 && atack.y < 7)) {
            NSLog(@"Point %d with coordinate %@ hit the target!", pointNumber, NSStringFromCGPoint(atack));
        } else {
            NSLog(@"Point %d with coordinate %@ did not hit", pointNumber, NSStringFromCGPoint(atack));
        }
        pointNumber++;
    }
    return YES;
}
-(CGPoint) pointMake {
    return CGPointMake(((arc4random() % 6) + 5), ((arc4random() % 6) + 5));
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
