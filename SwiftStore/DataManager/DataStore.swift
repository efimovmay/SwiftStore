//
//  DataStore.swift
//  SwiftStore
//
//  Created by Dmitry Polyakov on 31.01.23.
//

class DataStore {
    static let shared = DataStore()
    
    // MARK: - Categories
    let categories = [
        "Mac",
        "iPhone",
        "Watch",
        "iPad",
        "AirPods"
    ]
    
    // MARK: - Mac models
    let macs = [
        "MacBook Air M1",
        "MacBook Air M2",
        "MacBook Pro 13",
        "MacBook Pro 14",
        "MacBook Pro 16",
        "iMac 24",
        "Mac mini",
        "Mac Studio",
        "Mac Pro"
    ]
    
    // MARK: - iPhone models
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
    
    // MARK: - Watch models
    let watches = [
        "Apple Watch Ultra",
        "Apple Watch Series 8",
        "Apple Watch SE"
    ]
    
    // MARK: - iPad models
    let iPads = [
        "iPad Pro 11",
        "iPad Pro 12.9",
        "iPad Air",
        "iPad 10th generation",
        "iPad 9th generation",
        "iPad mini"
    ]
    
    // MARK: - AirPods models
    let airPods = [
        "AirPods (2nd generation)",
        "AirPods (3nd generation)",
        "AirPods Pro (2nd generation)",
        "AirPods Max"
    ]
    
    // MARK: - Processors
    let processors = [
        "MacBook Air M1": ["M1"],
        "MacBook Air M2": ["M2"],
        "MacBook Pro 13": ["M2"],
        "MacBook Pro 14": ["M2 Pro", "M2 Max"],
        "MacBook Pro 16": ["M2 Pro", "M2 Max"],
        "iMac 24": ["M1"],
        "Mac mini": ["M2", "M2 Pro"],
        "Mac Studio": ["M1 Max", "M1 Ultra"],
        "Mac Pro": [
            "8-core Intel Xeon W",
            "12-core Intel Xeon W",
            "16-core Intel Xeon W",
            "24-core Intel Xeon W",
            "28-core Intel Xeon W"
        ],
        "iPhone 14 Pro": ["A16"],
        "iPhone 14 Pro Max": ["A16"],
        "iPhone 14": ["A15"],
        "iPhone 14 Plus": ["A15"],
        "iPhone 13 mini": ["A15"],
        "iPhone 13": ["A15"],
        "iPhone SE": ["A15"],
        "iPhone 12": ["A14"],
        "Apple Watch Ultra": ["S8"],
        "Apple Watch Series 8": ["S8"],
        "Apple Watch SE": ["S8"],
        "iPad Pro 11": ["M2"],
        "iPad Pro 12.9": ["M2"],
        "iPad Air": ["M1"],
        "iPad 10th generation": ["A14"],
        "iPad 9th generation": ["A13"],
        "iPad mini": ["A15"],
        "AirPods 2nd generation": ["H1"],
        "AirPods 3nd generation": ["H1"],
        "AirPods Pro 2nd generation": ["H2"],
        "AirPods Max": ["H1"]
    ]
    
    // MARK: - Colors
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
    
    // MARK: - Displays
    let displays = [
        "MacBook Air M1": ["13.3"],
        "MacBook Air M2": ["13.6"],
        "MacBook Pro 13": ["13.3"],
        "MacBook Pro 14": ["14.2"],
        "MacBook Pro 16": ["16.2"],
        "iMac 24": ["24"],
        "Mac mini": [],
        "Mac Studio": [],
        "Mac Pro": [],
        "iPhone 14 Pro": ["6.1"],
        "iPhone 14 Pro Max": ["6.7"],
        "iPhone 14": ["6.1"],
        "iPhone 14 Plus": ["6.7"],
        "iPhone 13 mini": ["5.4"],
        "iPhone 13": ["6.1"],
        "iPhone SE": ["4.7"],
        "iPhone 12": ["6.1"],
        "Apple Watch Ultra": ["49mm"],
        "Apple Watch Series 8": ["41mm", "45mm"],
        "Apple Watch SE": ["40mm", "44mm"],
        "iPad Pro 11": ["11"],
        "iPad Pro 12.9": ["12.9"],
        "iPad Air": ["10.9"],
        "iPad 10th generation": ["10.9"],
        "iPad 9th generation": ["10.2"],
        "iPad mini": ["8.3"],
        "AirPods 2nd generation": [],
        "AirPods 3nd generation": [],
        "AirPods Pro 2nd generation": [],
        "AirPods Max": []
    ]
    
    // MARK: - Memory Configurations
    let memoryConfigurations = [
        "MacBook Air M1": ["8GB", "16GB"],
        "MacBook Air M2": ["8GB", "16GB", "24GB"],
        "MacBook Pro 13": ["8GB", "16GB", "24GB"],
        "MacBook Pro 14": ["16GB", "32GB", "64GB", "96GB"],
        "MacBook Pro 16": ["16GB", "32GB", "64GB", "96GB"],
        "iMac 24": ["8GB", "16GB"],
        "Mac mini": ["8GB", "16GB", "24GB", "32GB"],
        "Mac Studio": ["32GB", "64GB", "128GB"],
        "Mac Pro": [
            "32GB",
            "48GB",
            "96GB",
            "192GB",
            "384GB",
            "768GB",
            "1.5TB"
        ],
        "iPhone 14 Pro": ["6GB"],
        "iPhone 14 Pro Max": ["6GB"],
        "iPhone 14": ["6GB"],
        "iPhone 14 Plus": ["6GB"],
        "iPhone 13 mini": ["4GB"],
        "iPhone 13": ["4GB"],
        "iPhone SE": ["4GB"],
        "iPhone 12": ["4GB"],
        "Apple Watch Ultra": [],
        "Apple Watch Series 8": [],
        "Apple Watch SE": [],
        "iPad Pro 11": ["8GB"],
        "iPad Pro 12.9": ["8GB"],
        "iPad Air": ["8GB"],
        "iPad 10th generation": [],
        "iPad 9th generation": [],
        "iPad mini": [],
        "AirPods 2nd generation": [],
        "AirPods 3nd generation": [],
        "AirPods Pro 2nd generation": [],
        "AirPods Max": []
    ]
    
    // MARK: - Storage Configurations
    let storageConfigurations = [
        "MacBook Air M1": ["256GB", "512GB", "1TB", "2TB"],
        "MacBook Air M2": ["256GB", "512GB", "1TB", "2TB"],
        "MacBook Pro 13": ["256GB", "512GB", "1TB", "2TB"],
        "MacBook Pro 14": ["512GB", "1TB", "2TB", "4TB", "8TB"],
        "MacBook Pro 16": ["512GB", "1TB", "2TB", "4TB", "8TB"],
        "iMac 24": ["256GB", "512GB", "1TB", "2TB"],
        "Mac mini": ["256GB", "512GB", "1TB", "2TB", "4TB", "8TB"],
        "Mac Studio": ["1TB", "2TB", "4TB", "8TB"],
        "Mac Pro": ["512GB", "1TB", "2TB", "4TB", "8TB"],
        "iPhone 14 Pro": ["128GB", "256GB", "512GB", "1TB"],
        "iPhone 14 Pro Max": ["128GB", "256GB", "512GB", "1TB"],
        "iPhone 14": ["128GB", "256GB", "512GB"],
        "iPhone 14 Plus": ["128GB", "256GB", "512GB"],
        "iPhone 13 mini": ["128GB", "256GB", "512GB"],
        "iPhone 13": ["128GB", "256GB", "512GB"],
        "iPhone SE": ["64GB", "128GB", "256GB"],
        "iPhone 12": ["64GB", "128GB", "256GB"],
        "Apple Watch Ultra": [],
        "Apple Watch Series 8": [],
        "Apple Watch SE": [],
        "iPad Pro 11": ["128GB", "256GB", "512GB", "1TB", "2TB"],
        "iPad Pro 12.9": ["128GB", "256GB", "512GB", "1TB", "2TB"],
        "iPad Air": ["64GB", "256GB"],
        "iPad 10th generation": ["64GB", "256GB"],
        "iPad 9th generation": ["64GB", "256GB"],
        "iPad mini": ["64GB", "256GB"],
        "AirPods 2nd generation": [],
        "AirPods 3nd generation": [],
        "AirPods Pro 2nd generation": [],
        "AirPods Max": []
    ]
    
    // MARK: - Prices
    let prices = [
        "MacBook Air M1": [
            "base": 999,
            "memory": [
                "16GB": 200
            ],
            "storage": [
                "512GB": 200,
                "1TB": 400,
                "2TB": 800
            ]
        ],
        "MacBook Air M2": [
            "base": 1199,
            "memory": [
                "16GB": 200,
                "24GB": 400
            ],
            "storage": [
                "512GB": 200,
                "1TB": 400,
                "2TB": 800
            ]
        ],
        "MacBook Pro 13": [
            "base": 1299,
            "memory": [
                "16GB": 200,
                "24GB": 400
            ],
            "storage": [
                "512GB": 200,
                "1TB": 400,
                "2TB": 800
            ]
        ],
        "MacBook Pro 14": [
            "base": 1999,
            "processor": [
                "M2 Max": 500
            ],
            "memory": [
                "32GB": 400,
                "64GB": 800,
                "96GB": 1200
            ],
            "storage": [
                "1TB": 200,
                "2TB": 600,
                "4TB": 1200,
                "8TB": 2400
            ]
        ],
        "MacBook Pro 16": [
            "base": 2499,
            "processor": [
                "M2 Max": 200
            ],
            "memory": [
                "32GB": 400,
                "64GB": 800,
                "96GB": 1200
            ],
            "storage": [
                "1TB": 200,
                "2TB": 600,
                "4TB": 1200,
                "8TB": 2400
            ]
        ],
        "iMac 24": [
            "base": 1299,
            "memory": [
                "16GB": 200
            ],
            "storage": [
                "512GB": 200,
                "1TB": 400
            ]
        ],
        "Mac mini": [
            "base": 599,
            "processor": [
                "M2 Pro": 300
            ],
            "memory": [
                "16GB": 200,
                "24GB": 400
            ],
            "storage": [
                "512GB": 200,
                "1TB": 400,
                "2TB": 800
            ]
        ],
        "Mac Studio": [
            "base": 1999,
            "processor": [
                "M2 Ultra": 1400
            ],
            "memory": [
                "64GB": 400,
                "128GB": 1200
            ],
            "storage": [
                "1TB": 200,
                "2TB": 600,
                "4TB": 1200,
                "8TB": 2400
            ]
        ],
        "Mac Pro": [
            "base": 5999,
            "processor": [
                "12-core Intel Xeon W": 1000,
                "16-core Intel Xeon W": 2000,
                "24-core Intel Xeon W": 6000,
                "28-core Intel Xeon W": 7000
            ],
            "memory": [
                "48GB": 300,
                "96GB": 1000,
                "192GB": 3000,
                "384GB": 6000,
                "768GB": 10000,
                "1.5TB": 25000
            ],
            "storage": [
                "1TB": 200,
                "2TB": 600,
                "4TB": 1200,
                "8TB": 2400
            ]
        ],
        "iPhone 14 Pro": [
            "base": 999,
            "storage": [
                "256GB": 100,
                "512GB": 300,
                "1TB": 500
            ]
        ],
        "iPhone 14 Pro Max": [
            "base": 1099,
            "storage": [
                "256GB": 100,
                "512GB": 300,
                "1TB": 500
            ]
        ],
        "iPhone 14": [
            "base": 799,
            "storage": [
                "256GB": 100,
                "512GB": 300
            ]
        ],
        "iPhone 14 Plus": [
            "base": 899,
            "storage": [
                "256GB": 100,
                "512GB": 300
            ]
        ],
        "iPhone 13 mini": [
            "base": 599,
            "storage": [
                "256GB": 100,
                "512GB": 300
            ]
        ],
        "iPhone 13": [
            "base": 699,
            "storage": [
                "256GB": 100,
                "512GB": 300
            ]
        ],
        "iPhone SE": [
            "base": 429,
            "storage": [
                "128GB": 50,
                "256GB": 150
            ]
        ],
        "iPhone 12": [
            "base": 599,
            "storage": [
                "128GB": 50,
                "256GB": 150
            ]
        ],
        "Apple Watch Ultra": [
            "base": 799
        ],
        "Apple Watch Series 8": [
            "base": 399,
            "display": [
                "45mm": 30
            ]
        ],
        "Apple Watch SE": [
            "base": 249,
            "display": [
                "44mm": 30
            ]
        ],
        "iPad Pro 11": [
            "base": 799,
            "storage": [
                "256GB": 100,
                "512GB": 300,
                "1TB": 700,
                "2TB": 1100
            ]
        ],
        "iPad Pro 12.9": [
            "base": 1099,
            "storage": [
                "256GB": 100,
                "512GB": 300,
                "1TB": 700,
                "2TB": 1100
            ]
        ],
        "iPad Air": [
            "base": 599,
            "storage": [
                "256GB": 150
            ]
        ],
        "iPad 10th generation": [
            "base": 499,
            "storage": [
                "256GB": 150
            ]
        ],
        "iPad 9th generation": [
            "base": 329,
            "storage": [
                "256GB": 150
            ]
        ],
        "iPad mini": [
            "base": 499,
            "storage": [
                "256GB": 150
            ]
        ],
        "AirPods (2nd generation)": [
            "base": 129
        ],
        "AirPods (3nd generation)": [
            "base": 169
        ],
        "AirPods Pro (2nd generation)": [
            "base": 249
        ],
        "AirPods Max": [
            "base": 549
        ]
    ]
    
    let icons = [
        "circle.grid.2x1",
        "circlebadge",
        "cpu",
        "paintpalette",
        "display",
        "memorychip",
        "internaldrive"
    ]
    
    private init() {}
}
