//
//  CreateUserView.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 9/5/25.
//

import SwiftUI

struct CreateUserView: View {
    var body: some View {
        Form {
            Section("User Details") {
                TextField("First Name", text: .constant(""))
                TextField("Last Name", text: .constant(""))
                TextField("Email", text: .constant(""))
            }
        }
    }
}

#Preview {
    CreateUserView()
}
