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
            Section("New User Details") {
                TextField("First Name", text: .constant(""))
                TextField("Last Name", text: .constant(""))
                TextField("Email", text: .constant(""))
            }
            Section {
                Button {
                    print("Create User")
                } label: {
                    Text("Create User")
                        .frame(maxWidth: .infinity)                        
                }
            }
            

        }
    }
}

#Preview {
    CreateUserView()
}
