import SwiftUI

struct PostResponse: Identifiable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
}

extension PostResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
        case body
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        userId = try container.decodeIfPresent(Int.self, forKey: .userId)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        body = try container.decodeIfPresent(String.self, forKey: .body)
    }
}
