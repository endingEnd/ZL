# ZL
tableview与代理方法的解耦合，写了个简单的demo，路过的大婶多多关照
### 使用步骤：
####  给数据源添加数据
- NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
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
  ####    cell的代理方法
 -  /* cell高度 */
    dataSource.ConfigureHeightBlock = ^CGFloat(CGFloat height, id cellFrame) {
        CustomCellFrame *cellModelFrame = cellFrame;
        CGFloat cellHeight = height;
        cellHeight = cellModelFrame.cellHeight;
        return cellHeight;
    };
 -  /* 给cell 赋值 */
    dataSource.ConfigureBlock = ^(id cell, id cellFrame) {
        CustomTableViewCell *vcCell = cell;
        CustomCellFrame *cellModelFrame = cellFrame;
        vcCell.cellFrame = cellModelFrame;
    };
 -  /* cell的点击方法 */
    dataSource.ConfigureDidSelectBlock = ^(NSInteger row, id cellFrame) {
        NSLog(@" ConfigureDidSelectBlock == %d",row);
    };
