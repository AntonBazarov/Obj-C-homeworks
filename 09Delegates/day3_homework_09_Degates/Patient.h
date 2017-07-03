//
//  Patient.h
//  day3_homework_09_Degates
//
//  Created by Predki on 23.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol PatientDelegate;


@interface Patient : NSObject

//typedef enum {
//    head,
//    stomach,
//    hand,
//    neck,
//    eye
//} bodyParts;


@property (strong, nonatomic) NSString* name;
//@property (assign, nonatomic) bodyParts bodyParts;
@property (assign, nonatomic) BOOL doctorIsGood;

@property (assign, nonatomic) CGFloat temperature;
//@property (assign, nonatomic) BOOL headache;
//@property (assign, nonatomic) BOOL stomachAche;

@property (weak, nonatomic) id <PatientDelegate> delegate;

-(BOOL) iFeelBad;
-(BOOL) iFeelBadDoctorBad;
//-(BOOL) iFeelBadFriend;


@end

@protocol PatientDelegate <NSObject>

-(void) patientFeelBad:(Patient*) patient;
-(void) patientFeelBadDoctorBad:(Patient*) patient;

//-(void) patientFeelBadFriend:(Patient*) patient;

@end
