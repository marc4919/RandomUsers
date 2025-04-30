struct UsersCarousel: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(users) { friend in
                    if friend.id != user.id {
                        NavigationLink(destination: UserDetailView(user: friend)) {
                            CardModeView(user: friend)
                        }.buttonStyle(.plain)
                    }
                }
            }
            
        }.frame(height: 300).padding(.leading)
    }
}