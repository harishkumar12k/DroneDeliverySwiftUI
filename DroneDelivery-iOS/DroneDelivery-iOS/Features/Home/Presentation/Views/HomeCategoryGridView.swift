//
//  HomeCategoryGridView.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import SwiftUI

/// 3-column grid displaying product categories with primary-bordered circular images.
public struct HomeCategoryGridView: View {
    // MARK: - Properties

    let categories: [ProductCategory]
    let onCategoryTapped: (ProductCategory) -> Void

    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: Spacing.md),
        GridItem(.flexible(), spacing: Spacing.md),
        GridItem(.flexible(), spacing: Spacing.md)
    ]

    // MARK: - Body

    public var body: some View {
        VStack(alignment: .leading, spacing: Spacing.md) {
            Text("Category")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Color.primary)
                .padding(.horizontal, Spacing.md)

            LazyVGrid(columns: columns, spacing: Spacing.lg) {
                ForEach(categories) { category in
                    Button {
                        onCategoryTapped(category)
                    } label: {
                        VStack(spacing: Spacing.xs) {
                            ZStack {
                                Circle()
                                    .stroke(AppColors.primary, lineWidth: 3)
                                    .frame(width: 84, height: 84)

                                Image(category.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 54, height: 54)
                            }

                            Text(category.title)
                                .font(.system(size: 12, weight: .medium))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color.primary)
                                .lineLimit(2)
                                .frame(height: 30, alignment: .top)
                        }
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel(category.title)
                }
            }
            .padding(.horizontal, Spacing.md)
        }
    }
}

#Preview {
    HomeCategoryGridView(
        categories: [
            ProductCategory(id: "1", title: "Vegitables", imageName: "veggies"),
            ProductCategory(id: "2", title: "Fruits", imageName: "fruits"),
            ProductCategory(id: "3", title: "Milk Products", imageName: "dairy")
        ],
        onCategoryTapped: { _ in }
    )
}
