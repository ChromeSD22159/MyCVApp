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
            }
            .ignoresSafeArea()
            
            HStack {
                Image(.appLogo)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .padding(.trailing, 10)
                
                
                Spacer()
            }
            .padding(.horizontal, 40)
            
            DebugScrollView(show: false)
            
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
                    VStack(spacing: 30) {
                        HeadProtraitCard(margin: 30)
    
                        Accordion(
                            headerText: "Werdegang:",
                            list: professionalBackground
                        )
                        
                        Accordion(
                            headerText: "Schulisch:",
                            list: school
                        )
                        
                    }
                    .foregroundStyle(Theme.primaryTextColor)
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
}

struct Accordion: View {
    let headerText: String
    let list: [CVStation]
    
    @State var isListShown = false
    
    @State var printedList: [CVStation] = []
    
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            HStack {
                Text(headerText)
                    .textCase(.uppercase)
                    .font(.footnote)
                    .padding(.leading, 5)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .rotationEffect(Angle(degrees: isListShown ? 90 : 0))
                    .animation(.easeInOut, value: isListShown)
                    .onTapGesture { toggleCollapse() }
            }.padding(.horizontal, 30)
            
            ForEach(printedList, id: \.title) { item in
                ZStack {
                    Station(item: item)
                        .matchedGeometryEffect(id: item.title, in: namespace)
                }
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.8), value: printedList)
             
            }
            .padding(.horizontal, 30)
        }
    }
    
    private func toggleCollapse() {
        isListShown.toggle()
        if isListShown {
            printedList.removeAll() // Initialisiere die Liste immer sauber
            
            for (index, item) in list.enumerated() {
                let delay = 0.1 * Double(index) // 0.05 Sekunden Verzögerung für jedes Element
                
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    let found = printedList.contains(where: {
                        $0.title == item.title
                    })
                    
                    if !found {
                        printedList.append(item)
                    }
                }
            }
        } else {
            printedList.removeAll()
        }
    }
}
 
#Preview {
    ContentView()
}
