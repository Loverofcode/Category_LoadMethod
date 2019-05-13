//
//  CLPerson.m
//  面试题-load方法
//  
//  ******************** ****************** ********************
//  ******************* ****** ______******* *******************
//  ****************** *_____ /      \ _____* ******************
//  ***************** *(_____(        )_____)* *****************
//  **************** *********\------/********* ****************
//  *************** *********/        \********* ***************
//  ************** *********/    __    \********* **************
//  ************* *********/   ((__))   \********* *************
//  ************ *********(              )********* ************
//  *********** ***********\   ______   /*********** ***********
//  ********** *************\_/| __ |\_/************* **********
//  ********* ****************|||  |||**************** *********
//  ******** ******************\|  |/****************** ********
//  ******* ********************|__|******************** *******
//   ____  __  __ __  __ __  __ __ __  __  ____      __  __ __ __  __ _____  ____
//  |  _  \| | | || \ | || \ | || || \ | |/ --||  _  | \ | || || | | |||---)|  _  \
//  | |_) /| | | ||  \| ||  \| || ||  \| | / __  (_) |  \| || || | | |||--| | |_) /
//  | | \ \| |_| || |\  || |\  || || |\  | \__||     | |\  || || |_| |||___ | | \ \
//  (_|  \ \\___/ |_| \_||_| \_||_||_| \_|\____|     |_| \_||_| \___/ \----)/ /  \_\
//        \_\                                                              /_/
//  JIANSHU  https://www.jianshu.com/u/3f19ff5cda57
//  GITHUB   https://github.com/Loverofcode
//  CSDN     https://blog.csdn.net/u013480070
//
//  Created by RUNNING-NIUER on 2019/2/26.
//  Copyright © 2019 RUNNING_NIUER. All rights reserved.
    

#import "CLPerson.h"
#import <objc/runtime.h>
@implementation CLPerson
+(void)load
{
    NSLog(@"CLPerson + load");
}

+(void)test
{
    NSLog(@"CLPerson + test");
}

- (void) printMethodNamesOfClass:(Class)cls {
    unsigned int count;
    //获得方法列表
    Method *methodList = class_copyMethodList(cls, &count);
    //存储方法名
    NSMutableString *methodNames = [NSMutableString string];
    
    //遍历所有的方法
    for (int i = 0; i < count; i++) {
        //获得方法
        Method method = methodList[i];
        //h转成方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        //拼接方法名
        [methodNames appendString:methodName];
        [methodNames appendString:@", "];
    }
    
    //释放
    free(methodList);
    
    
    
    //打印方法名
    NSLog(@"%@  %@",cls, methodNames);
}
@end
