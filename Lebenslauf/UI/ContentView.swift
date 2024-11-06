import SwiftUI

struct ContentView: View {
    @State var scrollOffset: CGPoint = .zero
    
    @State var bgOffset = false
    @State var bgBlur = false
    
    var body: some View {
        ZStack(alignment: .top) {
            
            ZStack {
                Image(.appCircleBG)
                    .offset(y: bgOffset ? -10 : -300)
                    .blur(radius: bgBlur ? 0 : 4)
                    .animation(.easeInOut(duration: 0.4), value: bgOffset)
                    .animation(.easeInOut(duration: 0.8), value: bgBlur)
            }.ignoresSafeArea()
            
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
            
            AnimatedScrollView(
                scrollViewMarginTop: 60,
                onChangePosition: { size in
                    scrollOffset = size

                    if size.y >= -0.0  {
                        bgOffset = true
                        bgBlur = true
                        
                    } else {
                        bgOffset = false
                        bgBlur = false
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
}

func sleep(await: Double, onComplete: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        onComplete()
    }
}

#Preview {
    ContentView()
}
