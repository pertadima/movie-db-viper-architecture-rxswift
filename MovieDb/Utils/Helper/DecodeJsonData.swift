//
//  DecodeJsonData.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/9/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//
import Foundation

public class DecodeJsonData <T>: NSObject, Codable where T:Decodable {
    public func parsing(data: Data, success successCallback: @escaping (T) -> Void, error errorCallback: @escaping (String) -> Void){
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(T.self, from: data)
            successCallback(response)
        }catch {
            errorCallback("Cannot parsing object")
        }
    }
}
