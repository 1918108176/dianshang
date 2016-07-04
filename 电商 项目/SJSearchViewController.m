//
//  SJSearchViewController.m
//  电商 项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "SJSearchViewController.h"
#import "DJTableViewController.h"

@interface SJSearchViewController ()<UISearchBarDelegate>

@property (strong,nonatomic) UISearchBar *goodsSearchBar;

@end

@implementation SJSearchViewController

-(UISearchBar *)goodsSearchBar{
    if (!_goodsSearchBar) {
        _goodsSearchBar = [[UISearchBar alloc]initWithFrame:Rect(0, 0, VIEW_WIDTH, 40)];
        [_goodsSearchBar becomeFirstResponder];
        _goodsSearchBar.placeholder = @"输入要搜索的商品";
        _goodsSearchBar.showsCancelButton = YES;
        
    }
    return _goodsSearchBar;
}











- (void)viewDidLoad {
    [super viewDidLoad];
    
}
@end
