//
//  Untitled.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//
import SwiftUI

#Preview {
    ScrollView {
        HeadProtraitCard(margin: 10)
    }
}

struct HeadProtraitCard: View {
    let name: String = "Frederik Kohler "
    let subline: String = "- iOS & Android Developer \n- Full-Stack Web Developer\n- Mediengestalter Digital und Print"
    let image: UIImage = .appPortrait
    let margin: CGFloat
    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: image)
                .offset(x: 10, y: 10)
            
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title)
                    .foregroundStyle(Theme.onBackground)
                
                Text(subline)
                    .font(.footnote)
                    .foregroundStyle(Theme.onBackground)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(Theme.padding * 3)
            .background {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .fill(Theme.cardBorderGradient)
                    .shadow(radius: 10, x: 5, y: 5)
            }
        }
        .padding(margin)
    }
}
