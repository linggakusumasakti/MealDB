//
//  CustomError+Ext.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 19/10/21.
//

import Foundation

enum URLError: LocalizedError {
    
case invalidEmptyResponse
case addressUnreachable(URL)
    
    var errorDescription: String? {
        switch self {
        case .invalidEmptyResponse: return "The server responded with garbage."
        case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable"
        }
    }
}
