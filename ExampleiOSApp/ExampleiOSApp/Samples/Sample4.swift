//
//  Sample4.swift
//  ExampleiOSApp
//
//  Created by Yuki Kuwashima on 2022/12/20.
//

import SwiftUI
import SwiftyCreatives

struct Sample4: View {
    
    var body: some View {
        Text("Sample4")
            .font(.largeTitle)
        Form {
            Section("Example1") {
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
            }
            Section("Example2") {
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
                ZStack {SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")}
            }
        }
        .background(.black)
    }
    
    final class MySketch: SketchBase {
        
        var objs: [Rect] = []
        
        var elapsed: Float = Float.random(in: 0...1)
        var rand: Float = Float.random(in: 0...1)
        
        func setup() {
            for x in -7...7 {
                for y in -1...1 {
                    let rect = Rect()
                    rect.setColor(f4.randomPoint(0...1))
                    rect.setPos(
                        f3(
                            Float(x)*30,
                            Float(y)*30,
                            0
                        )
                    )
                    rect.setScale(f3.one * 30)
                    objs.append(rect)
                }
            }
        }
        func update() {
            for o in objs {
                o.setColor(f4(rand, sin(elapsed * o.color.z * 10) * 0.5, o.color.z, o.color.w))
            }
            elapsed += 0.003
        }
        
        func cameraProcess(camera: MainCamera<some CameraConfigBase>) {
//            camera.rotateAroundY(0.01)
        }
        
        func draw(encoder: MTLRenderCommandEncoder) {
            for o in objs {
                o.draw(encoder)
            }
        }
        
        func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.elapsed = Float.random(in: 0...3)
            self.rand = Float.random(in: 0...1)
        }
    }
}
