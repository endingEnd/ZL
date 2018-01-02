//
//  CustomTableViewCell.h
//  TableViewPackage
//
//  Created by 张丽 on 2018/1/2.
//  Copyright © 2018年 张丽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCellFrame.h"
@interface CustomTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *name;
@property (nonatomic,strong) UILabel *content;

@property (nonatomic,strong) CustomCellFrame *cellFrame;
@end
