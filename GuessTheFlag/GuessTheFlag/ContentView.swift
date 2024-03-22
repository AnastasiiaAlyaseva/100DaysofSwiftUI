

import SwiftUI

struct FlagImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.white)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var showingFinalScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var currentScore = 0
    @State private var questionCount = 0
    
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
           
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .titleStyle()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            scoreСalculation(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .modifier(FlagImage())
                
                Spacer()
                Spacer()
                
                Text("Score: \(currentScore)")
                    .titleStyle()
                
                Spacer()
            }
            .padding()
        }
        
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("You score is \(currentScore)")
        }
        .alert("Finale Score", isPresented: $showingFinalScore) {
            Button("Restart", action: restartGame)
        } message: {
            Text(" Congratulations! You answered \(currentScore) out of 8 questions correctly!")
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong! That's tha flag of \(countries[number])"
        }
        showingScore = true
        questionCount += 1
    }
    
    func askQuestion() {
        if questionCount < 8 {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        } else {
            showingFinalScore = true
        }
    }
    
    func scoreСalculation(_ number: Int) {
        if number == correctAnswer {
            currentScore += 1
        } else {
            currentScore -= 1
        }
    }
    func restartGame() {
        currentScore = 0
        questionCount = 0
        scoreTitle = ""
        showingScore = false
        showingFinalScore = false
        
    }
}

#Preview {
    ContentView()
}
