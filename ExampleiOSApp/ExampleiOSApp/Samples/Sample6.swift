//
//  Sample6.swift
//  ExampleiOSApp
//
//  Created by Yuki Kuwashima on 2022/12/20.
//
import SwiftUI
import SwiftyCreatives

struct Sample6: View {
    
    @State var num = 0
    
    var body: some View {
        List {
            if num >= 0 {
                ZStack {
                    SketchView<MySketch, MainCameraConfig, AddConfig>()
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Performance")
                                .font(.largeTitle)
                                .bold()
                                .shadow(color: .black, radius: 3)
                            Spacer()
                        }
                        HStack {
                            VStack {
                                HStack {
                                    Text("SwiftyCreatives: \n   140000 vertices / 60fps")
                                        .font(.title3)
                                        .shadow(color: .black, radius: 3)
                                    Spacer()
                                }
                                HStack {
                                    Text("Openframeworks: \n   280000 vertices / 60fps")
                                        .font(.title3)
                                        .shadow(color: .black, radius: 3)
                                    Spacer()
                                }
                            }
                            Spacer()
                        }
                    }
                }
                .frame(height: 180)
                .background(.black)
            }
            if num >= 1 {
                ZStack {
                    SketchView<MySketch, MainCameraConfig, AddConfig>()
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Alpha Blending")
                                .font(.largeTitle)
                                .bold()
                                .shadow(color: .black, radius: 3)
                            Spacer()
                        }
                        HStack {
                            VStack {
                                HStack {
                                    Text("SwiftyCreatives: \n   Order-Independent Transparency")
                                        .font(.title3)
                                        .shadow(color: .black, radius: 3)
                                    Spacer()
                                }
                                HStack {
                                    Text("Openframeworks: \n   Ordered Transparency")
                                        .font(.title3)
                                        .shadow(color: .black, radius: 3)
                                    Spacer()
                                }
                            }
                            Spacer()
                        }
                    }
                }
                .frame(height: 180)
                .background(.black)
            }
            if num >= 2 {
                ZStack {
                    SketchView<MySketch, MainCameraConfig, AddConfig>()
                    VStack(alignment: .leading) {
                        HStack {
                            Text("User Interaction")
                                .font(.largeTitle)
                                .bold()
                                .shadow(color: .black, radius: 3)
                            Spacer()
                        }
                        HStack {
                            VStack {
                                HStack {
                                    Text("SwiftyCreatives: \n   Anything!! Camera, GPS, HealthKit, etc")
                                        .font(.title3)
                                        .shadow(color: .black, radius: 3)
                                    Spacer()
                                }
                                HStack {
                                    Text("Openframeworks: \n   Needs Addon")
                                        .font(.title3)
                                        .shadow(color: .black, radius: 3)
                                    Spacer()
                                }
                            }
                            Spacer()
                        }
                    }
                }
                .frame(height: 180)
                .background(.black)
            }
            if num >= 3 {
                ZStack {
                    SketchView<MySketch, MainCameraConfig, AddConfig>()
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Text Rendering")
                                .font(.largeTitle)
                                .bold()
                                .shadow(color: .black, radius: 3)
                            Spacer()
                        }
                        HStack {
                            VStack {
                                HStack {
                                    Text("SwiftyCreatives: \n   High-Resolution with orientation")
                                        .font(.title3)
                                        .shadow(color: .black, radius: 3)
                                    Spacer()
                                }
                                HStack {
                                    Text("Openframeworks: \n   Bitmap Fonts, with no orientation")
                                        .font(.title3)
                                        .shadow(color: .black, radius: 3)
                                    Spacer()
                                }
                            }
                            Spacer()
                        }
                    }
                }
                .frame(height: 180)
                .background(.black)
            }
        }
        .listStyle(PlainListStyle())
        .background(.black)
        .onTapGesture {
            num += 1
        }
    }
    
    
    final class AddConfig: DrawConfigBase {
        static var contentScaleFactor: Int = 3
        static var blendMode: SwiftyCreatives.BlendMode = .add
    }
    
    final class MySketch: SketchBase {
        
        var color: f3 = f3.randomPoint(0...1)
        
        var objs: [Box] = []
        var lifetime: [Float] = []
        var speed: [Float] = []
        
        func setup() {
            for _ in 0...500 {
                let box = createBox()
                objs.append(box)
                lifetime.append(Float.random(in: 0.3...1))
                speed.append(Float.random(in: 0.1...0.9))
            }
        }
        func update() {
            for i in 0..<objs.count {
                lifetime[i] -= 0.001
                objs[i].setPos(f3(objs[i].pos.x + speed[i], objs[i].pos.y, objs[i].pos.z))
                let opacity = (objs[i].pos.x + 15) / 70
                objs[i].setColor(f4(color.x * opacity, color.y * opacity, color.z * opacity, objs[i].color.w))
                if lifetime[i] <= 0 {
                    lifetime[i] = Float.random(in: 0.1...1)
                    objs[i] = createBox()
                }
            }
        }
        
        func createBox() -> Box {
            let box = Box()
            box.setPos(
                f3(
                    Float.random(in: -60 ... -30),
                    Float.random(in: -30...30),
                    1
                )
            )
            box.setScale(
                f3(
                    Float.random(in: 2...4),
                    Float.random(in: 0.2...0.4),
                    Float.random(in: 0.2...0.4)
                )
            )
            box.setColor(f4(color.x, color.y, color.z, Float.random(in: 0.3...1)))
            return box
        }
        
        func cameraProcess(camera: MainCamera<some CameraConfigBase>) {
        }
        
        func draw(encoder: MTLRenderCommandEncoder) {
            for b in objs {
                b.draw(encoder)
            }
        }
        func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            color = f3.randomPoint(0...1)
        }
    }
}

