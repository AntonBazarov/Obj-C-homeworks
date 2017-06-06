//
//  ABZDrawStarBezier.m
//  24Drawings
//
//  Created by Predki on 06.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ABZDrawStarBezier.h"

@implementation ABZDrawStarBezier

- (void)drawRect:(CGRect)rect {
 
    [self drawFiveSmallStarWithCenter:[self randomPoint]];
    [self drawFiveSmallStarWithCenter:[self randomPoint]];
    [self drawFiveSmallStarWithCenter:[self randomPoint]];
    [self drawFiveSmallStarWithCenter:[self randomPoint]];
    [self drawFiveSmallStarWithCenter:[self randomPoint]];
    
    

    
    
    
    [self drawStarWithCenter:CGPointMake(200, 200)];
    
    
}
-(CGPoint)randomPoint {
    CGFloat randomX = (arc4random() % 300) + 40;
    CGFloat randomY = (arc4random() % 500) + 40;
    return CGPointMake(randomX, randomY);
}

-(void)drawStarWithCenter:(CGPoint) centerStar {
    CGPoint point1 = CGPointMake(centerStar.x - 60, centerStar.y);
    CGPoint point2 = CGPointMake(centerStar.x + 60, centerStar.y);
    CGPoint point3 = CGPointMake(centerStar.x - 45, centerStar.y + 80);
    CGPoint point4 = CGPointMake(centerStar.x, centerStar.y - 40);
    CGPoint point5 = CGPointMake(centerStar.x + 45, centerStar.y + 80);
    UIBezierPath *star = [UIBezierPath bezierPath];
  
    
    [star moveToPoint:point1];
    [star addLineToPoint:point2];
    [star addLineToPoint:point3];
    [star addLineToPoint:point4];
    [star addLineToPoint:point5];
    [star closePath];
    
    star.lineWidth = 5;
    [[UIColor colorWithRed:0.33 green:0.13 blue:0.73 alpha:1.0] setStroke];
    [[UIColor colorWithRed:0.33 green:0.13 blue:0.73 alpha:1.0] setFill];
   
    
    [star stroke];
    [star fill];
}
-(void)drawFiveSmallStarWithCenter:(CGPoint) centerStar {
    CGPoint point1 = CGPointMake(centerStar.x - 20, centerStar.y);
    CGPoint point2 = CGPointMake(centerStar.x + 20, centerStar.y);
    CGPoint point3 = CGPointMake(centerStar.x - 10, centerStar.y + 35);
    CGPoint point4 = CGPointMake(centerStar.x, centerStar.y - 15);
    CGPoint point5 = CGPointMake(centerStar.x + 10, centerStar.y + 35);
    UIBezierPath *star = [UIBezierPath bezierPath];
    
    
    [star moveToPoint:point1];
    [star addLineToPoint:point2];
    [star addLineToPoint:point3];
    [star addLineToPoint:point4];
    [star addLineToPoint:point5];
    [star closePath];
    
    star.lineWidth = 5;
    [[UIColor colorWithRed:0.22 green:0.85 blue:0.70 alpha:1.0] setStroke];
    [[UIColor colorWithRed:0.22 green:0.85 blue:0.70 alpha:1.0] setFill];
    
    
    [star stroke];
    [star fill];
}

    
    


@end
