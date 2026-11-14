import Foundation

/// Data transfer object for the complete home dashboard payload.
public struct HomeDashboardDTO: Codable, Sendable, Equatable {
    public let deliveryTimeNotice: String
    public let deliveryAddress: String
    public let advertisements: [AdvertisementDTO]
    public let categories: [ProductCategoryDTO]
    public let twoMinuteDeliveries: [ProductItemDTO]
    public let fiveMinuteDeliveries: [ProductItemDTO]
    public let quoteOfTheDay: String

    private enum CodingKeys: String, CodingKey {
        case deliveryTimeNotice
        case deliveryAddress
        case advertisements
        case categories
        case twoMinuteDeliveries
        case fiveMinuteDeliveries
        case quoteOfTheDay
    }

    public init(
        deliveryTimeNotice: String,
        deliveryAddress: String,
        advertisements: [AdvertisementDTO],
        categories: [ProductCategoryDTO],
        twoMinuteDeliveries: [ProductItemDTO],
        fiveMinuteDeliveries: [ProductItemDTO],
        quoteOfTheDay: String
    ) {
        self.deliveryTimeNotice = deliveryTimeNotice
        self.deliveryAddress = deliveryAddress
        self.advertisements = advertisements
        self.categories = categories
        self.twoMinuteDeliveries = twoMinuteDeliveries
        self.fiveMinuteDeliveries = fiveMinuteDeliveries
        self.quoteOfTheDay = quoteOfTheDay
    }
}
