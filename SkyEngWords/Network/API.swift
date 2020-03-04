//
//  API.swift
//  SkyEngWords
//
//  Created by Alexandr on 04.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Moya

enum API {
    enum Endpoint: String {
        case searchWords = "/words/search"
        case meanings = "/meanings"
    }
    enum QueryKeys: String {
        case wordSearch = "search"
        case ids = "ids"
    }
    case searchWords(_ searchString: String)
    case meaningDetail(_ ids: String)
}

extension API: TargetType {
    var baseURL: URL {
        return Environment.apiURL
    }
    var path: String {
        switch self {
        case .searchWords:
            return Endpoint.searchWords.rawValue
        case .meaningDetail:
            return Endpoint.meanings.rawValue
        }
    }
    var method: Method {
        switch self {
        case .searchWords, .meaningDetail:
            return .get
        }
    }
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    var task: Task {
        switch self {
        case .searchWords(let searchString):
            let parameters = [QueryKeys.wordSearch.rawValue: searchString]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case .meaningDetail(let id):
            let parameters = [QueryKeys.ids.rawValue: id]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json; charset=UTF-8"]
    }
    public var validationType: ValidationType {
        return .successCodes
    }
}
