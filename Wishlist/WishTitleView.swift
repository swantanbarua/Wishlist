//
//  WishTitleView.swift
//  Wishlist
//
//  Created by Swantan Barua on 16/02/26.
//

import SwiftUI

struct WishTitleView: View {
    
    // MARK: - PROPERTIES
    var title: String
    
    // MARK: - BODY
    var body: some View {
        Text(title)
            .font(.title.weight(.light))
            .padding(
                .vertical,
                2
            )
    }
}

#Preview {
    WishTitleView(title: title)
}
