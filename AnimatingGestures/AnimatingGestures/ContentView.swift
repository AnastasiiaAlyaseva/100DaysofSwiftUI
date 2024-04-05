

import SwiftUI

struct ContentView: View {
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    let letters = Array("Hello SwiftUI")
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) {
                num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .background(enabled ? .yellow : .green)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
        DragGesture()
            .onChanged {dragAmount = $0.translation }
            .onEnded {_ in
                dragAmount = .zero
                enabled.toggle()
            }
        )
    }
}

#Preview {
    ContentView()
}
