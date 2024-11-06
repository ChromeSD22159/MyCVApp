//
//  ContactScrollView.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//
import SwiftUI

struct ContactScrollView: View {
    let title: String
    let subTitle: String
    let socials: [SocialButton]
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title).padding(.leading, 5)
                Spacer()
            }
            HStack {
                Text(subTitle)
                    .textCase(.uppercase)
                    .font(.footnote)
                    .padding(.leading, 5)
                Spacer()
            }
        }.padding(.horizontal, 30)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(socials, id: \.self) { social in
                    RoundedButton(icon: social.image) {
                        openURL(urlString: social.url)
                    }
                }
            }
        }
        .contentMargins(.leading, 30)
        .contentMargins(.trailing, 30)
    }
}
