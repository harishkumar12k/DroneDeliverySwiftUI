import Foundation

/// Data transfer object for advertisement banners.
public struct AdvertisementDTO: Codable, Sendable, Equatable {
    public let id: String
    public let imageName: String
    public let title: String

    private enum CodingKeys: String, CodingKey {
        case id
        case imageName
        case title
    }

    public init(id: String, imageName: String, title: String) {
        self.id = id
        self.imageName = imageName
        self.title = title
    }
}
