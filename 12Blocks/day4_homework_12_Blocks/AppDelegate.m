//
//  AppDelegate.m
//  day4_homework_12_Blocks
//
//  Created by Predki on 24.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"
//typedef void(^blockThree)(NSString*);
@interface AppDelegate ()
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//
//    void(^blockOne)(void);
//    blockOne = ^{
//        NSLog(@"Block 1 created");
//    };
//    
//    
//    void (^blockTwo)(NSString*) = ^(NSString* string){
//        NSLog(@" %@ ", string);
//    };
//    
//    blockThree block3 = ^(NSString* string1){
//        NSLog(@" %@ ", string1);
//    };
//    
//    blockOne();
//    blockTwo(@"Hello");
//    block3(@"How are you?");
//    [self testMethod:^{
//        NSLog(@"I'm fine!");
//    }];
    
    Student* student1 = [[Student alloc] init];
    student1.name = @"Denis";
    student1.lastName = @"BORODACHEV";
    
    Student* student2 = [[Student alloc] init];
    student2.name = @"Nastya";
    student2.lastName = @"Andreeva";
    
    Student* student3 = [[Student alloc] init];
    student3.name = @"Vasya";
    student3.lastName = @"Korolev";
    
    Student* student4 = [[Student alloc] init];
    student4.name = @"Noob";
    student4.lastName = @"BORODACHEV";
    
    Student* student5 = [[Student alloc] init];
    student5.name = @"Crab";
    student5.lastName = @"BORODACHEV";
    
    Student* student6 = [[Student alloc] init];
    student6.name = @"Stiches";
    student6.lastName = @"Durnev";
    
    Student* student7 = [[Student alloc] init];
    student7.name = @"Valla";
    student7.lastName = @"Strelkova";
    
    Student* student8 = [[Student alloc] init];
    student8.name = @"Google";
    student8.lastName = @"Chromi";
    
    Student* student9 = [[Student alloc] init];
    student9.name = @"Holly";
    student9.lastName = @"Dolly";
    
    Student* student10 = [[Student alloc] init];
    student10.name = @"Molly";
    student10.lastName = @"Polly";
    
    Student* student11 = [[Student alloc] init];
    student11.name = @"Nolly";
    student11.lastName = @"Kolly";
    
    NSArray* students = [NSArray arrayWithObjects:student1, student2, student3, student4, student5, student6, student7, student8, student9, student10, student11, nil];
    
   students = [students sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
       if ([obj1 lastName] == [obj2 lastName]) {
           return [[obj1 name] compare: [obj2 name]];
       } else {
           return [[obj1 lastName] compare: [obj2 lastName]];
       }
   }];
    
    for (Student* index in students) {
        NSLog(@"%@ %@", index.name, index.lastName);
    }
    
    
    return YES;
}
//-(void) testMethod:(void(^)(void)) block {
//    block();


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
