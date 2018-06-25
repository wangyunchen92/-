//
//  Rpiece.m
//  国际象棋demo
//
//  Created by Sj03 on 2018/6/12.
//  Copyright © 2018年 Sj03. All rights reserved.
//

#import "Rpiece.h"

@implementation Rpiece

- (instancetype)initWithFrame:(CGRect)frame andstate:(NSInteger )pieceState andinitPoint:(NSInteger)point{
    self = [super initWithFrame:frame];
    self.directionArray = [[NSMutableArray alloc] init];
    self.eatDirectionArray = [[NSMutableArray alloc] init];

    if (self) {
        [self setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",pieceState]] forState:UIControlStateNormal];
        if (pieceState > 10) {
            self.titles = pieceState_BR;
            self.name = @"黑车";
        } else {
            self.titles = pieceState_WR;
            self.name = @"白车";
        }
        [self.directionArray addObject:@"1"];
        [self.directionArray addObject:@"3"];
        [self.directionArray addObject:@"5"];
        [self.directionArray addObject:@"7"];
        
        [self.eatDirectionArray addObject:@"1"];
        [self.eatDirectionArray addObject:@"3"];
        [self.eatDirectionArray addObject:@"5"];
        [self.eatDirectionArray addObject:@"7"];
        self.num = 8;
        self.eatnum = 8;
    }
    
    return self;
}

- (void)canMove:(placeModel *)nowplace {
    self.num = 8;
}

- (void)canEat:(placeModel *)nowplace {
    self.eatnum = 8;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
