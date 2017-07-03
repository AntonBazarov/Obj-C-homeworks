//
//  Patient.h
//  day4_homework_12_Blocks(part2)
//
//  Created by Predki on 24.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Patient : NSObject

@property(strong, nonatomic) NSString* name;
@property(assign, nonatomic) CGFloat temperature;
@property(copy, nonatomic) void (^patientBlock)(void);

-(void) iFeelBad;
-(void) takePill;
-(void) makeShot;

@end
