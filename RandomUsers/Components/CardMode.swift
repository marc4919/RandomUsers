//
//  CardMode.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 23/4/25.
//

import SwiftUI

struct CardMode: View {
    let user: User
    @State var isLoading: Bool = true
    var body: some View {
        VStack {
            Avatar(image: user.avatar).frame(maxWidth: .infinity)

            Text(user.firstName)
                .font(.largeTitle)
                .frame(maxWidth: .infinity).padding(.top, 5)
                .overlay(
                    Rectangle()
                        .frame(height: 5)
                        .foregroundColor(.gray)
                        .offset(y: -8),
                    alignment: .top
                )
            Text(user.email)
                .font(.subheadline)
                .foregroundColor(.gray)
        }.padding(.bottom, 30)
            .border(Color.gray, width: 3)
            .cornerRadius(5)
            .frame(maxWidth: 180)

    }
}

#Preview {
    CardMode(user: .test)
}
