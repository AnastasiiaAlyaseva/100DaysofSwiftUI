
import SwiftUI

struct ContentView: View {
    @State private var moves = ["Rock", "Paper", "Scissors"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.mint, .blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                
                VStack(spacing: 20) {
                    VStack {
                        Text("Make your choice")
                            .foregroundStyle(.white)
                            .font(.subheadline.weight(.heavy))
                        Text(moves[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    HStack {
                        ForEach(0..<3) { number in
                            Button {
                                //
                            } label: {
                                Image(moves[number])
                                    .clipShape(.circle)
                                    .shadow(radius: 5)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
