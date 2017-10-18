//
//  YTMainRequestNetworkTool.m
//  YTWeather
//
//  Created by admin on 2017/10/18.
//  Copyright © 2017年 Jaten. All rights reserved.
//

#import "YTMainRequestNetworkTool.h"

@implementation YTMainRequestNetworkTool

+ (void)requestWeatherWithCityName:(NSString *)cityName andFinish:(void (^)(YTWeatherModel *model, NSError *))finish
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 15;

    NSMutableDictionary *paraDict = [NSMutableDictionary dictionary];
    [paraDict setObject:cityName forKey:@"city"];
    [paraDict setObject:YT_Request_Main_API_KEY forKey:@"key"];
    
    [manager GET:YT_Request_Main_API parameters:paraDict progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        YTWeatherModel *weatherModel = [NSArray modelArrayWithClass:[YTWeatherModel class] json:responseObject[@"HeWeather5"]][0];
        finish(weatherModel, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finish(nil, error);
    }];
}

@end