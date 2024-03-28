
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakwUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var calculateBedtime: String {
        do {
            let config: MLModelConfiguration = MLModelConfiguration()
            let model: SleepCalculator = try SleepCalculator(configuration: config)
            
            let components: DateComponents = Calendar.current.dateComponents([.hour, .minute], from: wakwUp)
            let hour: Int = (components.hour ?? 0) * 60 * 60
            let minute: Int = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            let sleepTime: Date = wakwUp - prediction.actualSleep
            
            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "Sorry, there was a problem calculating you bedtime!"
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time", selection: $wakwUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12 , step: 0.25)
                }
                
                Section("Daily coffe intake") {
                    Picker("Number of cups", selection: $coffeeAmount) {
                        ForEach(1..<21) {
                            Text("^[\($0) cup](inflect: true)")
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    //                    Stepper(coffeAmount == 1 ? "1 cup" : "\(coffeAmount) cup(s)", value: $coffeAmount, in: 1...20)
                    //                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                }
                Section("Recommended bedtime") {
                    Text(calculateBedtime)
                        .font(.title3)
                }
            }
            .navigationTitle("BetterRest")
            .toolbar{
                Button("Restart", action: restartCalculations)
            }
        }
    }
    
    func restartCalculations() {
        wakwUp = ContentView.defaultWakeTime
        sleepAmount = 8.0
        coffeeAmount = 1
    }
}

#Preview {
    ContentView()
}
