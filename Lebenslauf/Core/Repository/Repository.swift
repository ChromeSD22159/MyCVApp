//
//  Repository.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//

import Foundation

class Repository {
    
    static let schoolEducation: [CVStation] = [
        CVStation(title: "Theodor-Heuss Schulen", from: Date(timeIntervalSince1970: 1104537600), till: Date(timeIntervalSince1970: 1230768000), description: "Grundschule & Mittlere Reife, D-Waldshut-Tiengen"),
        CVStation(title: "Justus-von-Liebig Schulen", from: Date(timeIntervalSince1970: 1233446400), till: Date(timeIntervalSince1970: 1264982400), description: "Einjährige Berufsfachschule Mediengestalter Digital und Print, D-Waldshut-Tiengen"),
        CVStation(title: "BFW Hamburg", from: Date(timeIntervalSince1970: 1577836800), till: Date(timeIntervalSince1970: 1577836800), description: "IHK Abschluss Mediengestalter Digital und Print, Hamburg"),
        CVStation(title: "Syntax Institut", from: Date(timeIntervalSince1970: 1704067200), till: Date(timeIntervalSince1970: 1748640000), description: "Mobile App Developer Weiterbildung, Berlin")
    ]

    static let professionalBackground: [CVStation] = [
        CVStation(title: "Native App Developer", from: Date(timeIntervalSince1970: 1704067200), till: Date(timeIntervalSince1970: 1748640000), description: "Software / Native App Developer bei Syntax Institut, Berlin. Weiterbildung in Kotlin, Android Studio, iOS - Swift & SwiftUI"),
        CVStation(title: "Frontend Developer", from: Date(timeIntervalSince1970: 1612137600), till: Date(timeIntervalSince1970: 1667260800), description: "Software / Frontend Entwickler bei Avarel Studios, CH-Gebenstorf. Weiterentwicklung einer Zeittracking Software, Design und Entwicklung von WordPress Webseiten"),
        CVStation(title: "Frontend Developer", from: Date(timeIntervalSince1970: 1580515200), till: Date(timeIntervalSince1970: 1602288000), description: "Frontend Entwickler bei Agentgroup, Hamburg. Design und Entwicklung von WordPress Webseiten"),
        CVStation(title: "Frontend Developer", from: Date(timeIntervalSince1970: 1554076800), till: Date(timeIntervalSince1970: 1580515200), description: "Frontend Entwickler bei effektor, Hamburg. Print Design in Kunden CI, Design und Entwicklung von WordPress Webseiten"),
        CVStation(title: "Schichtverantwortlicher", from: Date(timeIntervalSince1970: 1401667200), till: Date(timeIntervalSince1970: 1527811200), description: "Schichtverantwortlicher bei SubwayBW, Stuttgart. Schichtverantwortung, Inventur, Waren-Management"),
        CVStation(title: "Schichtverantwortlicher", from: Date(timeIntervalSince1970: 1272758400), till: Date(timeIntervalSince1970: 1381104000), description: "Schichtverantwortlicher bei Rewe MarktGmbH, Waldshut/Stuttgart. Kassenaufsicht, Tresor-Management, Schließdienst, Lagerplanung und Waren-Management"),
        CVStation(title: "Schichtverantwortlicher", from: Date(timeIntervalSince1970: 1235865600), till: Date(timeIntervalSince1970: 1338508800), description: "Schichtverantwortlicher bei Subway A. Kiback, Waldshut. Schichtverantwortung, Inventur, Waren-Management"),
        CVStation(title: "Lagermitarbeiter", from: Date(timeIntervalSince1970: 1072915200), till: Date(timeIntervalSince1970: 1222819200), description: "Lagermitarbeiter bei Obi GmbH, Waldshut. Warenannahme, Wareneingang und Lager-Management")
    ]
    
    static let socials: [SocialButton] = SocialButton.allCases
}

