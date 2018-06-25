//
//  Ppiece.m
//  国际象棋demo
//
//  Created by Sj03 on 2018/6/12.
//  Copyright © 2018年 Sj03. All rights reserved.
//

#import "Ppiece.h"

@implementation Ppiece

- (instancetype)initWithFrame:(CGRect)frame andstate:(NSInteger )pieceState andinitPoint:(NSInteger)point{
    self = [super initWithFrame:frame];
    if (self) {
        self.directionArray = [[NSMutableArray alloc] init];
        self.eatDirectionArray = [[NSMutableArray alloc] init];
        
        [self setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",pieceState]] forState:UIControlStateNormal];
        if (pieceState > 10) {
            self.titles = pieceState_BP;
            self.name = @"黑兵";
            [self.directionArray addObject:@"7"];
            [self.eatDirectionArray addObject:@"8"];
            [self.eatDirectionArray addObject:@"6"];
        } else {
            self.titles = pieceState_WP;
            self.name = @"白兵";
            [self.directionArray addObject:@"3"];
            [self.eatDirectionArray addObject:@"2"];
            [self.eatDirectionArray addObject:@"4"];
        }
        
        self.num = 2;
        self.eatnum = 1;
    }
    

    return self;
}

- (void)canMove:(placeModel *)nowplace {
    if (self.pointArray.count == 1) {
        self.num = 2;
    } else {
        self.num = 1;
    }
}

- (void)canEat:(placeModel *)nowplace {
    self.eatnum = 1;
}

- (void)move:(CGPoint)point {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
