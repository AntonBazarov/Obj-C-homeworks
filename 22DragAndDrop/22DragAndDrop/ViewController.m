//
//  ViewController.m
//  22DragAndDrop
//
//  Created by Predki on 04.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ViewController.h"
#import "ABZCell.h"
#import "ABZChecker.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *board;
@property(strong, nonatomic) NSDictionary *cells;
@property(strong, nonatomic) NSArray *checkers;
@property(weak, nonatomic) ABZChecker *checkerToMove;
@property(assign, nonatomic) CGRect oldFrame;

 @end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.board.layer.borderColor = [self borderColor];
    self.board.layer.borderWidth = 4.f;

    
    [self centerBoardAndMakeItSquare];
    [self generateAllCells];
    [self createCheckers];
    
    
}

-(void)createCheckers{
    NSMutableArray *checkers = [NSMutableArray array];
    for (int i = 0; i < 12; i++) {
        NSInteger row = (int)i/4;
        NSInteger index = (row % 2) == 0 ? (i*2) + 1 : (i*2) + 2;
        ABZChecker *blackChecker = [[ABZChecker alloc] initWithFrame:((ABZCell *)self.cells[@(index)]).view.frame];
        blackChecker.color = ABZCheckerColorBlack;
        blackChecker.boardCellIndex = index;
        [self.board addSubview:blackChecker];
        [checkers addObject:blackChecker];
        
        int origin = 5*8;
        index = (row % 2) == 0 ? (i*2) + 2 : (i*2) + 1;
        ABZChecker *whiteChecker = [[ABZChecker alloc] initWithFrame:((ABZCell *)self.cells[@(index + origin)]).view.frame];
        whiteChecker.color = ABZCheckerColorWhite;
        whiteChecker.boardCellIndex = index + origin;
        [self.board addSubview:whiteChecker];
        [checkers addObject:whiteChecker];
    }
    self.checkers = checkers;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.board];
    UIView *view = [self.board hitTest:point withEvent:event];
    if ([view isKindOfClass:[ABZChecker class]]){
        [self.board bringSubviewToFront:view];
        self.checkerToMove = (ABZChecker *)view;
        self.oldFrame = self.checkerToMove.frame;
    } else {
        self.checkerToMove = nil;
    }
    
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    if (self.checkerToMove) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.board];
        self.checkerToMove.center = point;
        
        
    }
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.board];
    for (ABZCell *cell in self.cells.allValues) {
        if([cell isPointInside:point] && [self isCellAtIndexFree:cell.index]){
            NSLog(@"Шашка брошена в индекс = %zd", cell.index);
            if(cell.color == ABZCellColorBlack) {
                self.checkerToMove.center = cell.view.center;
                self.checkerToMove.boardCellIndex = cell.index;
                
                return;
            }
            if (cell.color == ABZCellColorWhite) {
                if ([self nearestFreeBlackIndex:cell.index] != -1) {
                    NSLog(@"index = %zd", [self nearestFreeBlackIndex:cell.index]);
                    ABZCell *newBlackFreeCell = self.cells[@([self nearestFreeBlackIndex:cell.index])];
                    [UIView animateWithDuration:0.24f animations:^{
                        self.checkerToMove.center = newBlackFreeCell.view.center;
                    }];
                    self.checkerToMove.boardCellIndex = newBlackFreeCell.index;
                    return;
                }
               
            }
        }
    }
    [UIView animateWithDuration:0.24f animations:^{
        self.checkerToMove.frame = self.oldFrame;
    }];
  
    self.checkerToMove = nil;
}

-(NSInteger)nearestFreeBlackIndex:(NSInteger) index {
    NSInteger top = index - 8;
    NSInteger bot = index + 8;
    NSInteger right = index + 1;
    NSInteger left = index - 1;
    NSInteger col = index % 8;
    NSInteger row = index / 8;
    if (col == 0) {
        row -= 1;
    }
    if ([self isCellAtIndexFree:top] && row != 0) {
        return top;
    }
    if ([self isCellAtIndexFree:bot] && row != 7) {
        return bot;
    }
    if ([self isCellAtIndexFree:right] && (col != 0)) {
        return right;
    }
    if ([self isCellAtIndexFree:left] && (col != 1)) {
        return left;
    }
    return -1;
}

-(BOOL)isCellAtIndexFree:(NSInteger) index  {
    for (ABZChecker *checker in self.checkers) {
        if(index == checker.boardCellIndex) {
            return NO;
        }
    }
    return YES;
}

- (CGColorRef)borderColor {
    return [[UIColor colorWithRed:0.27 green:0.16 blue:0.51 alpha:1.0] CGColor];
}

- (UIColor *)blackColor {
    return [UIColor colorWithRed:0.18 green:0.01 blue:0.39 alpha:1.0];
}

- (UIColor *)whiteColor {
    return [UIColor colorWithRed:0.80 green:0.80 blue:1.00 alpha:1.0];
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
        ABZCell *cell = [self createCellForIndex:i];
        [self.board addSubview:cell.view];
        [cells setObject:cell forKey:@(i)];
    }
    self.cells = cells;
}

-(ABZCell *)createCellForIndex:(NSInteger) index {
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
    UIView *cellView = [[UIView alloc] initWithFrame:CGRectMake(x, y, size, size)];
    cellView.backgroundColor = ((col + row) % 2) == 0 ? [self blackColor] : [self whiteColor];
    ABZCell *cell = [ABZCell new];
    cell.view = cellView;
    cell.index = index;
    cell.color = ((col + row) % 2) == 0 ? ABZCellColorBlack : ABZCellColorWhite;
    return cell;
}


@end
