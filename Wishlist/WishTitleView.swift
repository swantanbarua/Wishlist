//
//  WishTitleView.swift
//  Wishlist
//
//  Created by Swantan Barua on 16/02/26.
//

// MARK: - IMPORTS
import SwiftUI
import SwiftData

struct WishTitleView: View {
    
    // MARK: - PROPERTIES
    var modelContext: ModelContext
    var wish: Wish
    
    // MARK: - BODY
    var body: some View {
        Text(wish.title)
            .font(.title.weight(.light))
            .padding(
                .vertical,
                2
            )
            .swipeActions {
                Button(
                    "Delete",
                    role: .destructive
                ) {
                    modelContext.delete(wish)
                }
            }
    }
}

#Preview {
    // Configure SwiftData to use in-memory storage for preview
    // This ensures the preview doesn't affect the actual app's data
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    
    do {
        // Create a ModelContainer with the Wish model and in-memory configuration
        // This container manages the data store for SwiftData
        let container = try ModelContainer(
            for: Wish.self,
            configurations: config
        )
        
        // Create a ModelContext from the container
        // The context is used to perform operations like insert, delete, etc.
        let context = ModelContext(container)
        
        // Create a sample wish for the preview
        let wish = Wish(title: "Sample Wish")
        
        // Insert the wish into the context so it's available in the preview
        context.insert(wish)
        
        // Return the WishTitleView with the context and sample wish
        return WishTitleView(
            modelContext: context,
            wish: wish
        )
    } catch {
        // If there's an error setting up the preview (e.g., model configuration issues),
        // display an error message instead of crashing
        return Text("Preview Error: \(error.localizedDescription)")
    }
}
