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
        VStack(spacing: 0) {
            Avatar(image: user.avatar, style: .square)

            VStack {
                Text(user.firstName)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity).padding(.top, 5)

                Text(user.email)
                    .font(.subheadline)
            }.padding(.bottom, 15).background(Color(.systemGray6))

        }
        .cornerRadius(5)
        .frame(maxWidth: 180)

    }
}

#Preview {
    CardMode(user: .test)
}
