//
//  StudentTwo.h
//  day5_homework_13_Threads
//
//  Created by Predki on 25.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentTwo : NSObject


@property(strong,nonatomic) NSString* name;
@property(assign, nonatomic) double finishTime;


-(void) guessNumber:(NSUInteger) requiredNumber range:(NSUInteger) range block:(void(^)(void)) block;

@end
