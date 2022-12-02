//
//  NetworkLayer.swift
//  ShoppingApp
//
//  Created by mac on 02/12/22.
//

import Foundation
import Alamofire
import UIKit
final class NetworkLayer {
    static let shared = NetworkLayer()
    var session: Session
    var configuration = URLSessionConfiguration.default
    private init() {
        configuration.waitsForConnectivity = true
        session = Session(configuration: configuration)
    }
    func request<T: Codable>(_ urlConvertible: NetworkRouter, type: T.Type, completion: @escaping(Result<T, String>) -> Void) {
        guard NetworkReachabilityManager() != nil else {
         //   completion(Result.failure(NetworkMessages.internetIssue.rawValue))
            return
        }
        session.request(urlConvertible).responseData { (response) in
            switch response.result {
            case .success(let data):
                do
                {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(T.self, from: data)
                    completion(Result.sucess(result))
                    return
                }
                catch
                {
                    completion(Result.failure(error.localizedDescription))
                    return
                }
                
            case .failure(let error):
                completion(Result.failure(error.localizedDescription))
            }
        }
    }
}
enum Result<data, error> {
    case sucess(data)
    case failure(error)
}
