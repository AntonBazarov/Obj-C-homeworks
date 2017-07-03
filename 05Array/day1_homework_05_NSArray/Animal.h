//
//  Animal.h
//  day1_homework_05_NSArray
//
//  Created by Predki on 21.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animal : NSObject
@property (strong, nonatomic) NSString* who;
@property (strong, nonatomic) NSString* skinColor;
@property (strong, nonatomic) NSString* monicker;
@property (assign, nonatomic) NSInteger howManyLives;

-(void) animalMovement;

@end
