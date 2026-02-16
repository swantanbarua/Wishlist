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
    @State private var isAlertShowing = false
    @State private var title = ""
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ForEach(wishes) { wish in
                WishTitleView(
                    modelContext: modelContext,
                    wish: wish
                )
            }
        }
        .navigationTitle("Wishlist")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isAlertShowing.toggle()
                } label: {
                    Image(systemName: "plus")
                        .imageScale(.large)
                }
            }
            
            if !wishes.isEmpty {
                ToolbarItem(placement: .bottomBar) {
                    Text("\(wishes.count) wish\(wishes.count > 1 ? "es" : "")")
                }
            }
        }
        .alert(
            "Create a new wish",
            isPresented: $isAlertShowing
        ) {
            TextField(
                "Enter a wish",
                text: $title
            )
            
            Button {
                modelContext.insert(
                    Wish(title: title)
                )
                title = ""
            } label: {
                Text("SAVE")
            }
        }
        .overlay {
            if wishes.isEmpty {
                ContentUnavailableView(
                    "My Wishlist",
                    systemImage: "heart.circle",
                    description: Text("No wishes yet. Add one to get started!")
                )
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
