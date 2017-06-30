//
//  ViewController.m
//  Runtime学习
//
//  Created by msy on 2017/6/30.
//  Copyright © 2017年 YM. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

#include <objc/message.h>

#import "NSObject+Property.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.消息机制
    //【查找build setting -> 搜索msg -> objc_msgSend（YES --> NO）】
    
    /////三种不同的runtime写法
    
    // Person *p = [Person alloc];
    
    // 或  Person *p = objc_msgSend(objc_getClass("Person"), sel_registerName("alloc"));
    
    // 或  Person *p = objc_msgSend(objc_getClass("Person"), @selector(alloc));
    
    Person *p = objc_msgSend([Person class], @selector(alloc));
    
    // p = [p init];
    p = objc_msgSend(p, sel_registerName("init"));
    
    // [p eat];
    objc_msgSend(p, sel_registerName("eat"));
    
    // [p run:@"20"];
    objc_msgSend(p, sel_registerName("run:"),@"20");
    
    // 2.交换方法
    [UIImage imageNamed:@"icon"];
    
    // 3.给NSObject分类动态添加属性
    NSObject *objc = [[NSObject alloc] init];
    objc.name = @"123";
    NSLog(@"runtime动态添加属性name==%@",objc.name);
    
    // 4.动态添加方法
    Person *p1 = [[Person alloc] init];
    [p1 performSelector:@selector(running:) withObject:@"晓明"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
