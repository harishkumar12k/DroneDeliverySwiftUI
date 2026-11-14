import Foundation

/// Stateless mapper transforming `HomeDashboardDTO` to `HomeDashboard` domain entity.
public enum HomeDashboardMapper {
    /// Maps DTO to Domain entity.
    /// - Parameter dto: Source `HomeDashboardDTO`.
    /// - Returns: `HomeDashboard` domain entity.
    public static func toDomain(_ dto: HomeDashboardDTO) -> HomeDashboard {
        HomeDashboard(
            deliveryTimeNotice: dto.deliveryTimeNotice,
            deliveryAddress: dto.deliveryAddress,
            advertisements: dto.advertisements.map(AdvertisementMapper.toDomain),
            categories: dto.categories.map(ProductCategoryMapper.toDomain),
            twoMinuteDeliveries: dto.twoMinuteDeliveries.map(ProductItemMapper.toDomain),
            fiveMinuteDeliveries: dto.fiveMinuteDeliveries.map(ProductItemMapper.toDomain),
            quoteOfTheDay: dto.quoteOfTheDay
        )
    }
}
