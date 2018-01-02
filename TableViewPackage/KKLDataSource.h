//
//  WElDataSource.h
//  TableViewPackage
//
//  Created by 张丽 on 2018/1/2.
//  Copyright © 2018年 张丽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface KKLDataSource : NSObject

/// cell的数据源
@property (nonatomic,strong) NSMutableArray *array;
/// cell的重用符
@property (nonatomic,strong) NSString *cellIdentifier;
/// 给cell赋值的block
@property (nonatomic,  copy) void(^ConfigureBlock)(id cell,id cellFrame);
/// 计算cell高度的block
@property (nonatomic,  copy) CGFloat (^ConfigureHeightBlock)(CGFloat height, id cellFrame);
/// 点击cell的block
@property (nonatomic,  copy) void(^ConfigureDidSelectBlock) (NSInteger row, id cellFrame);

/// 增加数据源数据的方法
- (void)addModel:(NSMutableArray *)array;
@end
