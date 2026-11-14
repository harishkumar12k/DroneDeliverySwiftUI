//
//  InDevelopmentView.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import SwiftUI

/// Placeholder destination screen displaying "In Development".
public struct InDevelopmentView: View {
    // MARK: - Properties

    let title: String

    // MARK: - Body

    public var body: some View {
        VStack(spacing: Spacing.md) {
            Image(systemName: "hammer.fill")
                .font(.system(size: 40))
                .foregroundStyle(AppColors.primary)

            Text("In Development")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(Color.primary)

            if !title.isEmpty {
                Text(title)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(Color.secondary)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.background)
        .navigationTitle(title.isEmpty ? "Feature" : title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        InDevelopmentView(title: "Special Offer")
    }
}
