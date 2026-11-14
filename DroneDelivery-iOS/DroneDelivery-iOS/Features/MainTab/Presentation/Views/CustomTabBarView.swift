import SwiftUI

/// Custom bottom tab bar with primary background, white selected color and lightGray unselected color.
public struct CustomTabBarView: View {
    // MARK: - Properties

    @Binding var selectedTab: AppTab

    // MARK: - Body

    public var body: some View {
        HStack(spacing: 0) {
            ForEach(AppTab.allCases) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    VStack(spacing: Spacing.xxs) {
                        Image(tab.iconName)
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)

                        Text(tab.title)
                            .font(.system(size: 11, weight: selectedTab == tab ? .semibold : .regular))
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(selectedTab == tab ? AppColors.tabSelected : AppColors.tabUnselected)
                }
                .buttonStyle(.plain)
                .accessibilityLabel(tab.title)
                .accessibilityAddTraits(selectedTab == tab ? .isSelected : [])
            }
        }
        .padding(.top, Spacing.xs)
        .padding(.bottom, Spacing.sm)
        .background(AppColors.primary)
    }
}

#Preview {
    CustomTabBarView(selectedTab: .constant(.home))
}
