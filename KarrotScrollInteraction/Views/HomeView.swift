//
//  HomeView.swift
//  KarrotScrollInteraction
//
//  Created by Huigyun Jeong on 10/1/26.
//

import SwiftUI

struct HomeView: View {
    @State private var headerOffset: CGFloat = .zero
    @State private var headerHeight: CGFloat = .zero
    @State private var isScrolled: Bool = false
    @State private var lastOffset: CGFloat? = nil

    private let listings: [Listing] = .samples

    fileprivate static let titleHeight: CGFloat = 32

    private var isCollapsingHeader: Bool {
        headerOffset < -headerHeight * 0.5
    }

    var body: some View {
        ScrollView {
            ListingListView(listings: listings)
        }
        .onScrollGeometryChange(for: Bool.self) { geometry in
            (geometry.contentOffset.y + geometry.contentInsets.top) > 0
        } action: { _, newValue in
            isScrolled = newValue
        }
        .onScrollGeometryChange(for: CGFloat.self) { geometry in
            geometry.contentOffset.y + geometry.contentInsets.top
        } action: { oldValue, newValue in
            guard let lastOffset else { return }

            headerOffset = -min(
                headerHeight,
                max(0, newValue - lastOffset),
            )
        }
        .onScrollPhaseChange { oldPhase, newPhase, context in
            if newPhase == .interacting {
                lastOffset =
                    context.geometry.contentOffset.y
                    + context.geometry.contentInsets.top + headerOffset
            } else if newPhase == .idle {
                lastOffset = nil

                let newOffset: CGFloat

                if headerOffset < -headerHeight * 0.5 {
                    newOffset = -headerHeight
                } else {
                    newOffset = .zero
                }

                withAnimation(.snappy) {
                    headerOffset = newOffset
                }
            }
        }
        .contentMargins(.top, 8, for: .scrollContent)
        .contentMargins(.horizontal, 16, for: .scrollContent)
        .contentMargins(.bottom, 80, for: .scrollContent)
        .safeAreaInset(edge: .top) {
            HomeToolbar()
                .safeAreaPadding([.top, .horizontal], 16)
                .safeAreaPadding(.bottom, 8)
                .background(.background)
                .offset(y: headerOffset)
                .onGeometryChange(for: CGFloat.self) { geometry in
                    geometry.size.height + geometry.safeAreaInsets.top
                } action: { newValue in
                    self.headerHeight = newValue
                }
        }
        .overlay(alignment: .topTrailing) {
            ToolbarItems(isCollapsing: isCollapsingHeader)
                .padding([.top, .trailing], 16)
        }
        .overlay(alignment: .bottomTrailing) {
            WriteButton(isCollapsed: isScrolled)
                .padding()
        }
    }
}

// MARK: - Subviews

private struct ListingListView: View, Equatable {
    let listings: [Listing]

    var body: some View {
        LazyVStack(spacing: 24) {
            ForEach(listings) { listing in
                ListingRow(listing: listing)
            }
        }
    }
}

private struct HomeToolbar: View {
    var body: some View {
        VStack(spacing: 24) {
            HStack {
                Label("반포동", systemImage: "map")
                    .font(.title3)
                    .bold()
                    .symbolVariant(.fill)

                Image(systemName: "chevron.down")
                    .font(.title2)

                Spacer()
            }
            .frame(height: HomeView.titleHeight)

            ScrollView(.horizontal) {
                HStack {
                    HomeTabButton(
                        isSelected: true,
                        action: {}
                    ) {
                        Text("전체")
                    }

                    HomeTabButton(
                        isSelected: false,
                        action: {}
                    ) {
                        Text("부동산 \(Image(systemName: "arrow.up.forward"))")
                    }

                    HomeTabButton(
                        isSelected: false,
                        action: {}
                    ) {
                        Text("방금 전")
                    }

                    HomeTabButton(
                        isSelected: false,
                        action: {}
                    ) {
                        Text("중고거래")
                    }

                    HomeTabButton(
                        isSelected: false,
                        action: {}
                    ) {
                        Text("가까운 동네")
                    }
                }
            }
        }
    }
}

private struct ToolbarItems: View {
    let isCollapsing: Bool

    var body: some View {
        GlassEffectContainer {
            HStack(
                spacing: isCollapsing ? 8 : 0
            ) {
                Button {

                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title3)
                        .frame(width: 44, height: 44)
                        .glassEffect(
                            isCollapsing ? .regular.interactive() : .identity
                        )
                }

                Button {

                } label: {
                    Image(systemName: "bell")
                        .font(.title3)
                        .frame(width: 44, height: 44)
                        .glassEffect(
                            isCollapsing ? .regular.interactive() : .identity
                        )
                }

                Button {

                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title3)
                        .frame(width: 44, height: 44)
                        .glassEffect(
                            isCollapsing ? .regular.interactive() : .identity
                        )
                }
            }
            .foregroundStyle(.foreground)
            .animation(.snappy, value: isCollapsing)
        }
        .frame(height: HomeView.titleHeight)
    }
}

private struct WriteButton: View {
    let isCollapsed: Bool

    var body: some View {
        Button {

        } label: {
            HStack(spacing: 4) {
                Image(systemName: "plus")
                    .font(isCollapsed ? .title3 : nil)

                if !isCollapsed {
                    Text("글쓰기")
                }
            }
            .geometryGroup()
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding()
            .background(.tint, in: .capsule)
        }
        .buttonStyle(.plain)
        .tint(.orange)
        .animation(.snappy, value: isCollapsed)
    }
}

private struct HomeTabButton<Label: View>: View {
    let action: () -> Void
    let isSelected: Bool
    @ViewBuilder let label: Label

    init(
        isSelected: Bool,
        action: @escaping () -> Void,
        @ViewBuilder label: () -> Label
    ) {
        self.isSelected = isSelected
        self.action = action
        self.label = label()
    }

    var body: some View {
        Button(action: action) {
            label
                .font(.callout)
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .foregroundStyle(
                    isSelected
                        ? AnyShapeStyle(.background)
                        : AnyShapeStyle(.foreground)
                )
                .background(
                    isSelected
                        ? AnyShapeStyle(.foreground)
                        : AnyShapeStyle(.regularMaterial),
                    in: .capsule
                )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HomeView()
}
