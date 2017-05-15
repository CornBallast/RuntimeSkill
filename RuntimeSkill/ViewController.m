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
@interface ViewController ()

@end

@implementation ViewController

+(void)load{
    //[self swizzleSelector:@selector(viewDidLoad) withSelector:@selector(viewDidLoad_swizz)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person* person = [[Person alloc] init];
    [person unKnowSel_obj];
    [Person unKonwSel_class];
//    person.name = @"1234";
//    [self linkObj:@"笑话" LinkKey:@"nickName"];
//    NSLog(@"%@_%@",person.name,[self getLinkObj:@"nickName"]);
//    //
//    [NSObject msgSendToObj:person Selector:NSSelectorFromString(@"eat") Prarms:nil NeedReturn:NO];
//    [NSObject msgSendToClass:NSClassFromString(@"Person") Selector:NSSelectorFromString(@"eat") Prarms:nil NeedReturn:NO];
//    //
//    [NSObject msgSendToObj:person Selector:NSSelectorFromString(@"sleepOfHour:") Prarms:@[@(8)] NeedReturn:NO];
//    [NSObject msgSendToClass:NSClassFromString(@"Person") Selector:NSSelectorFromString(@"sleepOfHour:") Prarms:@[@(8)] NeedReturn:NO];
//    
//    //
//    id objR = [NSObject msgSendToObj:person Selector:NSSelectorFromString(@"eatEnough:") Prarms:@[@(100)] NeedReturn:YES];
//    id classR = [NSObject msgSendToClass:NSClassFromString(@"Person") Selector:NSSelectorFromString(@"eatEnough:") Prarms:@[@(100)] NeedReturn:YES];
//    NSLog(@"objR_%@ classR_%@", objR, classR);
    
    //
    SEL aSel = @selector(didReceiveMemoryWarning);
    SEL a_sel = NSSelectorFromString(@"didReceiveMemoryWarning");
    SEL a_Sel = sel_registerName("didReceiveMemoryWarning");
    NSLog(@"%p___%p___%p",aSel,a_sel,a_Sel);
    //
    Method method = class_getInstanceMethod([self class], aSel);
    IMP imp = method_getImplementation(method);
    ((void (*) (id, SEL)) (void *)imp)(self, aSel);
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



-(void)viewDidLoad_swizz{
    NSLog(@"viewDidLoad_swizz");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"内存警告了⚠️");
}


@end
