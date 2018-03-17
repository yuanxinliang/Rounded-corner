//
//  UIView+YXLExtension.m
//  视图View圆角设置
//
//  Created by 袁鑫亮 on 2017/7/13.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "UIView+YXLExtension.h"

@implementation UIView (YXLExtension)

- (void)yxl_addCornerWithRadius:(CGFloat)radius {
    [self yxl_addCornerWithRadius:radius borderWidth:1.0 backgroundColor:[UIColor yellowColor] borderColor:[UIColor blackColor]];
}

- (void)yxl_addCornerWithRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor {
    UIImageView *iv = [[UIImageView alloc] initWithImage:[self yxl_drawRectCornerWithRadius:radius borderWidth:borderWidth backgroundColor:backgroundColor borderColor:borderColor]];
    [self insertSubview:iv atIndex:0];
}

- (UIImage *)yxl_drawRectCornerWithRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor {
    CGSize sizeToFit = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
    CGFloat halfBorderWidth = borderWidth / 2.0f;
    
    UIGraphicsBeginImageContextWithOptions(sizeToFit, NO, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    
    CGFloat width = sizeToFit.width;
    CGFloat height = sizeToFit.height;
    
    
//    CGContextMoveToPoint(context, width, radius); // 开始坐标右边开始
// 
//    CGContextAddArcToPoint(context, width, height, width - radius, height, radius); //右下角角度
//
//    CGContextAddArcToPoint(context, 0, height, 0, height - radius, radius); //左下角角度
//    
//    CGContextAddArcToPoint(context, 0, 0, radius, 0, radius); //左上角角度
//    
//    CGContextAddArcToPoint(context, width, 0, width, radius, radius); //右上角角度
    
    CGContextMoveToPoint(context, width - halfBorderWidth, radius); // 开始坐标右边开始
    
    CGContextAddArcToPoint(context, width - halfBorderWidth, height - halfBorderWidth, width - radius - halfBorderWidth, height - halfBorderWidth, radius - halfBorderWidth); //右下角角度
    
    CGContextAddArcToPoint(context, halfBorderWidth, height - halfBorderWidth, halfBorderWidth, height - radius - halfBorderWidth, radius - halfBorderWidth); //左下角角度
//
    CGContextAddArcToPoint(context, halfBorderWidth, halfBorderWidth, radius - halfBorderWidth, halfBorderWidth, radius - halfBorderWidth); //左上角角度
//
    CGContextAddArcToPoint(context, width - halfBorderWidth, halfBorderWidth, width - halfBorderWidth, radius - halfBorderWidth, radius - halfBorderWidth); //右上角角度

    
    CGContextDrawPath(context, kCGPathFillStroke);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end























