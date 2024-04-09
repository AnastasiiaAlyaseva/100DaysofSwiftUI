

import SwiftUI

struct SettingsView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
    }
}

extension View {
    func settingsViewStyle() -> some View {
        modifier(SettingsView())
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.secondary)
            .font(.subheadline.weight(.heavy))
    }
}

extension View{
    func titleSecondaryStyle() -> some View {
        modifier(Title())
    }
}


struct ContentView: View {
    @State private var multiplicationNumber = 6
    @State private var question = 10
    @State private var element = Int.random(in: 0...6)
    @State private var number = Int.random(in: 1...10)
    @State private var currentScore = 0
    @State private var answer = 0
    @State private var correctAnswer = 0
    @State private var questionCount = 0
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var showingScore = false
    @State private var showingFinalScore = false
    @State private var imageAnimation = false
    @State private var animationAmount = 0.0
    
    
    let questions = [5, 10, 20]
    let animal = ["Cat", "Chick", "Dog", "Fox", "Kitty", "Mice", "Rabbit"].shuffled()
    
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
                    .ignoresSafeArea()
                
                
                VStack(spacing: 15){
                    
                    VStack {
                        Text("Chose time table between 2 and 12")
                            .titleSecondaryStyle()
                        
                        Stepper("\(multiplicationNumber)", value: $multiplicationNumber, in: 2...12, step: 1)
                            .frame(maxWidth: 200)
                        
                        Text("How many questions do you want?")
                            .titleSecondaryStyle()
                        
                        Picker("", selection: $question) {
                            ForEach(questions, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(maxWidth: 200)
                    }
                    .settingsViewStyle()
                    
                    Spacer()
                }
                
                VStack{
                    Spacer()
                    Spacer()
                    
                    Text("Calculate how much is \(multiplicationNumber) x \(number) ?")
                        .font(.title2).bold()
                    
                    HStack{
                        TextField("Answer", value: $answer, format: .number)
                            .keyboardType(.numberPad)
                            .foregroundColor(answer == correctAnswer ? .black : .red)
                            .textFieldStyle(.roundedBorder)
                            .onSubmit{checkAnswer()}
                        
                        
                        Button(){
                            checkAnswer()
                        } label: {
                            Image(systemName: "chevron.right.square.fill")
                                .scaleEffect(2)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer()
                    
                    Image(animal[element])
                        .clipShape(.circle)
                        .shadow(radius: 10)
                        .rotation3DEffect(.degrees(animationAmount),axis: (x: 0.0, y: 1.0, z: 0.0))
                        .animation(.default, value: imageAnimation)
                        .opacity(questionCount == question ? 0.3 : 1)
                    
                    Spacer()
                    
                    Text("Score: \(currentScore)")
                        .font(.title).bold()
                    
                }
                .padding()
                
            }
            .navigationTitle("Multiply and Win")
            .toolbar{
                Button("New game"){
                    restartGame()
                }
            }
            
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text(scoreMessage)
            }
            .alert("Finale Score", isPresented: $showingFinalScore) {
                Button("New game", action: restartGame)
            } message: {
                Text("Congratulations! You answered \(questionCount) questions and got \(currentScore) score!")
            }
        }
    }
    
    func checkAnswer() {
        correctAnswer = multiplicationNumber * number
        if answer == correctAnswer {
            currentScore += 1
            scoreTitle = "Good job!"
            scoreMessage = "You score is \(currentScore)"
            animationAmount = 360
            imageAnimation = true
            
        } else {
            scoreTitle = "Oh no!"
            scoreMessage = "The correct answer is \(correctAnswer)"
        }
        showingScore = true
        questionCount += 1
    }
    
    func askQuestion() {
        animationAmount = 0
        imageAnimation = false
        correctAnswer = 0
        answer = 0
        if questionCount < question {
            number = Int.random(in: 1...10)
        } else {
            showingFinalScore = true
        }
    }
    
    func restartGame() {
        multiplicationNumber = 6
        question = 10
        currentScore = 0
        answer = 0
        correctAnswer = 0
        questionCount = 0
        scoreTitle = ""
        scoreMessage = ""
        imageAnimation = false
        animationAmount = 0.0
        element = Int.random(in: 0..<animal.count)
    }
}

#Preview {
    ContentView()
}
