
import SwiftUI

struct GameImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(.vertical, 50)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 30))
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title.bold())
            .foregroundStyle(.white)
    }
}

extension View {
    func titleWhiteStyle() -> some View {
        modifier(Title())
    }
}


struct ContentView: View {
    @State private var appChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var currantScore = 0
    @State private var showingScore = false
    @State private var showingFinalScore = false
    @State private var scoreTitle = ""
    @State private var roundCount = 0
    
    let moves = ["Rock", "Paper", "Scissors"].shuffled()
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.mint, .blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                
                Text("Rock Paper Scissors Game")
                    .titleWhiteStyle()
           
                VStack(spacing: 20) {
        
                    Spacer()
                    
                    VStack {
                        Text("App choice:")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(moves[appChoice])
                            .font(.largeTitle.weight(.semibold))
                        
                    }
                    
                    HStack {
                        ForEach(0..<3) { number in
                            Button{
                                playRound(number)
                            } label: {
                                Image(moves[number])
                                    .clipShape(.circle)
                                    .shadow(radius: 5)
                            }
                        }
                    }
                    .modifier(GameImage())
                    
                    Text("You need to \(shouldWin ? "win" : "lose") !")
                        .foregroundStyle(.white)
                        .font(.subheadline.weight(.heavy))
                        
                    Spacer()
                }

                Text("Your score: \(currantScore)")
                    .titleWhiteStyle()
                    
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: resetRound)
        } message: {
            Text ("Your score is \(currantScore)")
        }
        .alert("Final score", isPresented: $showingFinalScore) {
            Button("New game" , action: restartGame)
        } message: {
            Text("Congratulations! You got \(currantScore) point")
        }
    }
    
    func playRound(_ playerChoice: Int) {
        let winConditions = [[0, 1], [1, 2], [2, 0]]
        var isCorrect = true
        if shouldWin {
            isCorrect = winConditions[appChoice].contains(playerChoice)
        } else {
            isCorrect = appChoice == playerChoice
        }
        
        showingScore = true
        roundCount += 1
        scoreCalculation(isCorrect)
    }
    
    func resetRound () {
        if roundCount < 10 {
            appChoice = Int.random(in: 0...2)
            shouldWin.toggle()
        } else {
            showingFinalScore = true
        }
    }
    
    func scoreCalculation(_ isCorrect: Bool) {
        if !isCorrect {
            currantScore += 1
            scoreTitle = "Correct"
        } else {
            currantScore -= 1
            scoreTitle = "Wrong"
        }
    }
    
    func restartGame() {
        currantScore = 0
        roundCount = 0
        scoreTitle = ""
        showingScore = false
        showingFinalScore = false
    }
}

#Preview {
    ContentView()
}
