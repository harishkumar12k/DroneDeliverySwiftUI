import Foundation

/// Navigation routes originating from the Home flow.
public enum HomeRoute: Hashable, Sendable {
    /// In-development placeholder screen with title
    case inDevelopment(title: String)
    /// Shopping cart screen
    case cart
}
