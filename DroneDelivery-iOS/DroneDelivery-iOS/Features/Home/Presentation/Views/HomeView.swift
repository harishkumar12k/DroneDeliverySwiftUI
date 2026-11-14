//
//  HomeView.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import SwiftUI

/// Main Home dashboard view assembling navigation, search, ad carousel, categories, deliveries, and quote.
public struct HomeView: View {
    // MARK: - Properties

    @Bindable var viewModel: HomeViewModel

    // MARK: - Body

    public var body: some View {
        VStack(spacing: 0) {
            headerSection

            contentScrollView
        }
        .background(AppColors.background)
        .task {
            viewModel.send(.didAppear)
        }
        .onDisappear {
            viewModel.send(.didDisappear)
        }
    }

    // MARK: - Subviews

    private var headerSection: some View {
        VStack(spacing: 0) {
            HomeNavigationBarView(
                deliveryTimeNotice: viewModel.state.dashboard?.deliveryTimeNotice ?? "Delivered in 2 Mins",
                address: viewModel.state.dashboard?.deliveryAddress ?? "#123, HSK, Bangalore",
                onCartTapped: { viewModel.send(.didTapCart) },
                onAddressTapped: { viewModel.send(.didTapAddress) }
            )

            HomeSearchBarView(
                query: viewModel.state.searchQuery,
                onQueryChanged: { viewModel.send(.didChangeSearchQuery($0)) },
                onSearchTapped: { viewModel.send(.didTapSearch) }
            )
        }
    }

    private var contentScrollView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: Spacing.lg) {
                if let ads = viewModel.state.dashboard?.advertisements, !ads.isEmpty {
                    HomeAdSliderView(
                        advertisements: ads,
                        currentIndex: viewModel.state.currentAdIndex,
                        onIndexChanged: { viewModel.send(.didChangeAdIndex($0)) },
                        onAdTapped: { viewModel.send(.didTapAd($0)) }
                    )
                }

                if let categories = viewModel.state.dashboard?.categories, !categories.isEmpty {
                    HomeCategoryGridView(
                        categories: categories,
                        onCategoryTapped: { viewModel.send(.didTapCategory($0)) }
                    )
                }

                if let items2Min = viewModel.state.dashboard?.twoMinuteDeliveries, !items2Min.isEmpty {
                    HomeDeliverySectionView(
                        title: "2 Minutes Delivery",
                        products: items2Min,
                        onRevealAllTapped: { viewModel.send(.didTapRevealAll2Min) },
                        onProductTapped: { viewModel.send(.didTapProduct($0)) }
                    )
                }

                if let items5Min = viewModel.state.dashboard?.fiveMinuteDeliveries, !items5Min.isEmpty {
                    HomeDeliverySectionView(
                        title: "5 Minutes Delivery",
                        products: items5Min,
                        onRevealAllTapped: { viewModel.send(.didTapRevealAll5Min) },
                        onProductTapped: { viewModel.send(.didTapProduct($0)) }
                    )
                }

                if let quote = viewModel.state.dashboard?.quoteOfTheDay {
                    HomeQuoteView(quote: quote)
                }
            }
            .padding(.vertical, Spacing.zero)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(getHomeDashboardUseCase: GetHomeDashboardUseCaseImpl(repository: HomeRepositoryImpl())))
}
