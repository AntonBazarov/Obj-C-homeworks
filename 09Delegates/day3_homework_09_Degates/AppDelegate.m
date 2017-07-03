//
//  AppDelegate.m
//  day3_homework_09_Degates
//
//  Created by Predki on 23.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "AppDelegate.h"
#import "Patient.h"
#import "Doctor.h"
#import "Friend.h"
#import "BadDoctor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    Patient* patient1 = [[Patient alloc] init];
    patient1.name = @"Dima";
//    [patient1 setBodyParts:head];
//    patient1.doctorIsGood = YES;
    
    
    patient1.temperature = 36.6f;
//    patient1.headache = YES;
//    patient1.stomachAche = NO;
    
    Patient* patient2 = [[Patient alloc] init];
    patient2.name = @"Vasya";
//    [patient2 setBodyParts:stomach];
//    patient2.doctorIsGood = YES;
    
   patient2.temperature = 38.6f;
//    patient2.headache = YES;
//    patient2.stomachAche = NO;
    
    Patient* patient3 = [[Patient alloc] init];
    patient3.name = @"Gena";
//    [patient3 setBodyParts:neck];
//    patient3.doctorIsGood = NO;
    
    
      patient3.temperature = 39.6f;
//    patient3.headache = NO;
//    patient3.stomachAche = YES;
    
    Patient* patient4 = [[Patient alloc] init];
    patient4.name = @"Zoya";
//    [patient4 setBodyParts:hand];
//    patient4.doctorIsGood = YES;
    
    
    patient4.temperature = 36.6f;
//    patient4.headache = NO;
//    patient4.stomachAche = NO;
    
    Patient* patient5 = [[Patient alloc] init];
    patient5.name = @"Boroda";
//    [patient5 setBodyParts:eye];
//    patient5.doctorIsGood = NO;
    
    
    patient5.temperature = 39.6f;
//    patient5.headache = YES;
//    patient5.stomachAche = YES;
    
    Doctor* doc = [[Doctor alloc] init];
    
    
    patient1.delegate = doc;
    patient2.delegate = doc;
    patient3.delegate = doc;
    patient4.delegate = doc;
    patient5.delegate = doc;
    
    BadDoctor* badDoctor = [[BadDoctor alloc] init];
    patient1.delegate = badDoctor;
    patient2.delegate = badDoctor;
    patient3.delegate = badDoctor;
    patient4.delegate = badDoctor;
    patient5.delegate = badDoctor;
    
    badDoctor.headCount = 0;
    badDoctor.stomachCount = 0;
    badDoctor.handCount = 0;
    badDoctor.neckCount = 0;
    badDoctor.eyeCount = 0;
    
    
    
    NSArray* patiens = [[NSArray alloc] initWithObjects:patient1, patient2, patient3, patient4, patient5, nil];
    
/*
    for (Patient* patient in patiens) {
        if (patient.headache == YES){
            [patient setDelegate:doc];
            NSLog(@"Doctor asks: %@ are you ok?", patient.name);
            [patient iFeelBad];
        } else if ((patient.headache == NO) && (patient.stomachAche == NO)){
            [patient setDelegate:friend1];
            NSLog(@"Friend1 asks: %@ are you ok?", patient.name);
            [patient iFeelBadFriend];
        } else {
            [patient setDelegate:friend];
            NSLog(@"Friend asks: %@ are you ok?", patient.name);
            [patient iFeelBadFriend];
        }
}

    for (Patient* patient in patiens) {
        [patient iFeelBad];
    }
    [doc report];

    
    for (Patient* patient in patiens){
        [patient setDelegate:badDoctor];
        [patient iFeelBadDoctorBad];
        NSLog(@"Patient %@ say: my doctor is %@", patient.name, [patient doctorIsGood] ? @"good" : @"bad");
        NSLog(@" ");
    }
    [badDoctor badDoctorReport];
    
    for (id anyPatient in patiens) {
        if ([anyPatient doctorIsGood]){
            [anyPatient setDelegate:badDoctor];
            [anyPatient iFeelBadDoctorBad];
        } else {
            [anyPatient setDelegate:doc];
            [anyPatient iFeelBad];
        }
    }
 */
    
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
