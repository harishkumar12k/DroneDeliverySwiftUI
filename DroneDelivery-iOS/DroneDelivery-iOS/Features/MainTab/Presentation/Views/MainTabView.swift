//
//  MainTabView.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import SwiftUI

/// Main application screen managing tab navigation and hosting the Home coordinator.
public struct MainTabView: View {
    // MARK: - Properties

    @State private var selectedTab: AppTab = .home
    @State private var homeCoordinator: HomeCoordinator

    // MARK: - Lifecycle

    public init(homeCoordinator: HomeCoordinator? = nil) {
        let coordinator = homeCoordinator ?? HomeCoordinator(
            getHomeDashboardUseCase: GetHomeDashboardUseCaseImpl(
                repository: HomeRepositoryImpl()
            )
        )
        _homeCoordinator = State(initialValue: coordinator)
    }

    // MARK: - Body

    public var body: some View {
        VStack(spacing: 0) {
            tabContentSection
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            CustomTabBarView(selectedTab: $selectedTab)
        }
        .background(AppColors.primary)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }

    // MARK: - Subviews

    @ViewBuilder
    private var tabContentSection: some View {
        switch selectedTab {
        case .home:
            NavigationStack(path: $homeCoordinator.navigationPath) {
                homeCoordinator.makeHomeView()
                    .navigationDestination(for: HomeRoute.self) { route in
                        switch route {
                        case .inDevelopment(let title):
                            InDevelopmentView(title: title)
                        case .cart:
                            InDevelopmentView(title: "Cart")
                        }
                    }
            }

        case .pickUpDown:
            dummyTabCenterView(title: "Pick Up/Drop")

        case .orderHistory:
            dummyTabCenterView(title: "Order History")

        case .profile:
            dummyTabCenterView(title: "Profile")
        }
    }

    private func dummyTabCenterView(title: String) -> some View {
        VStack {
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(Color.primary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.background)
    }
}

#Preview {
    MainTabView()
}
