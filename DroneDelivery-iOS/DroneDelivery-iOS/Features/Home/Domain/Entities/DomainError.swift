import Foundation

/// Typed domain errors representing failures across business operations.
public enum DomainError: Error, Sendable, Equatable {
    /// Network connection failed
    case networkUnavailable
    /// Data payload was invalid or unparseable
    case invalidData
    /// Requested item or category was not found
    case notFound
    /// Catch-all for unexpected domain failures
    case unknown(String)
}
