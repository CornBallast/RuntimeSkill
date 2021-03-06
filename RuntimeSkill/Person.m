//
//  Person.m
//  TextViewDemo
//
//  Created by ys on 2017/3/27.
//  Copyright © 2017年 ys. All rights reserved.
//

#import "Person.h"
#import "Boss.h"
#import <objc/runtime.h>
@implementation Person

/**
 *吃饭实例方法  无参数 无返回值
 */
-(void)eat{
    NSLog(@"eat_person");
}
/**
 *吃饭类方法  无参数  无返回值
 */
+(void)eat{
    NSLog(@"eat_class");
}

/**
 *睡觉实例方法  有参数 无返回值
 */
-(void)sleepOfHour:(NSNumber*)hour{
    NSLog(@"sleep_person_%@",hour);
}
/**
 *睡觉类方法  有参数 无返回值
 */
+(void)sleepOfHour:(NSNumber*)hour{
    NSLog(@"sleep_class_%@",hour);
}


/**
 *是否吃饱实例方法 有参数 有返回值
 */
-(NSNumber*)eatEnough:(NSNumber*)breadCount{
    NSLog(@"breadCount_person_%@",breadCount);
    return @(1);
}

/**
 *是否吃饱类方法 有参数 有返回值
 */
+(NSNumber*)eatEnough:(NSNumber*)breadCount{
    NSLog(@"breadCount_class_%@",breadCount);
    return @(0);
}


-(id)eatMeal:(NSNumber*)meal Name:(NSString*)name{
    return [NSString stringWithFormat:@"吃饱了_%@_%@",meal,name];
}

//
-(void)noObjMethod{
    NSLog(@"未实现这个实例方法");
}
+(void)noClassMethod{
    NSLog(@"未实现这个类方法");
}
//
//-(void)unKnowSel_obj{
//    NSLog(@"unKnowSel_obj");
//}

//+(void)unKonwSel_class{
//    NSLog(@"unKonwSel_class");
//}

//实例方法
-(void)testObjMethod{
    NSLog(@"我是一个实例方法");
}

// 当一个对象调用未实现的方法，会调用这个方法处理,并且会把对应的方法列表传过来.
//注意:实例方法是存在于当前对象对应的类的方法列表中
//+(BOOL)resolveInstanceMethod:(SEL)sel{
//    SEL aSel = NSSelectorFromString(@"noObjMethod");
//    Method aMethod = class_getInstanceMethod(self, aSel);
//    class_addMethod(self, sel, method_getImplementation(aMethod), "v@:");
//    return YES;
//}
// 当一个类调用未实现的方法，会调用这个方法处理,并且会把对应的方法列表传过来.
//注意:类方法是存在于类的元类的方法列表中
//+(BOOL)resolveClassMethod:(SEL)sel{
//    SEL aSel = NSSelectorFromString(@"noClassMethod");
//    Method aMethod = class_getClassMethod(self, aSel);
//    class_addMethod(object_getClass(self), sel, method_getImplementation(aMethod), "v@:");
//    return YES;
//}
//消息转发第二个步 可返回一个可以处理该事件的对象
//-(id)forwardingTargetForSelector:(SEL)aSelector{
//    return [[Boss alloc] init];
//}
//消息转发第三步 返回方法签名。如果返回nil，则表示无法处理消息 调用-doesNotRecognizeSelector
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    if ([NSStringFromSelector(aSelector) isEqualToString:@"unKnowSel_obj"]) {
//        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
//    }
//    return [super methodSignatureForSelector:aSelector];
//}

// 第四步，如果第三部返回了方法签名才会进入这一步，这一步用户调用方法,当我们实现了此方法后，-doesNotRecognizeSelector:不会再被调用。也就是不会crash
//-(void)forwardInvocation:(NSInvocation *)anInvocation{
//    [anInvocation invokeWithTarget:[[Boss alloc] init]];
//}

//- (void)doesNotRecognizeSelector:(SEL)aSelector {
//    NSLog(@"无法处理消息：%@", NSStringFromSelector(aSelector));
//}




@end
