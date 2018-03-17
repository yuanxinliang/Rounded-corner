//
//  ViewController.m
//  视图View圆角设置
//
//  Created by 袁鑫亮 on 2017/7/13.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "ViewController.h"
#import "UIView+YXLExtension.h"
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *redBackgroundView = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300) / 2, 100, 300, 400)];
//    redBackgroundView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redBackgroundView];
//    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 150, redBackgroundView.frame.size.width / 2, 50)];
//    [leftButton setBackgroundColor:[UIColor yellowColor]];
//    [redBackgroundView addSubview:leftButton];
    
    // 第一种方式
//    redBackgroundView.layer.cornerRadius = 40;
//    redBackgroundView.layer.masksToBounds = YES;
    
    // 第二种方式
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:redBackgroundView.bounds byRoundingCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(30, 30)];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = redBackgroundView.bounds;
//    maskLayer.path = maskPath.CGPath;
//    redBackgroundView.layer.mask = maskLayer;
    
    // 第三种方式 通过给视图添加iv的方式。iv里面放了image
    [redBackgroundView yxl_addCornerWithRadius:20];
}


@end
