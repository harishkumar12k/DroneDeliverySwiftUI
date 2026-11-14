import SwiftUI

/// Top navigation bar displaying delivery time notice, address and cart icon button.
public struct HomeNavigationBarView: View {
    // MARK: - Properties

    let deliveryTimeNotice: String
    let address: String
    let onCartTapped: () -> Void
    let onAddressTapped: () -> Void

    // MARK: - Body

    public var body: some View {
        HStack(alignment: .center, spacing: Spacing.sm) {
            Button(action: onAddressTapped) {
                VStack(alignment: .leading, spacing: Spacing.xxxs) {
                    Text(deliveryTimeNotice)
                        .font(.system(size: 13, weight: .regular))
                        .foregroundStyle(AppColors.textPrimary)

                    Text(address)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(AppColors.textPrimary)
                }
            }
            .buttonStyle(.plain)

            Spacer()

            Button(action: onCartTapped) {
                Image("cart")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(AppColors.textPrimary)
            }
            .accessibilityLabel("Shopping Cart")
            .accessibilityIdentifier("home_cart_button")
        }
        .padding(.horizontal, Spacing.md)
        .padding(.vertical, Spacing.xs)
        .background(AppColors.primary)
    }
}

#Preview {
    HomeNavigationBarView(
        deliveryTimeNotice: "Delivered in 2 Mins",
        address: "#123, HSK, Bangalore",
        onCartTapped: {},
        onAddressTapped: {}
    )
}
