//
//  HomeViewState.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import Foundation

/// Immutable UDF state representing the complete Home view.
public struct HomeViewState: Sendable, Equatable {
    /// Loading state indicator
    public var isLoading: Bool
    /// Search bar current query
    public var searchQuery: String
    /// Current selected advertisement page index
    public var currentAdIndex: Int
    /// Loaded home dashboard data
    public var dashboard: HomeDashboard?
    /// Error message when retrieval fails
    public var errorMessage: String?

    public init(
        isLoading: Bool = false,
        searchQuery: String = "",
        currentAdIndex: Int = 0,
        dashboard: HomeDashboard? = nil,
        errorMessage: String? = nil
    ) {
        self.isLoading = isLoading
        self.searchQuery = searchQuery
        self.currentAdIndex = currentAdIndex
        self.dashboard = dashboard
        self.errorMessage = errorMessage
    }
}
