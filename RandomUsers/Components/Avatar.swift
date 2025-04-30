//
//  Avatar.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 23/4/25.
//

import SwiftUI

enum AvatarStyle {
    case square
    case round
}

struct Avatar: View {
    var image: URL
    var style: AvatarStyle = .round
    var dimension: CGFloat = 80
    
    var body: some View {
        switch style {
        case .square:
            squareAvatar
        case .round:
            roundAvatar
        }
    }
    
    var squareAvatar: some View {
        defaultAvatar.frame(maxWidth: .infinity)
    }
    
    var roundAvatar: some View {
        defaultAvatar
            .clipShape(Circle())
            .frame(width: dimension)
    }
    
    var defaultAvatar: some View {
        AsyncImage(url: image) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}



#Preview {
    Avatar(image: User.test.avatar)
}
