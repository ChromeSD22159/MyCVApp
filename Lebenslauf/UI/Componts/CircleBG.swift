//
//  CircleBG.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//
import SwiftUI

struct CircleBG: View {
    let bgOffset: Bool
    let bgBlur: Bool
    let bgOpacity: Bool
    var body: some View {
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
    }
}
