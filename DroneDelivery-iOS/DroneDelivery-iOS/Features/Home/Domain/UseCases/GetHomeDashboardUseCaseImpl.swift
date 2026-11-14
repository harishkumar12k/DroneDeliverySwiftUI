import Foundation

/// Concrete implementation of `GetHomeDashboardUseCase`.
public struct GetHomeDashboardUseCaseImpl: GetHomeDashboardUseCase {
    // MARK: - Properties

    private let repository: HomeRepository

    // MARK: - Lifecycle

    public init(repository: HomeRepository) {
        self.repository = repository
    }

    // MARK: - Public Methods

    /// Executes dashboard retrieval from the injected repository.
    /// - Returns: `HomeDashboard` entity.
    /// - Throws: `DomainError` upon failure.
    public func execute() async throws -> HomeDashboard {
        try await repository.fetchHomeDashboard()
    }
}
