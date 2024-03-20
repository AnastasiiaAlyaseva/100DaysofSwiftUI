
import SwiftUI

struct ContentView: View {
    @State private var inputValue: Double = 0.0
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    @FocusState private var valueIsFocused: Bool
    
    let timePeriod = ["Seconds", "Minutes", "Hours", "Days"]
    
    var convertedValue: Double {
        let rates = [1.0, 60.0, 3600.0, 86400.0]
        let inputRates = rates[inputUnit]
        let outputRates = rates[outputUnit]
        
        return inputValue * inputRates / outputRates
    }
    
    
    var body: some View {
        NavigationView{
            Form {
                Section{
                    TextField("Enter value", value: $inputValue, format: .number )
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)
                    
                    Picker("Input unit", selection: $inputUnit){
                        ForEach(timePeriod, id: \.self){ index in
                            Text(index)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    Picker("Output unit", selection: $outputUnit){
                        ForEach(timePeriod, id: \.self){ index in
                            Text(index)
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section("Converted Value") {
                    Text(convertedValue, format: .number)
                }
            }
            .navigationTitle("Time converter")
            .toolbar{
                if valueIsFocused{
                    Button("Done") {
                        valueIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
