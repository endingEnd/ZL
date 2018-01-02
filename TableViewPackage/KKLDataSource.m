//
//  WElDataSource.m
//  TableViewPackage
//
//  Created by 张丽 on 2018/1/2.
//  Copyright © 2018年 张丽. All rights reserved.
//

#import "KKLDataSource.h"


@interface KKLDataSource ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation KKLDataSource



#pragma mark tableviewDelegate --- 表的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count ? self.array.count : 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 1.0;
    id cellFrame = self.array[indexPath.row];
    typeof(self) weakSelf = self;
    if (self.ConfigureHeightBlock) {
       height = weakSelf.ConfigureHeightBlock(height, cellFrame);
        return height;
    }
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id cellFrame = self.array[indexPath.row];
    self.ConfigureBlock(cell, cellFrame);
    return cell;
}

- (void)addModel:(NSMutableArray *)array {
    if (!array) {
        return;
    }
    if (!_array) {
        _array = [[NSMutableArray alloc]initWithCapacity:0];
    }
    [_array addObjectsFromArray:array];
}

#pragma mark optional
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id cellFrame = self.array[indexPath.row];
    self.ConfigureDidSelectBlock(indexPath.row,cellFrame);
}
@end
