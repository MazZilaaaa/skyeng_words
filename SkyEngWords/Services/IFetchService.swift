//
//  IFetchService.swift
//  SkyEngWords
//
//  Created by Alexandr Fadeev on 05.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

protocol IFetchService {
    func fetch<T: Codable>(_ target: API, _ completion: @escaping (Result<T, ServiceError>) -> Void)
}
