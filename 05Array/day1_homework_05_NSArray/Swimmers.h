//
//  Swimmers.h
//  day1_homework_05_NSArray
//
//  Created by Predki on 22.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol Swimmers <NSObject>

@required
@property (strong, nonatomic) NSString* swim;
-(void) iCanSwim;
-(void) sayHelloSwimmers;

@optional
@property (strong, nonatomic) NSString* swimSuit;
-(void) swimButterfly;


@end
 
