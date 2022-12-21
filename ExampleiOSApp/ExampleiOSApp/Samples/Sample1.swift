//
//  Sample1.swift
//  ExampleiOSApp
//
//  Created by Yuki Kuwashima on 2022/12/20.
//

import SwiftUI
import SwiftyCreatives

struct Sample1: View {
    
    var body: some View {
        ZStack {
            SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
            Text("Hello, World!")
                .font(.largeTitle)
                .bold()
                .shadow(color: .gray, radius: 10)
        }
        .background(.black)
    }
    
    
    
    final class MySketch: SketchBase {
        
        var boxes: [Box] = []
        var elapsed: Float = 0.0
        
        func setup() {
            for _ in 0...1000 {
                let box = Box()
                box.setColor(f4.randomPoint(0...1))
                box.setPos(f3.randomPoint(-7...7))
                box.setScale(f3.one * Float.random(in: 0.1...0.5))
                boxes.append(box)
            }
        }
        func update() {
            let elapsedSin = sin(elapsed)
            for b in boxes {
                b.setColor(f4(elapsedSin, b.color.y, b.color.z, b.color.w))
            }
            elapsed += 0.01
        }
        
        func cameraProcess(camera: MainCamera<some CameraConfigBase>) {
            camera.rotateAroundY(0.01)
        }
        
        func draw(encoder: MTLRenderCommandEncoder) {
            for b in boxes {
                b.draw(encoder)
            }
        }
    }
}
