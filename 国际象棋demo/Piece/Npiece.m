//
//  Npiece.m
//  国际象棋demo
//
//  Created by Sj03 on 2018/6/12.
//  Copyright © 2018年 Sj03. All rights reserved.
//

#import "Npiece.h"

@implementation Npiece

- (instancetype)initWithFrame:(CGRect)frame andstate:(NSInteger )pieceState andinitPoint:(NSInteger)point{
    self = [super initWithFrame:frame];
    self.directionArray = [[NSMutableArray alloc] init];
    self.eatDirectionArray = [[NSMutableArray alloc] init];
    if (self) {
        [self setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",pieceState]] forState:UIControlStateNormal];
        if (pieceState > 10) {
            self.titles = pieceState_BN;
            self.name = @"黑马";
        } else {
            self.titles = pieceState_WN;
            self.name = @"白马";
        }
    }
    [self.directionArray addObject:@"9"];
    [self.eatDirectionArray addObject:@"9"];
    
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
