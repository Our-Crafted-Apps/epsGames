import Foundation

struct Patition: Decodable {
    
    let id: Int
    let title: String
    let imageUrl: String

    
    func with(imageUrl: String) -> Self {
        return Patition(
            id: id,
            title: title,
            imageUrl: imageUrl
        )
    }
}
