//
//  CustomTableViewCell.m
//  TableViewPackage
//
//  Created by 张丽 on 2018/1/2.
//  Copyright © 2018年 张丽. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 120, 30)];
        name.font = [UIFont systemFontOfSize:16];
        self.name = name;
        [self.contentView addSubview:name];
        //
        UILabel *content = [[UILabel alloc]initWithFrame:CGRectMake(140, 5, self.frame.size.width - 150, 40)];
        self.content = content;
        content.numberOfLines = 0;
        content.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:content];
    }
    return self;
}
- (void)setCellFrame:(CustomCellFrame *)cellFrame {
    self.name.text = cellFrame.model.name;
    self.content.text = cellFrame.model.content;
}

//- (void)setModel:(Model *)model {
//    self.name.text = model.name;
//    self.content.text = model.content;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
