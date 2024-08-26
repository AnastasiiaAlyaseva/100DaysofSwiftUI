
import SwiftUI

struct CrewView: View {
    let crew: [MissionView.CrewMembr]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink{
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack{
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                                .accessibilityHidden(true)
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                        .accessibilityElement()
                        .accessibilityLabel("\(crewMember.astronaut.name), \(crewMember.role)")
                        .accessibilityHint("Double-tap to learn more about this astronaut.")
                    }
                }
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missionView = MissionView(mission: missions[1],
                                  astronauts: astronauts)
    
    return CrewView(crew: missionView.crew)
        .preferredColorScheme(.dark)
}
