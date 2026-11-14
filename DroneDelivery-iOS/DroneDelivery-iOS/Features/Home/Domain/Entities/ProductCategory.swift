import Foundation

/// Represents a product category item.
public struct ProductCategory: Identifiable, Sendable, Equatable {
    /// Unique identifier
    public let id: String
    /// Display title of the category
    public let title: String
    /// Image asset catalog name
    public let imageName: String

    public init(id: String, title: String, imageName: String) {
        self.id = id
        self.title = title
        self.imageName = imageName
    }
}
