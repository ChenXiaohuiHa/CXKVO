//
//  CXPerson.m
//  CXKVO
//
//  Created by 陈晓辉 on 2018/12/2.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import "CXPerson.h"

@implementation CXPerson

- (instancetype)init {
    self = [super init];
    if (self) {
        _dog = [CXDog new];
        _array = [NSMutableArray array];
    }
    return self;
}


/*
 有时候我们并不需要响应 name 的所有变化值, 只有当 name 值满足需求时, 才响应, 怎么做呢?
 
 我们需要添加一个类方法 automaticallyNotifiesObserversForKey 设置自动触发响应还是手动触发,
 我们可以根据需求手动触发响应
 */

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    
    //如果对象的很多属性再被监听, 唯独 name 属性特殊需要手动响应时
    if ([key isEqualToString:@"name"]) {
        
        return NO;
    }
    
    //YES 自动触发
    //NO  手动触发
    return YES;
}


/*
 有时候会监听一个对象的多个属性值得变化(dog 对象的 name,age 等属性),一个一个添加监听, 会很麻烦
 这是我们可以设置依赖关系,只监听 dog 对象,当 dog 对象的某个属性值发生变化时, 会触发响应
 
 返回一个容器, NSString * 类型
 */
+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
    
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"dog"]) { //只有触发 dog 对象时, 才会添加 dog 的属性
        
        //拿到新的 keyPaths,
        //属性依赖关系中, 一定要有 "_", _dog 的成员g变量
        NSArray *dogKeys = @[@"_dog.name",@"_dog.age"];
        keyPaths = [keyPaths setByAddingObjectsFromArray:dogKeys];
    }
    return keyPaths;
}


@end
