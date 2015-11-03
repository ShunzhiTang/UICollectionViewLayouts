//
//  TSZStackLayout.m
//  UICollectionViewLineLayout
//
//  Created by Tsz on 15/11/2.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "TSZStackLayout.h"

@implementation TSZStackLayout


//实现布局就要实现两个方法

#pragma mark 返回 所有cell的布局属性
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    //1、定义存储属性的数组
    NSMutableArray *array = [NSMutableArray array];
    
    //2、获得需要布局的组对应的 个数
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for ( int i = 0; i < count;  i++) {
        NSIndexPath *indexPath  =[NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs =  [self layoutAttributesForItemAtIndexPath:indexPath  ];
        
        [array addObject:attrs];
        
    }
    
    return  array;
}

#pragma  mark 每一个indexPath对应cell  的布局
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //获得 组中的item的个数
    
    NSUInteger count = [self.collectionView numberOfItemsInSection:indexPath.section];
    
    attrs.center = CGPointMake(self.collectionView.frame.size.width * 0.5 , self.collectionView.frame.size.height * 0.5);
    
    attrs.size = CGSizeMake(100, 100);
    
    //为了美观显示 5个的布局
    if (count >= 5) {
        count = 5;
    }
   
    if (indexPath.item >= count) {
        attrs.hidden = YES;
        return attrs;
    }
    
    CGFloat deltaAngle = M_PI_2 / count;
    
    CGFloat angle = indexPath.item * deltaAngle;
    
    attrs.transform = CGAffineTransformMakeRotation(angle);
    
    return attrs;
}



@end
