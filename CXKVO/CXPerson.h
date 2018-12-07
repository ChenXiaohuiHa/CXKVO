//
//  CXPerson.h
//  CXKVO
//
//  Created by 陈晓辉 on 2018/12/2.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CXDog.h"
NS_ASSUME_NONNULL_BEGIN

@interface CXPerson : NSObject

/** name */
@property (nonatomic, copy) NSString *name;
/** 宠物 */
@property (nonatomic, strong) CXDog *dog;
/** KVO 观察是的属性, 观察不到成员变量
 
 KVO 观察的是 属性的 set 方法
 
 OC 的属性是对 : 带有下划线的成员变量 + set 方法 + get 方法 的封装
 
 因为KVO 监听的是 属性的 set 方法, 所以数组属性的 addObject 无法触发响应
 */
@property (nonatomic, strong) NSMutableArray *array;

@end

NS_ASSUME_NONNULL_END
