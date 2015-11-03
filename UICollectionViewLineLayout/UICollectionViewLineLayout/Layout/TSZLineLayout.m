//
//  TSZLineLayout.m
//  UICollectionViewLineLayout
//
//  Created by Tsz on 15/11/2.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "TSZLineLayout.h"

@implementation TSZLineLayout

//准备布局
- (void)prepareLayout{
    
    // 必须 调用父类
    [super prepareLayout];
    
    //设置滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //设置cell 的大小
    CGFloat itemWH = self.collectionView.frame.size.height  * 0.7;
    
    self.itemSize = CGSizeMake(itemWH, itemWH);
    
    //设置内边距
    CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
    
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
}

/**
 * 返回CollectionView 上面 所有元素的布局属性
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    // 调用父类方法 拿到默认的布局 属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    //获得CollectionView中点 的x值
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    //在默认的布局属相的基础上进行 调整
    for (UICollectionViewLayoutAttributes *attrs in array) {
        
        // 计算 cell 中点 x 到 CollectionvIEW Z的值
        CGFloat delta = ABS(attrs.center.x - centerX);
        
        // 根据距离计算缩放比例  成反比
        
        CGFloat scale = 1 - delta / (self.collectionView.frame.size.width + self.itemSize.width);
        
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
        
    }
    return array;
}


// 当 CollectionView 的bounds 发生变化 的时候刷新
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

/**
 * 获得最终的偏移量
 */

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    
    //1、计算 最终 的可见范围
    CGRect rect;
    
    rect.origin = proposedContentOffset;
    rect.size = self.collectionView.frame.size;
    
    //取得cell 的 布局属性
    NSArray *array = [super  layoutAttributesForElementsInRect:rect];
    
    // 计算CollectionView 中线的X值
    
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    CGFloat minDelta = MAXFLOAT;
    
    for (UICollectionViewLayoutAttributes *attrs in array) {
        
        CGFloat delta = attrs.center.x - centerX;
        
        if (ABS(delta <= ABS(minDelta))) {
            minDelta = delta;
        }
    }
    
    return  CGPointMake(proposedContentOffset.x + minDelta, proposedContentOffset.y);
    
}

@end
