//
//  YTMainView.m
//  YTWeather
//
//  Created by admin on 2017/10/17.
//  Copyright © 2017年 Jaten. All rights reserved.
//

#import "YTMainView.h"

#import "YTMainTableHeaderView.h"
#import "YTMainForecastTableViewCell.h"
#import "YTMainAdvertisingTableViewCell.h"
#import "YTMainDetailTableViewCell.h"
#import "YTMainMapTableViewCell.h"
#import "YTMainPrecipitationTableViewCell.h"
#import "YTMainSunAndWindTableViewCell.h"

#import "YTWeatherCacheData.h"

@interface YTMainView ()
<
UITableViewDataSource,
UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YTMainView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view =  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
        view.frame = self.bounds;
        [self addSubview:view];
        
        [self setupTableView];
    }
    return self;
}

- (void)setupTableView
{
//    if (@available(iOS 11.0, *)) {
//        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    }
    
    [self.tableView registerNib:[YTMainForecastTableViewCell yt_defaultNibInMainBoundle] forCellReuseIdentifier:[YTMainForecastTableViewCell className]];
    
    [self.tableView registerNib:[YTMainAdvertisingTableViewCell yt_defaultNibInMainBoundle] forCellReuseIdentifier:[YTMainAdvertisingTableViewCell className]];

    [self.tableView registerNib:[YTMainForecastTableViewCell yt_defaultNibInMainBoundle] forCellReuseIdentifier:[YTMainForecastTableViewCell className]];

    [self.tableView registerNib:[YTMainDetailTableViewCell yt_defaultNibInMainBoundle] forCellReuseIdentifier:[YTMainDetailTableViewCell className]];

    [self.tableView registerNib:[YTMainMapTableViewCell yt_defaultNibInMainBoundle] forCellReuseIdentifier:[YTMainMapTableViewCell className]];

    [self.tableView registerNib:[YTMainPrecipitationTableViewCell yt_defaultNibInMainBoundle] forCellReuseIdentifier:[YTMainPrecipitationTableViewCell className]];

    [self.tableView registerNib:[YTMainSunAndWindTableViewCell yt_defaultNibInMainBoundle] forCellReuseIdentifier:[YTMainSunAndWindTableViewCell className]];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
}

#pragma mark - Data
- (void)loadData
{
    [self.tableView.mj_header endRefreshing];
}

#pragma mark - Tableview Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}

#pragma mark - Tableview Delegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    YTMainTableHeaderView *headerView = [[YTMainTableHeaderView alloc] init];
    
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return ScreenHeight;
}

@end
