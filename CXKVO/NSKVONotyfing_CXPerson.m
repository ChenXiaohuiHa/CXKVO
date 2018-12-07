//
//  NSKVONotyfing_CXPerson.m
//  CXKVO
//
//  Created by 陈晓辉 on 2018/12/2.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import "NSKVONotyfing_CXPerson.h"

@implementation NSKVONotyfing_CXPerson

- (void)setName:(NSString *)name {
    
    [self willChangeValueForKey:@"name"];
    
    [super setName:name];
    
    [self didChangeValueForKey:@"name"];
}

@end
