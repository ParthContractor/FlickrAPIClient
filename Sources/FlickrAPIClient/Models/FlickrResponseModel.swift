//
//  FlickrResponseModel.swift
//  
//
//  Created by Parth on 05/07/21.
//

import Foundation

public struct FlickrResponseModel: Decodable {
    public let photos: Photos?
    let stat: Stat
    let code: Int?
    let message: String?
    
    public var error: FlickrError? {
        switch stat {
        case .fail:
            if let code = code, code == 100 {
                return .invalidAPIKey
            }
            else if let code = code, code == 3 {
                return .parameterlessSearches
            }
            else if let code = code, code == 112 {
                return .unknownMethod
            }
            else{
                return .other
            }
        default:
            return .none
        }
    }
    
    enum CodingKeys:String,CodingKey {
        case photos,stat,code,message
    }
}
