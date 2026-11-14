import SwiftUI

/// Coordinator managing navigation path and screen factory for Home feature.
@Observable
@MainActor
public final class HomeCoordinator {
    // MARK: - Properties

    public var navigationPath: NavigationPath = NavigationPath()

    private let getHomeDashboardUseCase: GetHomeDashboardUseCase
    private var homeViewModel: HomeViewModel?

    // MARK: - Lifecycle

    public init(getHomeDashboardUseCase: GetHomeDashboardUseCase) {
        self.getHomeDashboardUseCase = getHomeDashboardUseCase
    }

    // MARK: - Public Methods

    /// Navigates to the given route.
    public func navigate(to route: HomeRoute) {
        navigationPath.append(route)
    }

    /// Pops the top-most view.
    public func pop() {
        guard !navigationPath.isEmpty else { return }
        navigationPath.removeLast()
    }

    /// Factory method creating the configured HomeView with retained ViewModel.
    public func makeHomeView() -> HomeView {
        if let existingViewModel = homeViewModel {
            return HomeView(viewModel: existingViewModel)
        }

        let viewModel = HomeViewModel(getHomeDashboardUseCase: getHomeDashboardUseCase)
        viewModel.onRoute = { [weak self] route in
            guard let self else { return }
            self.navigate(to: route)
        }
        self.homeViewModel = viewModel
        return HomeView(viewModel: viewModel)
    }
}
