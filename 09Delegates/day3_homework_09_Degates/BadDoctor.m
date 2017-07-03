//
//  BadDoctor.m
//  day3_homework_09_Degates
//
//  Created by Predki on 23.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "BadDoctor.h"
#import "Patient.h"


@implementation BadDoctor

-(void) patientFeelBadDoctorBad:(Patient*) patient {
    if (patient.bodyParts == head) {
        NSLog(@"Patient %@.Say: Headache! / BAD Doctor say: wow.. take a pill for a headache!", patient.name);
        NSLog(@" ");
        _headCount++;
    } else if (patient.bodyParts == neck) {
        NSLog(@"Patient %@.Say: Neckache! / BAD Doctor say: wow.. take a pill for a neckache", patient.name);
        NSLog(@" ");
        _neckCount++;
    } else if (patient.bodyParts == hand) {
        NSLog(@"Patient %@.Say: Nandache! / BAD Doctor say: wow.. take a pill for a handache!", patient.name);
        NSLog(@" ");
        _handCount++;
    } else if (patient.bodyParts == stomach) {
        NSLog(@"Patient %@.Say: Stomachache! / BAD Doctor say: wow.. take a pill for a stomachache!", patient.name);
        NSLog(@" ");
        _stomachCount++;
    } else if (patient.bodyParts == eye) {
        NSLog(@"Patient %@.Say: Eyeache! / BAD Doctor say: wow.. take a pill for a eyeache!", patient.name);
        NSLog(@" ");
        _eyeCount++;
    }
}

-(void) badDoctorReport {
        NSLog(@"\n***REPORT***\n%d - Headache \n%d - neckache \n%d - handache \n%d - stomachache \n%d - eyeache", self.headCount, self.neckCount, self.handCount, self.stomachCount, self.eyeCount);

}

@end
