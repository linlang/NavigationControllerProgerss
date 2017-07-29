//
//  ImageHelper.h
//  AVAudioPlayerProject
//
//  Created by Linyoung on 2017/7/29.
//  Copyright © 2017年 Linyoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageHelper : NSObject

/**
 *  通过一个颜色绘制一个 uiimage
 */
+ (UIImage *)drawImageWithColor:(UIColor *)color;

@end
