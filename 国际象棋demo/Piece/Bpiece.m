//
//  Bpiece.m
//  国际象棋demo
//
//  Created by Sj03 on 2018/6/12.
//  Copyright © 2018年 Sj03. All rights reserved.
//

#import "Bpiece.h"

@implementation Bpiece

- (instancetype)initWithFrame:(CGRect)frame andstate:(NSInteger )pieceState andinitPoint:(NSInteger)point{
    self = [super initWithFrame:frame];
    if (self) {
        self.directionArray = [[NSMutableArray alloc] init];
        self.eatDirectionArray = [[NSMutableArray alloc] init];
        
        [self setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",pieceState]] forState:UIControlStateNormal];
        if (pieceState > 10) {
            self.titles = pieceState_BB;
            self.name = @"黑象";
        } else {
            self.titles = pieceState_WB;
            self.name = @"白象";
        }
        [self.directionArray addObject:@"2"];
        [self.directionArray addObject:@"4"];
        [self.directionArray addObject:@"6"];
        [self.directionArray addObject:@"8"];
        
        [self.eatDirectionArray addObject:@"2"];
        [self.eatDirectionArray addObject:@"4"];
        [self.eatDirectionArray addObject:@"6"];
        [self.eatDirectionArray addObject:@"8"];
        
        self.num = 8;
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
