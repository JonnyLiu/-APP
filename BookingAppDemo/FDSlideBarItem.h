//
//  FDSlideBarItem.h
//  ZhiXing
//
//  Created by rjh on 2017/12/09.
//  Copyright © 2017年 rjh. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol FDSlideBarItemDelegate;

@interface FDSlideBarItem : UIView

@property (assign, nonatomic) BOOL selected;
@property (weak, nonatomic) id<FDSlideBarItemDelegate> delegate;

- (void)setItemTitle:(NSString *)title;
- (void)setItemTitleFont:(CGFloat)fontSize;
- (void)setItemTitleColor:(UIColor *)color;
- (void)setItemSelectedTileFont:(CGFloat)fontSize;
- (void)setItemSelectedTitleColor:(UIColor *)color;

+ (CGFloat)widthForTitle:(NSString *)title;

@end

@protocol FDSlideBarItemDelegate <NSObject>

- (void)slideBarItemSelected:(FDSlideBarItem *)item;

@end
