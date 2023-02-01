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
        "AirPods"
    ]
    
    let macs = [
        "MacBook Air",
        "MacBook Pro 13",
        "MacBook Pro 14",
        "MacBook Pro 16",
        "iMac 24",
        "Mac mini",
        "Mac Studio",
        "Mac Pro"
    ]
    
    let iPhones = [
        "iPhone 14 Pro",
        "iPhone 14 Pro Max",
        "iPhone 14",
        "iPhone 14 Plus",
        "iPhone 13 mini",
        "iPhone 13",
        "iPhone SE",
        "iPhone 12"
    ]
    
    let watches = [
        "Apple Watch Ultra",
        "Apple Watch Series 8",
        "Apple Watch SE"
    ]
    
    let iPads = [
        "iPad Pro 11",
        "iPad Pro 12.9",
        "iPad Air",
        "iPad 10th generation",
        "iPad 9th generation",
        "iPad mini"
    ]
    
    let airPods = [
        "AirPods 2nd generation",
        "AirPods 3nd generation",
        "AirPods Pro 2nd generation",
        "AirPods Max"
    ]
    
    let processors = [
        "MacBook Air M1" : ["M1"],
        "MacBook Air M2" : ["M2"],
        "MacBook Pro 13" : ["M2"],
        "MacBook Pro 14" : ["M2 Pro", "M2 Max"],
        "MacBook Pro 16" : ["M2 Pro", "M2 Max"],
        "iMac 24" : ["M1"],
        "Mac mini" : ["M2", "M2 Pro"],
        "Mac Studio" : ["M1 Max", "M1 Ultra"],
        "Mac Pro" : [
            "8-core Intel Xeon W",
            "12-core Intel Xeon W",
            "16-core Intel Xeon W",
            "24-core Intel Xeon W",
            "28-core Intel Xeon W"
        ],
        "iPhone 14 Pro" : ["A16"],
        "iPhone 14 Pro Max" : ["A16"],
        "iPhone 14" : ["A15"],
        "iPhone 14 Plus" : ["A15"],
        "iPhone 13 mini" : ["A15"],
        "iPhone 13" : ["A15"],
        "iPhone SE" : ["A15"],
        "iPhone 12" : ["A14"],
        "Apple Watch Ultra" : ["S8"],
        "Apple Watch Series 8" : ["S8"],
        "Apple Watch SE" : ["S8"],
        "iPad Pro 11" : ["M2"],
        "iPad Pro 12.9" : ["M2"],
        "iPad Air" : ["M1"],
        "iPad 10th generation" : ["A14"],
        "iPad 9th generation" : ["A13"],
        "iPad mini" : ["A15"],
        "AirPods 2nd generation" : ["H1"],
        "AirPods 3nd generation" : ["H1"],
        "AirPods Pro 2nd generation" : ["H2"],
        "AirPods Max" : ["H1"]
    ]
    
    let colors = [
        "MacBook Air M1" : [
            "Space Gray",
            "Gold",
            "Silver"
        ],
        "MacBook Air M2" : [
            "Midnight",
            "Starlight",
            "Space Gray",
            "Silver"
        ],
        "MacBook Pro 13" : [
            "Space Gray",
            "Silver"
        ],
        "MacBook Pro 14" : [
            "Space Gray",
            "Silver"
        ],
        "MacBook Pro 16" : [
            "Space Gray",
            "Silver"
        ],
        "iMac 24" : [
            "Blue",
            "Green",
            "Pink",
            "Silver",
            "Yellow",
            "Orange",
            "Purple"
        ],
        "Mac mini" : [],
        "Mac Studio" : [],
        "Mac Pro" : [],
        "iPhone 14 Pro" : [
            "Deep Purple",
            "Gold",
            "Silver",
            "Space Black"
        ],
        "iPhone 14 Pro Max" : [
            "Deep Purple",
            "Gold",
            "Silver",
            "Space Black"
        ],
        "iPhone 14" : [
            "Blue",
            "Purple",
            "Midnight",
            "Starlight",
            "(PRODUCT)RED"
        ],
        "iPhone 14 Plus" : [
            "Blue",
            "Purple",
            "Midnight",
            "Starlight",
            "(PRODUCT)RED"
        ],
        "iPhone 13 mini" : [
            "Blue",
            "Pink",
            "Midnight",
            "Starlight",
            "Green",
            "(PRODUCT)RED"
        ],
        "iPhone 13" : [
            "Blue",
            "Pink",
            "Midnight",
            "Starlight",
            "Green",
            "(PRODUCT)RED"
        ],
        "iPhone SE" : [
            "Midnight",
            "Starlight",
            "(PRODUCT)RED"
        ],
        "iPhone 12" : [
            "Blue",
            "Purple",
            "Green",
            "White",
            "Black",
            "(PRODUCT)RED"
        ],
        "Apple Watch Ultra" : [],
        "Apple Watch Series 8" : [
            "Midnight",
            "Starlight",
            "Gold",
            "Silver",
            "Graphite",
            "Space Black",
            "(PRODUCT)RED"
        ],
        "Apple Watch SE" : [
            "Midnight",
            "Starlight",
            "Silver"
        ],
        "iPad Pro 11" : [
            "Space Gray",
            "Silver"
        ],
        "iPad Pro 12.9" : [
            "Space Gray",
            "Silver"
        ],
        "iPad Air" : [
            "Space Gray",
            "Blue",
            "Pink",
            "Purple",
            "Starlight"
        ],
        "iPad 10th generation" : [
            "Blue",
            "Pink",
            "Silver",
            "Yellow"
        ],
        "iPad 9th generation" : [
            "Space Gray",
            "Silver"
        ],
        "iPad mini" : [
            "Space Gray",
            "Pink",
            "Purple",
            "Starlight"
        ],
        "AirPods 2nd generation" : [],
        "AirPods 3nd generation" : [],
        "AirPods Pro 2nd generation" : [],
        "AirPods Max" : [
            "Space Gray",
            "Pink",
            "Green",
            "Silver",
            "Sky Blue"
        ]
    ]
    
    let displays = [
        "MacBook Air M1" : ["13.3"],
        "MacBook Air M2" : ["13.6"],
        "MacBook Pro 13" : ["13.3"],
        "MacBook Pro 14" : ["14.2"],
        "MacBook Pro 16" : ["16.2"],
        "iMac 24" : ["24"],
        "Mac mini" : [],
        "Mac Studio" : [],
        "Mac Pro" : [],
        "iPhone 14 Pro" : ["6.1"],
        "iPhone 14 Pro Max" : ["6.7"],
        "iPhone 14" : ["6.1"],
        "iPhone 14 Plus" : ["6.7"],
        "iPhone 13 mini" : ["5.4"],
        "iPhone 13" : ["6.1"],
        "iPhone SE" : ["4.7"],
        "iPhone 12" : ["6.1"],
        "Apple Watch Ultra" : ["49mm"],
        "Apple Watch Series 8" : ["41mm", "45mm"],
        "Apple Watch SE" : ["40mm", "44mm"],
        "iPad Pro 11" : ["11"],
        "iPad Pro 12.9" : ["12.9"],
        "iPad Air" : ["10.9"],
        "iPad 10th generation" : ["10.9"],
        "iPad 9th generation" : ["10.2"],
        "iPad mini" : ["8.3"],
        "AirPods 2nd generation" : [],
        "AirPods 3nd generation" : [],
        "AirPods Pro 2nd generation" : [],
        "AirPods Max" : []
    ]
    
    private init() {}
}
