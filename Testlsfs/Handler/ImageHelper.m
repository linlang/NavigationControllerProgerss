//
//  ImageHelper.m
//  AVAudioPlayerProject
//
//  Created by Linyoung on 2017/7/29.
//  Copyright © 2017年 Linyoung. All rights reserved.
//

#import "ImageHelper.h"

@implementation ImageHelper

/**
 *  通过一个颜色绘制一个 uiimage
 */
+ (UIImage *)drawImageWithColor:(UIColor *)color
{
    CGSize imageSize = CGSizeMake(10, 10);
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return pressedColorImg;
}

@end
