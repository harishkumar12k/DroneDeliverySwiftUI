//
//  ProductItemMapper.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import Foundation

/// Stateless mapper transforming `ProductItemDTO` to `ProductItem` domain entity.
public enum ProductItemMapper {
    /// Maps DTO to Domain entity.
    /// - Parameter dto: Source `ProductItemDTO`.
    /// - Returns: `ProductItem` domain entity.
    public static func toDomain(_ dto: ProductItemDTO) -> ProductItem {
        ProductItem(
            id: dto.id,
            name: dto.name,
            weight: dto.weight,
            offerPrice: dto.offerPrice,
            maximumPrice: dto.maximumPrice,
            discountPercentage: dto.discountPercentage,
            imageName: dto.imageName
        )
    }
}
