//
//  Person+SleepControl.m
//  RuntimeSkill
//
//  Created by ys on 2017/5/16.
//  Copyright © 2017年 ys. All rights reserved.
//

#import "Person+SleepControl.h"
#import "NSObject+YSRuntime.h"
@implementation Person (SleepControl)

+(void)load{
    [self swizzleSelector:NSSelectorFromString(@"sleepOfHour:") withSelector:NSSelectorFromString(@"sleepOfHour_control:")];
}

-(void)sleepOfHour_control:(NSNumber*)hours{
    [self sleepOfHour_control:hours];
    if ([hours integerValue] >= 10) {
        NSLog(@"你睡得太多了吧,小伙");
    }
}

+(void)sleepOfHour:(NSNumber*)hour{
    NSLog(@"sleep_class_%@",hour);
}


@end
