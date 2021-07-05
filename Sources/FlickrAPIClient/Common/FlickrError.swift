//
//  FlickrError.swift
//  
//
//  Created by Parth on 05/07/21.
//

import Foundation

//MVP//Handle couple of known errors and remaining to be considered other error
public enum FlickrError: Int {
    case invalidAPIKey = 100
    case parameterlessSearches = 3
    case unknownMethod = 112
    case other
}
