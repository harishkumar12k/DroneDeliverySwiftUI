//
//  HomeViewAction.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import Foundation

/// User actions and intents from the Home screen.
public enum HomeViewAction: Sendable {
    /// Screen appeared lifecycle event
    case didAppear
    /// Screen disappeared lifecycle event
    case didDisappear
    /// User typed into search field
    case didChangeSearchQuery(String)
    /// User tapped search bar button/field
    case didTapSearch
    /// User scrolled or changed ad banner index
    case didChangeAdIndex(Int)
    /// User tapped an ad banner
    case didTapAd(Advertisement)
    /// User tapped a category item
    case didTapCategory(ProductCategory)
    /// User tapped reveal all 2 min deliveries
    case didTapRevealAll2Min
    /// User tapped reveal all 5 min deliveries
    case didTapRevealAll5Min
    /// User tapped a product item card
    case didTapProduct(ProductItem)
    /// User tapped cart button in navigation bar
    case didTapCart
    /// User tapped address area in navigation bar
    case didTapAddress
}
