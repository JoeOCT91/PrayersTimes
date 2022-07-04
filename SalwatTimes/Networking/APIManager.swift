//
//  APIManager.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 12/02/2021.
//

import Foundation
import Alamofire
import Combine

class APIManager {

    class func getTimes(month: Int, year: Int, complation: @escaping (Result<MainResponse, Error>) -> () ) {
        request(APIRouter.getTimes(month: month, year: year)) { (response) in
            complation(response)
        }
    }
}

extension APIManager{
    // MARK:- The request function to get results in a closure
    private static func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, completion:  @escaping (Result<T, Error>) -> ()) {
        // Trigger the HttpRequest using AlamoFire
        AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
