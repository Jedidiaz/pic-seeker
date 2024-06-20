import Foundation

struct UnsplashResponse: Decodable {
    var total: Int?
    var totalPages: Int?
    var results: [ImageObject]?
    
    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

struct ImageObject: Decodable {
    var id: String?
    var width: Int?
    var height: Int?
    var color: String?
    var urls: Urls?
    var altDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case width
        case height
        case color
        case urls
        case altDescription = "alt_description"
    }
}

struct Urls: Decodable {
    var raw: String?
    var full: String?
    var regular: String?
    var small: String?
    var thumb: String?
    var smallS3: String?
    
    enum CodingKeys: String, CodingKey {
        case raw
        case full
        case regular
        case small
        case thumb
        case smallS3 = "small_s3"
    }
}

