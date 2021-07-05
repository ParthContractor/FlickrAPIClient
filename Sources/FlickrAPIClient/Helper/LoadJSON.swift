//
//  LoadJSON.swift
//  
//
//  Created by Parth on 05/07/21.
//

import Foundation

//protocol defined for loading json
//it could be reused because methodName needs to be provided by client who implements this protocol
//Also custom type(it could be custom model object type) is generic which needs to be provided by client who implements this protocol
protocol LoadJSONData {
    associatedtype T: Decodable
    var methodName: MethodName { get set }
    func loadJsonData(_ url: URL) -> T?
}

//default implementation is also provided for loading json response content and returning a valid model
extension LoadJSONData {
    func loadJsonData(_ url: URL) -> T? {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(T.self, from: data)
            return jsonData
        } catch {
            print("Data decoding failure:\(error)")
            return nil
        }
    }
}
