//
//  TSZImageCell.m
//  UICollectionViewLineLayout
//
//  Created by Tsz on 15/11/2.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "TSZImageCell.h"

@interface TSZImageCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation TSZImageCell

- (void)awakeFromNib {

//    self.clipsToBounds = YES;
    self.iconView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.iconView.layer.cornerRadius  = 10;
    self.iconView.layer.masksToBounds = YES;
    
}

//执行set方式 设置值

- (void)setImageName:(NSString *)imageName{
    _imageName = imageName;
    
    self.iconView.image = [UIImage imageNamed:imageName];
}
@end
