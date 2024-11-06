//
//  DebugScrollView.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//
import SwiftUI

struct DebugScrollView: View {
    var show: Bool = false
    var scrollOffset: CGPoint
    var body: some View {
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
