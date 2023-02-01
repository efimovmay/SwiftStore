//
//  DataStore.swift
//  SwiftStore
//
//  Created by Виталий Гринчик on 31.01.23.
//

class DataStore {
    static let shared = DataStore()
    
    let categories = [
        "Mac",
        "iPhone",
        "Watch",
        "iPad",
        "AirPods"
    ]
    
    let mac = [
        "MacBook Air",
        "MacBook Pro 14",
        "MacBook Pro 16",
        "iMac 24",
        "Mac mini",
        "Mac Studio",
        "Mac Pro"
    ]
    
    private init() {}
}
