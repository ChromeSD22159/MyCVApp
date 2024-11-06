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
    
    
    // Font Color
    static var onBackground: Color = Color.white
    
    static var primaryTextColor: Color = Color(.fkPrimaryText) 
    
    static var linearGradient: LinearGradient = LinearGradient(colors: [
        Theme.secondary,
        Theme.primary
    ], startPoint: .topTrailing, endPoint: .bottomLeading)
    
    static var borderGradient: LinearGradient = LinearGradient(colors: [
        Theme.primary,
        Theme.secondary
    ], startPoint: .topTrailing, endPoint: .bottomLeading)
}
