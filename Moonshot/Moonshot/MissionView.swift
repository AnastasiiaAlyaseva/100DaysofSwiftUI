
import SwiftUI

struct MissionView: View {
    struct CrewMembr {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMembr]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.6
                        }
                        .padding(.top)
                        .accessibilityHidden(true)
                    
                    Text(mission.formattedLaunchDate)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                        .padding(.top)
                        .accessibilityHidden(true)
                    
                    
                    VStack(alignment: .leading) {
                        DividerView()
                        
                        Text("Mission Highlighs")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        DividerView()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    .accessibilityElement()
                    .accessibilityLabel("\(mission.displayName), Launch date: \(mission.formattedLaunchDate). Mission highlights: \(mission.description)")
                    
                    CrewView(crew: crew)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMembr(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
