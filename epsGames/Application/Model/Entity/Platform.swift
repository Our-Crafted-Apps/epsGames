import Foundation

struct Platform: Decodable {
    
    let id: Int
    let title: String
    let imageUrl: String

    
    func with(imageUrl: String) -> Self {
        return Platform(
            id: id,
            title: title,
            imageUrl: imageUrl
        )
    }
}
