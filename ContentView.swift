//
//  ContentView.swift
//  Wishlist
//
//  Created by Swantan Barua on 01/09/25.
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
            .navigationTitle(NavigationTitle.wishlist)
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView(
                        Heading.myWishlist,
                        systemImage: ImageTitle.heartCircle,
                        description: Text(DescriptionMsg.noWishesMsg)
                    )
                }
            }
        }
    }
}

#Preview(PreviewHeading.listWithSampleData) {
    
    // MARK: - PROPERTIES
    let container = try! ModelContainer(
        for: Wish.self,
        configurations: ModelConfiguration(
            isStoredInMemoryOnly: true
        )
    )
    
    let wishTitles = [
        WishlistTitle.masterSwiftData,
        WishlistTitle.buyNewIPhone,
        WishlistTitle.practiceLatinDances,
        WishlistTitle.travelToEurope,
        WishlistTitle.makePositiveImpact
    ]
    
    // MARK: - BODY
    ForEach(wishTitles) { wishTitle in
        container.mainContext.insert(
            Wish(title: wishTitle)
        )
    }
    
    return ContentView()
        .modelContainer(container)
}

#Preview(PreviewHeading.emptyList) {
    ContentView()
        .modelContainer(
            for: Wish.self,
            inMemory: true
        )
}
