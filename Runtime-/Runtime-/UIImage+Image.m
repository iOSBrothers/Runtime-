//
//  UIImage+Image.m
//  Runtime学习
//
//  Created by msy on 2017/6/30.
//  Copyright © 2017年 YM. All rights reserved.
//

#import "UIImage+Image.h"
#include <objc/runtime.h>
@implementation UIImage (Image)

+(void)load{
    // 1.获取 imageNamed方法地址
    // class_getClassMethod（获取某个类的方法）
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    
    // 2.获取 ym_imageNamed方法地址
    Method ym_imageNamedMethod = class_getClassMethod(self, @selector(ym_imageNamed:));
    
    // 3.交换方法地址，相当于交换实现方式;「method_exchangeImplementations 交换两个方法的实现」
    method_exchangeImplementations(imageNamedMethod, ym_imageNamedMethod);
}

+ (UIImage *)ym_imageNamed:(NSString *)name {
    
    UIImage *image = [UIImage ym_imageNamed:name];
    if (image) {
        NSLog(@"runtime添加额外功能--加载成功");
    } else {
        NSLog(@"runtime添加额外功能--加载失败");
    }
    return image;
}
@end
