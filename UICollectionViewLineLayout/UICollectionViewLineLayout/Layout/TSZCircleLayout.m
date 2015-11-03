//
//  TSZCircleLayout.m
//  UICollectionViewLineLayout
//
//  Created by Tsz on 15/11/2.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "TSZCircleLayout.h"

@implementation TSZCircleLayout

/**
 * 决定cell 如何排布
 */

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray *array = [NSMutableArray array];
    
    NSUInteger count = [self.collectionView  numberOfItemsInSection:0];
    
    for (int i = 0; i < count; i++) {
        //创建i 位置cell 对应的indexPath
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        // 创建i 位置cell 对应 的 布局属性
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        //添加布局属性
        [array addObject:attrs];
        
    }
    return  array;
}

//返回 indexPath 对应cell 的 布局属性

- (UICollectionViewLayoutAttributes *) layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSUInteger count = [self.collectionView numberOfItemsInSection:indexPath.section];
    
    //半径
    
    CGFloat radius = 100;
    
    //圆心的坐标
    CGFloat centenX = self.collectionView.frame.size.width * 0.5;
    
    CGFloat centerY = self.collectionView.frame.size.height * 0.5;
    
    //角度增量
    CGFloat deltaAngle = 2 * M_PI / count;
    
    //创建i 位置cell 对应的布局属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attrs.size = CGSizeMake(50, 50);
    
    if (count ==  1) {
        attrs.center = CGPointMake(centenX, centerY);
    }else {
        
        //旋转角度
        CGFloat angle = indexPath.item * deltaAngle ;
        
        //cell 中心点坐标
        CGFloat attrsCenterX = centenX + radius * cos(angle);
        CGFloat attrsCenterY = centerY + radius * sin(angle);
        
        attrs.center = CGPointMake(attrsCenterX, attrsCenterY);
        
    }
    return  attrs;
    
}

@end
