//
//  HomeProductCardView.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import SwiftUI

/// Reusable product card view displaying image, discount badge, name, weight, and pricing.
public struct HomeProductCardView: View {
    // MARK: - Properties

    let product: ProductItem
    let onTapped: () -> Void

    // MARK: - Body

    public var body: some View {
        Button(action: onTapped) {
            VStack(alignment: .leading, spacing: Spacing.xxs) {
                imageWithBadgeSection

                productDetailsSection
            }
            .padding(Spacing.xs)
            .frame(width: 130)
            .background(Color(uiColor: .systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: Radius.card))
            .overlay(
                RoundedRectangle(cornerRadius: Radius.card)
                    .stroke(AppColors.cardBorder, lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
        .accessibilityLabel("\(product.name), \(product.weight), offer price \(product.offerPrice)")
    }

    // MARK: - Subviews

    private var imageWithBadgeSection: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 114, height: 90)
                .clipped()

            Text("\(product.discountPercentage)% OFF")
                .font(.system(size: 9, weight: .bold))
                .padding(.horizontal, Spacing.xxs)
                .padding(.vertical, Spacing.xxxs)
                .background(AppColors.badgeBackground)
                .foregroundStyle(AppColors.badgeText)
                .clipShape(RoundedRectangle(cornerRadius: Radius.small))
        }
    }

    private var productDetailsSection: some View {
        VStack(alignment: .leading, spacing: Spacing.xxxs) {
            Text(product.name)
                .font(.system(size: 13, weight: .bold))
                .foregroundStyle(Color.primary)
                .lineLimit(2)
                .frame(height: 34, alignment: .topLeading)

            Text(product.weight)
                .font(.system(size: 11, weight: .regular))
                .foregroundStyle(Color.secondary)

            HStack(spacing: Spacing.xxs) {
                Text("₹ \(product.offerPrice)")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(Color.primary)

                Text("₹ \(product.maximumPrice)")
                    .font(.system(size: 11, weight: .regular))
                    .strikethrough(true, color: AppColors.strikethroughPrice)
                    .foregroundStyle(AppColors.strikethroughPrice)
            }
        }
    }
}

#Preview {
    HomeProductCardView(
        product: ProductItem(
            id: "1",
            name: "Demo Tabs\n(25mg)",
            weight: "40 gms",
            offerPrice: Decimal(450),
            maximumPrice: Decimal(500),
            discountPercentage: 10,
            imageName: "demoOralTablet"
        ),
        onTapped: {}
    )
}
