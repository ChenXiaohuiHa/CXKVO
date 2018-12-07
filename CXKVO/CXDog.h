//
//  CXDog.h
//  CXKVO
//
//  Created by 陈晓辉 on 2018/12/2.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXDog : NSObject

/** name */
@property (nonatomic, copy) NSString *name;
/** age */
@property (nonatomic, assign) int age;

@end

NS_ASSUME_NONNULL_END
