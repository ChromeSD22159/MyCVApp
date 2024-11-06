//
//  openURL.swift
//  Lebenslauf
//
//  Created by Frederik Kohler on 06.11.24.
//

import UIKit

func openURL(urlString: String) {
    if let url = URL(string: urlString) {
       UIApplication.shared.open(url)
    }
}
