//
//  Doctor.m
//  day3_homework_09_Degates
//
//  Created by Predki on 23.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Doctor.h"
#import "Patient.h"


@implementation Doctor
/*
-(void) patientFeelBad:(Patient*) patient {
    if ((patient.temperature > 38.f) && (patient.headache == YES)) {
        NSLog(@"Patient %@.Say: I feel bad! \nDoctor say: wow.. You have the flu! You need hospitalization!", patient.name);
    } else if ((patient.temperature < 37.f) && (patient.headache == YES)) {
        NSLog(@"Patient %@.Say: I feel bad! \nDoctor say: Trivia. The head is not asshole, bandages, go to bed :)", patient.name);
    } else if ((patient.temperature > 38.f) && (patient.stomachAche == YES)) {
        NSLog(@"Patient %@.Say: I feel bad! \nDoctor say: You have the poisoning! You need hospitalization!", patient.name);
    } else if ((patient.temperature < 37.f) && (patient.stomachAche == YES)) {
        NSLog(@"Patient %@.Say: I feel bad! \nDoctor say: Trivia. Take a \"НОШПА\"", patient.name);
    } else if ((patient.temperature > 37.f) && (patient.stomachAche == YES) && (patient.headache == YES)) {
        NSLog(@"Patient %@.Say: I feel bad! \nDoctor say: You need hospitalization!!! ", patient.name);
    } else if ((patient.stomachAche == YES) && (patient.headache == YES)) {
        NSLog(@"Patient %@.Say: I feel bad! \nDoctor say: You need hospitalization!!! ", patient.name);
    } else {
        NSLog(@"Patient %@.Say: I feel bad! \nDoctor say: Don't worry", patient.name);
    }
}
*/

-(void) patientFeelBad:(Patient*) patient {
    if (patient.bodyParts == head) {
        NSLog(@"Patient %@.Say: Headache! / Doctor say: Hmmm.. make a shot for a headache!", patient.name);
        NSLog(@" ");
    } else if (patient.bodyParts == neck) {
        NSLog(@"Patient %@.Say: neckache! / Doctor say: Hmmm.. make a shot for a neckache", patient.name);
        NSLog(@" ");
    } else if (patient.bodyParts == hand) {
        NSLog(@"Patient %@.Say: handache! / Doctor say: Hmmm.. make a shot for a handache!", patient.name);
        NSLog(@" ");
    } else if (patient.bodyParts == stomach) {
        NSLog(@"Patient %@.Say: stomachache! / Doctor say: Hmmm.. make a shot for a stomachache!", patient.name);
        NSLog(@" ");
    } else if (patient.bodyParts == eye) {
        NSLog(@"Patient %@.Say: eyeache! / Doctor say: Hmmm.. make a shot for a eyeache!", patient.name);
        NSLog(@" ");
    }
}


//-(void) report {
//    NSLog(@"\n***REPORT***\n%d - Headache \n%d - neckache \n%d - handache \n%d - stomachache \n%d - eyeache", self.headCount, self.neckCount, self.handCount, self.stomachCount, self.eyeCount);
//    
//}


    
@end
