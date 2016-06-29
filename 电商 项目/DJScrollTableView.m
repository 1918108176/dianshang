//
//  DJScrollTableView.m
//  电商 项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJScrollTableView.h"
#import "DJSingleTableViewCell.h"
#import "DJGroupTableViewCell.h"

@interface DJScrollTableView ()

@end

@implementation DJScrollTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.separatorStyle = UITableViewCellAccessoryNone;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_isSingle) {
        return _singleListArray.count;
    } else {
        return _groupBuyListArray.count;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isSingle) {
        return 170;
    }else{
        return 175;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    if (_isSingle) {
        DJSingleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[DJSingleTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.singleModel = self.singleListArray[indexPath.row];
        return cell;
    } else {
        DJGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[DJGroupTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.groupBuyModel = self.groupBuyListArray[indexPath.row];
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isSingle) {
        if (_singBlock) {
            NSString *goodsID = [NSString stringWithFormat:@"%@", self.singleListArray[indexPath.row]];
            _singBlock(goodsID);
        }
        
    } else {
        if (_groBlock) {
            NSString *ActivityId = [NSString stringWithFormat:@"%@",self.groupBuyListArray[indexPath.row]];
            _groBlock(ActivityId);
        }
        
    }
}




@end
