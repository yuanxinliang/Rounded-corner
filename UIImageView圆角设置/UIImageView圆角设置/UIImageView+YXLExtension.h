//
//  UIImageView+YXLExtension.h
//  UIImageView圆角设置
//
//  Created by 袁鑫亮 on 2017/7/13.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+YXL_ConerRadius.h"

@interface UIImageView (YXLExtension)

- (void)setImageViewRoundingCornersWithSize:(CGSize)size roundingCorners:(UIRectCorner)roundingCorners radius:(CGFloat)radius;

@end
