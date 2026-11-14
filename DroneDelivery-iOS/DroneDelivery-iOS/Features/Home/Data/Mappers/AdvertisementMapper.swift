//
//  AdvertisementMapper.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import Foundation

/// Stateless mapper transforming `AdvertisementDTO` to `Advertisement` domain entity.
public enum AdvertisementMapper {
    /// Maps DTO to Domain entity.
    /// - Parameter dto: Source `AdvertisementDTO`.
    /// - Returns: `Advertisement` domain entity.
    public static func toDomain(_ dto: AdvertisementDTO) -> Advertisement {
        Advertisement(
            id: dto.id,
            imageName: dto.imageName,
            title: dto.title
        )
    }
}
