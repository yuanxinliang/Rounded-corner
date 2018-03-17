//
//  ViewController.m
//  不规则视图圆角
//
//  Created by 袁鑫亮 on 2017/7/14.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
#import "UIView+YXLExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 第一种方式
//    CustomView *view = [[CustomView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
//    view.center = self.view.center;
//    [self.view addSubview:view];
    
    // 第二种方式
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 50, 200, 200)];
//    view.backgroundColor = [UIColor redColor];
    [view yxl_addCornerWithRadius:10];
    [self.view addSubview:view];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
