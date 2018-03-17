//
//  ViewController.m
//  图片圆角设置
//
//  Created by 袁鑫亮 on 2017/4/12.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+YXL_ConerRadius.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(60, 60, 200, 200)];
    iv.center = self.view.center;
    iv.backgroundColor = [UIColor redColor];
    [self.view addSubview:iv];
    
    /**
     只是设置图片圆角，本身imageView没有设置
     */
//    iv.image = [[UIImage imageNamed:@"helpdesk"] circleImageWithRadius:100];
//    iv.image = [[UIImage imageNamed:@"helpdesk"] circleImage];
//    iv.image = [UIImage circleImageWithImageNamed:@"helpdesk"];
    iv.image = [[UIImage imageNamed:@"helpdesk"] circleImageWithSize:iv.frame.size roundingCorners:UIRectCornerAllCorners radius:100];
    
//    iv.image = [UIImage imageNamed:@"helpdesk"];
    
    /**
     默认情况下，这个属性只会影响视图的背景颜色和 border。对于视图内部还有子视图的控件就无能为力了
     */
//    iv.layer.cornerRadius = 100;
    
//    iv.layer.masksToBounds = YES;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 200, 200)];
    view1.backgroundColor = [UIColor yellowColor];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    view2.backgroundColor = [UIColor brownColor];
    [view1 addSubview:view2];
    view1.layer.cornerRadius = 100;
    view1.layer.masksToBounds = YES;
    [self.view addSubview:view1];
}


@end
