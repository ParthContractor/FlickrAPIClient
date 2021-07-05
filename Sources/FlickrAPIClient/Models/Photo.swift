//
//  Photo.swift
//  
//
//  Created by Parth on 05/07/21.
//

import Foundation

public struct Photo: Decodable {
    public let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int64
    public let title: String
    
    public var photoUrl: URL? {
        return URL(string: "https://farm" + "\(farm)" + ".static.flickr.com/" + "\(server)/" + "\(id)_" + "\(secret)" + ".jpg")
    }
    
    enum CodingKeys:String,CodingKey {
        case id,owner,secret,server,farm,title
    }
}
