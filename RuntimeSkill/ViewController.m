//
//  ViewController.m
//  RuntimeSkill
//
//  Created by ys on 2016/5/11.
//  Copyright © 2016年 ys. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+YSRuntime.h"
#import "Person.h"
#import "Person+Character.h"
#import "Person+SleepControl.h"
#import "NSArray+name.h"
@interface ViewController ()

@end

@implementation ViewController


+(void)load{
    //[self swizzleSelector:@selector(viewDidLoad) withSelector:@selector(viewDidLoad_swizz)];
    //[self noSameClassSelSiwzz];
}

+(void)noSameClassSelSiwzz{
    Method originalMethod_class = class_getInstanceMethod(self, NSSelectorFromString(@"viewDidLoad"));
    Method swizzledMethod_class = class_getClassMethod(NSClassFromString(@"Person"), NSSelectorFromString(@"sleepOfHour:"));
    method_exchangeImplementations(originalMethod_class, swizzledMethod_class);
    
    Method originalMethod_id = class_getInstanceMethod(self, NSSelectorFromString(@"viewDidLoad"));
    Method swizzledMethod_id = class_getInstanceMethod(NSClassFromString(@"Person"), NSSelectorFromString(@"eat"));
    method_exchangeImplementations(originalMethod_id, swizzledMethod_id);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[[self class] eat_VC];
//    method_setImplementation(class_getInstanceMethod([self class], NSSelectorFromString(@"swizzTest")), method_getImplementation(class_getInstanceMethod([Person class], NSSelectorFromString(@"eat"))));
    //
    //class_replaceMethod([self class], NSSelectorFromString(@"swizzTest"), method_getImplementation(class_getInstanceMethod([Person class], NSSelectorFromString(@"eat"))), "v@:");
//    [self swizzTest];
    //
    Person* person = [[Person alloc] init];
    //person.name = @"伍丽娟";
//    [NSObject getAllIvarNameWithClass:[Person class] Completed:^(NSArray *ivarNameArray) {
//        NSLog(@"ivars_%@",ivarNameArray);
//    }];
//    [NSObject getAllPropertyNameWithClass:[Person class] Completed:^(NSArray *propertyNameArray) {
//        NSLog(@"propertys_%@",propertyNameArray);
//    }];
    //[person unKnowSel_obj];
    //[Person unKonwSel_class];
    //person.name = @"1234";
    //[self linkObj:@"笑话" LinkKey:@"nickName"];
    //NSLog(@"%@_%@",person.name,[self getLinkObj:@"nickName"]);
    //
//    [NSObject msgSendToObj:person Selector:NSSelectorFromString(@"eat") Prarms:nil NeedReturn:NO];
//    [NSObject msgSendToClass:NSClassFromString(@"Person") Selector:NSSelectorFromString(@"eat") Prarms:nil NeedReturn:NO];
//    //
//    [NSObject msgSendToObj:person Selector:NSSelectorFromString(@"sleepOfHour:") Prarms:@[@(10)] NeedReturn:NO];
//    [NSObject msgSendToClass:NSClassFromString(@"Person") Selector:NSSelectorFromString(@"sleepOfHour:") Prarms:@[@(8)] NeedReturn:NO];
//    //
//    id objR = [NSObject msgSendToObj:person Selector:NSSelectorFromString(@"eatEnough:") Prarms:@[@(100)] NeedReturn:YES];
//    id classR = [NSObject msgSendToClass:NSClassFromString(@"Person") Selector:NSSelectorFromString(@"eatEnough:") Prarms:@[@(100)] NeedReturn:YES];
//    NSLog(@"objR_%@ classR_%@", objR, classR);
    
    //
//    [NSObject msgSendToObj_invocation:person Selector:NSSelectorFromString(@"eat") Prarms:nil NeedReturn:NO];
//    [NSObject msgSendToClass_invocation:NSClassFromString(@"Person") Selector:NSSelectorFromString(@"eat") Prarms:nil NeedReturn:NO];
    //
//    [NSObject msgSendToObj_invocation:person Selector:NSSelectorFromString(@"sleepOfHour:") Prarms:@[@(10)] NeedReturn:NO];
//    [NSObject msgSendToClass_invocation:NSClassFromString(@"Person") Selector:NSSelectorFromString(@"sleepOfHour:") Prarms:@[@(8)] NeedReturn:NO];
    //
//    id objR_in = [NSObject msgSendToObj_invocation:person Selector:NSSelectorFromString(@"eatEnough:") Prarms:@[@(100)] NeedReturn:YES];
//    id classR_in = [NSObject msgSendToClass_invocation:NSClassFromString(@"Person") Selector:NSSelectorFromString(@"eatEnough:") Prarms:@[@(100)] NeedReturn:YES];
//    NSLog(@"objR_in_%@ classR_in_%@", objR_in, classR_in);
    
//    id return_id = [NSObject msgSendToObj_invocation:person Selector:NSSelectorFromString(@"eatMeal:Name:") Prarms:@[@(10),@"面包"] NeedReturn:YES];
//    NSLog(@"%@",return_id);
//    [[self class] swizzleSelector:@selector(swizzTest) withSelector:@selector(viewDidLoad_swizz)];
    
//    [self swizzTest];
    
    //
//    SEL aSel = @selector(didReceiveMemoryWarning);
//    SEL a_sel = NSSelectorFromString(@"didReceiveMemoryWarning");
//    SEL a_Sel = sel_registerName("didReceiveMemoryWarning");
//    NSLog(@"%p___%p___%p",aSel,a_sel,a_Sel);
//    //
//    Method method = class_getInstanceMethod([self class], aSel);
//    IMP imp = method_getImplementation(method);
//    ((void (*) (id, SEL)) (void *)imp)(self, aSel);
    
    
//    NSArray* array_test = [NSArray new];
//    array_test.name = @"12345";
//    NSLog(@"%@",array_test.name);
    NSDictionary* dict = [[NSNull alloc] init];
    [dict objectForKey:@"123"];
}

-(void)nslogClassAndIdWithPerson:(Person*)person{
    NSLog(@"%p",person);
    //
    NSLog(@"%p",[person class]);
    NSLog(@"%p",[Person class]);
    NSLog(@"%p",[[Person class] class]);
    //
    NSLog(@"%p",object_getClass(person));
    NSLog(@"%p",object_getClass([person class]));
    NSLog(@"%p",object_getClass(object_getClass([person class])));
    NSLog(@"%p",object_getClass(object_getClass(object_getClass([NSObject class]))));
}

-(void)viewWillAppear:(BOOL)animated{
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
}

-(void)viewDidLoad_swizz{
    NSLog(@"viewDidLoad_swizz");
}

-(void)swizzTest{
    NSLog(@"swizzTest_swizz");
}

-(void)swizzTest_Imp{
    NSLog(@"swizzTest_Imp");
}


+(void)eat_VC{
    NSLog(@"eat_VC");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"内存警告了⚠️");
}


@end
