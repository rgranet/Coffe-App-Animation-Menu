//
//  Coffee.swift
//  CoffeeAppAnimation
//
//  Created by Ruben Granet on 08/11/2022.
//

import SwiftUI

// Coffee Model with Sample Data

struct Coffee: Identifiable {
    var id: UUID = .init()
    var imageName: String
    var title: String
    var price: String
}


var coffees: [Coffee] = [
    Coffee(imageName: "Item 1", title: "Caramel\nCold Drink", price: "$3.90"),
    Coffee(imageName: "Item 2", title: "Caramel\nMacchiato", price: "$2.30"),
    Coffee(imageName: "Item 3", title: "Iced Coffee\nMocha", price: "$9.20"),
    Coffee(imageName: "Item 4", title: "Toffee Nut\nCrunch Latte", price: "$12.30"),
    Coffee(imageName: "Item 5", title: "Styled Cold\nCoffee", price: "$8.90"),
    Coffee(imageName: "Item 6", title: "Classic Irish\nCoffee", price: "$6.10"),
    Coffee(imageName: "Item 7", title: "Black Tea\nLatte", price: "$2.20"),
    Coffee(imageName: "Item 8", title: "Iced Coffee\nMocha", price: "$5.90"),
]
