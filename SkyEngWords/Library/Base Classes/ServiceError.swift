//
//  ServiceError.swift
//  SkyEngWords
//
//  Created by Alexandr Fadeev on 05.03.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case emptyData
    case decode
    case loading
}

extension ServiceError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .emptyData:
            return NSLocalizedString("Данных нет", comment: "")
        case .decode:
            return NSLocalizedString("Ошибка обработки данных", comment: "")
        case .loading:
            return NSLocalizedString("Ошибка подключения. Попробуйте повторить позднее", comment: "")
        }
    }
}
