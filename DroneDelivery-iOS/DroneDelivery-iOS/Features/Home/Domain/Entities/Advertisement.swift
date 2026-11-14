//
//  Advertisement.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import Foundation

/// Represents an advertisement slider item on the Home screen.
public struct Advertisement: Identifiable, Sendable, Equatable {
    /// Unique identifier
    public let id: String
    /// Image asset name
    public let imageName: String
    /// Accessible title or description
    public let title: String

    public init(id: String, imageName: String, title: String) {
        self.id = id
        self.imageName = imageName
        self.title = title
    }
}
