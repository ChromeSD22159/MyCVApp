//
//  AppLogo.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//

import SwiftUI

struct AppLogo: View {
    let logoOpacity: CGFloat
    var body: some View {
        HStack(alignment: .center) {
            FKLogo()
                .frame(width: 70, height: 70)
            
            HStack(spacing: 0) {
                Text("Frederik")
                    
                Text("Kohler").fontWeight(.bold)
            }.offset(x: -8, y: -8)
            
            Spacer()
        }
        .opacity(logoOpacity)
        .colorInvert()
        .padding(.horizontal, 40)
    }
}

struct FKLogo: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.81372*width, y: 0.68628*height))
        path.addLine(to: CGPoint(x: 0.62997*width, y: 0.68628*height))
        path.addLine(to: CGPoint(x: 0.44398*width, y: 0.37284*height))
        path.addLine(to: CGPoint(x: 0.63109*width, y: 0.05941*height))
        path.addLine(to: CGPoint(x: 0.8126*width, y: 0.05941*height))
        path.addLine(to: CGPoint(x: 0.63781*width, y: 0.37284*height))
        path.addLine(to: CGPoint(x: 0.81372*width, y: 0.68628*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.62213*width, y: 0.68628*height))
        path.addLine(to: CGPoint(x: 0.4014*width, y: 0.68628*height))
        path.addLine(to: CGPoint(x: 0.40028*width, y: 0.51089*height))
        path.addLine(to: CGPoint(x: 0.3084*width, y: 0.37284*height))
        path.addLine(to: CGPoint(x: 0.40812*width, y: 0.22914*height))
        path.addLine(to: CGPoint(x: 0.27927*width, y: 0.22914*height))
        path.addLine(to: CGPoint(x: 0.18627*width, y: 0.05941*height))
        path.addLine(to: CGPoint(x: 0.62437*width, y: 0.05941*height))
        path.addLine(to: CGPoint(x: 0.43501*width, y: 0.37284*height))
        path.addLine(to: CGPoint(x: 0.62213*width, y: 0.68628*height))
        path.closeSubpath()
        return path
    }
}
