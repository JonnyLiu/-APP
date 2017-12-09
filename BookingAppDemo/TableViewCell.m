//
//  TableViewCell.m
//  ZhiXing
//
//  Created by rjh on 2017/12/09.
//  Copyright © 2017年 rjh. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - Custom Accessors

- (void)setText:(NSString *)text {
    _text = text;
    self.label.text = text;
}

@end
