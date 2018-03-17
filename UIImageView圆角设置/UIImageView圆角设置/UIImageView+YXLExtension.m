//
//  UIImageView+YXLExtension.m
//  UIImageView圆角设置
//
//  Created by 袁鑫亮 on 2017/7/13.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "UIImageView+YXLExtension.h"

@implementation UIImageView (YXLExtension)

- (void)setImageViewRoundingCornersWithSize:(CGSize)size roundingCorners:(UIRectCorner)roundingCorners radius:(CGFloat)radius {
    if (self.image != nil) {
        self.image = [self.image circleImageWithSize:size roundingCorners:roundingCorners radius:radius];
    }
}

@end
