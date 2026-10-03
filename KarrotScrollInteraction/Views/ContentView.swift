//
//  ContentView.swift
//  KarrotScrollInteraction
//
//  Created by Huigyun Jeong on 10/1/26.
//

import SwiftUI
import UIKitTabView

struct ContentView: View {
    var body: some View {
        UIKitTabView {
            UIKitTab(
                "홈",
                image: "house",
                selectedImage: "house.fill"
            ) {
                HomeView()
            }

            UIKitTab(
                "커뮤니티",
                image: "person.3",
                selectedImage: "person.3.fill"
            ) {

            }

            UIKitTab(
                "동네지도",
                image: "map",
                selectedImage: "map.fill"
            ) {

            }

            UIKitTab(
                "채팅",
                image: "ellipsis.bubble",
                selectedImage: "ellipsis.bubble.fill"
            ) {

            }

            UIKitTab(
                "나의 당근",
                image: "person",
                selectedImage: "person.fill"
            ) {

            }
        }
        .tint(Color(.label))
        .ignoresSafeArea(.container)
    }
}

#Preview {
    ContentView()
        .environment(\.locale, .init(languageCode: .korean))
}
