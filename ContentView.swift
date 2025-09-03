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
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
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
            }
            .alert(
                DescriptionMsg.createNewWish,
                isPresented: $isAlertShowing
            ) {
                
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
    ContentView()
        .modelContainer(
            for: Wish.self,
            inMemory: true
        )
}

#Preview(PreviewHeading.emptyList) {
    ContentView()
        .modelContainer(
            for: Wish.self,
            inMemory: true
        )
}
