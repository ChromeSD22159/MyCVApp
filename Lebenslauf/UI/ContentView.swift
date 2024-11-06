import SwiftUI

struct ContentView: View {
    @State var scrollOffset: CGPoint = .zero
    
    @State var bgOffset = false
    @State var bgBlur = false
    @State var bgOpacity = false
    
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
            
            HStack(alignment: .center) {
                Image(.appLogo)
                    .resizable()
                    .frame(width: 70, height: 70)
                
                HStack(alignment: .center) {
                    Text("Frederik").blendMode(.colorDodge)
                    Text("Kohler").blendMode(.colorBurn)
                }
                
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
                    VStack {
                        
                        HeadProtraitCard(margin: 40)
                    }
                    .padding(.horizontal, Theme.padding)
                }
            )
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

func sleep(await: Double, onComplete: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        onComplete()
    }
}

#Preview {
    ContentView()
}
