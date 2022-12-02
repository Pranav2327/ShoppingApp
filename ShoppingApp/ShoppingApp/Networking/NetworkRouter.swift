//
//  NetworkRouter.swift
//  ShoppingApp
//
//  Created by mac on 02/12/22.
//

import Foundation
import Alamofire

enum NetworkRouter: URLRequestConvertible {
    
    // MARK: routes
    case listRequest

    // MARK: path
    private var path: String {
        switch self {
        case .listRequest:
            return ""
        }
    }
    
    // MARK: method
    private var method: HTTPMethod {
        switch self {
          case .listRequest:
            return .get
        }
    }
    
    // MARK: body
    private var body: Parameters? {
        switch self {
        
        default:
            return nil
        }
    }
    
    // MARK: queryParameters
    private var queryParameters: Parameters? {
        switch self {
        
         default:
            return nil
        }
    }
    
    var shouldCache: Bool {
         switch self {
        default:
            return false
        }
    }
    
    func asURLRequest() throws -> URLRequest {
       var url = try Enviornment.baseUrl.asURL()
        
        
        // Construct url
        // url = try Enviornment.baseUrl.asURL()
        
        // Append path
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // Determine HTTP method
        urlRequest.httpMethod = method.rawValue
        
        // Set common headers
        urlRequest.setValue(NetworkConstants.HTTPHeaderFieldValue.json.rawValue,
                                        forHTTPHeaderField: NetworkConstants.HTTPHeaderFieldKey.acceptType.rawValue)
        urlRequest.setValue(NetworkConstants.HTTPHeaderFieldValue.json.rawValue,
                                        forHTTPHeaderField: NetworkConstants.HTTPHeaderFieldKey.contentType.rawValue)
        
        // Add http body to request
        if let body = body {
            do {
                let data = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                urlRequest.httpBody = data
                
            } catch (_) {
                
            }
        }
        
        // Add query parameters to request
        if let parameters = queryParameters {
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }

}




public enum Enviornment {
    static let baseUrl: String = "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0"
}

struct NetworkConstants {
    /// The keys for HTTP header fields
    enum HTTPHeaderFieldKey: String {
        case authorization = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case token = "token"
        case ApiKey = "Api-Key"
        
    }
    
    /// The values for HTTP header fields
    enum HTTPHeaderFieldValue: String {
        case json = "application/json"
        case formData = "multipart/form-data"
    }
}

