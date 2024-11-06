//
//  ScrollViewOffsetTracker.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//
import SwiftUI

struct ScrollViewOffsetTracker: View {
    var body: some View {
        GeometryReader { geo in
            Color.clear
                .preference(
                    key: ScrollOffsetPreferenceKey.self,
                    value: geo
                        .frame(in: .named(ScrollOffsetNamespace.namespace))
                        .origin
                )
        }
        .frame(height: 0)
    }
}
