//
//  APIRouter.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 12/02/2021.
//

import Foundation
import Alamofire

enum APIRouter:URLRequestConvertible {
    
    //End Points names
    case getTimes(month: Int, year: Int)

    
    //Mark:- HTTP Methods
    private var method: HTTPMethod {
        switch self {
        case .getTimes:
            return .get
        }
    }
    
    //MARK:- End points path
    private var path: String {
        switch self {
        case .getTimes:
            return ""
        }
    }
    
    private var query: URLQueryItem? {
        switch self {
        default:
            return nil
        }
    }

    
    //MARK:- Parameters
    private var parameters: Parameters? {
        switch self {
        case .getTimes(let month, let year):
            return [
                ParameterKeys.longitude: Coordinates.longitude,
                ParameterKeys.latitude: Coordinates.latitude,
                ParameterKeys.year: year,
                ParameterKeys.month: month,
                ParameterKeys.method: 5,
            ]

        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        var urlComponents = URLComponents(string: URLs.base + path)!
        if let query = query {
            urlComponents.queryItems = [query]
        }
        let url =  try urlComponents.asURL()
        var urlRequest = URLRequest(url: url)
        
        //Set request Method
        urlRequest.httpMethod = method.rawValue
        
        //Http Headers
        switch self {
        default:
            break
        }
        
        urlRequest.setValue("application/json", forHTTPHeaderField: HeaderKeys.contentType)
        urlRequest.setValue("application/json", forHTTPHeaderField: HeaderKeys.accept)
        
        // HTTP Body
        let httpBody: Data? = {
            switch self {
            default:
                return nil
            }
        }()
        
        urlRequest.httpBody = httpBody
        
        // Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get, .delete:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
    
        print(try encoding.encode(urlRequest, with: parameters))
        return try encoding.encode(urlRequest, with: parameters)
    }
}

extension APIRouter {
    private func encodeToJSON<T: Encodable>(_ body: T) -> Data? {
        do {
            let anyEncodable = AnyEncodable(body)
            let jsonData = try JSONEncoder().encode(anyEncodable)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            print(jsonString)
            return jsonData
        } catch {
            print(error)
            return nil
        }
    }
}

// type-erasing wrapper
struct AnyEncodable: Encodable {
    private let _encode: (Encoder) throws -> Void
    
    public init<T: Encodable>(_ wrapped: T) {
        _encode = wrapped.encode
    }
    
    func encode(to encoder: Encoder) throws {
        try _encode(encoder)
    }
}




