//
//  DJBuyCarTableView.m
//  电商 项目
//
//  Created by ma c on 16/6/30.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJBuyCarTableView.h"
#import "DJBuyCarTableViewCell.h"


@interface DJBuyCarTableView ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation DJBuyCarTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = RGB(245, 245, 245);
        self.separatorStyle = UITableViewCellAccessoryNone;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    DJBuyCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[DJBuyCarTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    
    
    return cell;
}





@end
