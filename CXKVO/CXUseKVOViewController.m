//
//  CXUseKVOViewController.m
//  CXKVO
//
//  Created by 陈晓辉 on 2018/12/2.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import "CXUseKVOViewController.h"

#import "CXPerson.h"

@interface CXUseKVOViewController ()

/** ObjC */
@property (nonatomic, strong) CXPerson *person;

@end

@implementation CXUseKVOViewController

/*
 1. 动态创建 CXPerson 对象 (通过 runtime)
 2. 重写 setName 方法, 在内部恢复父类的做法
 3. 动态的创建了 CXPerson 类的子类 NSKVONotifing_CXPerson
 4. 动态的修改了 person 对象的类型, 让他变为子类类型, 即 person 对象类型由 CXPerson 变为 NSKVONotifing_CXPerson
 5. 调用了 NSKVONotifing_CXPerson 属性的 set 方法
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建 person 对象
    _person = [CXPerson new];
    
    //订阅观察者
    //监听 person 对象的 name 属性的变化
    
    /*
     NSKeyValueObservingOptionNew     : 观察新值
     NSKeyValueObservingOptionOld     : 观察旧值
     NSKeyValueObservingOptionInitial : 注册的时候 和改变的时候 各发一次
     NSKeyValueObservingOptionPrior   : 改变之前和改变之后各发一次
     */
    [_person addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
    [_person addObserver:self forKeyPath:@"dog" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
}

//响应 观察对象值得变化
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    //change 字典中
    //kind: 1
    //new : 属性的最新值
    //old : 属性的旧值
    NSLog(@"change: %@", change);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    static int count = 0;
    count++;
    
    //手动
    [_person willChangeValueForKey:@"name"];
    _person.name = [NSString stringWithFormat:@"fengZhanBingHua_%d",count];
    [_person didChangeValueForKey:@"name"];
    
    //自动
    _person.dog.name = [NSString stringWithFormat:@"wangCai_%d",count];
    _person.dog.age = count;
    
    //因为KVO 监听的是 属性的 set 方法, 所以数组属性的 addObject 无法触发响应
    [_person.array addObject:@(count)];
}

@end
