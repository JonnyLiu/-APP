//
//  FDSlideBar.h
//  ZhiXing
//
//  Created by rjh on 2017/12/09.
//  Copyright © 2017年 rjh. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef void(^FDSlideBarItemSelectedCallback)(NSUInteger idx);

@interface FDSlideBar : UIView

@property (copy, nonatomic) NSArray *itemsTitle;

@property (strong, nonatomic) UIColor *itemColor;

@property (strong, nonatomic) UIColor *itemSelectedColor;

@property (strong, nonatomic) UIColor *sliderColor;

- (void)slideBarItemSelectedCallback:(FDSlideBarItemSelectedCallback)callback;

- (void)selectSlideBarItemAtIndex:(NSUInteger)index;

@end
