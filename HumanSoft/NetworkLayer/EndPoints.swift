//
//  EndPoints.swift
//  HumanSoft
//
//  Created by Azza on 02/02/2021.
//

import Foundation
import Alamofire
enum EndPoints: APIConfigurations {
    
    case users
    case albums(parameter: [String:  Any])
    case photos(parameter: [String:  Any])
    
    var method: HTTPMethod {
        return .get
    }
    
    internal var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var path: String {
        switch self {
        case .users:
            return "users?id=1"
        case .albums:
            return "albums"
        case .photos:
            return "photos"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = ConstantsAPI.baseUrl + path
        let finalURl = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        var urlRequest = URLRequest(url: URL(string: finalURl)!)
        urlRequest.httpMethod = method.rawValue
        return  urlRequest
    }
    
}
