//
//  NSNull+safe.m
//  RuntimeSkill
//
//  Created by ys on 2017/5/26.
//  Copyright © 2017年 ys. All rights reserved.
//

#import "NSNull+safe.h"

@implementation NSNull (safe)
#define pLog
#define JsonObjects @[@"",@0,@{},@[]]
- (id)forwardingTargetForSelector:(SEL)aSelector {
    for (id jsonObj in JsonObjects) {
        if ([jsonObj respondsToSelector:aSelector]) {
#ifdef pLog
            NSLog(@"NULL出现啦！这个对象应该是是_%@",[jsonObj class]);
#endif
            return jsonObj;
        }
    }
    return [super forwardingTargetForSelector:aSelector];
}



@end
