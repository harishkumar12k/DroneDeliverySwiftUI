import Foundation

/// Data transfer object for product cards.
public struct ProductItemDTO: Codable, Sendable, Equatable {
    public let id: String
    public let name: String
    public let weight: String
    public let offerPrice: Decimal
    public let maximumPrice: Decimal
    public let discountPercentage: Int
    public let imageName: String

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case weight
        case offerPrice
        case maximumPrice
        case discountPercentage
        case imageName
    }

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
