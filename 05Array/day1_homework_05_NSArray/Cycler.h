//
//  Cycler.h
//  day1_homework_05_NSArray
//
//  Created by Predki on 21.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Human.h"
#import "Jumpers.h"

@interface Cycler : Human <Jumpers>

@property (assign, nonatomic) CGFloat heightJump;


@end
