//
//  Patient.m
//  day3_homework_09_Degates
//
//  Created by Predki on 23.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Patient.h"

@implementation Patient


-(BOOL) iFeelBad {
   // BOOL iFeelBad = arc4random() % 2;
    BOOL iFeelBad = YES;
    if (iFeelBad) {
        [self.delegate patientFeelBad:self];
    } else {
        NSLog(@"Patient %@ say: I'm fine doc!", self.name);
    }
    return iFeelBad;
}

-(BOOL) iFeelBadDoctorBad {
    BOOL iFeelBad = YES;
    if (iFeelBad) {
        [self.delegate patientFeelBadDoctorBad:self];
    }
    return iFeelBad;
}


@end
