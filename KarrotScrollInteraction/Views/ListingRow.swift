//
//  ListingRow.swift
//  KarrotScrollInteraction
//
//  Created by Huigyun Jeong on 10/3/26.
//

import SwiftUI

struct ListingRow: View, Equatable {
    let listing: Listing

    var body: some View {
        HStack(spacing: 16) {
            RoundedRectangle(cornerRadius: 8)
                .fill(.quinary)
                .aspectRatio(1.0, contentMode: .fit)

            VStack(
                alignment: .leading,
                spacing: 8
            ) {
                Text(listing.title)

                Text(
                    "\(listing.location) · \(Text(listing.date, format: .relativeDate))"
                )
                .font(.caption)
                .foregroundStyle(.secondary)

                Text(listing.price)
                    .font(.headline)
                    .bold()

                Spacer()

                HStack {
                    Spacer()

                    Label("\(listing.chatCount)", systemImage: "bubble")
                        .symbolVariant(.fill)

                    Label("\(listing.likeCount)", systemImage: "heart")
                        .symbolVariant(.fill)
                }
                .foregroundStyle(.secondary)
            }
        }
        .frame(height: 128)
    }
}

#Preview {
    ListingRow(listing: .sample)
        .padding()
}
