//
//  ChessBoard.h
//  UIViewGeometry_Superman
//
//  Created by Predki on 31.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChessBoard : UIView

@property(strong, nonatomic) NSArray* cellsForBoard;
@property(strong, nonatomic) UIColor* blackColor;
@property(strong, nonatomic) UIColor* whiteColor;

-(void)createCellForBoard:(CGRect) frame;
-(void)layoutCells;
-(CGPoint)convert:(NSInteger) index sizeOf:(NSInteger) size;
- (CGRect) checker:(NSInteger) index;
@end
