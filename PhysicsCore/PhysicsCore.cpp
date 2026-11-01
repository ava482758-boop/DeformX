#include "PhysicsEngine.h"

PhysicsEngine::PhysicsEngine() {
    y = 10.0f;       // 初始高度
    velocity = 0.0f;
    gravity = -9.8f; // 重力加速度
}

void PhysicsEngine::update(float dt) {
    velocity += gravity * dt;
    y += velocity * dt;
    if (y < 0.0f) { // 简单地面碰撞
        y = 0.0f;
        velocity = 0.0f;
    }
}

float PhysicsEngine::getYPosition() {
    return y;
}
