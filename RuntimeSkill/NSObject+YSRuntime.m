//
//  NSObject+YSRuntime.m
//  RuntimeSkill
//
//  Created by ys on 2016/5/11.
//  Copyright © 2016年 ys. All rights reserved.
//

#import "NSObject+YSRuntime.h"

@implementation NSObject (YSRuntime)
#pragma mark - 交换方法
+ (void)swizzleSelector:(SEL)originalSelector withSelector:(SEL)swizzledSelector {
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethodInit=class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethodInit) {
        class_addMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

+ (void)swizzleClassSelector:(SEL)originalSelector withClassSelector:(SEL)swizzledSelector {
    Class class = [self class];
    
    Method originalMethod = class_getClassMethod(class, originalSelector);
    Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
    if ((int)originalMethod != 0 && (int)swizzledMethod != 0) {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

#pragma mark - class_copyIvarList
/**
 *获取当前类的所有实例变量
 */
+(void)getAllIvarNameWithClass:(Class)YSClass Completed:(void (^)(NSArray *ivarNameArray))completed{
    NSMutableArray *ivarNameArray = [NSMutableArray array];
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(YSClass, &count);
    for (int i = 0; i < count; i++){
        Ivar ivar = ivars[i];
        const char *ivarName = ivar_getName(ivar);
        NSString *ivarNameCode = [NSString stringWithUTF8String:ivarName];
#ifdef _YSDebugLog
        NSLog(@"%d : %@",i,ivarNameCode);
#endif
        [ivarNameArray addObject:ivarNameCode];
    }
    if (completed) completed(ivarNameArray);
}

#pragma mark - objc_msgSend

+(id)msgSendToObj:(id)obj Selector:(SEL)selector Prarms:(NSArray*)params NeedReturn:(BOOL)needReturn{
    id returnValue = nil;
    NSInteger paramsCount = params.count;
    NSMutableArray *params_M = [NSMutableArray arrayWithArray:params];
    //
    while (params_M.count < 5) {
        [params_M addObject:@""];
    }
    params = params_M;
    //
    if (obj && selector && [obj respondsToSelector:selector] && paramsCount <= 5) {
        if (needReturn) {
            returnValue = ((id (*) (id, SEL, id, id , id, id, id)) (void *)objc_msgSend) (obj, selector, params[0], params[1], params[2], params[3], params[4]);
        }else{
            ((void (*) (id, SEL, id, id , id, id, id)) (void *)objc_msgSend)(obj, selector,  params[0], params[1], params[2], params[3], params[4]);
        }
    }
    return returnValue;
}

+(id)msgSendToClass:(Class)YSClass Selector:(SEL)selector Prarms:(NSArray*)params NeedReturn:(BOOL)needReturn{
    id returnValue = nil;
    NSInteger paramsCount = params.count;
    NSMutableArray *params_M = [NSMutableArray arrayWithArray:params];
    //
    while (params_M.count < 5) {
        [params_M addObject:@""];
    }
    params = params_M;
    //
    Method method = class_getClassMethod(YSClass, selector);
    //
    if (YSClass && selector && (int)method != 0 && paramsCount <= 5) {
        if (needReturn) {
            returnValue = ((id (*) (id, SEL, id, id , id, id, id)) (void *)objc_msgSend) (YSClass, selector, params[0], params[1], params[2], params[3], params[4]);
        }else{
            ((void (*) (id, SEL, id, id , id, id, id)) (void *)objc_msgSend)(YSClass, selector,  params[0], params[1], params[2], params[3], params[4]);
        }
    }
    return returnValue;
}

#pragma mark - NSInvocation (不限参数)
+(id)msgSendToObj_invocation:(id)obj Selector:(SEL)selector Prarms:(NSArray*)params NeedReturn:(BOOL)needReturn{
    id value = nil;
    if (obj && selector) {
        if ([obj respondsToSelector:selector]) {
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[[obj class] instanceMethodSignatureForSelector:selector]];
            [invocation setSelector:selector];
            [invocation setTarget:obj];
            for (int i=0; i < params.count; i++) {
                id ref = params[i];
                [invocation setArgument:&ref atIndex:2+i];
            }
            [invocation invoke];//perform 的传参表达方式
            if(needReturn){//获得返回值
                void *vvl = nil;
                [invocation getReturnValue:&vvl];
                value = (__bridge id)vvl;
            }
        }else{
#ifdef _YSDebugLog
            NSLog(@"msgToTarget unRespondsToSelector -->>> %@ %@",obj,menthed);
#endif
        }
    }
    return value;
}
+(id)msgSendToClass_invocation:(Class)YSClass Selector:(SEL)selector Prarms:(NSArray*)params NeedReturn:(BOOL)needReturn{
    id value = nil;
    Method method = class_getClassMethod(YSClass, selector);
    if((int)method != 0){
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[YSClass methodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:YSClass];
        for (int i=0; i < params.count; i++) {
            id ref = params[i];
            [invocation setArgument:&ref atIndex:2+i];
        }
        [invocation invoke];//perform 的传参表达方式
        if(needReturn){//获得返回值
            void *vvl = nil;
            [invocation getReturnValue:&vvl];
            value = (__bridge id)vvl;
        }
    }else{
#ifdef _YSDebugLog
        NSLog(@"msgToClass unRespondsToSelector -->>> %@ %@",YSClass,menthed);
#endif
    }
    return value;
}

#pragma mark - 动态链接一个对象
-(void)linkObj:(id)obj LinkKey:(NSString*)linkKey{
    objc_setAssociatedObject(self, (__bridge const void *)(linkKey), obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(id)getLinkObj:(NSString*)linkKey{
    return  objc_getAssociatedObject(self, (__bridge const void *)(linkKey));
}

@end
