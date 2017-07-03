//
//  Enum.h
//  day1_homework_06_DataTypes
//
//  Created by Predki on 21.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Enum : NSObject

typedef enum {
    red,
    green,
    blue
} Color;

typedef enum {
    mersedes,
    BMW,
    Audi
} Car;

@property (assign, nonatomic) Car car;
@property (assign, nonatomic) Color color;
@end
