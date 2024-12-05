import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoGameModelView // View model for game state

    var body: some View {
        VStack {
            // Title
            Text("Memo")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Large card at the top
            largeCardView
            
            // Cards grid
            ScrollView {
                rects
            }
            
            // Theme and Shuffle Buttons
            VStack {
                themeButtons
                shuffleButton
            }
        }
        .padding()
    }
    
    // Large card display
    var largeCardView: some View {
        CardView(card: viewModel.mainCard, color: viewModel.themeColor)
            .aspectRatio(2 / 3, contentMode: .fit) // Ensure the large card fits the layout
            .frame(width: 200, height: 300) // Adjust size to make it larger
            .padding(.bottom, 20) // Space between the large card and the grid
    }
    
    // Cards grid layout
    var rects: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(viewModel.cards) { card in // Skipping the first card for the large one
                CardView(card: card, color: viewModel.themeColor) // Smaller cards in grid
                    .aspectRatio(2 / 3, contentMode: .fit)
                    .onTapGesture {
                        // Flip the card on tap
                        withAnimation(.easeInOut(duration: 0.3)) {
                            viewModel.choose(card)
                        }
                    }
            }
        }
        .foregroundColor(viewModel.themeColor) // Dynamic theme color
    }
    
    // Theme selection buttons
    var themeButtons: some View {
        
        HStack(spacing: 20) {
            ThemeButton(
                action: { viewModel.changeTheme(color: .purple) },
                label: "Animal1",
                icon: "moon.stars",
                color: .purple
                
            )
            ThemeButton(
                action: { viewModel.changeTheme(color: .cyan) },
                label: "Animal2",
                icon: "moon",
                color: .cyan
            )
            ThemeButton(
                action: { viewModel.changeTheme(color: .gray) },
                label: "Animal3",
                icon: "moon.zzz",
                color: .gray
            )
        }
        .padding(.top)
    }
    
    // Shuffle cards button
    var shuffleButton: some View {
        Button(action: {
            viewModel.shuffleCards()
        }) {
            HStack {
                Image(systemName: "shuffle")
                Text("Shuffle Cards")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(viewModel.themeColor.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .padding(.top)
    }
}

#Preview {
    ContentView(viewModel: MemoGameModelView())
}
