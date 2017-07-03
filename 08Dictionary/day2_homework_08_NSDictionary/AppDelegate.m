//
//  AppDelegate.m
//  day2_homework_08_NSDictionary
//
//  Created by Predki on 22.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "AppDelegate.h"
#import "Students.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Students* student1 = [[Students alloc] init];
    Students* student2 = [[Students alloc] init];
    Students* student3 = [[Students alloc] init];
    Students* student4 = [[Students alloc] init];
    Students* student5 = [[Students alloc] init];
    Students* student6 = [[Students alloc] init];
    Students* student7 = [[Students alloc] init];
    Students* student8 = [[Students alloc] init];
    Students* student9 = [[Students alloc] init];
    Students* student10 = [[Students alloc] init];
    
    
    student1.name = @"Petya";
    student1.lastName = @"Kozloff";
    student1.phrase = @"Hi...";
    
    student2.name = @"Vasya";
    student2.lastName = @"Sidoroff";
    student2.phrase = @"Hi. I'm drinking vodka every day!";
    
    student3.name = @"Sashok";
    student3.lastName = @"Pukhan";
    student3.phrase = @"Sashok puknul v meshok!";
    
    student4.name = @"Andrey";
    student4.lastName = @"Naturalov";
    student4.phrase = @"Andrey is not gay";
    
    student5.name = @"Anton";
    student5.lastName = @"Antonov";
    student5.phrase = @"Anton is not ... You know";
    
    student6.name = @"Dima";
    student6.lastName = @"Nupiker";
    student6.phrase = @"Wassup fools";
    
    student7.name = @"Kolya";
    student7.lastName = @"Dimitrov";
    student7.phrase = @"Hi.How are you?";
    
    student8.name = @"Docya";
    student8.lastName = @"Poroshkova";
    student8.phrase = @"Deshevle v dva raza";
    
    student9.name = @"Mr.Proper";
    student9.lastName = @"KEK";
    student9.phrase = @"Mr.Proper veseley a Andryukha gay%)";
    
    student10.name = @"Petya";
    student10.lastName = @"Nemiroff";
    student10.phrase = @"SALE SALE SALE!!! BUY VODKA";
    
    NSDictionary* journal = [NSDictionary dictionaryWithObjectsAndKeys:
                             student1,[student1.name stringByAppendingString:student1.lastName],
                             student2,[student2.name stringByAppendingString:student2.lastName],
                             student3,[student3.name stringByAppendingString:student3.lastName],
                             student4,[student4.name stringByAppendingString:student4.lastName],
                             student5,[student5.name stringByAppendingString:student5.lastName],
                             student6,[student6.name stringByAppendingString:student6.lastName],
                             student7,[student7.name stringByAppendingString:student7.lastName],
                             student8,[student8.name stringByAppendingString:student8.lastName],
                             student9,[student9.name stringByAppendingString:student9.lastName],
                             student10,[student10.name stringByAppendingString:student10.lastName],
                             nil];
    
    
    
    NSArray* sortedJournal = [journal keysSortedByValueUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [[obj1 name] compare:[obj2 name]];
    }];
    
    
    for (NSString* key in sortedJournal) {
        Students* value = [journal objectForKey:key];
        NSLog(@"Student %@ say:  %@ ", [value.name stringByAppendingString:value.lastName], value.phrase);
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
