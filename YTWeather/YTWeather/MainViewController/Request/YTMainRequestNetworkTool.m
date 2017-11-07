//
//  YTMainRequestNetworkTool.m
//  YTWeather
//
//  Created by admin on 2017/10/18.
//  Copyright © 2017年 Jaten. All rights reserved.
//

#import "YTMainRequestNetworkTool.h"

@implementation YTMainRequestNetworkTool

+ (void)requestWeatherWithCityName:(NSString *)cityName viewController:(UIViewController *)vc andFinish:(void (^)(YTWeatherModel *model, NSError *))finish
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 15;

    NSMutableDictionary *paraDict = [NSMutableDictionary dictionary];
    [paraDict setObject:cityName forKey:@"location"];
    [paraDict setObject:YT_Request_Main_API_KEY forKey:@"key"];
    
    [manager GET:YT_Request_Main_API parameters:paraDict progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        YTWeatherModel *weatherModel = [NSArray modelArrayWithClass:[YTWeatherModel class] json:responseObject[@"HeWeather6"]][0];
        finish(weatherModel, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"获取信息失败" message:nil preferredStyle:UIAlertControllerStyleAlert];//UIAlertControllerStyleAlert视图在中央
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"重新获取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self requestWeatherWithCityName:cityName viewController:vc  andFinish:finish];
        }];//https在iTunes中找，这里的事件是前往手机端App store下载微信
        [alertController addAction:okAction];
        [vc presentViewController:alertController animated:YES completion:nil];
        finish(nil, error);
    }];
}

@end
