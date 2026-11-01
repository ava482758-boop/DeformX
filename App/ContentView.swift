import SwiftUI

struct ContentView: View {
    // 引入刚才写的桥接类
    @State private var engine = PhysicsBridge()
    @State private var yPosition: CGFloat = 10.0
    @State private var timer: Timer?
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            Text("DeformX.crash")
                .font(.largeTitle)
                .foregroundColor(.orange)
                .position(x: UIScreen.main.bounds.width / 2, y: 100)
            
            // 模拟的物理方块
            Rectangle()
                .fill(Color.orange)
                .frame(width: 50, height: 50)
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height - CGFloat(yPosition * 50))
        }
        .onAppear {
            // 启动一个简单的游戏循环
            timer = Timer.scheduledTimer(withTimeInterval: 1.0/60.0, repeats: true) { _ in
                engine.update(1.0/60.0) // 调 C++ 物理代码
                yPosition = CGFloat(engine.getYPosition()) // 更新 UI
            }
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
}
