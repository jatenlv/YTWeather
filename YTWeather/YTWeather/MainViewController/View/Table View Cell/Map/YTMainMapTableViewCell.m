//
//  YTMainMapTableViewCell.m
//  YTWeather
//
//  Created by admin on 2017/10/18.
//  Copyright © 2017年 Jaten. All rights reserved.
//

#import "YTMainMapTableViewCell.h"

@implementation YTMainMapTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];

    self.backgroundColor = MainTableViewCellColor;
    self.layer.cornerRadius = MainTableViewCellRadius;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
