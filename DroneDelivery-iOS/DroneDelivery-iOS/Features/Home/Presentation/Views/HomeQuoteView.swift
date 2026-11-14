//
//  HomeQuoteView.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import SwiftUI

/// Italicized quote of the day displayed at the bottom of the home feed.
public struct HomeQuoteView: View {
    // MARK: - Properties

    let quote: String

    // MARK: - Body

    public var body: some View {
        Text(quote)
            .font(.system(size: 13, weight: .regular))
            .italic()
            .multilineTextAlignment(.center)
            .foregroundStyle(Color.secondary)
            .padding(.horizontal, Spacing.lg)
            .padding(.vertical, Spacing.md)
            .frame(maxWidth: .infinity)
            .accessibilityLabel("Quote of the day: \(quote)")
    }
}

#Preview {
    HomeQuoteView(quote: "Every day is a journey, and the journey itself is home.")
}
