//
//  ScrollViewExtention.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//
import SwiftUI

extension ScrollView {
    func withOffsetTracking(
        action: @escaping (_ offset: CGPoint) -> Void
    ) -> some View {
        self.coordinateSpace(name: ScrollOffsetNamespace.namespace)
            .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: action)
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {

    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}

enum ScrollOffsetNamespace {
    static let namespace = "scrollView"
}
