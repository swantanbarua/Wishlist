//
//  WishlistApp.swift
//  Wishlist
//
//  Created by Swantan Barua on 13/11/25.
//

// MARK: - IMPORTS
import SwiftUI
import SwiftData

@main
struct WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}
