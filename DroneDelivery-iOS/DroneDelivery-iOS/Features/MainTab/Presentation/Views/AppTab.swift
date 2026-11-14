//
//  AppTab.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import Foundation

/// Primary tab items for the Drone Delivery application.
public enum AppTab: Int, CaseIterable, Identifiable, Sendable {
    case home = 0
    case pickUpDown = 1
    case orderHistory = 2
    case profile = 3

    public var id: Int { rawValue }

    /// Tab label displayed in bottom bar
    public var title: String {
        switch self {
        case .home:
            return "Home"
        case .pickUpDown:
            return "Pick Up/Drop"
        case .orderHistory:
            return "Order History"
        case .profile:
            return "Profile"
        }
    }

    /// Image asset catalog name for tab icon
    public var iconName: String {
        switch self {
        case .home:
            return "home"
        case .pickUpDown:
            return "send"
        case .orderHistory:
            return "orderHistory"
        case .profile:
            return "profile"
        }
    }
}
