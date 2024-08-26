

import SwiftUI

struct ListLayout: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(missions) { mission in
                    NavigationLink(value: mission){
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .accessibilityLabel("\(mission.displayName), \(mission.formattedLaunchDate)")
                            .accessibilityHint("Double-tap to view mission details.")
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                }
                .listRowBackground(Color.darkBackground)
            }
            .listStyle(PlainListStyle())
            .padding()
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
        }
    }
}

#Preview {
    ListLayout(missions: Bundle.main.decode("missions.json"), astronauts: Bundle.main.decode("astronauts.json"))
        .preferredColorScheme(.dark)
}
