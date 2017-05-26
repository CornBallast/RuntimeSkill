//
//  Person+Character.m
//  RuntimeSkill
//
//  Created by ys on 2017/5/11.
//  Copyright © 2017年 ys. All rights reserved.
//

#import "Person+Character.h"
#import "YSAssociated.h"
@implementation Person (Character)

//-(NSString *)name {
//    return objc_getAssociatedObject(self, @"name");
//}
//
//-(void)setName:(NSString *)name {
//    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
ASSOCIATED(name, setName, NSString*, OBJC_ASSOCIATION_COPY_NONATOMIC);

@end
