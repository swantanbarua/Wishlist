//
//  WishModel.swift
//  Wishlist
//
//  Created by Swantan Barua on 01/09/25.
//

import Foundation
import SwiftData

@Model
class Wish {
    
    // MARK: - PROPERTIES
    var title: String
    
    // MARK: - INITIALIZER
    init(title: String) {
        self.title = title
    }
}
