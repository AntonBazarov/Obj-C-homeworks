//
//  ViewController.m
//  22DragAndDrop
//
//  Created by Predki on 04.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ViewController.h"
#import "ABZCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *board;
@property(strong, nonatomic) NSDictionary *cells;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self centerBoardAndMakeItSquare];
    [self generateAllCells];
}

- (UIInterfaceOrientation)interfaceOrientation {
    return (UIInterfaceOrientation) UIInterfaceOrientationMaskAll;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self centerBoardAndMakeItSquare];
}

- (void)centerBoardAndMakeItSquare {
    CGFloat width = self.view.frame.size.width;
    CGFloat height =  self.view.frame.size.height;
    CGFloat size = (width < height) ? width : height;
    CGFloat margin = 16.f;
    self.board.frame = CGRectMake(0, 0, size - margin, size - margin);
    self.board.center = self.view.center;
}

-(void)generateAllCells{
    NSMutableDictionary *cells = [NSMutableDictionary dictionary];
    for (int i = 1; i <= 64; i++) {
        UIView *cellView = [self createCellViewForIndex:i];
        [self.board addSubview:cellView];
        ABZCell *cell = [ABZCell new];
        cell.view = cellView;
        [cells setObject:cell forKey:@(i)];
    }
    self.cells = cells;
}

-(UIView *)createCellViewForIndex:(NSInteger) index {
    NSInteger row = index / 8;
    NSInteger col = index % 8;
    if (col != 0){
        row += 1;
    } else {
        col = 8;
    }
    CGFloat size = CGRectGetWidth(self.board.frame) / 8;
    
    CGFloat x = (col - 1) * size;
    CGFloat y = (row - 1) * size;
    UIView *cell = [[UIView alloc] initWithFrame:CGRectMake(x, y, size, size)];
    cell.backgroundColor = ((col + row) % 2) == 0 ? [UIColor blackColor] : [UIColor colorWithRed:1.00 green:1.00 blue:0.80 alpha:1.0];
    return cell;
}


@end
