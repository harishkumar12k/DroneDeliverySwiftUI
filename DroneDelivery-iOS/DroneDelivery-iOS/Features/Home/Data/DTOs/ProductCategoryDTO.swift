//
//  ProductCategoryDTO.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import Foundation

/// Data transfer object for product categories.
public struct ProductCategoryDTO: Codable, Sendable, Equatable {
    public let id: String
    public let title: String
    public let imageName: String

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageName
    }

    public init(id: String, title: String, imageName: String) {
        self.id = id
        self.title = title
        self.imageName = imageName
    }
}
