//
//  ProductInfoViewController.swift
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
    
    var priceDiscount: Int {
        price - price * discountAmount / 100
    }
    var image: String {
        "\(model) \(color)".trimmingCharacters(in: .whitespaces)
    }
    var inCart = false
    var title: String {
        switch category {
        case "Mac":
            if model.contains("M1") || model.contains("M2") {
                return "\(model) \(color) \(memory)/\(storage)"
            } else {
                return "\(model) \(chip)\(color == "" ? "" : " \(color)") \(memory)/\(storage)"
            }
        case "iPhone", "iPad":
            return "\(model) \(color) \(storage)"
        case "Watch":
            return "\(model)\(color == "" ? "" : " \(color)") \(display)"
        default:
            return model == "AirPods Max" ? "\(model) \(color)" : model
        }
    }
}

extension Product {
    static func getRandomProducts(count: Int) -> [Product] {
        
        let shared = DataStore.shared
        var products: [Product] = []
        
        while products.count < count {
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
            
            let product = Product(
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
                discountAmount: discountAmount
            )
            
            if !products.contains(product) {
                products.append(product)
            }
        }
        
        return products
    }
    
    static func getPrice(
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

    static func getDiscountAmount(onSale: Bool) -> Int {
        onSale == true ? Int.random(in: 5...25) : 0
    }
}



// MARK: - Equatable
extension Product: Equatable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        return
            lhs.model == rhs.model &&
            lhs.chip == rhs.chip &&
            lhs.color == rhs.color &&
            lhs.display == rhs.display &&
            lhs.memory == rhs.memory &&
            lhs.storage == rhs.storage
    }
}
