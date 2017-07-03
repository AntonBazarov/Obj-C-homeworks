//
//  Student.m
//  day5_homework_15_Bits
//
//  Created by Predki on 25.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Student.h"
#import <UIKit/UIKit.h>

@implementation Student


-(NSString*) answerByType:(StudentStudiesSubjects) type {
    return self.studiesSubject & type ? @"Yes" : @"No";
}

-(NSString*) description {
    return [NSString stringWithFormat: @"Student %@ studies:\n"
                                        "Math: %@\n"
                                        "Physics: %@\n"
                                        "Chemistry: %@\n"
                                        "Geometry: %@\n"
                                        "History: %@\n"
                                        "English: %@\n"
                                        "Art: %@\n"
                                        "Programming: %@\n",
                                        self.name,
                                        [self answerByType:StudentStudiesSubjectMath],
                                        [self answerByType:StudentStudiesSubjectPhysics],
                                        [self answerByType:StudentStudiesSubjectChemistry],
                                        [self answerByType:StudentStudiesSubjectGeometry],
                                        [self answerByType:StudentStudiesSubjectHistory],
                                        [self answerByType:StudentStudiesSubjectEnglish],
                                        [self answerByType:StudentStudiesSubjectArt],
                                        [self answerByType:StudentStudiesSubjectProgramming]];
    
}

@end
