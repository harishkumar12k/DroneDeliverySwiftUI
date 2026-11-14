//
//  HomeRepositoryImpl.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import Foundation

/// Concrete repository implementation providing mock/local home dashboard data.
public final class HomeRepositoryImpl: HomeRepository {
    // MARK: - Lifecycle

    public init() {}

    // MARK: - HomeRepository

    public func fetchHomeDashboard() async throws -> HomeDashboard {
        // Simulates async retrieval with deterministic local seed data
        let dto = makeDefaultDashboardDTO()
        return HomeDashboardMapper.toDomain(dto)
    }

    // MARK: - Private Helpers

    private func makeDefaultDashboardDTO() -> HomeDashboardDTO {
        let ads: [AdvertisementDTO] = [
            AdvertisementDTO(id: "ad_1", imageName: "special_offer", title: "Special Offer 1"),
            AdvertisementDTO(id: "ad_2", imageName: "special_offer", title: "Special Offer 2"),
            AdvertisementDTO(id: "ad_3", imageName: "special_offer", title: "Special Offer 3"),
            AdvertisementDTO(id: "ad_4", imageName: "special_offer", title: "Special Offer 4"),
            AdvertisementDTO(id: "ad_5", imageName: "special_offer", title: "Special Offer 5")
        ]

        let categories: [ProductCategoryDTO] = [
            ProductCategoryDTO(id: "cat_1", title: "Vegitables", imageName: "veggies"),
            ProductCategoryDTO(id: "cat_2", title: "Fruits", imageName: "fruits"),
            ProductCategoryDTO(id: "cat_3", title: "Milk Products", imageName: "dairy"),
            ProductCategoryDTO(id: "cat_4", title: "Meat", imageName: "fishAndMeat"),
            ProductCategoryDTO(id: "cat_5", title: "Medicine", imageName: "medicine"),
            ProductCategoryDTO(id: "cat_6", title: "cakes And Chocolates", imageName: "chocolateAndCake"),
            ProductCategoryDTO(id: "cat_7", title: "Mobile And Accessories", imageName: "mobileAndAccessories"),
            ProductCategoryDTO(id: "cat_8", title: "Cloth And Shoe", imageName: "clothAndShoe"),
            ProductCategoryDTO(id: "cat_9", title: "Game", imageName: "game"),
            ProductCategoryDTO(id: "cat_10", title: "Toy", imageName: "toy"),
            ProductCategoryDTO(id: "cat_11", title: "Soap And Shampoo", imageName: "soapAndShampoo"),
            ProductCategoryDTO(id: "cat_12", title: "Pet Food", imageName: "petFood")
        ]

        let twoMinuteDeliveries: [ProductItemDTO] = [
            ProductItemDTO(
                id: "2min_1",
                name: "Demo Tabs\n(25mg)",
                weight: "40 gms",
                offerPrice: Decimal(450),
                maximumPrice: Decimal(500),
                discountPercentage: 10,
                imageName: "demoOralTablet"
            ),
            ProductItemDTO(
                id: "2min_2",
                name: "Banana\n(Ripped)",
                weight: "250 gms",
                offerPrice: Decimal(90),
                maximumPrice: Decimal(100),
                discountPercentage: 10,
                imageName: "demoBanana"
            ),
            ProductItemDTO(
                id: "2min_3",
                name: "Demo battery\n(AA)",
                weight: "100 gms",
                offerPrice: Decimal(90),
                maximumPrice: Decimal(100),
                discountPercentage: 10,
                imageName: "demoBatteryAA"
            )
        ]

        let fiveMinuteDeliveries: [ProductItemDTO] = [
            ProductItemDTO(
                id: "5min_1",
                name: "Demo Mobile\n(White)",
                weight: "270 gms",
                offerPrice: Decimal(9000),
                maximumPrice: Decimal(10000),
                discountPercentage: 10,
                imageName: "demoMobile"
            ),
            ProductItemDTO(
                id: "5min_2",
                name: "Demo Perfume\n(Gold)",
                weight: "80 gms",
                offerPrice: Decimal(250),
                maximumPrice: Decimal(275),
                discountPercentage: 10,
                imageName: "demoPerfume"
            ),
            ProductItemDTO(
                id: "5min_3",
                name: "Demo Aluminium\nFoil",
                weight: "220 gms",
                offerPrice: Decimal(180),
                maximumPrice: Decimal(200),
                discountPercentage: 10,
                imageName: "demoAluminiumFoil"
            ),
            ProductItemDTO(
                id: "5min_4",
                name: "Demo Battery\n(AAA)",
                weight: "90 gms",
                offerPrice: Decimal(90),
                maximumPrice: Decimal(100),
                discountPercentage: 10,
                imageName: "demoBatteryAAA"
            )
        ]

        return HomeDashboardDTO(
            deliveryTimeNotice: "Delivered in 2 Mins",
            deliveryAddress: "#123, HSK, Bangalore",
            advertisements: ads,
            categories: categories,
            twoMinuteDeliveries: twoMinuteDeliveries,
            fiveMinuteDeliveries: fiveMinuteDeliveries,
            quoteOfTheDay: "Every day is a journey, and the journey itself is home."
        )
    }
}
