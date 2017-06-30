//
//  NSObject+Property.h
//  Runtime学习
//
//  Created by msy on 2017/6/30.
//  Copyright © 2017年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Property)

// @property分类:只会生成get,set方法声明,不会生成实现,也不会生成下划线成员属性
@property(nonatomic,strong) NSString *name;

@end
