//
//  ChessBoard.m
//  UIViewGeometry_Superman
//
//  Created by Predki on 31.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ChessBoard.h"

@implementation ChessBoard

-(void)createCellForBoard:(CGRect) frame {
    self.blackColor = [[UIColor alloc] initWithRed:0.21 green:0.14 blue:0.11 alpha:0.5f];
    self.whiteColor = [[UIColor alloc] initWithRed:0.21 green:0.14 blue:0.11 alpha:0.2f];
    self.frame = frame;
    NSMutableArray* cells = [NSMutableArray array];
    
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8 ; j++) {
            UIView* cellForBoard = [[UIView alloc] initWithFrame:CGRectZero];
            cellForBoard.backgroundColor = ((i + j) % 2) == 0 ? self.blackColor : self.whiteColor;
            [cells addObject:cellForBoard];
            [self addSubview:cellForBoard];
        }
    }
    self.cellsForBoard = cells;
    [self layoutCells];
    
}
-(void)layoutCells{
    CGFloat sizeCell = self.bounds.size.width / 8;
    [self.cellsForBoard enumerateObjectsUsingBlock:^(UIView* cell, NSUInteger idx, BOOL *stop) {
        CGPoint origin = [self convert:idx+1 sizeOf:sizeCell];
        CGRect frame = CGRectMake(origin.x, origin.y, sizeCell, sizeCell);
        cell.frame = frame;
    }];
    
}

-(CGPoint)convert:(NSInteger) index sizeOf:(NSInteger) size{
    NSInteger y = index / 8;
    NSInteger x = index - (y*8) - 1;
    if (x<0) {
        x = 7;
        y = y - 1;
    }
    x = x * size;
    y = y * size;
    
    x = (self.bounds.origin.x + x);
    y = (self.bounds.origin.y + y);
    
    return CGPointMake(x, y);
}

- (CGRect) checker:(NSInteger) index {
    UIView* view = (UIView*)self.cellsForBoard[index];
    CGFloat indent = 10;
    CGFloat x = view.frame.origin.x + indent;
    CGFloat y = view.frame.origin.y + indent;
    CGFloat width = view.frame.size.width - (2*indent);
    CGRect frameChecker  = CGRectMake(x, y, width, width);
    return frameChecker;
    
}

@end
