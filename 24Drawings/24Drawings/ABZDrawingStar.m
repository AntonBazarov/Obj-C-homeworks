//
//  ABZDrawingStar.m
//  24Drawings
//
//  Created by Predki on 06.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ABZDrawingStar.h"


@implementation ABZDrawingStar

- (void)drawRect:(CGRect)rect {
    [self drawStarWithCenter:CGPointMake(100, 100)];
}

-(void)drawStarWithCenter:(CGPoint) centerStar {
    CGPoint point1 = CGPointMake(centerStar.x - 60, centerStar.y);
    CGPoint point2 = CGPointMake(centerStar.x + 60, centerStar.y);
    CGPoint point3 = CGPointMake(centerStar.x - 45, centerStar.y + 80);
    CGPoint point4 = CGPointMake(centerStar.x, centerStar.y - 40);
    CGPoint point5 = CGPointMake(centerStar.x + 45, centerStar.y + 80);

    CGContextRef contextStarLine = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(contextStarLine, [UIColor colorWithRed:0.33 green:0.13 blue:0.73 alpha:1.0].CGColor);
    
    CGContextSetLineWidth(contextStarLine, 4.f);
    CGContextSetLineCap(contextStarLine, kCGLineCapRound);
    // Line 1
    CGContextMoveToPoint(contextStarLine, point1.x, point1.y);
    CGContextAddLineToPoint(contextStarLine, point2.x, point2.y);
    // Line 2
    CGContextMoveToPoint(contextStarLine, point2.x, point2.y);
    CGContextAddLineToPoint(contextStarLine, point3.x, point3.y);
    // Line 3
    CGContextMoveToPoint(contextStarLine, point3.x, point3.y);
    CGContextAddLineToPoint(contextStarLine, point4.x, point4.y);
    // Line 4
    CGContextMoveToPoint(contextStarLine, point4.x, point4.y);
    CGContextAddLineToPoint(contextStarLine, point5.x, point5.y);
    // Line 5
    CGContextMoveToPoint(contextStarLine, point5.x, point5.y);
    CGContextAddLineToPoint(contextStarLine, point1.x, point1.y);

    CGContextStrokePath(contextStarLine);

    
    
    
    // Create Arc 1
    CGContextRef contextArc1 = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(contextArc1, [UIColor colorWithRed:0.33 green:0.13 blue:0.73 alpha:1.0].CGColor);
    CGContextAddArc(contextArc1, point1.x - 8, point1.y, 8.f, -M_PI, M_PI * 2, NO);
    CGContextStrokePath(contextArc1);
    // Create Arc 2
    CGContextRef contextArc2 = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(contextArc2, [UIColor colorWithRed:0.33 green:0.13 blue:0.73 alpha:1.0].CGColor);
    CGContextAddArc(contextArc2, point2.x + 8, point2.y, 8.f, -M_PI, M_PI * 2, NO);
    CGContextStrokePath(contextArc2);
    // Create Arc 3
    CGContextRef contextArc3 = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(contextArc3, [UIColor colorWithRed:0.33 green:0.13 blue:0.73 alpha:1.0].CGColor);
    CGContextAddArc(contextArc3, point3.x - 8, point3.y + 8, 8.f, -M_PI, M_PI * 2, NO);
    CGContextStrokePath(contextArc3);
    // Create Arc 4
    CGContextRef contextArc4 = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(contextArc4, [UIColor colorWithRed:0.33 green:0.13 blue:0.73 alpha:1.0].CGColor);
    CGContextAddArc(contextArc4, point4.x, point4.y - 8, 8.f, -M_PI, M_PI * 2, NO);
    CGContextStrokePath(contextArc4);
    // Create Arc 5
    CGContextRef contextArc5 = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(contextArc5, [UIColor colorWithRed:0.33 green:0.13 blue:0.73 alpha:1.0].CGColor);
    CGContextAddArc(contextArc5, point5.x + 8, point5.y + 8, 8.f, -M_PI, M_PI * 2, NO);
    CGContextStrokePath(contextArc5);
    // line for centr in arc's
    CGContextRef contextCenterArcLine = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(contextStarLine, [UIColor colorWithRed:0.33 green:0.13 blue:0.73 alpha:1.0].CGColor);
    CGContextSetLineWidth(contextCenterArcLine, 2.f);
    CGContextSetLineCap(contextCenterArcLine, kCGLineCapRound);
    // Line 1
    CGContextMoveToPoint(contextCenterArcLine, point1.x - 8, point1.y);
    CGContextAddLineToPoint(contextCenterArcLine, point4.x, point4.y - 8);
    // Line 2
    CGContextMoveToPoint(contextCenterArcLine, point4.x, point4.y - 8);
    CGContextAddLineToPoint(contextCenterArcLine, point2.x + 8, point2.y);
    // Line 3
    CGContextMoveToPoint(contextCenterArcLine, point2.x + 8, point2.y);
    CGContextAddLineToPoint(contextCenterArcLine, point5.x + 8, point5.y + 8);
    // Line 4
    CGContextMoveToPoint(contextCenterArcLine, point5.x + 8, point5.y + 8);
    CGContextAddLineToPoint(contextCenterArcLine, point3.x - 8, point3.y + 8);
    // Line 5
    CGContextMoveToPoint(contextCenterArcLine, point3.x - 8, point3.y + 8);
    CGContextAddLineToPoint(contextCenterArcLine, point1.x - 8, point1.y);
    CGContextStrokePath(contextCenterArcLine);
}


@end
