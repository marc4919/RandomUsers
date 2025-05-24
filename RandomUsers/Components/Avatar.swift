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
    var image: URL?
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
        defaultAvatar
            .frame(maxWidth: .infinity)
            .aspectRatio(1, contentMode: .fit)
    }

    var roundAvatar: some View {
        defaultAvatar
            .clipShape(Circle())
            .frame(width: dimension)
    }

    var defaultAvatar: some View {
        Group {
            if let validURL = image {
                AsyncImage(url: validURL) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure(_):
                        fallbackImage
                    case .empty:
                        ProgressView()
                    @unknown default:
                        fallbackImage
                    }
                }
            } else {
                fallbackImage
            }
        }
    }
    
    private var fallbackImage: some View {
        Group {
            switch style {
            case .square:
                RoundedRectangle(cornerRadius: 0)
                    .fill(Color.gray.opacity(0.3))
                    .overlay(
                        Image(systemName: "person.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: dimension * 1.4))
                    )
                    
            case .round:
                Image(systemName: "person.circle.fill")
                    .foregroundColor(.gray)
                    .font(.system(size: dimension))
            }
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        Avatar(image: nil, style: .round, dimension: 80)
        
        Avatar(image: nil, style: .square, dimension: 80)
        
        Avatar(image: User.test.avatar, style: .round, dimension: 80)
        Avatar(image: User.test.avatar, style: .square, dimension: 80)
    }
    .padding()
}
