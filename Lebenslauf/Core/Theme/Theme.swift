//
//  Theme.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//

import SwiftUI

class Theme { 
    
    static var padding: CGFloat = 10
    
    
    // Color
    static var primary: Color = Color(.fkPrimary)
    
    static var secondary: Color = Color(.fkSecondary)
    
    static var accentPrimary: Color = Color(.fkAccentColorPrimary)
    
    static var accentSecondary: Color = Color(.fkAccentColorSecondary)
    
    
    // Font Color
    static var onBackground: Color = Color.white
    
    static var primaryTextColor: Color = Color(.fkPrimaryText) 
    
    static var linearGradient: LinearGradient = LinearGradient(colors: [
        Theme.secondary,
        Theme.primary
    ], startPoint: .topTrailing, endPoint: .bottomLeading)
    
    static var borderGradient: LinearGradient = LinearGradient(colors: [
        Theme.accentPrimary,
        Theme.accentSecondary
    ], startPoint: .bottomLeading, endPoint: .topTrailing)
    
    static var cardBorderGradient: LinearGradient = LinearGradient(colors: [
        Theme.accentPrimary,
        Theme.accentSecondary
    ], startPoint: .topTrailing, endPoint: .bottomLeading)
}
