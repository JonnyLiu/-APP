//
//  ViewController.m
//  Ticket
//
//  Created by zxJun on 2017/11/28.
//  Copyright © 2017年 zxJun. All rights reserved.
//

#import "ViewController.h"

#define DEVICE_WIDTH CGRectGetWidth([UIScreen mainScreen].bounds)

@interface ViewController () <UITableViewDelegate, UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /********** 以下为首页相关代码 **********/
    [self renderUI]; // 渲染主框架
    [self tabItemSelected:0 needAnimation:NO]; // 主框架定位到第几个tab
    
    // 添加一个状态栏背景
    UIView *navbarView = [[UIView alloc]init];
    navbarView.frame = CGRectMake(0, 0, DEVICE_WIDTH, 30);
    navbarView.backgroundColor = [UIColor colorWithHexString:@"#1E90FF"];
    [self.view addSubview:navbarView];

    /********** 以上为首页相关代码 **********/
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}
-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


/********** 以下为首页相关代码 **********/
- (NSDictionary *)getPageConfigInfo{
    NSDictionary *configInfo = @{
                                 @"topViewBgColor": @"#1E90FF",
                                 @"maskColor": @"#FFFFFF",
                                 @"maskPositionType": @2,
                                 @"type": @0,
                                 @"items": @[@{
                                                @"itemType": @2,
                                                @"title": @"火车票",
                                                @"normalTitleColor": @"#666666",
                                                @"selectTitleColor": @"#FFFFFF",
                                                @"normalIconName": @"train_unselected",
                                                @"selectIconName": @"train_selected",
                                                @"vcName": @"TrainVC"
                                                },
                                            @{
                                                @"itemType":@2,
                                                @"title":@"飞机票",
                                                @"normalTitleColor":@"#666666",
                                                @"selectTitleColor":@"#FFFFFF",
                                                @"normalIconName":@"plane_unselected",
                                                @"selectIconName":@"plane_selected",
                                                @"vcName":@"PlaneVC"
                                                },
                                            @{
                                                @"itemType":@2,
                                                @"title":@"汽车/船票",
                                                @"normalTitleColor":@"#666666",
                                                @"selectTitleColor":@"#FFFFFF",
                                                @"normalIconName":@"car_unselected",
                                                @"selectIconName":@"car_selected",
                                                @"vcName":@"CarVC"
                                                },
                                            @{
                                                @"itemType":@2,
                                                @"title":@"酒店",
                                                @"normalTitleColor":@"#666666",
                                                @"selectTitleColor":@"#FFFFFF",
                                                @"normalIconName":@"hotel_unselected",
                                                @"selectIconName":@"hotel_selected",
                                                @"vcName":@"HotelVC"
                                                },
                                            @{
                                                @"itemType":@2,
                                                @"title":@"专车",
                                                @"normalTitleColor":@"#666666",
                                                @"selectTitleColor":@"#FFFFFF",
                                                @"normalIconName":@"spcar_unselected",
                                                @"selectIconName":@"spcar_selected",
                                                @"vcName":@"SpcarVC"
                                                }
                                            ]
                                 };
    return configInfo;
}

/********** 以上为首页相关代码 **********/

@end
