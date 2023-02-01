//
//  DataStore.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 31.01.23.
//

import Foundation

class DataStore {
    static let shared = DataStore()
    
    let categories = [
        "Mac",
        "iPhone",
        "Watch",
        "iPad",
        "AirPods",
    ]
    
    private init() {}
}
