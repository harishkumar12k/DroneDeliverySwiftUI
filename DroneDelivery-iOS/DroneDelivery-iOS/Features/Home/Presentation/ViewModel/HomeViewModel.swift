//
//  HomeViewModel.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import Foundation
import Observation

/// ViewModel powering the Home screen adhering strictly to UDF.
@Observable
@MainActor
public final class HomeViewModel {
    // MARK: - Properties

    public private(set) var state: HomeViewState = HomeViewState()
    public var onRoute: ((HomeRoute) -> Void)?

    private let getHomeDashboardUseCase: GetHomeDashboardUseCase
    private var loadTask: Task<Void, Never>?

    // MARK: - Lifecycle

    public init(getHomeDashboardUseCase: GetHomeDashboardUseCase) {
        self.getHomeDashboardUseCase = getHomeDashboardUseCase
    }

    // MARK: - Public Methods

    /// Single action entry point for the view.
    public func send(_ action: HomeViewAction) {
        switch action {
        case .didAppear:
            loadDashboardIfNeeded()

        case .didDisappear:
            loadTask?.cancel()
            loadTask = nil

        case .didChangeSearchQuery(let query):
            state.searchQuery = query

        case .didTapSearch:
            onRoute?(.inDevelopment(title: "Search"))

        case .didChangeAdIndex(let index):
            state.currentAdIndex = index

        case .didTapAd(let ad):
            onRoute?(.inDevelopment(title: ad.title))

        case .didTapCategory(let category):
            onRoute?(.inDevelopment(title: category.title))

        case .didTapRevealAll2Min:
            onRoute?(.inDevelopment(title: "2 Minutes Delivery"))

        case .didTapRevealAll5Min:
            onRoute?(.inDevelopment(title: "5 Minutes Delivery"))

        case .didTapProduct(let product):
            onRoute?(.inDevelopment(title: product.name.replacingOccurrences(of: "\n", with: " ")))

        case .didTapCart:
            onRoute?(.inDevelopment(title: "Cart"))

        case .didTapAddress:
            onRoute?(.inDevelopment(title: "Address Selector"))
        }
    }

    // MARK: - Private Helpers

    private func loadDashboardIfNeeded() {
        guard state.dashboard == nil, !state.isLoading else { return }
        state.isLoading = true
        state.errorMessage = nil

        loadTask?.cancel()
        loadTask = Task { [weak self] in
            guard let self else { return }
            do {
                let dashboard = try await self.getHomeDashboardUseCase.execute()
                guard !Task.isCancelled else { return }
                self.state.dashboard = dashboard
                self.state.isLoading = false
            } catch {
                guard !Task.isCancelled else { return }
                self.state.errorMessage = error.localizedDescription
                self.state.isLoading = false
            }
        }
    }
}
