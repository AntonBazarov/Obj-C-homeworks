//
//  Student.h
//  day5_homework_15_Bits
//
//  Created by Predki on 25.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    StudentStudiesSubjectMath        = 1 << 0,
    StudentStudiesSubjectPhysics     = 1 << 1,
    StudentStudiesSubjectChemistry   = 1 << 2,
    StudentStudiesSubjectGeometry    = 1 << 3,
    StudentStudiesSubjectHistory     = 1 << 4,
    StudentStudiesSubjectEnglish     = 1 << 5,
    StudentStudiesSubjectArt         = 1 << 6,
    StudentStudiesSubjectProgramming = 1 << 7
    
} StudentStudiesSubjects;

@interface Student : NSObject
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) StudentStudiesSubjects studiesSubject;

@end
