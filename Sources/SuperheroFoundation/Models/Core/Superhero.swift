/*
 +----------------------------------------------------------------------+
 | PROJECT: SUPERHERO FOUNDATION
 +----------------------------------------------------------------------+
 | Copyright (c) 2021 THETEALPICKLE LLC.
 | All Rights Reserved.
 +----------------------------------------------------------------------+
 | Author: Jessica Joseph <jessica@thetealpickle.com>
 +----------------------------------------------------------------------+
 */

public struct Superhero: Identifiable, Equatable, Decodable {
    public var id: String
    var name: String
    var work: Work
    var image: Image
    
    var favorited: Bool = true
}

// MARK: - Superhero + Image
extension Superhero {
    public struct Image: Equatable, Decodable {
        var url: String
    }
}

// MARK: - Superhero + Work
extension Superhero {
    public struct Work: Equatable, Decodable {
        var occupation: String
        var base: String
    }
}

extension Superhero {
    public static var sampleModel: Superhero {
        Superhero(id: "0",
                  name: "Cat Women",
                  work: .init(occupation: "-",
                              base: "Gotham"),
                  image: .init(url: "https://www.superherodb.com/pictures2/portraits/10/100/954.jpg"))
    }
}
