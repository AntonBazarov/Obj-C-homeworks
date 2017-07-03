//
//  AppDelegate.m
//  day4_homework_12_Blocks(part2)
//
//  Created by Predki on 24.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "AppDelegate.h"
#import "Patient.h"

typedef void (^PatientBlock)(Patient*);
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    Patient* patient1 = [[Patient alloc] init];
    patient1.name = @"Dima";
    patient1.temperature = 37.6f;
    
    Patient* patient2 = [[Patient alloc] init];
    patient2.name = @"Vasya";
    patient2.temperature = 38.6f;
    
    Patient* patient3 = [[Patient alloc] init];
    patient3.name = @"Gena";
    patient3.temperature = 39.6f;
    
    Patient* patient4 = [[Patient alloc] init];
    patient4.name = @"Zoya";
    patient4.temperature = 37.1f;
    
    Patient* patient5 = [[Patient alloc] init];
    patient5.name = @"Boroda";
    patient5.temperature = 39.6f;
    
    [self initBlock:patient1];
    [self initBlock:patient2];
    [self initBlock:patient3];
    [self initBlock:patient4];
    [self initBlock:patient5];
    
    
    
    return YES;

    
}
-(void) initBlock:(Patient*) patient {
    __weak Patient* weakLink = patient;
    patient.patientBlock = ^{
        if (weakLink.temperature > 37 && weakLink.temperature < 38){
            [weakLink takePill];
        } else {
            [weakLink makeShot];
        }
    };
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
