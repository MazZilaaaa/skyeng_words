//
//  FetchService.swift
//  SkyEngWords
//
//  Created by Alexandr Fadeev on 05.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Moya

class FetchService: IFetchService {
    private let provider: MoyaProvider<API>
    private var currentRequest: Cancellable?

    init(provider: MoyaProvider<API>) {
        self.provider = provider
    }

    func fetch<T: Codable>(_ target: API, _ completion: @escaping (Result<T, ServiceError>) -> Void) {
        currentRequest?.cancel()
        currentRequest = provider.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(T.self, from: response.data)
                    completion(.success(response))
                } catch {
                    print(error)
                    completion(.failure(.decode))
                }
            case .failure(let error):
                switch error {
                case .underlying:
                    completion(.failure(.canceled))
                default:
                    print(error)
                    completion(.failure(.loading))
                }
            }
        }
    }
}
