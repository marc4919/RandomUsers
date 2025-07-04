//
//  RandomizerView.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 1/5/25.
//

import SwiftUI

struct RandomizerView: View {
    @Environment(UsersVM.self) private var vm

    @State private var currentIndex = 0
    @State private var showDetail = false
    @State private var showAvatar = false
    @State private var user: User?

    var body: some View {
        ZStack {
            if showDetail {
                UserDetailView(user: $user)
                    .transition(.scale)
                    .animation(.easeInOut, value: showDetail)
            } else {
                ZStack {
                    ForEach(0..<12, id: \.self) { i in
                        let angle = Angle(degrees: Double(i) * 30 - 90)
                        let radius: CGFloat = 60

                        Image(systemName: "questionmark.circle")
                            .scaleEffect(showAvatar ? 1 : 0.1)
                            .opacity(showAvatar ? 1 : 0)
                            .offset(
                                x: radius * cos(angle.radians),
                                y: radius * sin(angle.radians)
                            )
                            .animation(
                                .easeOut(duration: 0.4)
                                    .delay(Double(i) * 0.2),
                                value: showAvatar
                            )
                    }

                    Avatar(image: vm.users[currentIndex].avatar, dimension: 100)
                }
                .frame(width: 200, height: 200)
            }
        }
        .onAppear {
            randomizeUser()
        }
        .onDisappear {
            showDetail = false
            showAvatar = false
        }

    }

    func randomizeUser() {
        print("Randomizing user...")
        Task {
            showAvatar = true
            for i in 0..<vm.users.count {
                try? await Task.sleep(nanoseconds: 400_000_000)
                currentIndex = i
            }
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            user = vm.users[currentIndex]
            withAnimation {
                showDetail = true
            }
        }
    }
}

#Preview {
    RandomizerView()
        .environment(UsersVM())
}
