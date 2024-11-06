//
//  RoundedButton.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//
import SwiftUI

enum SocialButton: CaseIterable {
    case linkedIn, xing, github, phone, web, mail
    
    var image: UIImage {
        switch self {
            case .linkedIn: .linkedIn
            case .xing: .xing
            case .github: .github
            case .phone: .phone
            case .web: .web
            case .mail: .mail
        }
    }
    
    var url: String {
        switch self {
            case .linkedIn: "https://www.linkedin.com/in/frederik-kohler/"
            case .xing: "https://www.xing.com/profile/Frederik_Kohler2"
            case .github: "https://github.com/ChromeSD22159"
            case .phone: "tel:+4915129188449"
            case .web: "mailTo:info@frederikkohler.de"
            case .mail: "https://www.frederikkohler.de"
        }
    }
}
