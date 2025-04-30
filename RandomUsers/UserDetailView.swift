//
//  UserDetailView.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 23/4/25.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    let users = getUsers()
    var body: some View {
        VStack {
            Avatar(image: user.avatar)
                .frame(width: 140).clipShape(Circle())
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

            UsersCarousel(users: users, referenceUser: user).frame(height: 300)
                .padding(.leading)

        }

    }
}

#Preview {
    UserDetailView(user: .test)
}
