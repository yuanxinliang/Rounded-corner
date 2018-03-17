//
//  CustomView.m
//  不规则视图圆角
//
//  Created by 袁鑫亮 on 2017/7/14.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat radius = 30;
    CGFloat spacing = radius / 2;
    CGFloat triangleWidth = radius;
    CGFloat triangleHight = sqrt(pow(triangleWidth, 2) - pow(triangleWidth / 2, 2));
    
    
    // 1.获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.设置图形
    CGContextMoveToPoint(ctx, width, radius + triangleHight);// 从右边坐标开始；
    CGContextAddArcToPoint(ctx, width, height, width - radius, height, radius);
    CGContextAddArcToPoint(ctx, 0, height, 0, height - radius, radius);
    CGContextAddArcToPoint(ctx, 0, triangleHight, radius, triangleHight, radius);
    
    CGContextAddLineToPoint(ctx, width - radius - spacing - triangleWidth, triangleHight);
    
    CGContextAddLineToPoint(ctx, width - radius - spacing - triangleWidth / 2, 0);
    
    CGContextAddLineToPoint(ctx, width - radius - spacing, triangleHight);
    
    CGContextAddArcToPoint(ctx, width, triangleHight, width, radius + triangleHight, radius);
    
    [[UIColor yellowColor] setFill];
    // 3.绘制图形
    CGContextFillPath(ctx);
}

@end
