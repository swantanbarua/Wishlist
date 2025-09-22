//
//  ContentView.swift
//  Wishlist
//
//  Created by Swantan Barua on 14/09/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                }
            }
            .navigationTitle("Wishlist")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(
            for: Wish.self,
            inMemory: true
        )
}
