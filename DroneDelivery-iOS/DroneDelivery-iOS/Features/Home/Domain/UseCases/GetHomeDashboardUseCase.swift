import Foundation

/// Use case protocol for fetching the Home dashboard entity.
public protocol GetHomeDashboardUseCase: Sendable {
    /// Executes dashboard retrieval.
    /// - Returns: `HomeDashboard` entity.
    /// - Throws: `DomainError` upon failure.
    func execute() async throws -> HomeDashboard
}
