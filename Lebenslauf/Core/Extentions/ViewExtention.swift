//
//  ViewExtention.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//
import SwiftUI

extension View {
    func spaceInside() -> some View {
        modifier(SpaceInside())
    }
}

struct SpaceInside: ViewModifier {
    let value: CGFloat = Theme.padding
    func body(content: Content) -> some View {
        content.padding(value)
    }
}
