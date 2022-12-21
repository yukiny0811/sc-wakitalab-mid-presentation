//
//  ExampleMacOSApp.swift
//  ExampleMacOSApp
//
//  Created by Yuki Kuwashima on 2022/12/15.
//

import SwiftUI
import SwiftyCreatives

@main
struct ExampleMacOSApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                VStack {
                    SketchView<MySketch, MainCameraConfig, MainDrawConfig>()
                }
            }
            .background(.black)
        }
    }
}

final class MyDrawConfigNormal: DrawConfigBase {
    static var contentScaleFactor: Int = 3
    static var blendMode: SwiftyCreatives.BlendMode = .normalBlend
}

final class MyDrawConfigAdd: DrawConfigBase {
    static var contentScaleFactor: Int = 3
    static var blendMode: SwiftyCreatives.BlendMode = .add
}

final class MyDrawConfigAlpha: DrawConfigBase {
    static var contentScaleFactor: Int = 3
    static var blendMode: SwiftyCreatives.BlendMode = .alphaBlend
}

//final class SlideSketch: SketchBase {
//
//    var img = Img()
//
//    var t1 = TextObject()
//
//    var blackRect = Rect()
//
//    var boxes: [Box] = []
//
//    var t2 = TextObject()
//
//    var elapsed: Float = 0
//
//    func setup() {
//        img.load(image: NSImage(named: "node")!.cgImage(forProposedRect: nil, context: nil, hints: nil)!)
//        img.multiplyScale(23)
//        img.setPos(f3(0, 0, 11))
//
//        t1.setText("Metal Node Editor", font: NSFont.systemFont(ofSize: 120), color: .white)
//        t1.multiplyScale(12)
//        t1.setPos(f3(0, 15, 11))
//
//        blackRect.setColor(f4(0, 0, 0, 1))
//        blackRect.setPos(f3(0, 0, 10))
//        blackRect.setScale(f3.one * 100)
//
//        for _ in 0...1000 {
//            let box = Box()
//            box.setColor(f4.randomPoint(0...1))
//            box.setPos(f3.randomPoint(-10...10))
//            box.setPos(f3(box.pos.x, box.pos.y, 0))
//            box.setScale(f3.one * Float.random(in: 0.3...1.5))
//            boxes.append(box)
//        }
//
//        t2.setText("Swifty Creatives", font: NSFont.systemFont(ofSize: 120), color: .white)
//        t2.multiplyScale(12)
//        t2.setPos(f3(0, 15, 0))
//        t2.setRot(f3(0, Float.pi, 0))
//    }
//
//    func update() {
//        elapsed += 0.01
//        let e = sin(elapsed)
//        let c = cos(elapsed)
//        for b in boxes {
//            b.setColor(f4(e, c, b.color.z, b.color.w))
//        }
//    }
//
//    func draw(encoder: MTLRenderCommandEncoder) {
//        img.draw(encoder)
//        t1.draw(encoder)
//        blackRect.draw(encoder)
//
//        for b in boxes {
//            b.draw(encoder)
//        }
//
//        t2.draw(encoder)
//    }
//
//
//}

//final class TextSketch: SketchBase {
//
//    var text = TextObject()
//    var box = Box()
//
//    func setup() {
//        text.setText("Hello, World!", font: NSFont.systemFont(ofSize: 240), color: .white)
//        text.multiplyScale(12)
//        text.setPos(f3(0, 8, 0))
//
//        box.setScale(f3.one * 4)
//        box.setColor(f4(1, 0.4, 1, 1))
//    }
//
//    func update() {
//
//    }
//
//    func draw(encoder: MTLRenderCommandEncoder) {
//        text.draw(encoder)
//        box.draw(encoder)
//    }
//
//
//}

final class MySketch: SketchBase {

    var boxes: [Box] = []
    var elapsed: Float = 0.0

    var date = Date()

    func setup() {
        for _ in 0...1000 {
            let box = Box()
            box.setColor(f4.randomPoint(0...1))
            box.setPos(f3.randomPoint(-10...10))
            box.setScale(f3.one * Float.random(in: 0.3...1.5))
            boxes.append(box)
        }
    }

    func update() {
    }

    func cameraProcess(camera: MainCamera<some CameraConfigBase>) {
//        camera.rotateAroundY(0.01)
    }

    func draw(encoder: MTLRenderCommandEncoder) {
        for b in boxes {
            b.draw(encoder)
        }
        print(1 / Date().timeIntervalSince(date))
        date = Date()
    }
}
