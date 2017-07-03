//
//  Patient.m
//  day4_homework_12_Blocks(part2)
//
//  Created by Predki on 24.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Default";
        self.temperature = ((arc4random() % 5) + 36.6f);
        [self performSelector:@selector(iFeelBad) withObject:nil afterDelay:((arc4random() % 5 ) + 17)];
        
    }
    return self;
}
-(void) iFeelBad {
    NSLog(@"Patient %@  feels bad", self.name);
    self.patientBlock();
}
-(void) takePill {
    NSLog(@"Patient %@ take a pill", self.name);
}

-(void) makeShot {
    NSLog(@"Patient %@ make a shot", self.name);
}
@end
