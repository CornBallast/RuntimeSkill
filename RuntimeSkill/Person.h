//
//  Person.h
//  TextViewDemo
//
//  Created by ys on 2017/3/27.
//  Copyright © 2017年 ys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    NSInteger age;
}

-(void)unKnowSel_obj;
+(void)unKonwSel_class;

/**
 *睡觉实例方法  有参数 无返回值
 */
-(void)sleepOfHour:(NSNumber*)hour;

/**
 *是否吃饱实例方法 有参数 有返回值
 */
-(NSNumber*)eatEnough:(NSNumber*)breadCount;

@end
