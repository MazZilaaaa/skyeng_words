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
        case search = "search"
        case page = "page"
        case pageSize = "pageSize"
        case ids = "ids"
    }

    case searchWords(searchString: String, offset: Int, limit: Int)
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
        guard let data = "".data(using: .utf8) else {
            return Data()
        }

        return data
    }

    var task: Task {
        switch self {
        case .searchWords(let searchString, let page, let pageSize):
            var parameters: [String: Any] = [:]
            parameters[QueryKeys.search.rawValue] = searchString
            parameters[QueryKeys.page.rawValue] = page
            parameters[QueryKeys.pageSize.rawValue] = pageSize
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
