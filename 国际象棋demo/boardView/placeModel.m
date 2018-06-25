//
//  placeModel.m
//  国际象棋demo
//
//  Created by Sj03 on 2018/6/12.
//  Copyright © 2018年 Sj03. All rights reserved.
//

#import "placeModel.h"

@interface placeModel ()
@property (nonatomic, assign)NSInteger englishNum;

@end

@implementation placeModel
- (instancetype)init {
    self = [super init];
    if (self) {
        _english = @"";
        _number = 1;
    }
    return self;
}

+ (NSInteger )formattingtag:(placeModel *)model {
    return (model.number) * 10  + model.englishNum - 1;
}

+ (placeModel *)formattingPoint:(NSInteger )point {
    
    placeModel *model = [[placeModel alloc] init];
    NSString *english = [model formatterEnglish:point];
    
    model.englishNum = (point % 10) + 1;
    [model getmodel:english num:(point/10)];
    return model;
}

- (void)getmodel:(NSString *)english num:(NSInteger )num {
    self.english = english;
    self.number = num;
}

- (NSString *)formatterEnglish:(NSInteger )num {
    NSString *english;
    switch (num % 10) {
        case 0:
            english = @"a";
            break;
        case 1:
            english = @"b";
            break;
        case 2:
            english = @"c";
            break;
        case 3:
            english = @"d";
            break;
        case 4:
            english = @"e";
            break;
        case 5:
            english = @"f";
            break;
        case 6:
            english = @"g";
            break;
        case 7:
            english = @"h";
            break;
        default:
            break;
    }
    return english;
}

#pragma -mark 移动
+ (placeModel *)upPoint:(placeModel *)model andnum:(NSInteger )num {
    placeModel *returnmodel = [[placeModel alloc] init];
    
    returnmodel.number = model.number + num;
    
    if (returnmodel.number > 8 ) {
        returnmodel.number = 8;
    }
    
    returnmodel.englishNum = model.englishNum;
    returnmodel.english = [model formatterEnglish:returnmodel.englishNum - 1];
    
    return returnmodel;
}

+ (placeModel *)rightPoint:(placeModel *)model andnum:(NSInteger )num {
    placeModel *returnmodel = [[placeModel alloc] init];
    
    returnmodel.englishNum = model.englishNum + num;
    if (returnmodel.englishNum > 8) {
        returnmodel.englishNum = 8;
    }
    
    returnmodel.english = [model formatterEnglish:returnmodel.englishNum - 1];
    returnmodel.number = model.number;
    return returnmodel;
}

+ (placeModel *)leftPoint:(placeModel *)model andnum:(NSInteger )num {
    placeModel *returnmodel = [[placeModel alloc] init];
    returnmodel.englishNum = model.englishNum - num;
    if (returnmodel.englishNum < 1) {
        returnmodel.englishNum = 1;
    }

    returnmodel.english = [model formatterEnglish:returnmodel.englishNum - 1];
    returnmodel.number = model.number;
    return returnmodel;
}

+ (placeModel *)downPoint:(placeModel *)model andnum:(NSInteger )num {
    placeModel *returnmodel = [[placeModel alloc] init];
    
    returnmodel.number = model.number - num;
    if (model.number < 1) {
        returnmodel.number = model.number - 1;
    }
    
    returnmodel.englishNum = model.englishNum;
    returnmodel.english = [model formatterEnglish:returnmodel.englishNum - 1];
    return returnmodel;
}

+ (placeModel *)leftupPoint:(placeModel *)model andnum:(NSInteger )num {
    if (model.englishNum - num < 1 || model.number + num > 8) {
        return model;
    }
    placeModel *model1 =[placeModel upPoint:model andnum:num];
    placeModel *returnmodel = [placeModel leftPoint:model1 andnum:num];
    return returnmodel;
}

+ (placeModel *)rightupPoint:(placeModel *)model andnum:(NSInteger )num {
    if (model.englishNum + num > 8 || model.number + num > 8) {
        return model;
    }
    placeModel *model1 =[placeModel upPoint:model andnum:num];
    placeModel *returnmodel = [placeModel rightPoint:model1 andnum:num];
    return returnmodel;
}

+ (placeModel *)leftdownPoint:(placeModel *)model andnum:(NSInteger )num {
    if (model.englishNum - num < 1 || model.number - num < 1) {
        return model;
    }
    placeModel *model1 =[placeModel downPoint:model andnum:num];
    placeModel *returnmodel = [placeModel leftPoint:model1 andnum:num];
    return returnmodel;
}

+ (placeModel *)rightdownPoint:(placeModel *)model andnum:(NSInteger )num {
    if (model.englishNum + num > 8 || model.number - num < 1) {
        return model;
    }
    placeModel *model1 =[placeModel downPoint:model andnum:num];
    placeModel *returnmodel = [placeModel rightPoint:model1 andnum:num];
    return returnmodel;
}

+ (NSArray *)NMove:(placeModel *)model {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    BOOL up;
    BOOL down;
    BOOL left;
    BOOL right;
    
    BOOL up1;
    BOOL down1;
    BOOL left1;
    BOOL right1;
    if (model.number + 2 <= 8) {
        up = YES;
    } else {
        up = NO;
    }
    
    if (model.number - 2 >= 1) {
        down = YES;
    } else {
        down = NO;
    }
    
    if (model.englishNum + 2 <= 8) {
        right = YES;
    } else {
        right = NO;
    }
    
    if (model.englishNum - 2 >= 1) {
        left = YES;
    } else {
        left = NO;
    }
    
    
    
    if (model.number + 1 <= 8) {
        up1 = YES;
    } else {
        up1 = NO;
    }
    
    if (model.number - 1 >= 1) {
        down1 = YES;
    } else {
        down1 = NO;
    }
    
    if (model.englishNum + 1 <= 8) {
        right1 = YES;
    } else {
        right1 = NO;
    }
    
    if (model.englishNum - 1 >= 1) {
        left1 = YES;
    } else {
        left1 = NO;
    }
    
    if (left) {
        if (up1) {
            placeModel *model1 = [placeModel leftPoint:model andnum:2];
            placeModel *addmodel = [placeModel upPoint:model1 andnum:1];
            [array addObject:addmodel];
        }
        if (down1) {
            placeModel *model1 = [placeModel leftPoint:model andnum:2];
            placeModel *addmodel = [placeModel downPoint:model1 andnum:1];
            [array addObject:addmodel];
        }
    }

    if (up) {
        if (left1) {
            placeModel *model1 = [placeModel upPoint:model andnum:2];
            placeModel *addmodel = [placeModel leftPoint:model1 andnum:1];
            [array addObject:addmodel];
        }
        if (right1) {
            placeModel *model1 = [placeModel upPoint:model andnum:2];
            placeModel *addmodel = [placeModel rightPoint:model1 andnum:1];
            [array addObject:addmodel];
        }
    }
    
    if (right) {
        if (up1) {
            placeModel *model1 = [placeModel rightPoint:model andnum:2];
            placeModel *addmodel = [placeModel upPoint:model1 andnum:1];
            [array addObject:addmodel];
        }
        if (down1) {
            placeModel *model1 = [placeModel rightPoint:model andnum:2];
            placeModel *addmodel = [placeModel downPoint:model1 andnum:1];
            [array addObject:addmodel];
        }
    }
    
    if (down) {
        if (left1) {
            placeModel *model1 = [placeModel downPoint:model andnum:2];
            placeModel *addmodel = [placeModel leftPoint:model1 andnum:1];
            [array addObject:addmodel];
        }
        if (right1) {
            placeModel *model1 = [placeModel downPoint:model andnum:2];
            placeModel *addmodel = [placeModel rightPoint:model1 andnum:1];
            [array addObject:addmodel];
        }
    }
    
    NSArray *rarray = [NSArray arrayWithArray:array];
    return rarray;
}

@end
