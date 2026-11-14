import SwiftUI

/// Banner carousel showing up to 5 promotional advertisements with page indicators.
public struct HomeAdSliderView: View {
    // MARK: - Constants

    private enum Constants {
        static let aspectRatio: CGFloat = 16.0 / 9.0
        static let pageIndicatorBottomSpacing: CGFloat = 20
    }

    // MARK: - Properties

    let advertisements: [Advertisement]
    let currentIndex: Int
    let onIndexChanged: (Int) -> Void
    let onAdTapped: (Advertisement) -> Void

    // MARK: - Body

    public var body: some View {
        VStack(spacing: Spacing.xs) {
            TabView(selection: Binding(
                get: { currentIndex },
                set: { onIndexChanged($0) }
            )) {
                ForEach(Array(advertisements.prefix(5).enumerated()), id: \.element.id) { index, ad in
                    Button {
                        onAdTapped(ad)
                    } label: {
                        Image(ad.imageName)
                            .resizable()
                            .aspectRatio(Constants.aspectRatio, contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .clipped()
                    }
                    .buttonStyle(.plain)
                    .tag(index)
                    .accessibilityLabel(ad.title)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .aspectRatio(Constants.aspectRatio, contentMode: .fit)
        }
    }
}

#Preview {
    HomeAdSliderView(
        advertisements: [
            Advertisement(id: "1", imageName: "special_offer", title: "Special Offer")
        ],
        currentIndex: 0,
        onIndexChanged: { _ in },
        onAdTapped: { _ in }
    )
}
