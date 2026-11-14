import SwiftUI

/// Semantic color tokens conforming to design system specifications.
public enum AppColors {
    /// Primary brand color loaded from asset catalog
    public static let primary: Color = Color("primary")
    /// Primary text color loaded from asset catalog
    public static let textPrimary: Color = Color("textPrimary")
    /// Search bar background color loaded from asset catalog
    public static let searchBarBackground: Color = Color("searchBar")
    /// Neutral background color for screens and content
    public static let background: Color = Color(uiColor: .systemBackground)
    /// Card border color
    public static let cardBorder: Color = Color(uiColor: .systemGray4)
    /// Tag green background for discount badges
    public static let badgeBackground: Color = Color(red: 0.85, green: 0.95, blue: 0.85)
    /// Tag green text color for discount badges
    public static let badgeText: Color = Color(red: 0.15, green: 0.55, blue: 0.2)
    /// Strikethrough price color
    public static let strikethroughPrice: Color = Color(uiColor: .secondaryLabel)
    /// Light gray unselected tab color
    public static let tabUnselected: Color = Color(uiColor: .lightGray)
    /// White selected tab color
    public static let tabSelected: Color = Color.white
}
