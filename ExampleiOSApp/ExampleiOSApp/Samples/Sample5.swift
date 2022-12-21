//
//  Sample5.swift
//  ExampleiOSApp
//
//  Created by Yuki Kuwashima on 2022/12/20.
//

import SwiftUI
import SwiftyCreatives

struct Sample5: View {
    
    var body: some View {
        ZStack {
            SketchView<MySketch, MainCameraConfig, AddConfig>()
        }
        .background(.black)
    }
    
    final class AddConfig: DrawConfigBase {
        static var contentScaleFactor: Int = 3
        static var blendMode: SwiftyCreatives.BlendMode = .add
    }
    
    final class MySketch: SketchBase {
        
        var boxes: [Box] = []
        var elapsed: Float = 0.0
        var text = TextObject()
        
        func setup() {
            for _ in 0...8 {
                let box = Box()
                box.setColor(f4.randomPoint(0...1))
                box.setScale(f3.one * Float.random(in: 0.1...0.5))
                boxes.append(box)
            }
            text.setText("Loading...", font: UIFont.systemFont(ofSize: 240), color: .white)
            text.multiplyScale(3.5)
        }
        func update() {
            for i in 0..<boxes.count {
                let elapsedSin = sin(elapsed * Float(i+1))
                let elapsedCos = cos(elapsed * Float(i+1))
                boxes[i].setPos(f3(elapsedCos * 5, elapsedSin * 5, 0))
                boxes[i].setColor(f4(elapsedSin, boxes[i].color.y, boxes[i].color.z, 1))
            }
            elapsed += 0.01
        }
        
        func cameraProcess(camera: MainCamera<some CameraConfigBase>) {
            camera.rotateAroundY(0.03)
        }
        
        func draw(encoder: MTLRenderCommandEncoder) {
            for b in boxes {
                b.draw(encoder)
            }
            text.draw(encoder)
        }
    }
}
