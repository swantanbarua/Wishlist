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
    @State private var isAlertShowing = false
    @State private var title = ""
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(
                            .vertical,
                            2
                        )
                        .swipeActions {
                            Button(
                                ButtonTitle.delete,
                                role: .destructive
                            ) {
                                modelContext.delete(wish)
                            }
                        }
                }
            }
            .navigationTitle(NavigationTitle.wishlist)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: ImageTitle.plus)
                            .imageScale(.large)
                    }
                }
                
                if !wishes.isEmpty {
                    ToolbarItem(placement: .bottomBar) {
                        Text("\(wishes.count) wish\(wishes.count > 1 ? "es": "")")
                    }
                }
            }
            .alert(
                DescriptionMsg.createNewWish,
                isPresented: $isAlertShowing
            ) {
                TextField(
                    DescriptionMsg.enterWish,
                    text: $title
                )
                
                Button {
                    modelContext.insert(
                        Wish(title: title)
                    )
                    title = ""
                } label: {
                    Text(ButtonTitle.save)
                }
            }
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
    
    let container = try! ModelContainer(
        for: Wish.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    
    container.mainContext.insert(
        Wish(title: WishlistTitle.masterSwiftData)
    )
    
    container.mainContext.insert(
        Wish(title: WishlistTitle.buyNewIPhone)
    )
    
    container.mainContext.insert(
        Wish(title: WishlistTitle.practiceLatinDances)
    )
    
    container.mainContext.insert(
        Wish(title: WishlistTitle.travelToEurope)
    )
    
    container.mainContext.insert(
        Wish(title: WishlistTitle.makePositiveImpact)
    )
    
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
