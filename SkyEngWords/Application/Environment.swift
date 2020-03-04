//
//  Environment.swift
//  SkyEngWords
//
//  Created by Alexandr on 05.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

public enum Environment {
    enum Keys {
      enum Plist {
        static let baseURL = "BASE_URL"
        static let apiVersion = "API_VERSION"
      }
    }
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    static let baseURL: URL = {
        guard let stringURL = Environment.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("baseURL not set in plist for this environment")
        }
        guard let baseURL = URL(string: stringURL) else {
            fatalError("base URL is invalid")
        }
        return baseURL
    }()
    static let apiVersion: String = {
        guard let apiVersion = Environment.infoDictionary[Keys.Plist.apiVersion] as? String else {
            fatalError("apiVersion not set in plist for this environment")
        }
        return apiVersion
    }()
    static let apiURL: URL = {
        return baseURL.appendingPathComponent("/api/public/\(apiVersion)")
    }()
}
