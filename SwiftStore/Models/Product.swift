//
//  Product.swift
//  SwiftStore
//
//  Created by Dmitry Polyakov on 31.01.23.
//

struct Product {
    let category: String
    let model: String
    let chip: String
    let color: String
    let display: String
    let memory: String
    let storage: String
    let onSale: Bool
    let isBestseller: Bool
    let isRecommended: Bool
    let price: Int
    let discountAmount: Int
    let priceDiscount: Int
    var inCart = false
    
    var image: String {
        "\(model) \(color)".trimmingCharacters(in: .whitespaces)
    }
}

extension Product {
    static func getRandomProducts(count: Int) -> [Product] {
        
        let shared = DataStore.shared
        var products: [Product] = []
        
        for _ in 1...count {
            let category = shared.categories.randomElement() ?? "iPhone"
            let model: String
            
            switch category {
            case "Mac":
                model = shared.macs.randomElement() ?? ""
            case "iPhone":
                model = shared.iPhones.randomElement() ?? ""
            case "Watch":
                model = shared.watches.randomElement() ?? ""
            case "iPad":
                model = shared.iPads.randomElement() ?? ""
            default:
                model = shared.airPods.randomElement() ?? ""
            }
            
            let chip = shared.processors[model]?.randomElement() ?? ""
            let color = shared.colors[model]?.randomElement() ?? ""
            let display = shared.displays[model]?.randomElement() ?? ""
            let memory = shared.memoryConfigurations[model]?.randomElement()
            ?? ""
            let storage = shared.storageConfigurations[model]?.randomElement()
            ?? ""
            let onSale = Bool.random()
            let isBestseller = Bool.random()
            let isRecommended = Bool.random()
            let price = getPrice(model: model, processor: chip, memory: memory, storage: storage, display: display)
            let discountAmount = getDiscountAmount(onSale: onSale)
            let priceDiscount = price - price * discountAmount / 100
            
            products.append(
                Product(
                    category: category,
                    model: model,
                    chip: chip,
                    color: color,
                    display: display,
                    memory: memory,
                    storage: storage,
                    onSale: onSale,
                    isBestseller: isBestseller,
                    isRecommended: isRecommended,
                    price: price,
                    discountAmount: discountAmount,
                    priceDiscount: priceDiscount
                )
            )
        }
        
        return products
    }
}

private func getPrice(
    model: String,
    processor: String?,
    memory: String?,
    storage: String?,
    display: String?
) -> Int
{
    var price = 0
    
    guard let info = DataStore.shared.prices[model] else { return 0 }
    
    if let basePrice = info["base"] as? Int {
        price += basePrice
    } else {
        price += 0
    }
    
    if let processorPrice = info["processor"] as? [String: Int] {
        price += processorPrice[processor ?? ""] ?? 0
    } else {
        price += 0
    }
    
    if let memoryPrice = info["memory"] as? [String: Int] {
        price += memoryPrice[memory ?? ""] ?? 0
    } else {
        price += 0
    }
    
    if let storagePrice = info["storage"] as? [String: Int] {
        price += storagePrice[storage ?? ""] ?? 0
    } else {
        price += 0
    }
    
    if let displayPrice = info["display"] as? [String: Int] {
        price += displayPrice[display ?? ""] ?? 0
    } else {
        price += 0
    }
    
    return price
}

private func getDiscountAmount(onSale: Bool) -> Int {
    onSale == true ? Int.random(in: 5...25) : 0
}

extension Product {
    static func getProducts() -> [Product] {
        [
            Product(
                category: "Mac",
                model: "MacBook Air M1",
                chip: "M1",
                color: "Silver",
                display: "13.3",
                memory: "16GB",
                storage: "512GB",
                onSale: true,
                isBestseller: true,
                isRecommended: true,
                price: 1399,
                discountAmount: 10,
                priceDiscount: 1099
            ),
            Product(
                category: "Mac",
                model: "MacBook Air M1",
                chip: "M1",
                color: "Space Gray",
                display: "13.3",
                memory: "8GB",
                storage: "256GB",
                onSale: false,
                isBestseller: true,
                isRecommended: true,
                price: 999,
                discountAmount: 10,
                priceDiscount: 899
            ),
            Product(
                category: "Mac",
                model: "MacBook Pro 14",
                chip: "M2 Pro",
                color: "Space Gray",
                display: "14.2",
                memory: "16GB",
                storage: "512GB",
                onSale: true,
                isBestseller: false,
                isRecommended: false,
                price: 1999,
                discountAmount: 10,
                priceDiscount: 1890
            ),
            Product(
                category: "Mac",
                model: "MacBook Pro 14",
                chip: "M2 Max",
                color: "Silver",
                display: "14.2",
                memory: "32GB",
                storage: "1TB",
                onSale: false,
                isBestseller: false,
                isRecommended: true,
                price: 3099,
                discountAmount: 10,
                priceDiscount: 3099
            ),
            Product(
                category: "Mac",
                model: "MacBook Pro 16",
                chip: "M2 Pro",
                color: "Space Gray",
                display: "16.2",
                memory: "16GB",
                storage: "512GB",
                onSale: true,
                isBestseller: true,
                isRecommended: false,
                price: 2499,
                discountAmount: 10,
                priceDiscount: 2299
            ),
            Product(
                category: "Mac",
                model: "MacBook Pro 16",
                chip: "M2 Max",
                color: "Silver",
                display: "16.2",
                memory: "64GB",
                storage: "2TB",
                onSale: false,
                isBestseller: false,
                isRecommended: false,
                price: 3499,
                discountAmount: 10,
                priceDiscount: 3499
            ),
            Product(
                category: "Mac",
                model: "iMac 24",
                chip: "M1",
                color: "Blue",
                display: "24",
                memory: "8GB",
                storage: "256GB",
                onSale: true,
                isBestseller: false,
                isRecommended: false,
                price: 1299,
                discountAmount: 10,
                priceDiscount: 1199
            ),
            Product(
                category: "Mac",
                model: "iMac 24",
                chip: "M1",
                color: "Green",
                display: "24",
                memory: "16GB",
                storage: "512GB",
                onSale: false,
                isBestseller: false,
                isRecommended: false,
                price: 1699,
                discountAmount: 10,
                priceDiscount: 1699
            ),
            Product(
                category: "Mac",
                model: "Mac mini",
                chip: "M2",
                color: "",
                display: "",
                memory: "8GB",
                storage: "256GB",
                onSale: false,
                isBestseller: true,
                isRecommended: false,
                price: 599,
                discountAmount: 10,
                priceDiscount: 599
            ),
            Product(
                category: "Mac",
                model: "Mac mini",
                chip: "M2",
                color: "",
                display: "",
                memory: "16GB",
                storage: "512GB",
                onSale: true,
                isBestseller: false,
                isRecommended: false,
                price: 999,
                discountAmount: 10,
                priceDiscount: 899
            ),
            Product(
                category: "Mac",
                model: "Mac mini",
                chip: "M2 Pro",
                color: "",
                display: "",
                memory: "32GB",
                storage: "1TB",
                onSale: false,
                isBestseller: false,
                isRecommended: true,
                price: 1899,
                discountAmount: 10,
                priceDiscount: 1899
            ),
            Product(
                category: "Mac",
                model: "Mac Studio",
                chip: "M2 Max",
                color: "",
                display: "",
                memory: "32GB",
                storage: "512GB",
                onSale: true,
                isBestseller: false,
                isRecommended: false,
                price: 1999,
                discountAmount: 10,
                priceDiscount: 1899
            ),
            Product(
                category: "Mac",
                model: "Mac Studio",
                chip: "M2 Ultra",
                color: "",
                display: "",
                memory: "64GB",
                storage: "4TB",
                onSale: false,
                isBestseller: false,
                isRecommended: false,
                price: 3999,
                discountAmount: 10,
                priceDiscount: 3999
            ),
            Product(
                category: "Mac",
                model: "Mac Pro",
                chip: "Intel Xeon W",
                color: "",
                display: "",
                memory: "1.5TB",
                storage: "8TB",
                onSale: true,
                isBestseller: false,
                isRecommended: false,
                price: 49799,
                discountAmount: 10,
                priceDiscount: 47799
            ),
            Product(
                category: "Mac",
                model: "Mac Pro",
                chip: "Intel Xeon W",
                color: "",
                display: "",
                memory: "32GB",
                storage: "512GB",
                onSale: false,
                isBestseller: false,
                isRecommended: false,
                price: 5999,
                discountAmount: 10,
                priceDiscount: 5999
            ),
            Product(
                category: "iPad",
                model: "iPad Pro",
                chip: "M2",
                color: "Silver",
                display: "11",
                memory: "",
                storage: "128GB",
                onSale: false,
                isBestseller: false,
                isRecommended: false,
                price: 799,
                discountAmount: 10,
                priceDiscount: 799
            ),
            Product(
                category: "iPad",
                model: "iPad Pro",
                chip: "M2",
                color: "Space Gray",
                display: "12.9",
                memory: "",
                storage: "512GB",
                onSale: true,
                isBestseller: false,
                isRecommended: false,
                price: 1399,
                discountAmount: 10,
                priceDiscount: 1299
            ),
            Product(
                category: "iPad",
                model: "iPad Air",
                chip: "M1",
                color: "Space Gray",
                display: "10.9",
                memory: "",
                storage: "256GB",
                onSale: false,
                isBestseller: false,
                isRecommended: false,
                price: 749,
                discountAmount: 10,
                priceDiscount: 749
            ),
            Product(
                category: "iPad",
                model: "iPad 10th generation",
                chip: "A14",
                color: "Silver",
                display: "10.9",
                memory: "",
                storage: "64GB",
                onSale: false,
                isBestseller: false,
                isRecommended: false,
                price: 499,
                discountAmount: 10,
                priceDiscount: 499
            ),
            Product(
                category: "iPad",
                model: "iPad mini",
                chip: "A15",
                color: "Pink",
                display: "8.3",
                memory: "",
                storage: "64GB",
                onSale: true,
                isBestseller: false,
                isRecommended: false,
                price: 499,
                discountAmount: 10,
                priceDiscount: 449
            ),
            Product(
                category: "iPhone",
                model: "iPhone 14 Pro",
                chip: "A16",
                color: "Deep Purple",
                display: "6.1",
                memory: "",
                storage: "256GB",
                onSale: true,
                isBestseller: false,
                isRecommended: false,
                price: 1099,
                discountAmount: 10,
                priceDiscount: 999
            ),
            Product(
                category: "iPhone",
                model: "iPhone 14 Pro Max",
                chip: "A16",
                color: "Gold",
                display: "6.7",
                memory: "",
                storage: "512GB",
                onSale: false,
                isBestseller: false,
                isRecommended: false,
                price: 1399,
                discountAmount: 10,
                priceDiscount: 1399
            ),
            Product(
                category: "iPhone",
                model: "iPhone 14",
                chip: "A15",
                color: "Blue",
                display: "6.1",
                memory: "",
                storage: "128GB",
                onSale: false,
                isBestseller: false,
                isRecommended: false,
                price: 799,
                discountAmount: 10,
                priceDiscount: 799
            ),
            Product(
                category: "iPhone",
                model: "iPhone 14 Plus",
                chip: "A15",
                color: "Midnight",
                display: "6.7",
                memory: "",
                storage: "512GB",
                onSale: false,
                isBestseller: true,
                isRecommended: false,
                price: 1199,
                discountAmount: 10,
                priceDiscount: 1199
            ),
            Product(
                category: "iPhone",
                model: "iPhone 13 mini",
                chip: "A15",
                color: "Pink",
                display: "5.4",
                memory: "",
                storage: "128GB",
                onSale: true,
                isBestseller: true,
                isRecommended: true,
                price: 599,
                discountAmount: 10,
                priceDiscount: 599
            ),
            Product(
                category: "iPhone",
                model: "iPhone 13",
                chip: "A15",
                color: "Starlight",
                display: "6.1",
                memory: "",
                storage: "256GB",
                onSale: false,
                isBestseller: false,
                isRecommended: true,
                price: 799,
                discountAmount: 10,
                priceDiscount: 799
            ),
            Product(
                category: "iPhone",
                model: "iPhone SE",
                chip: "A15",
                color: "Midnight",
                display: "4.7",
                memory: "",
                storage: "64GB",
                onSale: false,
                isBestseller: false,
                isRecommended: true,
                price: 429,
                discountAmount: 10,
                priceDiscount: 429
            ),
            Product(
                category: "iPhone",
                model: "iPhone 12",
                chip: "A14",
                color: "Green",
                display: "6.1",
                memory: "",
                storage: "256GB",
                onSale: false,
                isBestseller: false,
                isRecommended: true,
                price: 749,
                discountAmount: 10,
                priceDiscount: 749
            ),
            Product(
                category: "Watch",
                model: "Apple Watch Ultra",
                chip: "",
                color: "Starlight",
                display: "",
                memory: "",
                storage: "",
                onSale: true,
                isBestseller: true,
                isRecommended: true,
                price: 799,
                discountAmount: 10,
                priceDiscount: 799
            ),
            Product(
                category: "Watch",
                model: "Apple Watch Series 8",
                chip: "",
                color: "Red",
                display: "",
                memory: "",
                storage: "",
                onSale: false,
                isBestseller: false,
                isRecommended: true,
                price: 499,
                discountAmount: 10,
                priceDiscount: 499
            ),
            Product(
                category: "Watch",
                model: "Apple Watch SE",
                chip: "",
                color: "Sunglow",
                display: "",
                memory: "",
                storage: "",
                onSale: false,
                isBestseller: false,
                isRecommended: true,
                price: 279,
                discountAmount: 10,
                priceDiscount: 279
            ),
            Product(
                category: "AirPods",
                model: "AirPods (2nd generation)",
                chip: "",
                color: "",
                display: "",
                memory: "",
                storage: "",
                onSale: false,
                isBestseller: true,
                isRecommended: true,
                price: 129,
                discountAmount: 10,
                priceDiscount: 129
            ),
            Product(
                category: "AirPods",
                model: "AirPods (3nd generation)",
                chip: "",
                color: "",
                display: "",
                memory: "",
                storage: "",
                onSale: false,
                isBestseller: false,
                isRecommended: true,
                price: 169,
                discountAmount: 10,
                priceDiscount: 169
            ),
            Product(
                category: "AirPods",
                model: "AirPods Pro (2nd generation)",
                chip: "",
                color: "",
                display: "",
                memory: "",
                storage: "",
                onSale: true,
                isBestseller: false,
                isRecommended: false,
                price: 249,
                discountAmount: 10,
                priceDiscount: 229
            ),
            Product(
                category: "AirPods",
                model: "AirPods Max",
                chip: "",
                color: "Sky Blue",
                display: "",
                memory: "",
                storage: "",
                onSale: false,
                isBestseller: false,
                isRecommended: true,
                price: 549,
                discountAmount: 10,
                priceDiscount: 549
            )
        ]
    }
}
