//
//  BadDoctor.h
//  day3_homework_09_Degates
//
//  Created by Predki on 23.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PatientDelegate;

@interface BadDoctor : NSObject <PatientDelegate>

@property (assign, nonatomic) int headCount;
@property (assign, nonatomic) int stomachCount;
@property (assign, nonatomic) int handCount;
@property (assign, nonatomic) int neckCount;
@property (assign, nonatomic) int eyeCount;

@property (assign, nonatomic) BOOL rateReport;
@property (assign, nonatomic) int patientCount;
-(void) badDoctorReport;

@end
