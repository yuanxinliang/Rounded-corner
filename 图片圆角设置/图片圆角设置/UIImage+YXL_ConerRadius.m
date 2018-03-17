//
//  UIImage+YXL_ConerRadius.m
//  图片圆角设置
//
//  Created by 袁鑫亮 on 2017/4/12.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "UIImage+YXL_ConerRadius.h"

@implementation UIImage (YXL_ConerRadius)
- (instancetype)circleImageWithRadius:(CGFloat)radius {
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    //根据矩形画带圆角的曲线
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    /**
     圆形曲线
     */
//    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerBottomRight cornerRadii:CGSizeMake(radius, radius)];
    
    CGContextAddPath(UIGraphicsGetCurrentContext(), bezier.CGPath);
    
    CGContextClip(UIGraphicsGetCurrentContext());
    
    [self drawInRect:rect];
    
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}


/**
 根据视图的大小，圆角的规则和圆角的大小

 @param size 视图的大小
 @param roundingCorners 圆角的类型
 @param radius 圆角的大小
 @return 图片
 */

- (instancetype)circleImageWithSize:(CGSize)size roundingCorners:(UIRectCorner)roundingCorners radius:(CGFloat)radius {
    
    /* 
     *
     void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale);
     size——同UIGraphicsBeginImageContext,参数size为新创建的位图上下文的大小
     opaque—透明开关，如果图形完全不用透明，设置为YES以优化位图的存储。
     scale—–缩放因子
    */
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    //根据矩形画带圆角的曲线
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    //根据矩形画带圆角的曲线
    /**
     圆形曲线
     */
    //    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    /**
     根据圆角cornerRadii的值画椭圆形，还能设置UIRectCorner
     */
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:roundingCorners cornerRadii:CGSizeMake(radius, radius)];
    
    CGContextAddPath(UIGraphicsGetCurrentContext(), bezier.CGPath);
    
    CGContextClip(UIGraphicsGetCurrentContext());
    
    [self drawInRect:rect];
    
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

/**
 切一个圆形的圆角
 */
- (instancetype)circleImage {
    // 开启图形上下文
    UIGraphicsBeginImageContext(self.size);
//    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    // 上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置一个范围
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    // 根据rect范围创建一个椭圆
    CGContextAddEllipseInRect(context, rect);
    // 裁剪
    CGContextClip(context);
    // 将原照片画到图形上下文
    [self drawInRect:rect];
    // 从上下文上获取剪裁后的照片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}

+ (instancetype)circleImageWithImageNamed:(NSString *)imageNamed {
    return [[self imageNamed:imageNamed] circleImage];
}
@end
