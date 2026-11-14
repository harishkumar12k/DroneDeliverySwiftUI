//
//  HomeDeliverySectionView.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import SwiftUI

/// Horizontal delivery section containing header with "Reveal All" and scrolling product cards.
public struct HomeDeliverySectionView: View {
    // MARK: - Properties

    let title: String
    let products: [ProductItem]
    let onRevealAllTapped: () -> Void
    let onProductTapped: (ProductItem) -> Void

    // MARK: - Body

    public var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            headerRow

            productScrollView
        }
    }

    // MARK: - Subviews

    private var headerRow: some View {
        HStack {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Color.primary)

            Spacer()

            Button(action: onRevealAllTapped) {
                HStack(spacing: Spacing.xxs) {
                    Text("Reveal All")
                        .font(.system(size: 14, weight: .bold))
                    Image(systemName: "arrow.right")
                        .font(.system(size: 12, weight: .bold))
                }
                .foregroundStyle(Color.primary)
            }
        }
        .padding(.horizontal, Spacing.md)
    }

    private var productScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: Spacing.sm) {
                ForEach(products) { product in
                    HomeProductCardView(product: product) {
                        onProductTapped(product)
                    }
                }
            }
            .padding(.horizontal, Spacing.md)
        }
    }
}

#Preview {
    HomeDeliverySectionView(
        title: "2 Minutes Delivery",
        products: [],
        onRevealAllTapped: {},
        onProductTapped: { _ in }
    )
}
