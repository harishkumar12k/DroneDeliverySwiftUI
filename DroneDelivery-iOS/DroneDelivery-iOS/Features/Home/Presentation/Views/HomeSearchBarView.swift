import SwiftUI

/// Capsule-shaped search bar embedded in the primary-colored header.
public struct HomeSearchBarView: View {
    // MARK: - Properties

    let query: String
    let onQueryChanged: (String) -> Void
    let onSearchTapped: () -> Void

    // MARK: - Body

    public var body: some View {
        HStack(spacing: Spacing.sm) {
            Button(action: onSearchTapped) {
                HStack(spacing: Spacing.xs) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(Color(uiColor: .placeholderText))

                    Text(query.isEmpty ? "Search" : query)
                        .font(.system(size: 16))
                        .foregroundStyle(query.isEmpty ? Color(uiColor: .placeholderText) : Color.primary)

                    Spacer()
                }
                .padding(.horizontal, Spacing.md)
                .frame(height: 40)
                .background(AppColors.searchBarBackground)
                .clipShape(Capsule())
            }
            .buttonStyle(.plain)
            .accessibilityLabel("Search")
            .accessibilityIdentifier("home_search_bar")
        }
        .padding(.horizontal, Spacing.md)
        .padding(.bottom, Spacing.sm)
        .background(AppColors.primary)
    }
}

#Preview {
    HomeSearchBarView(
        query: "",
        onQueryChanged: { _ in },
        onSearchTapped: {}
    )
}
