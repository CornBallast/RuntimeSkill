//
//  NSObject+YSRuntime.h
//  RuntimeSkill
//
//  Created by ys on 2016/5/11.
//  Copyright © 2016年 ys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

//#define _YSDebugLog 1

@interface NSObject (YSRuntime)
#pragma mark - method_exchangeImplementations
/**
 *替换实例方法(在+load中调用)
 */
+ (void)swizzleSelector:(SEL)originalSelector withSelector:(SEL)swizzledSelector;
/**
 *替换类方法(在+load中调用)
 */
+ (void)swizzleClassSelector:(SEL)originalSelector withClassSelector:(SEL)swizzledSelector;

#pragma mark - class_copyIvarList
/**
 *获取当前类的所有实例变量
 */
+(void)getAllIvarNameWithClass:(Class)YSClass Completed:(void (^)(NSArray *ivarNameArray))completed;

#pragma mark - objc_msgSend (限制五个个参数及以内)
/**
 *实例方法
 */
+(id)msgSendToObj:(id)obj Selector:(SEL)selector Prarms:(NSArray*)params NeedReturn:(BOOL)needReturn;
/**
 *类方法
 */
+(id)msgSendToClass:(Class)YSClass Selector:(SEL)selector Prarms:(NSArray*)params NeedReturn:(BOOL)needReturn;

#pragma mark - NSInvocation (不限参数)
/**
 *实例方法
 */
+(id)msgSendToObj_invocation:(id)obj Selector:(SEL)selector Prarms:(NSArray*)params NeedReturn:(BOOL)needReturn;
/**
 *类方法
 */
+(id)msgSendToClass_invocation:(Class)YSClass Selector:(SEL)selector Prarms:(NSArray*)params NeedReturn:(BOOL)needReturn;

#pragma mark - 动态链接一个对象
-(void)linkObj:(id)obj LinkKey:(NSString*)linkKey;
-(id)getLinkObj:(NSString*)linkKey;



@end
