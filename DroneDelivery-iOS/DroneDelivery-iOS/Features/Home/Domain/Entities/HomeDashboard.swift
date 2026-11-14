//
//  HomeDashboard.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import Foundation

/// Represents the complete dashboard data for the Home screen.
public struct HomeDashboard: Sendable, Equatable {
    /// Delivery time estimate string for navbar
    public let deliveryTimeNotice: String
    /// Current selected address
    public let deliveryAddress: String
    /// Carousel advertisement banners
    public let advertisements: [Advertisement]
    /// Grid of product categories
    public let categories: [ProductCategory]
    /// Products available for 2-minute ultra-fast delivery
    public let twoMinuteDeliveries: [ProductItem]
    /// Products available for 5-minute fast delivery
    public let fiveMinuteDeliveries: [ProductItem]
    /// Quote of the day displayed at the bottom
    public let quoteOfTheDay: String

    public init(
        deliveryTimeNotice: String,
        deliveryAddress: String,
        advertisements: [Advertisement],
        categories: [ProductCategory],
        twoMinuteDeliveries: [ProductItem],
        fiveMinuteDeliveries: [ProductItem],
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
