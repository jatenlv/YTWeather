//
//  YTLeftSlideView.h
//  YTWeather
//
//  Created by admin on 2017/11/1.
//  Copyright © 2017年 Jaten. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YTLeftSlideViewDelegate <NSObject>

- (void)clickShareButton;
- (void)clickSlideViewCloseButton;
- (void)showCityViewWithIndex:(NSInteger)index;
- (void)deleteCityViewWithIndex:(NSInteger)index;
- (void)clickSettingButton;

@end

@interface YTLeftSlideView : UIView

@property (nonatomic, weak) id <YTLeftSlideViewDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *kCityNameArray;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
