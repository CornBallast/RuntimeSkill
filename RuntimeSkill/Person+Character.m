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
ASSOCIATED(name, setName, NSString*, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
@end
