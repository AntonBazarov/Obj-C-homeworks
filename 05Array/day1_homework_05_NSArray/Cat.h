//
//  Cat.h
//  day1_homework_05_NSArray
//
//  Created by Predki on 21.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Animal.h"
#import "Jumpers.h"

@interface Cat : Animal <Jumpers>
@property (assign, nonatomic) CGFloat heightJump;

@end
