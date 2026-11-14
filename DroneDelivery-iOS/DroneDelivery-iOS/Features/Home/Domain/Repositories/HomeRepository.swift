import Foundation

/// Repository contract for fetching Home dashboard contents.
public protocol HomeRepository: Sendable {
    /// Fetches the complete Home dashboard data.
    /// - Returns: A populated `HomeDashboard` entity.
    /// - Throws: `DomainError` when data retrieval fails.
    func fetchHomeDashboard() async throws -> HomeDashboard
}
