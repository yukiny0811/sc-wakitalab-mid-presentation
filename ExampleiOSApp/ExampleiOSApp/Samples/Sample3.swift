//
//  Sample3.swift
//  ExampleiOSApp
//
//  Created by Yuki Kuwashima on 2022/12/20.
//

import SwiftUI
import SwiftyCreatives

struct Sample3: View {
    
    var body: some View {
        ZStack {
            SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
        }
        .background(.black)
    }
    
    final class MySketch: SketchBase {
        
        var images: [Img] = []
        var boxes: [Box] = []
        var texts: [TextObject] = []
        
        var elapsed: Float = 0.0
        
        let fonts: [UIFont] = [
            UIFont.systemFont(ofSize: 240),
            UIFont(name: "Baskerville-Italic", size: 240)!,
            UIFont(name: "MarkerFelt-Wide", size: 240)!
        ]
        
        func setup() {
            for z in -3...3 {
                for i in 0..<6 {
                    let img = Img()
                    img.load(image: UIImage(named: "image")!.cgImage!)
                    img.multiplyScale(6)
                    img.setRot(
                        f3(
                            0,
                            -Float.pi * 2 / 6 * Float(i) + Float.pi / 2,
                            0
                        )
                    )
                    img.setPos(
                        f3(
                            cos(Float.pi * 2 / 6 * Float(i)) * 13,
                            Float(z * 10),
                            sin(Float.pi * 2 / 6 * Float(i)) * 13
                        )
                    )
                    images.append(img)
                    
                    let text = TextObject()
                    text.setText(
                        "Hello, World",
                        font: fonts.randomElement()!,
                        color: UIColor(
                            red: CGFloat.random(in: 0...1),
                            green: CGFloat.random(in: 0.8...1),
                            blue: CGFloat.random(in: 0...1),
                            alpha: 1
                        )
                    )
                    text.multiplyScale(3)
                    text.setRot(
                        f3(
                            0,
                            -Float.pi * 2 / 6 * Float(i) + Float.pi / 2,
                            0
                        )
                    )
                    text.setPos(
                        f3(
                            cos(Float.pi * 2 / 6 * Float(i)) * 13,
                            Float(z * 10) + 5,
                            sin(Float.pi * 2 / 6 * Float(i)) * 13
                        )
                    )
                    texts.append(text)
                }
            }
            for _ in 0...1000 {
                let box = Box()
                box.setRot(f3.randomPoint(0...Float.pi*2))
                box.setPos(
                    f3(
                        Float.random(in: -10...10),
                        Float.random(in: -100...100),
                        Float.random(in: -10...10)
                    )
                )
                box.setColor(
                    f4.randomPoint(0...1)
                )
                boxes.append(box)
            }
        }
        func update() {
            elapsed += 0.02
            let sinelapsed = sin(elapsed)
            let coselapsed = cos(elapsed)
            for b in boxes {
                b.setColor(
                    f4(
                        sinelapsed,
                        coselapsed,
                        b.color.z,
                        b.color.w
                    )
                )
            }
        }
        
        func cameraProcess(camera: MainCamera<some CameraConfigBase>) {
            camera.rotateAroundY(0.003)
        }
        
        func draw(encoder: MTLRenderCommandEncoder) {
            for img in images {
                img.draw(encoder)
            }
            for b in boxes {
                b.draw(encoder)
            }
            for t in texts {
                t.draw(encoder)
            }
        }
    }
}

