//
//  ExampleiOSApp.swift
//  ExampleiOSApp
//
//  Created by Yuki Kuwashima on 2022/12/15.
//

import SwiftUI
import SwiftyCreatives

enum SampleType: Int {
    case introduction = 0
    case blendMode = 1
    case recycle = 2
    case image = 3
    case list = 4
    case loading = 5
    case openframeworks = 6
}

@main
struct ExampleiOSApp: App {
    @State var count = 0
    var body: some Scene {
        WindowGroup {
            
            let type: SampleType = SampleType(rawValue: count)!
            
            VStack {
                switch type {
                    
                case .introduction:
                    //Processingのように書けるクリエイティブコーディング環境をSwiftで作った
                    Sample1()
                    
                case .blendMode:
                    //ブレンドモードは3種類
                    //normal add alpha.
                    //alpha blendingにはこの間論文輪読で発表したOrder Independent Transparencyを効率化したものを実装しました
                    Sample1_2()
                    
                case .recycle:
                    //SwiftUIのViewとして使えるので、再利用性に優れている
                    Sample2()
                    
                case .image:
                    //画像の表示・テキストの表示もできます
                    Sample3()
                    
                case .list:
                    //アプリの画面に簡単に組み込める、といったように、いろんなアプリでよく見るリストビューに対しても超簡単にアニメーションをつけることができます
                    Sample4()
                    
                case .loading:
                    //こんなかんじのちょっとしたローディング画面も簡単に作れる
                    Sample5()
                    
                case .openframeworks:
                    //Openframeworksとの比較
                    Sample6()
                }
                HStack {
                    if count > 0 {
                        Button("Back") {
                            count -= 1
                        }
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 30, trailing: 10))
                    }
                    if count < 6 {
                        Button("Next") {
                            count += 1
                        }
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 30, trailing: 10))
                    }
                }
            }
            .background(.black)
        }
    }
}
