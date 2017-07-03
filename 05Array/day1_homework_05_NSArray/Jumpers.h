//
//  Jumpers.h
//  day1_homework_05_NSArray
//
//  Created by Predki on 22.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Jumpers <NSObject>

@required
@property (assign, nonatomic) CGFloat heightJump;
-(void) jump;
-(void) sayHelloJumpers;

@optional
@property (assign, nonatomic) CGFloat record;
-(void) thereAreAchievements;

@end
