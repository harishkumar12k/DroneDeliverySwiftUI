//
//  GetHomeDashboardUseCase.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import Foundation

/// Use case protocol for fetching the Home dashboard entity.
public protocol GetHomeDashboardUseCase: Sendable {
    /// Executes dashboard retrieval.
    /// - Returns: `HomeDashboard` entity.
    /// - Throws: `DomainError` upon failure.
    func execute() async throws -> HomeDashboard
}
