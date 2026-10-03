//
//  Listing.swift
//  KarrotScrollInteraction
//
//  Created by Huigyun Jeong on 10/1/26.
//

import Foundation

struct Listing {
    let id: UUID
    let title: String
    let location: String
    let date: Date
    let price: String
    let chatCount: Int
    let likeCount: Int
}

extension Listing: Identifiable, Equatable {}

extension Listing {
    static let sample: Self = .init(
        id: .init(),
        title: "반포미도아파트 33평 10층",
        location: "반포동",
        date: .now.addingTimeInterval(-3 * 24 * 60 * 60),
        price: "월세 6억/70만원",
        chatCount: 4,
        likeCount: 21
    )
}

extension Array where Element == Listing {
    static let samples: Self = [
        .sample,
        .init(
            id: .init(),
            title: "아이폰13 128GB 화이트 (박스, 케이블 포함)",
            location: "역삼1동",
            date: .now.addingTimeInterval(-45 * 60),
            price: "390,000원",
            chatCount: 3,
            likeCount: 0
        ),
        .init(
            id: .init(),
            title: "📸 코닥 일회용 플래쉬 카메라 펀 세이버 27 (27컷 촬영가능)",
            location: "동작구 흑석동",
            date: .now.addingTimeInterval(-31 * 24 * 60 * 60),
            price: "20,000원",
            chatCount: 3,
            likeCount: 9
        ),
        .init(
            id: .init(),
            title: "대용량 텀블러(42oz/1250ml)",
            location: "논현2동",
            date: .now.addingTimeInterval(-2 * 60),
            price: "5,000원",
            chatCount: 3,
            likeCount: 4
        ),
        .init(
            id: .init(),
            title: "비전프로 256GB",
            location: "논현1동",
            date: .now,
            price: "2,500,000원",
            chatCount: 0,
            likeCount: 0
        ),
    ]
}
