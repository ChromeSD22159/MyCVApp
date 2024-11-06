//
//  RoundedButton.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//
import SwiftUI

struct RoundedButton: View {
    var icon: UIImage = .appLogo
    var onClick: () -> ()
    var body: some View {
        ZStack {
            Circle()
                .fill(Theme.linearGradient)
                .stroke(Theme.borderGradient, lineWidth: 10)
                
            
            Image(uiImage: icon)
                .resizable()
                //.background(.red)
                .frame(width: 25, height: 25)
        }
        .onTapGesture { onClick() }
        .padding(10)
        .frame(width: 75, height: 75)
    }
}
