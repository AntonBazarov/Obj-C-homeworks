//
//  Runners.h
//  day1_homework_05_NSArray
//
//  Created by Predki on 22.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Runners <NSObject>
@required

@property (assign,nonatomic) CGFloat speed;
-(void) run;
-(void) sayHelloRunners;


@optional
@property (strong, nonatomic) NSString* snickerFirm;
-(void) doYouLike;

@end
