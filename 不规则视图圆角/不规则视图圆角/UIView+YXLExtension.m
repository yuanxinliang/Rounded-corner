//
//  UIView+YXLExtension.m
//  不规则视图圆角
//
//  Created by 袁鑫亮 on 2017/7/14.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "UIView+YXLExtension.h"

@implementation UIView (YXLExtension)

- (void)yxl_addCornerWithRadius:(CGFloat)radius {
    [self yxl_addCornerWithRadius:radius borderWidth:0.0 backgroundColor:[UIColor lightGrayColor] borderColor:[UIColor blackColor]];
}

- (void)yxl_addCornerWithRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor {
    UIImageView *iv = [[UIImageView alloc] initWithImage:[self yxl_drawRectCornerWithRadius:radius borderWidth:borderWidth backgroundColor:backgroundColor borderColor:borderColor]];
    [self insertSubview:iv atIndex:0];
}

- (UIImage *)yxl_drawRectCornerWithRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor {
    
    CGSize sizeToFit = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
    UIGraphicsBeginImageContextWithOptions(sizeToFit, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat spacing = radius * 2;
    CGFloat triangleWidth = 15;
    CGFloat triangleHight = sqrt(pow(triangleWidth, 2) - pow(triangleWidth / 2, 2));
    
    CGContextMoveToPoint(context, width, radius + triangleHight);// 从右边坐标开始；
    
    CGContextAddArcToPoint(context, width, height, width - radius, height, radius);
    
    CGContextAddArcToPoint(context, 0, height, 0, height - radius, radius);
    
    CGContextAddArcToPoint(context, 0, triangleHight, radius, triangleHight, radius);
    
    CGContextAddLineToPoint(context, width - radius - spacing - triangleWidth, triangleHight);
    
    CGContextAddLineToPoint(context, width - radius - spacing - triangleWidth / 2, 0);
    
    CGContextAddLineToPoint(context, width - radius - spacing, triangleHight);
    
    CGContextAddArcToPoint(context, width, triangleHight, width, radius + triangleHight, radius);
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
