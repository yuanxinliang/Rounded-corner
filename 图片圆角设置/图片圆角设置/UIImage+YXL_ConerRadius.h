//
//  UIImage+YXL_ConerRadius.h
//  图片圆角设置
//
//  Created by 袁鑫亮 on 2017/4/12.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YXL_ConerRadius)
- (instancetype)circleImageWithRadius:(CGFloat)radius;
- (instancetype)circleImageWithSize:(CGSize)size roundingCorners:(UIRectCorner)roundingCorners radius:(CGFloat)radius;
- (instancetype)circleImage;
+ (instancetype)circleImageWithImageNamed:(NSString *)imageNamed;
@end
