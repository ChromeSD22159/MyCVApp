import SwiftUI

struct ContentView: View {
    @State var scrollOffset: CGPoint = .zero
    
    @State var bgOffset = false
    @State var bgBlur = false
    @State var bgOpacity = false
    
    @State var school: [CVStation] = []
    @State var professionalBackground: [CVStation] = []
    
    var body: some View {
        ZStack(alignment: .top) {
            
            ZStack {
                Image(.appCircleBG)
                    .offset(y: bgOffset ? -10 : -300)
                    .blur(radius: bgBlur ? 0 : 4)
                    .opacity(bgOpacity ? 1.0 : 0.25)
                    .animation(.easeInOut(duration: 0.4), value: bgOffset)
                    .animation(.easeInOut(duration: 0.8), value: bgBlur)
                    .animation(.easeInOut(duration: 0.8), value: bgOpacity)
            }.ignoresSafeArea()
            
            HStack {
                Image(.appLogo)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .padding(.trailing, 10)
                
                
                Spacer()
            }
            .padding(.horizontal, 40)
            
            DebugScrollView(show: true)
            
            AnimatedScrollView(
                scrollViewMarginTop: 80,
                onChangePosition: { size in
                    scrollOffset = size

                    if size.y >= -0.0  {
                        bgOffset = true
                        bgBlur = true
                        bgOpacity = true
                        
                    } else {
                        bgOffset = false
                        bgBlur = false
                        bgOpacity = false
                    }
                },
                content: {
                    VStack {
                        HeadProtraitCard(margin: 30)
                        
                        HStack {
                            Text("Schulisch:")
                            Spacer()
                        }.padding(.horizontal, 30)
                        ForEach(school, id: \.title) { school in
                            Station(item: school)
                        }.padding(.horizontal, 30)
                        
                        HStack {
                            Text("Schulisch:")
                            Spacer()
                        }.padding(.horizontal, 30)
                        
                        ForEach(professionalBackground, id: \.title) { background in
                            Station(item: background)
                        }.padding(.horizontal, 30)
                        
                    }
                    .padding(.horizontal, Theme.padding)
                }
            )
        }
        .onAppear {
            school = Repository.schoolEducation
            professionalBackground = Repository.professionalBackground
        }
    }
    
    @ViewBuilder func DebugScrollView(show: Bool = false) -> some View {
        if show {
            HStack {
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("ScrollOffset")
                    
                    HStack {
                        Text(String(format: "X: %.0f", scrollOffset.x)).frame(minWidth: 20)
                        Text(String(format: "Y: %.0f", scrollOffset.y)).frame(minWidth: 20)
                    }
                     
                }
                .foregroundStyle(Theme.onBackground)
                .font(.footnote)
            }
            .padding(.top, 10)
            .padding(.trailing, 50)
            .ignoresSafeArea()
        }
    }
    
    @ViewBuilder func Station(item: CVStation) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(item.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                let from = formateDateMMYY(date: item.from)
                let till = formateDateMMYY(date: item.till)
                Text("\(from) - \(till)")
                    .font(.subheadline)
            }
            
            Text(item.description)
                .font(.footnote)
        }
        .padding(Theme.padding)
        .background(
            RoundedRectangle(cornerRadius: Theme.padding)
                .fill(Material.ultraThinMaterial)
        )
    }
}
 
#Preview {
    ContentView()
}
