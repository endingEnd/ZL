//
//  ViewController.m
//  TableViewPackage
//
//  Created by 张丽 on 2018/1/2.
//  Copyright © 2018年 张丽. All rights reserved.
//

#import "ViewController.h"
#import "KKLDataSource.h"
#import "CustomCellFrame.h"
#import "Model.h"
#import "CustomTableViewCell.h"
@interface ViewController ()

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) KKLDataSource *dataSource;
@property (nonatomic,strong) CustomTableViewCell *cell;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    KKLDataSource *dataSource = [[KKLDataSource alloc]init];
    self.dataSource = dataSource;
    dataSource.cellIdentifier = @"cell";
    /* 给数据源添加数据 */
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i = 0; i < 30; i ++) {
        CustomCellFrame *cellFrame = [[CustomCellFrame alloc]init];
        Model *model = [[Model alloc]init];
        model.name = @"长颜草文字";
        model.content = @"你好啊 2018 渣渣渣渣渣渣渣渣渣渣渣渣渣渣渣 ";
        cellFrame.model = model;
        cellFrame.cellHeight = (arc4random() % 30) + 50;
        [array addObject:cellFrame];
    }
    [dataSource addModel:array];
    /* cell高度 */
    dataSource.ConfigureHeightBlock = ^CGFloat(CGFloat height, id cellFrame) {
        CustomCellFrame *cellModelFrame = cellFrame;
        CGFloat cellHeight = height;
        cellHeight = cellModelFrame.cellHeight;
        return cellHeight;
    };
    /* 给cell 赋值 */
    dataSource.ConfigureBlock = ^(id cell, id cellFrame) {
        CustomTableViewCell *vcCell = cell;
        CustomCellFrame *cellModelFrame = cellFrame;
        vcCell.cellFrame = cellModelFrame;
    };
    dataSource.ConfigureDidSelectBlock = ^(NSInteger row, id cellFrame) {
        NSLog(@" ConfigureDidSelectBlock == %d",row);
    };
    /* tableview 刷新 */
    [self.tableView reloadData];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = _dataSource;
        _tableView.delegate = _dataSource;
        [_tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:_dataSource.cellIdentifier];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
