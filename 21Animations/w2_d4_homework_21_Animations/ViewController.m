//
//  ViewController.m
//  w2_d4_homework_21_Animations
//
//  Created by Predki on 01.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong, nonatomic) UIView *viewOne;
@property(strong, nonatomic) UIView *viewTwo;
@property(strong, nonatomic) UIView *viewThree;
@property(strong, nonatomic) UIView *viewFour;

@property(weak, nonatomic) UIImageView *imageView;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat x = self.view.bounds.origin.x;
    CGFloat y = self.view.bounds.origin.y;
    CGFloat width = 70;
    CGFloat dx = CGRectGetMaxX(self.view.bounds) - width;
    CGFloat dy = CGRectGetMaxY(self.view.bounds) - width;
    self.viewOne = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, width)];
    self.viewOne.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.viewOne];
    
    self.viewTwo = [[UIView alloc] initWithFrame:CGRectMake(dx, y, width, width)];
    self.viewTwo.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.viewTwo];
    
    self.viewThree = [[UIView alloc] initWithFrame:CGRectMake(x, dy, width, width)];
    self.viewThree.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.viewThree];
    
    self.viewFour = [[UIView alloc] initWithFrame:CGRectMake(dx, dy, width, width)];
    self.viewFour.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.viewFour];
 
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 220, 400)];
    image.backgroundColor = [UIColor clearColor];
        
    UIImage* img1 = [UIImage imageNamed:@"111.png"];
    UIImage* img2 = [UIImage imageNamed:@"222.png"];
    UIImage* img3 = [UIImage imageNamed:@"333.png"];
    NSArray* images = [[NSArray alloc] initWithObjects:img1, img2, img3, img2, nil];
    image.animationImages = images;
    image.animationDuration = 1.2f;
    [image startAnimating];
        
    [self.view addSubview:image];
    self.imageView = image;
    

    
}


-(UIColor*)randomColor {
    CGFloat red = (arc4random() % 100)/100.f;
    CGFloat green = (arc4random() % 100)/100.f;
    CGFloat blue = (arc4random() % 100)/100.f;
    return [[UIColor alloc] initWithRed:red green:green blue:blue alpha:1.0f];
}



-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    __block UIColor* oneColor = self.viewOne.backgroundColor;
    __block UIColor* twoColor = self.viewTwo.backgroundColor;
    __block UIColor* threeColor = self.viewThree.backgroundColor;
    __block UIColor* fourColor = self.viewFour.backgroundColor;
    
    __block CGPoint oneCenter = self.viewOne.center;
    __block CGPoint twoCenter = self.viewTwo.center;
    __block CGPoint threeCenter = self.viewThree.center;
    __block CGPoint fourCenter = self.viewFour.center;
    
    __block int i = arc4random() % 2;
    [UIView animateWithDuration:7.0f
                          delay:1.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                            if (i == 0) {
                             self.viewOne.center = twoCenter;
                             self.viewOne.backgroundColor = twoColor;
                             self.viewTwo.center = fourCenter;
                             self.viewTwo.backgroundColor = fourColor;
                             self.viewThree.center = oneCenter;
                             self.viewThree.backgroundColor = oneColor;
                             self.viewFour.center = threeCenter;
                             self.viewFour.backgroundColor = threeColor;
                         } else {
                             self.viewOne.center = threeCenter;
                             self.viewOne.backgroundColor = threeColor;
                             self.viewTwo.center = oneCenter;
                             self.viewTwo.backgroundColor = oneColor;
                             self.viewThree.center = fourCenter;
                             self.viewThree.backgroundColor = fourColor;
                             self.viewFour.center = twoCenter;
                             self.viewFour.backgroundColor = twoColor;
                         }
                     }
                     completion:^(BOOL finished) {
                         //[self reapetFunc];
                         NSLog(@"Клевая анимашка");
                     }];
    
    
}

-(CGPoint)pointMake:(UIView*) currentView {
    CGFloat x = CGRectGetWidth(self.view.bounds) - CGRectGetWidth(currentView.frame) /2;
    CGFloat y = currentView.center.y;
    return CGPointMake(x, y);
}

-(void)reapetFunc {
    __block UIColor* oneColor = self.viewOne.backgroundColor;
    __block UIColor* twoColor = self.viewTwo.backgroundColor;
    __block UIColor* threeColor = self.viewThree.backgroundColor;
    __block UIColor* fourColor = self.viewFour.backgroundColor;
    
    __block CGPoint oneCenter = self.viewOne.center;
    __block CGPoint twoCenter = self.viewTwo.center;
    __block CGPoint threeCenter = self.viewThree.center;
    __block CGPoint fourCenter = self.viewFour.center;
    
    __block int i = arc4random() % 2;
    [UIView animateWithDuration:3.0f
                          delay:1.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         if (i == 0) {
                             self.viewOne.center = twoCenter;
                             self.viewOne.backgroundColor = twoColor;
                             self.viewTwo.center = fourCenter;
                             self.viewTwo.backgroundColor = fourColor;
                             self.viewThree.center = oneCenter;
                             self.viewThree.backgroundColor = oneColor;
                             self.viewFour.center = threeCenter;
                             self.viewFour.backgroundColor = threeColor;
                         } else {
                             self.viewOne.center = threeCenter;
                             self.viewOne.backgroundColor = threeColor;
                             self.viewTwo.center = oneCenter;
                             self.viewTwo.backgroundColor = oneColor;
                             self.viewThree.center = fourCenter;
                             self.viewThree.backgroundColor = fourColor;
                             self.viewFour.center = twoCenter;
                             self.viewFour.backgroundColor = twoColor;
                         }
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"Клевая анимашка");
                     }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
