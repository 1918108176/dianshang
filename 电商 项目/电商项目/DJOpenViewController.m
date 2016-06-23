//
//  DJOpenViewController.m
//  电商项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJOpenViewController.h"
#import "FirstView.h"
#import "view.h"

@interface DJOpenViewController ()

@property (strong,nonatomic) FirstView *view1;

@property (strong,nonatomic) view *view2;

@end

@implementation DJOpenViewController

- (FirstView *)view{
    if (!_view1) {
        _view1 = [[FirstView alloc]init];
    }
    return _view1;
}
- (view *)view2{
    if (!_view2) {
        _view2 = [[view alloc]initWithFrame:CGRectMake(0, 300, CGRectGetWidth(self.view.frame), 100)];
    }
    return _view2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    [self.view addSubview:self.view2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
