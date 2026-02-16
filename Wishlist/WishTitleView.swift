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
    
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    
    do {
        let container = try ModelContainer(
            for: Wish.self,
            configurations: config
        )
        
        let context = ModelContext(container)
        let wish = Wish(title: "Sample Wish")
        context.insert(wish)
        
        return WishTitleView(
            modelContext: context,
            wish: wish
        )
    } catch {
        return Text("Preview Error: \(error.localizedDescription)")
    }
}
