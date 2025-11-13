//
//  ContentView.swift
//  Wishlist
//
//  Created by Swantan Barua on 13/11/25.
//

// MARK: - IMPORTS
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
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView(
                        "My Wishlist",
                        systemImage: "heart.circle",
                        description: Text("No wishes yet. Add one to get started")
                    )
                }
            }
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
