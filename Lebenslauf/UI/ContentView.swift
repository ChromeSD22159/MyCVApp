import SwiftUI

struct ContentView: View {
    @State var scrollOffset: CGPoint = .zero
    
    @State var bgOffset = false
    @State var bgBlur = false
    @State var bgOpacity = false
    
    var logoOpacity: CGFloat {
        let minOffset: CGFloat = -20
        let maxOffset: CGFloat = 10

        // Begrenze scrollOffset.y innerhalb des Bereichs von minOffset bis maxOffset
        let clampedOffset = max(min(scrollOffset.y, maxOffset), minOffset)

        // Normalisiere clampedOffset auf einen Wert zwischen 0.0 und 1.0
        return (clampedOffset - minOffset) / (maxOffset - minOffset)
    }
    
    @State var school: [CVStation] = []
    @State var professionalBackground: [CVStation] = []
    @State var socials: [SocialButton] = []
    var body: some View {
        ZStack(alignment: .top) {
            
            CircleBG(bgOffset: bgOffset, bgBlur: bgBlur, bgOpacity: bgOpacity)
            
            AppLogo(logoOpacity: logoOpacity)
            
            //DebugScrollView(show: true, scrollOffset: scrollOffset)
            
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
    
                        ContactScrollView(
                            title: "Kontakt",
                            subTitle: "Sag einfach mal Hallo!",
                            socials: socials
                        )
                        
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
            socials = Repository.socials
        }
    }
}

#Preview {
    ContentView()
}
