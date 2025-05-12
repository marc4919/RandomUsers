//
//  UserDetailView.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 23/4/25.
//

import SwiftUI

struct UserDetailView: View {
    @Environment(UsersVM.self) private var vm

    @Binding var user: User?

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

                UsersCarousel(users: vm.users, referenceUser: $user).frame(
                    height: 300
                )
                .padding(.leading)
            }
        }

    }
}

#Preview {
    UserDetailView(user: .constant(.test))
        .environment(UsersVM())
}
