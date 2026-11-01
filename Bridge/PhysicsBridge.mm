#import <Foundation/Foundation.h>
#include "PhysicsEngine.h"

@interface PhysicsBridge : NSObject
- (void)update:(float)dt;
- (float)getYPosition;
@end

@implementation PhysicsBridge {
    // 核心修复：使用指针或引用，避免编译报错
    PhysicsEngine* _engine; 
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _engine = new PhysicsEngine(); // 动态分配
    }
    return self;
}

- (void)dealloc {
    delete _engine; // 释放内存
}

- (void)update:(float)dt { 
    _engine->update(dt); 
}

- (float)getYPosition { 
    return _engine->getYPosition(); 
}

@end
