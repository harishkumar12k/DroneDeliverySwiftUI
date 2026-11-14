import Foundation

/// Stateless mapper transforming `ProductCategoryDTO` to `ProductCategory` domain entity.
public enum ProductCategoryMapper {
    /// Maps DTO to Domain entity.
    /// - Parameter dto: Source `ProductCategoryDTO`.
    /// - Returns: `ProductCategory` domain entity.
    public static func toDomain(_ dto: ProductCategoryDTO) -> ProductCategory {
        ProductCategory(
            id: dto.id,
            title: dto.title,
            imageName: dto.imageName
        )
    }
}
