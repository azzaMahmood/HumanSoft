//
//  APIConfigurations.swift
//  HumanSoft
//
//  Created by Azza on 02/02/2021.
//

import Foundation

import Alamofire
protocol APIConfigurations: URLRequestConvertible {
    var method: HTTPMethod {get}
    var path: String {get}
}
