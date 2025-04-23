//
//  Avatar.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 23/4/25.
//

import SwiftUI

struct Avatar: View {
    var image: URL
    var body: some View {
        AsyncImage(url: image) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 50)
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    Avatar(image: User.test.avatar)
}
