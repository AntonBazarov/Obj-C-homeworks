//
//  ViewController.m
//  w2_day1_homework_19_UIViewGeometry
//
//  Created by Predki on 29.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray* cellArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor* bazColor = [[UIColor alloc] initWithRed:0.29 green:0.07 blue:0.47 alpha:1.0f];
//    UIView* darkBackground = [[UIView alloc] init];
//    darkBackground = [self makeViewRect:CGRectMake(16, 100, 288, 288) setViewColor:bazColor parrentViews:self.view];
//    
    UIView* whiteBackground = [[UIView alloc] init];
    whiteBackground = [self makeViewRect:[self centerView] setViewColor:[UIColor whiteColor] parrentViews:self.view];
    self.cellArray = [NSMutableArray array];
    
    CGRect darkRect = [self createDarkCell];
    
    
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 4; j++) {
            UIView* darkCell = [[UIView alloc] init];
            darkCell = [self makeViewRect:darkRect setViewColor:bazColor parrentViews:whiteBackground];
            darkRect.origin.x += 2*darkRect.size.width;
            [self.cellArray addObject:darkCell];
        }
        if (i%2) {
            darkRect.origin.x = 0;
        } else {
            darkRect.origin.x = darkRect.size.width;
        }
        
        darkRect.origin.y += darkRect.size.width;
    }

    CGRect chessRect = [self createChess];
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 4; j++){
            if (i < 3) {
                UIView* whiteChess = [[UIView alloc] init];
                whiteChess = [self makeViewRect:chessRect setViewColor:[UIColor whiteColor] parrentViews:self.view];
                chessRect.origin.x += 80;
                (i%2) == 0 ? (chessRect.origin.x = 10) : (chessRect.origin.x = 50);
                chessRect.origin.y += 80;
            } else if (i > 4) {
                UIView* redChess = [[UIView alloc] init];
                redChess = [self makeViewRect:chessRect setViewColor:[UIColor redColor] parrentViews:self.view];
                chessRect.origin.x += 80;
                (i%2) == 0 ? (chessRect.origin.x = 10) : (chessRect.origin.x = 50);
                chessRect.origin.y += 80;
            } else {
                chessRect.origin.y += 80;
            }

            }
    }



}




-(UIInterfaceOrientationMask) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
    
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    UIColor* anyColor = [[UIColor alloc] initWithRed:((arc4random() % 80 + 21) * 0.01f)
                                               green:((arc4random() % 80 + 21) * 0.01f)
                                                blue:((arc4random() % 80 + 21) * 0.01f)
                                               alpha:1.0f];
    
    for (UIView* anyCell in self.cellArray) {
        anyCell.backgroundColor = anyColor;
    }
}
-(CGRect) createChess {
    CGRect chess;
    chess.origin.x = 10;
    chess.origin.y = (self.view.bounds.size.height/2 - self.view.bounds.size.width/2) + 10;
    chess.size.height = self.view.bounds.size.width / 16;
    chess.size.width = self.view.bounds.size.width / 16;
    return chess;
}

-(CGRect) createDarkCell {
    CGRect cell;
    cell.origin.x = 0;
    cell.origin.y = 0;
    cell.size.height = self.view.bounds.size.width / 8;
    cell.size.width = self.view.bounds.size.width / 8;
    return cell;
}

-(CGRect) centerView {
    CGRect centerPoint;
    centerPoint.origin.x = 0;
    centerPoint.origin.y = self.view.bounds.size.height/2 - self.view.bounds.size.width/2;
    centerPoint.size.height = self.view.bounds.size.width;
    centerPoint.size.width = self.view.bounds.size.width;
    return centerPoint;
}


-(UIView*) makeViewRect:(CGRect) viewRect setViewColor:(UIColor*) viewColor parrentViews:(UIView*) parrentView {
    UIView* viewLocal = [[UIView alloc] initWithFrame:viewRect];
    viewLocal.backgroundColor = viewColor;
    [parrentView addSubview:viewLocal];
    viewLocal.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin
                               | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    return viewLocal;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
