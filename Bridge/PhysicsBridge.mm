#import <Foundation/Foundation.h>
#include "PhysicsEngine.h"

// 用一个 Objective-C 类把 C++ 包装起来
@interface PhysicsBridge : NSObject
- (void)update:(float)dt;
- (float)getYPosition;
@end

@implementation PhysicsBridge {
    PhysicsEngine _engine; // 内部持有 C++ 对象
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _engine = PhysicsEngine();
    }
    return self;
}

- (void)update:(float)dt { _engine.update(dt); }
- (float)getYPosition { return _engine.getYPosition(); }

@end
