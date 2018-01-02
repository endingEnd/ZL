//
//  CustomCellFrame.h
//  TableViewPackage
//
//  Created by 张丽 on 2018/1/2.
//  Copyright © 2018年 张丽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Model.h"

@interface CustomCellFrame : NSObject

@property (nonatomic,assign) CGFloat cellHeight;

@property (nonatomic,strong) Model *model;
@end
