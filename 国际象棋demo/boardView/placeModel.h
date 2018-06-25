//
//  placeModel.h
//  国际象棋demo
//
//  Created by Sj03 on 2018/6/12.
//  Copyright © 2018年 Sj03. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface placeModel : NSObject
@property (nonatomic, strong)NSString *english;
@property (nonatomic, assign)NSInteger number;

+ (placeModel *)formattingPoint:(NSInteger )point;

+ (NSInteger )formattingtag :(placeModel *)model;


#pragma -mark 移动
+ (placeModel *)upPoint:(placeModel *)model andnum:(NSInteger )num;

+ (placeModel *)rightPoint:(placeModel *)model andnum:(NSInteger )num;

+ (placeModel *)leftPoint:(placeModel *)model andnum:(NSInteger )num;

+ (placeModel *)downPoint:(placeModel *)model andnum:(NSInteger )num;

+ (placeModel *)leftupPoint:(placeModel *)model andnum:(NSInteger )num;

+ (placeModel *)rightupPoint:(placeModel *)model andnum:(NSInteger )num;

+ (placeModel *)leftdownPoint:(placeModel *)model andnum:(NSInteger )num;

+ (placeModel *)rightdownPoint:(placeModel *)model andnum:(NSInteger )num;

+ (NSArray *)NMove:(placeModel *)model;

@end
