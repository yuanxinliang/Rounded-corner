//
//  ViewController.m
//  UIImageView圆角设置
//
//  Created by 袁鑫亮 on 2017/7/13.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+YXLExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    iv.backgroundColor = [UIColor yellowColor];
    iv.image = [UIImage imageNamed:@"helpdesk"];
    [iv setImageViewRoundingCornersWithSize:iv.frame.size roundingCorners:UIRectCornerTopLeft radius:100];
    [self.view addSubview:iv];
}


@end
