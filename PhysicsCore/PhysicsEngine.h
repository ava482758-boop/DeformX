#ifndef PhysicsEngine_h
#define PhysicsEngine_h

class PhysicsEngine {
public:
    PhysicsEngine();
    void update(float dt); // 物理步进
    float getYPosition();  // 获取 Y 轴位置

private:
    float y;
    float velocity;
    float gravity;
};

#endif
