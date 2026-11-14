//
//  Item.swift
//  DroneDelivery-iOS
//
//  Created by Harish Kumar on 13/11/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
