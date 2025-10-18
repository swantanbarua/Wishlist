//
//  EmptyWishListView.swift
//  Wishlist
//
//  Created by Swantan Barua on 19/10/25.
//

import SwiftUI

struct EmptyWishListView: View {
    
    // MARK: - PROPERTIES
    @State var isEmpty: Bool
    
    // MARK: - BODY
    var body: some View {
        if isEmpty {
            ContentUnavailableView(
                "My Wishlist",
                systemImage: "heart.circle.fill",
                description: Text("No wishes yet. Add one to get started")
            )
        }
    }
}

#Preview {
    EmptyWishListView(isEmpty: true)
}
