//
//  AnimatedScrollView.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//
import SwiftUI

struct AnimatedScrollView<Content: View>: View {
    let scrollViewMarginTop: CGFloat
    let onChangePosition: (CGPoint) -> Void
    let content: () -> Content
    
    init(
        scrollViewMarginTop: CGFloat = 50,
        onChangePosition: @escaping (CGPoint) -> Void,
        content: @escaping () -> Content
    ) {
        self.scrollViewMarginTop = scrollViewMarginTop
        self.onChangePosition = onChangePosition
        self.content = content
    }
    
    var body: some View {
        ScrollView {
            
            ScrollViewOffsetTracker()
            
            VStack {
                content()
            }
        }
        .withOffsetTracking(action: {
            onChangePosition($0)
        })
        .contentMargins(.top, scrollViewMarginTop)
        
    }
}
