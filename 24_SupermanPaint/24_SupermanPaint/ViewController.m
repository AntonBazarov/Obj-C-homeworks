//
//  ViewController.m
//  24_SupermanPaint
//
//  Created by Predki on 06.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (assign, nonatomic) CGPoint lastPoint;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    self.lastPoint = point;
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.paintGo.image drawInRect:rect];
    CGContextRef paint = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(paint, [UIColor colorWithRed:0.33 green:0.13 blue:0.73 alpha:1.0].CGColor);
    CGContextSetLineWidth(paint, 4.f);
    CGContextSetLineCap(paint, kCGLineCapRound);
    CGContextBeginPath(paint);
    CGContextMoveToPoint(paint, self.lastPoint.x, self.lastPoint.y);
    CGContextAddLineToPoint(paint, point.x, point.y);
    CGContextStrokePath(paint);
    self.paintGo.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.lastPoint = point;
}

@end
