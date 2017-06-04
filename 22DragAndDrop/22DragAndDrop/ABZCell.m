//
//  ABZCell.m
//  22DragAndDrop
//
//  Created by Predki on 04.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ABZCell.h"

@implementation ABZCell

-(BOOL)isPointInside:(CGPoint) point {
    CGFloat leftX = CGRectGetMinX(self.view.frame);
    CGFloat topY = CGRectGetMinY(self.view.frame);
    CGFloat rightX = CGRectGetMaxX(self.view.frame);
    CGFloat botY = CGRectGetMaxY(self.view.frame);
    CGFloat x = point.x;
    CGFloat y = point.y;
    if (leftX <= x && topY <= y && rightX >= x && botY >= y) {
        return YES;
    }
    return NO;
}
@end
