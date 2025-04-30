//
//  UsersCarousel.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 23/4/25.
//

import SwiftUI

struct UsersCarousel: View {
    let users: [User]
    @Binding var referenceUser: User?
    var isReferenceUserIncluded: Bool = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(users) { friend in
                    if isReferenceUserIncluded || friend.id != referenceUser?.id {
                        Button {
                            referenceUser = friend
                        } label: {
                            CardMode(user: friend)
                        }.buttonStyle(.plain)
                    }
                }
            }
            
        }
    }
}

#Preview {
    let previewUsers = [User.test, User.test, User.test, User.test]
    UsersCarousel(users: previewUsers, referenceUser: .constant(.test), isReferenceUserIncluded: true)
    
}
