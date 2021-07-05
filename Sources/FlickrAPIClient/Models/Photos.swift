//
//  Photos.swift
//  
//
//  Created by Parth on 05/07/21.
//

import Foundation

public struct Photos: Decodable {
    let page: Int64
    let pages: Int64
    let perpage: Int64
    public let total: Int64
    public let photo: [Photo]?
}
