import Foundation

/// Represents a deliverable product item card.
public struct ProductItem: Identifiable, Sendable, Equatable {
    /// Unique identifier
    public let id: String
    /// Product name (supports up to 2 lines in UI)
    public let name: String
    /// Weight/quantity descriptor (e.g. "40 gms")
    public let weight: String
    /// Promotional offer price
    public let offerPrice: Decimal
    /// Maximum retail price before discount
    public let maximumPrice: Decimal
    /// Discount percentage (e.g. 10 for 10% OFF)
    public let discountPercentage: Int
    /// Image asset catalog name
    public let imageName: String

    public init(
        id: String,
        name: String,
        weight: String,
        offerPrice: Decimal,
        maximumPrice: Decimal,
        discountPercentage: Int,
        imageName: String
    ) {
        self.id = id
        self.name = name
        self.weight = weight
        self.offerPrice = offerPrice
        self.maximumPrice = maximumPrice
        self.discountPercentage = discountPercentage
        self.imageName = imageName
    }
}
