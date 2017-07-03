//
//  Human.h
//  day1_homework_05_NSArray
//
//  Created by Predki on 21.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Human : NSObject 

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) CGFloat weight;
@property (assign, nonatomic) NSInteger height;
@property (strong, nonatomic) NSString* sex;

-(void) movement;



@end
