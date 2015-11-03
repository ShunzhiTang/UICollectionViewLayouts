//
//  ViewController.m
//  UICollectionViewLineLayout
//
//  Created by Tsz on 15/11/2.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "ViewController.h"
#import "TSZImageCell.h"
#import "TSZLineLayout.h"
#import "TSZCircleLayout.h"
@interface ViewController ()<UICollectionViewDataSource , UICollectionViewDelegate>

//图片名
@property (nonatomic , strong) NSMutableArray *images;

@property (nonatomic ,weak) UICollectionView *collectionView;
@end

@implementation ViewController

static   NSString *ID = @"image";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建collectionView 的 frame
    CGFloat w = self.view.frame.size.width;
    
    CGRect rect =  CGRectMake(0 ,100 , w , 300 );
    
    //创建 布局
//    TSZLineLayout *layout = [[TSZLineLayout alloc] init];
    TSZCircleLayout *layoutCircle = [[TSZCircleLayout alloc] init];
    
    //创建uicollectionView
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:layoutCircle];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
//    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    
    [collectionView registerNib:[UINib nibWithNibName:@"TSZImageCell"  bundle:nil] forCellWithReuseIdentifier:ID];
    
    [self.view addSubview:collectionView];
    
    self.collectionView = collectionView;
    
    
}

#pragma mark 实现UICollectionView的 代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *ID = @"cell";
    
    TSZImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.imageName = self.images[indexPath.row];
//    cell,
    return cell;
}

#pragma mark 懒加载
- (NSMutableArray *)images{
    
    if ( _images == nil) {
        
        //获取图片
        self.images = [[NSMutableArray alloc] init];
        
        for (int i = 1; i <= 20 ; i++) {
            [self.images addObject:[NSString stringWithFormat:@"%d" , i]];
        }
    }
    return _images;
}

@end
