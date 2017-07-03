//
//  AppDelegate.m
//  day5_homework_15_Bits
//
//  Created by Predki on 25.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "AppDelegate.h"
#include "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    Student* student1 = [[Student alloc] init];
    student1.name = @"Vasya";
    student1.studiesSubject = StudentStudiesSubjectMath | StudentStudiesSubjectPhysics
                                |StudentStudiesSubjectChemistry | StudentStudiesSubjectGeometry;
    
    Student* student2 = [[Student alloc] init];
    student2.name = @"Dosya";
    student2.studiesSubject = StudentStudiesSubjectHistory | StudentStudiesSubjectEnglish
                                |StudentStudiesSubjectArt;
    
    Student* student3 = [[Student alloc] init];
    student3.name = @"Bazar Jr.";
    student3.studiesSubject = StudentStudiesSubjectProgramming;
    
    Student* student4 = [[Student alloc] init];
    student4.name = @"Kolya";
    student4.studiesSubject = StudentStudiesSubjectHistory | StudentStudiesSubjectProgramming
    |StudentStudiesSubjectChemistry;
    
    /*
    NSMutableArray* students = [[NSMutableArray alloc] initWithObjects:student1, student2, student3, student4, nil];
    int programmistCounter = 0;
    for (Student* anyStudent in students) {
        if (anyStudent.studiesSubject == StudentStudiesSubjectProgramming) {
            programmistCounter++;
            NSLog(@"Student %@ is programmist", anyStudent.name);
        } else if (anyStudent.studiesSubject == (StudentStudiesSubjectMath | StudentStudiesSubjectPhysics
                                                |StudentStudiesSubjectChemistry | StudentStudiesSubjectGeometry)) {
            
            NSLog(@"Student %@ is technician", anyStudent.name);
            
        } else if (anyStudent.studiesSubject == (StudentStudiesSubjectHistory | StudentStudiesSubjectEnglish
                                                 |StudentStudiesSubjectArt)) {
            
           NSLog(@"Student %@ is humanist))", anyStudent.name);
        } else {
            NSLog(@"Student %@ - not fish is not meat", anyStudent.name);
        }
    }
    NSLog(@"Programmist count = %d", programmistCounter);
     */
    
    NSMutableArray* students = [[NSMutableArray alloc] initWithObjects:student1, student2, student3, student4, nil];
    
    for (Student* anyStudent in students){
        if (anyStudent.studiesSubject & StudentStudiesSubjectHistory) {
            anyStudent.studiesSubject = anyStudent.studiesSubject ^ StudentStudiesSubjectHistory;
            NSLog(@"Student %@ studied history..", anyStudent.name);
        }
    }
    
    NSInteger randomNumber = arc4random() % INT32_MAX;
    NSMutableString* str = [NSMutableString stringWithFormat:@""];
    
    for (int i = 31; i >= 0; i--) {
        NSInteger bitMask = 1 << i;
        if ((randomNumber & bitMask) == 0 ) {
            [str appendString:@"0"];
        } else {
            [str appendString:@"1"];
        }
        if ((i + 1) % 8 == 0 & i != 31) {
            [str appendString:@" "];
        }
    }
    
    NSLog(@"randomNumber = %ld, BIT - %@", (long)randomNumber, str);
    
    
    
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
