//
//  YTMainDetailTableViewCell.m
//  YTWeather
//
//  Created by admin on 2017/10/18.
//  Copyright © 2017年 Jaten. All rights reserved.
//

#import "YTMainDetailTableViewCell.h"

@interface YTMainDetailTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *bodyTmp;
@property (weak, nonatomic) IBOutlet UILabel *wet;
@property (weak, nonatomic) IBOutlet UILabel *visibility;
@property (weak, nonatomic) IBOutlet UILabel *pressure;

@end

@implementation YTMainDetailTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];

    self.backgroundColor = MainTableViewCellColor;
    self.layer.cornerRadius = MainTableViewCellRadius;
}

- (void)setNowModel:(YTWeatherNowModel *)nowModel
{
    self.bodyTmp.text    = [NSString stringWithFormat:@"%@°", nowModel.fl];
    self.wet.text        = [NSString stringWithFormat:@"%@%%", nowModel.hum];
    self.visibility.text = [NSString stringWithFormat:@"%@公里", nowModel.vis];
    self.pressure.text   = [NSString stringWithFormat:@"%@Pa", nowModel.pres];
}

@end
