//
//  Sample2.swift
//  ExampleiOSApp
//
//  Created by Yuki Kuwashima on 2022/12/20.
//

import SwiftUI
import SwiftyCreatives

struct Sample2: View {
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")
                        .font(.title)
                }
                .background(.black)
                ZStack {
                    SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")
                        .font(.title)
                }
                .background(.black)
            }
            HStack {
                ZStack {
                    SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")
                        .font(.title)
                }
                .background(.black)
                ZStack {
                    SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                    Text("Hello, World!")
                        .font(.title)
                }
                .background(.black)
            }
        }
    }
    
    final class MySketch: SketchBase {
        
        var boxes: [Box] = []
        var elapsed: Float = 0.0
        
        func setup() {
            for _ in 0...100 {
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
