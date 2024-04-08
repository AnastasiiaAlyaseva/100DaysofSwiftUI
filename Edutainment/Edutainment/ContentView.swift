

import SwiftUI

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
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Stepper("\(multiplicationNumber)", value: $multiplicationNumber, in: 2...12, step: 1)
                            .frame(maxWidth: 200)
                        
                        Text("How many questions do you want?")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Picker("", selection: $question) {
                            ForEach(questions, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(maxWidth: 200)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                    
                    Spacer()
                    }
                
                VStack{
                    Spacer()
                    Spacer()
                   
                    
                    Image(animal[element])
                        .clipShape(.circle)
                        .shadow(radius: 10)
                    
                    Spacer()
                    
                    Text("Calculate how much is \(multiplicationNumber) x \(number) ?")
                        .font(.title2).bold()
                   
                    HStack{
                        TextField("Answer", value: $answer, format: .number)
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
                    
                    Text("Score: \(currentScore)")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                       
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
            
        } else {
            scoreTitle = "Oh no!"
            scoreMessage = "The correct answer is \(correctAnswer)"
        }
        showingScore = true
        questionCount += 1
    }
    
    func askQuestion() {
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
    }
}

#Preview {
    ContentView()
}
