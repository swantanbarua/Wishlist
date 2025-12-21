//
//  WishModel.swift
//  Wishlist
//
//  Created by Swantan Barua on 14/11/25.
//

// MARK: - IMPORTS
import Foundation
import SwiftData

@Model
class Wish {
    
    // MARK: - PROPERTIES
    var title: String
    
    // MARK: - INITIALIZATION
    init(title: String) {
        self.title = title
    }
}
