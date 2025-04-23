//
//  UserCell.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 23/4/25.
//

import SwiftUI

struct UserCell: View {
    var user: User
    
    var body: some View {
        HStack{
            Text(user.name.first)
            Spacer()
            Avatar(image: user.picture.thumbnail)
        }
    }
}

#Preview {
    UserCell(user: .test)
}


