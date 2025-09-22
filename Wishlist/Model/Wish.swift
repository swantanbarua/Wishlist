//
//  Wish.swift
//  Wishlist
//
//  Created by Swantan Barua on 17/09/25.
//

import Foundation
import SwiftData

@Model
class Wish {
    
    // MARK: - PROPERTIES
    var title: String
    
    // MARK: - INIT
    init(title: String) {
        self.title = title
    }
}
