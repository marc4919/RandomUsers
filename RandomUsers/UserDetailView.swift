//
//  UserDetailView.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 23/4/25.
//

import SwiftUI

struct UserDetailView: View {
    @Binding var user: User?
    let users = getUsers()
    var body: some View {
        VStack {
            if let user {
                
                Avatar(image: user.avatar, style: .round, dimension: 140)
                Text("\( user.firstName) \(user.lastName)")
                    .font(.largeTitle)
                    .padding()
                Text(user.email)
                    .font(.headline)
                    .foregroundColor(.gray).padding(.bottom, 50)
                
                Text("Friends")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                    .padding(.leading)
                
                UsersCarousel(users: users, referenceUser: $user).frame(height: 300)
                    .padding(.leading)
            }
        }

    }
}

#Preview {
    UserDetailView(user: .constant(.test))
}
