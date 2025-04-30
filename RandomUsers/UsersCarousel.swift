//
//  UsersCarousel.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 23/4/25.
//

import SwiftUI

struct UsersCarousel: View {
    let users: [User]
    var referenceUser: User? = nil
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(users) { friend in
                    if friend.id != referenceUser?.id {
                        NavigationLink(destination: UserDetailView(user: friend)) {
                            CardModeView(user: friend)
                        }.buttonStyle(.plain)
                    }
                }
            }
            
        }
    }
}

#Preview {
    let previewUsers = [User.test, User.test, User.test, User.test]
    UsersCarousel(users: previewUsers)
        
}
