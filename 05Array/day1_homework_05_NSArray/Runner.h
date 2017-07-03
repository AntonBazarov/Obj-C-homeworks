//
//  Runner.h
//  day1_homework_05_NSArray
//
//  Created by Predki on 21.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Human.h"
#import "Runners.h"


@interface Runner : Human <Runners>

#pragma mark - Runners protocol

@property (assign,nonatomic) CGFloat speed;

@property (strong, nonatomic) NSString* snickerFirm;
@end
